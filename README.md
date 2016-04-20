# snipe

[![License](http://img.shields.io/:license-mit-blue.svg)](https://github.com/fortinmike/snipe/blob/master/LICENSE)

Easily send one-off emails from scripts using MailGun

## Installation

snipe is distributed as a cross-platform Ruby Gem:

    $ gem install snipe

# Usage

1. Configure snipe (first time only):

    $ snipe init

2. Send emails

    $ echo "Hello snipe!" | snipe --target="someone@domain.com"
    $ snipe --target=someone@domain.com --message="Hello mister!"
    $ snipe -to=someone@domain.com -m="Hello mister!"
