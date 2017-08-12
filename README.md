Starting from scratch
If you haven't been tracking your configurations in a Git repository before, you can start using this technique easily with these lines:

1
git init --bare $HOME/.cfg
2
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
3
config config --local status.showUntrackedFiles no
4
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.bashrc
The first line creates a folder ~/.cfg which is a Git bare repository that will track our files.
Then we create an alias config which we will use instead of the regular git when we want to interact with our configuration repository.
We set a flag - local to the repository - to hide files we are not explicitly tracking yet. This is so that when you type config status and other commands later, files you are not interested in tracking will not show up as untracked.
Also you can add the alias definition by hand to your .bashrc or use the the fourth line provided for convenience.
I packaged the above lines into a snippet up on Bitbucket and linked it from a short-url. So that you can set things up with:

1
curl -Lks http://bit.do/cfg-init | /bin/bash
After you've executed the setup any file within the $HOME folder can be versioned with normal commands, replacing git with your newly created config alias, like:

1
config status
2
config add .vimrc
3
config commit -m "Add vimrc"
4
config add .bashrc
5
config commit -m "Add bashrc"
6
config push
Install your dotfiles onto a new system (or migrate to this setup)
If you already store your configuration/dotfiles in a Git repository, on a new system you can migrate to this setup with the following steps:
Prior to the installation make sure you have committed the alias to your .bashrc or .zsh:

1
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

1
echo ".cfg" >> .gitignore
Now clone your dotfiles into a bare repository in a "dot" folder of your $HOME:

1
git clone --bare <git-repo-url> $HOME/.cfg
Define the alias in the current shell scope:

1
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
Checkout the actual content from the bare repository to your $HOME:

1
config checkout
The step above might fail with a message like:

1
error: The following untracked working tree files would be overwritten by checkout:
2
    .bashrc
3
    .gitignore
4
Please move or remove them before you can switch branches.
5
Aborting
This is because your $HOME folder might already have some stock configuration files which would be overwritten by Git. The solution is simple: back up the files if you care about them, remove them if you don't care. I provide you with a possible rough shortcut to move all the offending files automatically to a backup folder:

1
mkdir -p .config-backup && \
2
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
3
xargs -I{} mv {} .config-backup/{}
Re-run the check out if you had problems:

1
config checkout
Set the flag showUntrackedFiles to no on this specific (local) repository:

1
config config --local status.showUntrackedFiles no
You're done, from now on you can now type config commands to add and update your dotfiles:

1
config status
2
config add .vimrc
3
config commit -m "Add vimrc"
4
config add .bashrc
5
config commit -m "Add bashrc"
6
config push
