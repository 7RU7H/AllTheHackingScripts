#!/usr/bin/zsh
# George Ornbo (shapeshed) http://shapeshed.com
# License - http://unlicense.org
# 
# # Fixes a corrupt .zsh_history file
#
mv ~/.zsh_history ~/.zsh_history_bad
strings -eS ~/.zsh_history_bad > ~/.zsh_history
#R in capital gives an error so the solution
# Capital -R works non env zsh - only alteration 
fc -R ~/.zsh_history
rm ~/.zsh_history_bad

