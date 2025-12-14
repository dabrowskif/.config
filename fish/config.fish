set_color ff6600
set --universal pure_color_prompt_on_success ff6600
set -U fish_greeting ""
fish_vi_key_bindings

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end
# Do not use fish_add_path (added in Fish 3.2) because it potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims

if status is-interactive
		# and not set -q TMUX
		# ta -t 00_Configs || tmux
end

set PATH $PATH /home/fufu/.local/bin
