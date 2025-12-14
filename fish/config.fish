set_color ff6600
set --universal pure_color_prompt_on_success ff6600
set -U fish_greeting ""

if status is-interactive
		and not set -q TMUX
		ta -t 00_Configs || tmux
end

set PATH $PATH /home/fufu/.local/bin
