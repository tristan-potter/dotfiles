import os

# TODO add brew install stuff
# install you complete me stuff
# set git config stuff like global exclude

# files and folders to ignore
ignore_list = ['.git', 'README.md', os.path.basename(__file__)]

repo_path = os.path.dirname(os.path.abspath(__file__))
# the files and folders we want to symlink
dotfiles = os.listdir(repo_path)

for x in ignore_list:
    dotfiles.remove(x)

# now we need to add a '.' in front of each one
# and then add it to $HOME

for config in dotfiles:
    source = os.path.join(repo_path, config)

    # from now on, we need the actual dotfile name
    config = '.' + config

    link_path = os.path.join(os.path.expanduser('~'), config)
    if os.path.exists(link_path) and not os.path.islink(link_path):
        # if path exists and isn't symlink, move to temp and overwrite
	old_files_dir = os.path.join(os.path.expanduser('~'), '.old_dotfiles')

	try:
		os.mkdir(old_files_dir)
	except:
		pass
	try:
		os.rename(link_path, 
			  os.path.join(old_files_dir,
				       config))
	except Exception as e:
		pass

    try:
        os.symlink(source, link_path)
    except Exception as e:
        print e

