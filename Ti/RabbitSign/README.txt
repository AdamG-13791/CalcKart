RabbitSign 2.1
--------------

 RabbitSign is a free implementation of the algorithms used to
 digitally sign software for the Texas Instruments TI-73, TI-83 Plus,
 TI-84 Plus, TI-89, TI-92 Plus, and Voyage 200 calculators.

 RabbitSign can handle a variety of common input file formats,
 including GraphLink files as well as "plain" hex and binary files.
 It is quite a lot faster than the official application signing
 programs from TI, and unlike those programs, does not have any
 arbitrary limitations on file names or contents.  It also has the
 ability (unique as far as I know) to re-sign applications that have
 been signed previously.

 Finally, of course, RabbitSign is free software, and should be able
 to run on any modern system with an ANSI C compiler.

 I have NOT received any assistance from TI on this, nor have I
 attempted to reverse-engineer any of their programs.  The details of
 the application format and signing algorithm were determined purely
 by my analysis of the output of TI's and Peter-Martijn Kuipers'
 appsign tools.


Installing
----------

 This is a binary package for Microsoft Windows systems.  For other
 systems, please refer to the source package, available on the Web at:

  http://www.ticalc.org/pub/unix/rabbitsign.tar.gz


Using
-----

 In order to sign an application or OS, you need to have an
 appropriate signing key.  The signing key for "shareware" TI-83/84
 Plus apps, 0104.key, is included in this package.  (The corresponding
 keys for the TI-73, TI-89, and TI-92 Plus have not been released, so
 only TI can sign applications for those calculators.)

 In addition, this package includes an unofficial signing key, 05.key,
 which can be used for TI-83/84 Plus operating systems.  To install an
 OS that has been signed using this key, you must first install the
 corresponding certificate, which can be done using Brandon Wilson's
 Free83P utility.

 To sign a hex or binary app file, use a command such as

	rabbitsign -g myapp.hex

 This will search for the key specified in the app header (using the
 801x field.)  It will then sign the app and write the result in
 GraphLink format to myapp.8xk.

 To use a specific key file, use the -k option:

	rabbitsign -g -k foo.key myapp.hex

 Run 'man rabbitsign' for more information.


A word of caution
-----------------

 If you do somehow acquire a valid signing key for the TI-89 or TI-92
 Plus, you should be able to use RabbitSign to sign applications for
 those calculators.  However, keep in mind that on those calculators,
 it is possible (in fact, quite easy) to seriously break the system
 merely by installing a buggy Flash app.  So be sure to test your app
 in an emulator before trying to install it on a real calculator!

 (Of course, testing your app before installing it is a good idea on
 the TI-83 Plus as well!)


History
-------

 version 2.1 -- July 25, 2009

  * Added the unofficial "05" key, which can be used in combination
    with Brandon Wilson's Free83P to sign TI-83/84 Plus OSes.

 version 2.0 -- July 19, 2009

  * Added the RSA algorithm; RabbitSign now allows signing and
    validating OS upgrades and 68k applications.  (You still need, of
    course, to obtain a valid signing key somehow.)
  * RabbitSign now checks that no app page begins with FFh.  (App
    pages that begin with FFh will cause problems when defragmenting.)
  * Added the -P option, which allows you to sign apps that come very
    close to filling the last page.  (This means adding an extra page
    to hold the signature.  It's still not a good idea most of the
    time.)
  * Added the -f option, which forces apps to be signed even if they
    contain problematic data or headers.
  * The 0104 public and private keys, along with various other known
    public keys, are now included in the RabbitSign library; key files
    are no longer required (you can still use your own key files, if
    necessary.)
  * Improved performance a little bit when using mpz.c.
  * mpz.c will now work correctly on 64-bit (and larger) systems.
  * Major API changes to provide various new features, and generally
    to make RabbitSign easier to integrate into other software.

 version 1.2 -- July 24, 2007

  * Avoid setting app length to 55 modulo 64.  (Such apps do not
    validate correctly on the TI-73 or 83+ BE, due to a bug in the
    boot code.)

 version 1.1 -- May 31, 2007

  * OMIT_FINAL_NEWLINE and PAD_OUTPUT are now default, to work around
    bugs in tifiles2 and TI-Connect respectively.
  * Padding added won't span a page boundary.
  * Corrected the warning message when re-signing a too-long app.
  * Just in case it wasn't fast enough, it now uses mpz_gcdext().  Try
    it with Niels M??ller's subquadratic GCD code...
  * Just in case it was too fast, a set of simple, slow arithmetic
    routines is included for people too lazy to get GMP.
  * Unless suppressed with -q, warnings result in an exit status of 1.
  * Test code now compiles on old and/or dumb systems that provide
    rand() and not random().

 version 1.0 -- February 3, 2006

  * First public release.


Legal stuff
-----------

 RabbitSign is copyright (C) 2004-2009 Benjamin Moody.

 This program is free software; you can redistribute and/or modify it
 under the terms of the GNU General Public License version 3 or later.
 There is no warranty of any kind.  See the included 'COPYING' for
 details.

 The MD5 calculating code (md5.c and md5.h) comes from GNU md5sum,
 which was written by Ulrich Drepper and is copyright 1995-96 by the
 Free Software Foundation.  GNU md5sum is part of the GNU Coreutils
 package; see http://www.gnu.org/software/coreutils/ for more
 information.


Author
------

 Benjamin Moody / floppusmaximus@users.sf.net

 Bug reports, please.
