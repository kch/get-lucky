# Get Lucky

Helps you get lucky with Google using Safari's Location field.

No dynamic code injection required.


## Initial setup

  sudo rake hosts:update


## Usage

Start the server:

    sudo rake thin:start

In safari's location bar, type `go/ your search string`

  - go/kch github           # Google Feeling Lucky straight to the awesomest github account
  - im.go/cheezburger       # Google Images for, er… cheeseburgers
  - go/vanilla ice cream    # Google Feeling Lucky for the awesomest icecream
  - wp.go/Vanilla_Ice       # Wikipedia entry for some guy featured in xkcd #210
  - go/xkcd 210             # The aforementioned comic

Yes, spaces, yes. Safari will honor them.


## Customization

    sudo rake shortcuts:edit
