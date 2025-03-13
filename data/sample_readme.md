# Title



## Table of Contents
- [Code](#code)
    - [Python virtual environment](#python-venv)

## Code

The code for this programme can be found in the directory: [src](src/).

### Python virtual environment

Before using the code it is best to setup and start a Python virtual environment in order to avoid potential package clashes using the [requirements](requirements.txt) file:

```BASH
# Navigate into the project directory

# Create a virtual environment
python3 -m venv email-daily-news

# Activate virtual environment
source email-daily-news/bin/activate

# Install dependencies for code
pip3 install -r requirements.txt

# When finished with virtual environment
deactivate
```

