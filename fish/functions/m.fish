function m
    set internal eDP-1
    set external DP-1

    if test (count $argv) -gt 0
        switch $argv[1]
            case 1
                set mode internal
            case 2
                set mode external
            case '*'
                echo "Usage: auto-display [1|2]"
                return 1
        end
    else
        if hyprctl monitors -j | jq -e '.[].name == "'$external'"' >/dev/null
            set mode external
        else
            set mode internal
        end
    end

    if test $mode = external
        hyprctl keyword monitor "$external,3440x1440@75,auto,1,bitdepth,10,cm,hdr,sdrbrightness,1.25,sdrsaturation,1"
        hyprctl keyword monitor "$internal,disable"
		else
        hyprctl keyword monitor "$internal,1920x1080@120,0x0,1"
        hyprctl keyword monitor "$external,disable"
    end


    for ws in (hyprctl workspaces -j | jq '.[].id')
        if test $mode = external
            hyprctl dispatch moveworkspacetomonitor $ws $external
        else
            hyprctl dispatch moveworkspacetomonitor $ws $internal
        end
    end
end
