# Generate local python git repository

This BASH script generates the base local git repository to get started with a Python3 open-source project

## Table of Contents

[Prerequisites](#python-prereqs)
[Programme execution](#execution)
[Remote GitHub repository](#github-repo)

## Prerequisites

This script runs on Debian and Ubuntu UNIX OSs and the following packages need to be installed for the script to run:

```BASH
sudo apt update
sudo apt install git
sudo apt install python3
```

## Programme execution

The arguments to the script are as follows:

1. d: directory of the local git repository to be created and the name of the project
2. p: directory of where the project will be created relative to the scripts execution
3. n: name of person who is creating the local git repository

Before running the BASH script ensure the local user has set up the git configuration.

```BASH
# navigate to directory of local git repository
cd src/
chmod 744 main.sh
./main.sh -d <directory_name> -p <parent_directory> -n <name>
```

To be the same as GitHub conventions rename the default branch to `main`:

```BASH
git config --global init.defaultBranch main
```

## Remote GitHub repository

Once the script has run you will have a local git repository. If a remote GitHub repository is desired follows these instructions:

1. Install the GitHub CLI:

```BASH
sudo apt update
sudo apt install gh
```

2. Set up a GitHub account
3. Set up coonect by SSH the GitHub account:

```BASH
gh auth login
```

4. The GitHub account now having been connected, run the following command and follow the instructions to then connect a remote GitHub repository to the locally generated git repository:

```BASH
git repo create
```
