# Nodis(traction)

> Block websites within a daily time range.

By simply making use of host entries in /etc/hosts, nodis blocks access to
websites that distract you.

## Motivation

Recently, I've found myself more and more distracted, again, by the web. Having
some important stuff to finish for the end of the month, I'm sick of not
progressing on what really matters right now.  
I've written this script as a crutch to recover from this kind of addiction to
direct futile satisfaction. As any crutch, I think it should be temporary.

## Install

Dependencies:
 * awk (posix should work)
 * cron

`clone` the repository and `cd` into it

`git clone https://github.com/pldiiw/nodis --depth 1 && cd nodis`

Move the scripts somewhere in your path and set proper permissions to them if
necessary:

`install -o root -g root -t /usr/local/bin nodis nodis_update_hosts.awk`

## Usage

Here's the detailed help for nodis:

```
Block websites within a daily time range.

Usage: nodis <SUBCOMMAND>

SUBCOMMANDS:
  update
    Update nodis' entries inside the hosts file
  block <domain> <start_time> <end_time>
    Block a domain within specified time range
      domain     - The domain name to block
      start_time - When nodis should start to block the given domain
      end_time   - When nodis should stop blocking the given domain
  allow <domain>
    Remove a nodis entry
      domain     - The domain name to remove from the hosts file
  version
    Display current version
  usage
    Show only the different possible subcommands
  help
    Show the extended help

ENVIRONMENT VARIABLES:
  HOSTS_FILE - The path to the hosts file, defaults to /etc/hosts

TIME FORMAT:
  When specifying a time, the expected format should be parseable by
  the date(1) command

NODIS ENTRY FORMAT:
  The format used by nodis inside the hosts file is the following:
    127.0.0.1 <domain> ## <start_time> <end_time>
  You can manually edit the entries if you would like to, just be
  aware that you can write the times like this (regexp): HH.?MM
  Examples: 1430, 03:55, 22-01, 17h23

MULTIPLE TIME RANGES:
  If you would like to block a domain for multiples time ranges, simply use the
  block subcommand for each time range!
```

## Contribute

I'm open to any contribution, just post an issue and we will see together what
we can do about it.

## License

This software is licensed under the Unlicense, see the LICENSE file for more
information or visit http://unlicense.org/UNLICENSE

![Speed project 4h](http://www.fffff.at/widgets/speed-project/images/small_time_240.png)
