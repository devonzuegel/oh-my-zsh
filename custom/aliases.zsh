####################################################################################################
## ls ##############################################################################################
####################################################################################################

# # Flags:
# #   -G: default colors, different for directories vs. files
# #   -F: includes a trailing `/` at the end of directory names
# #   -l: display long format (file types, permissions, number of hard
# #       links, owner, group, size, last-modified date, and filename)
# #   -t: sort the list of files by modification time
# alias l='ls -GF -lt | awk '\''{
#   printf("%-4.4s ", $5);
#   printf("%4s %-3.2d %-5.5s  ", $6, $7, $8);
#   printf("%-7.59s\n", $9);
# }'\'' | tail +2'  # Remove first line from output (formerly "total")
alias l='exa --header --modified -l --git'
alias ls='ls -1'
alias tree2='exa --tree --level=2'
alias tree3='exa --tree --level=3'

####################################################################################################
## Git #############################################################################################
####################################################################################################

nowrap()
{
   cut -c-$(($(tput cols)+43));
}

alias ga='git add -A'
alias gc='git commit -v'
alias gcm='git commit -m '
alias gaC='git add -A && gc'
alias gac='git add -A && gc -m'
alias pull='git pull'
alias push='git push'
alias gpf='git push -f'
alias gp='echo "Use gpe (git push each)!"'
alias gpe='sh $ZSH/custom/bin/git-push-each.sh'
alias gpb='git push origin -u HEAD' # Push checked out branch to origin, create if doesn't yet exist
alias gbd='gb -d'
alias log='git log --graph --all --decorate --stat --date=iso'
alias gl='git log -15 --pretty=format:"%C(#343d4f)%h~%C(#ffffff)%s~%C(green nobold)%D" | column -t -s "~" | nowrap'
alias gln='git log -15 --pretty=format:"%C(#343d4f)%h~%C(white bold)%s~%C(#343d4f)[%aN]~%C(green)%d" | column -t -s "~"'
alias gll='git log -55 --pretty=format:"%C(#343d4f)%h%C(green)%d%C(white bold) %s %C(#343d4f)[%aN]"'
alias gb='git branch'
alias gbb='gb | grep -v "a/" '
alias b='
  git for-each-ref                        \
  --count=5                               \
  --sort=-committerdate refs/heads/       \
  --format="%(HEAD)  %(color:yellow)%(refname:short)%(color:reset);%(color:green)%(committerdate:relative)%(color:reset);%(contents:subject)"  \
  | column -t -s ";"                                                                                                                                                                      \
  | tail -r'
alias ba='
  git for-each-ref                        \
  --count=5                               \
  --sort=-committerdate refs/heads/       \
  --format="%(HEAD) %(authorname)%(color:reset);%(color:yellow)%(refname:short)%(color:reset);%(color:green)%(committerdate:relative)%(color:reset);%(contents:subject)"  \
  | column -t -s ";"                                                                                                                                                                      \
  | tail -r'
alias bb='git for-each-ref --count=10 --sort=-committerdate refs/heads/ --format="%(committerdate:relative),%(refname:short)" | tail -r | column -t -s ","'
alias gch='git checkout'
alias gm='git merge '
alias recap='git log --all --oneline --no-merges --author=$(git config user.name)'
alias today='git log --since=00:00:00 --all --no-merges --oneline --author=$(git config user.name)'
alias gs='git status '
alias fd='git diff origin/master --name-only'
alias rm='echo "Use trash!"'

####################################################################################################
## Grep ############################################################################################
####################################################################################################


alias mygrep='grep --color=always --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
# Grep (case-insensitive)
alias lg='l | grep -i'


####################################################################################################
## ZSH #############################################################################################
####################################################################################################

# Reload aliases
alias ra='source ~/.zshrc'
alias zshrc='code $HOME/.zshrc'
alias ez='zshrc'
alias ea='code $HOME/.oh-my-zsh/custom/aliases.zsh'

####################################################################################################
## Ruby ############################################################################################
####################################################################################################

alias bashrc='subl ~/.bashrc'
alias guard='bundle exec guard'
alias rspec='bundle exec rspec'

####################################################################################################
## Text editor #####################################################################################
####################################################################################################

alias s='subl'
alias vsc='code'
alias v='code'

####################################################################################################
## PostgresSQL #####################################################################################
####################################################################################################

alias psql="'/Applications/Postgres.app/Contents/Versions/9.5/bin'/psql"

####################################################################################################
## Javascript/Typescript ###########################################################################
####################################################################################################

alias j='jest'

####################################################################################################
## Arcanist ########################################################################################
####################################################################################################

alias arc='/Users/devonzuegel/dev/arcanist/bin/arc'

####################################################################################################
## Affirm ##########################################################################################
####################################################################################################

alias cleandist='git clean -df && git checkout -- dist/;'
alias deployui='grunt build:dist && grunt deploy'

cb() {
  branch_name=$(git symbolic-ref --short -q HEAD)
  merge_base=$(git merge-base $branch_name $1)
  git rebase -i $merge_base
}