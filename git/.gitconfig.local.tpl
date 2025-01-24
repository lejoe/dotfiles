[user]
	name = YOUR_NAME
	email = YOUR_EMAIL
	signingkey = YOUR_SSH_SIGNING_KEY

[gpg]
  	format = ssh

[gpg "ssh"]
  	program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
	allowedSignersFile = ~/.config/git/allowed-signers

[commit]
  	gpgsign = true

[tag]
	gpgsign = true

# Add any custom includes as needed
[includeIf "gitdir:~/Projects/ORGANIZATION/"]
    path = ~/.gitconfig.organization