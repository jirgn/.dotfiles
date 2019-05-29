# Configuration for Mutt Email Client and Tooling

The setup and configuration is inspired by some great articles
* (mutt multible accounts)[https://lukespear.co.uk/mutt-multiple-accounts-mbsync-notmuch-gpg-and-sub-minute-updates/]
* (a modern mutt setup)[https://webgefrickel.de/blog/a-modern-mutt-setup]
* (mutt email client by suffix)[https://www.suffix.be/blog/mutt/]
* (mutt the vim way)[https://www.ryanlue.com/posts/2017-05-21-mutt-the-vim-way]
* (Dave Pearsons Mutt Hints)[http://www.davep.org/mutt/]

The neomutt config can be found in ./config/neomutt/*

## Google Account 

Because Mutt is not able to use oauth, we have to use an app password to
surpase google standards.

* goto (myaccount)[https://myaccount.google.com]
* security -> sighnin -> app password

### Password Access

create smtp password in keychain like described in the [msmtp documentation](https://marlam.de/msmtp/msmtp.html#Authentication)

    security add-internet-password -s smtp.gmail.com -r smtp -a jirgnmssnr@googlemail.com -w

use this password in the following configurations
* .msmtprc  => `passwordeval security find-internet-password -s 'smtp.gmail.com' -a 'jirgnmssnr@googlemail.com' -w`
* .mbsyncrc => `PassCmd "security find-internet-password -s 'smtp.gmail.com' -a 'jirgnmssnr@googlemail.com' -w"`

## Contacts

### vdirsyncer

#### iCloud

#### Google
* [google api library](https://console.developers.google.com/apis/library)
