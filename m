From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/4] gpio: batch #3: remove modular code from non-modular drivers
Date: Mon, 9 May 2016 19:59:54 -0400
Message-ID: <1462838398-10725-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail1.windriver.com ([147.11.146.13]:60431 "EHLO
	mail1.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753914AbcEJAAn (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 May 2016 20:00:43 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Alexandre Courbot <gnurou@gmail.com>, Fabian Vogt <fabian@ritter-vogt.de>, "Hans J . Koch" <hjk@linutronix.de>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Rabin Vincent <rabin.vincent@stericsson.com>

For GPIO, I'd divided up the the audit of modular usage in non-modular
drivers into three categories to ease review and limit the batch size.
Group #1 & #2 have been submitted and merged ; this here is group #3.

The breakdown of the three groups was as follows:

1) just replacement of modular macros with their non-modular equivalents
   that CPP would have inserted anyway ; this means runtime equivalence
   and actually also binary equivalence.

2) as per #1 but also with the removal of unused/orphaned __exit functions
   that could never be called/exercised.  This also maintains runtime
   equivalence, but since the unused __exit function is gone, there is a
   reduction in the object file size and hence not binary equivalence, eg:
       before: -rw-rw-r-- 1 8828 drivers/gpio/gpio-rc5t583.o
       after:  -rw-rw-r-- 1 7396 drivers/gpio/gpio-rc5t583.o

3) as per #2 but also with the removal of a ".remove" function that is
   hooked into the driver struct.   This ".remove" function would of
   course not be called from the __exit function since that is never run.
   However in theory, someone could have triggered it via sysfs unbind,
   even though there isn't a sensible use case for doing so.  So to cover
   that possibility, we've also disabled sysfs unbind in these drivers.

Since this is the #3 of 3, an additional bind comment is warranted.
One could argue that the suppress bind is overkill, since it isn't used
by all non-modular drivers everywhere, but it does ensure that anyone
who was manually trying to (ab)use it with _these_ drivers gets a clear
signal that it was never meant to be used like that.

For anyone new to the underlying goal of this cleanup, we are trying to
not use module support for code that can never be built as a module since:

 (1) it is easy to accidentally write unused module_exit and remove code
 (2) it can be misleading when reading the source, thinking it can be
     modular when the Makefile and/or Kconfig prohibit it
 (3) it requires the include of the module.h header file which in turn
     includes nearly everything else, thus adding to CPP overhead.
 (4) it gets copied/replicated into other code and spreads like weeds.

There are no initcall level changes here; everything was at the level
of device_initcall and remains so, by using the builtin equivalents.

I fixed up the shortlogs in this lot to match the existing gpio shortlog
format (no "device/" in the prefix, etc.) -- apologies for not catching
that for the earlier lot of commits in #1 and #2.

Build tested for 5-6 different key arch on today's linux-next to ensure
no silly typos crept in.

There is one remaining trivial bool ---> tristate gpio conversion I have to
send that didn't fit #1/#2/#3, but getting these groups done is 99% of it,
so thanks in advance for handling these and getting them off of my queue.

Paul.
---

Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Fabian Vogt <fabian@ritter-vogt.de>
Cc: Hans J. Koch <hjk@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Cc: Rabin Vincent <rabin.vincent@stericsson.com>

Paul Gortmaker (4):
  gpio: sodaville: make it explicitly non-modular
  gpio: stmpe: make it explicitly non-modular
  gpio: timberdale: make it explicitly non-modular
  gpio: zevio: make it explicitly non-modular

 drivers/gpio/gpio-sodaville.c  | 28 ++++++----------------------
 drivers/gpio/gpio-stmpe.c      | 31 +++++--------------------------
 drivers/gpio/gpio-timberdale.c | 35 +++++------------------------------
 drivers/gpio/gpio-zevio.c      | 21 +++------------------
 4 files changed, 19 insertions(+), 96 deletions(-)

-- 
2.8.0

