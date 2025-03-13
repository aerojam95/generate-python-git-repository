# Generate local python git repository

This BASH script generates the base local git repository to get started with a Python3 open-source project

## Table of Contents

- [Prerequisites](#python-prereqs)
- [Programme execution](#execution)

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

```BASH
# navigate to directory of local git repository
chmod 744 main.sh
./main.sh -d <directory_name> -p <parent_directory> -n <name>
```
