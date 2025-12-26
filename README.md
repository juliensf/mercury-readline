# Mercury-Readline

`mercury_readline` is a basic [Mercury](https://mercurylang.org) interface
to the [GNU Readline](https://tiswww.cwru.edu/php/chet/readline/rltop.html)
library.

## License

`mercury_readline` is licensed under a simple 2-clause BSD style license.
See the file [COPYING](COPYING) for details.

Keep in mind however, that GNU Readline itself is licensed under the
[GNU General Public License, version 3](https://www.gnu.org/licenses/gpl-3.0.html).
(This interface should also work with [Editline](https://github.com/troglobit/editline),
which has a less restrictive license.)

## Installation

Check the values in the file [Make.options](Make.options) to see if they agree
with your system, then do:

    make install

You can also override values in [Make.options](Make.options) on the command
line, for example

    make INSTALL_PREFIX=/foo/bar install

causes the library to be installed in the directory `/foo/bar`.

## Author

Julien Fischer <juliensf@gmail.com>
