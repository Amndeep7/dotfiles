# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH";

# Load aliases
[ -r ".aliases" ] && [ -f ".aliases" ] && source ".aliases";

# Load prompt
[ -r ".bash_prompt" ] && [ -f ".bash_prompt" ] && source ".bash_prompt";

# Case-insensitive globbing
shopt -s nocaseglob;

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth;
# Unlimited history length
HISTSIZE=
HISTFILESIZE=
# Append to Bash history as opposed to overwriting
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
	source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
	source /etc/bash_completion;
fi;

# Add tab completions for Alacritty
[ -d "~/alacritty" ] && source ~/alacritty/extra/completions/alacritty.bash
