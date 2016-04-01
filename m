From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/6] gpio: batch #2: remove modular code from non-modular drivers
Date: Fri, 1 Apr 2016 14:49:32 -0400
Message-ID: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Alexandre Courbot <gnurou@gmail.com>, Graeme Gregory <gg@slimlogic.co.uk>, Gregory Bean <gbean@codeaurora.org>, Hanumath Prasad <hanumath.prasad@stericsson.com>, Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Rabin Vincent <rabin.vincent@stericsson.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

For GPIO, I've divided up the the audit of modular usage in non-modular
drivers into three categories to ease review and limit the batch size.
Group #1 has been submitted and merged ; this group here is group #2.

The breakdown of the three groups is as follows:

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

For anyone new to the underlying goal of this cleanup, we are trying to
not use module support for code that can never be built as a module since:

 (1) it is easy to accidentally write unused module_exit and remove code
 (2) it can be misleading when reading the source, thinking it can be
     modular when the Makefile and/or Kconfig prohibit it
 (3) it requires the include of the module.h header file which in turn
     includes nearly everything else, thus adding to CPP overhead.
 (4) it gets copied/replicated into other code and spreads like weeds.

Interestingly enough, none of the drivers patched here were using the
module_init() binding ; they all used subsys_initcall() instead, which
I think reinforces point #4 above - i.e. nobody writes a new driver
from scratch.

Build tested for x86-64, arm and arm64 on today's linux-next to ensure
no silly typos crept in.

Paul.
---

Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Graeme Gregory <gg@slimlogic.co.uk>
Cc: Gregory Bean <gbean@codeaurora.org>
Cc: Hanumath Prasad <hanumath.prasad@stericsson.com>
Cc: Jorge Eduardo Candelaria <jedu@slimlogic.co.uk>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Rabin Vincent <rabin.vincent@stericsson.com>
Cc: linux-gpio@vger.kernel.org

Paul Gortmaker (6):
  drivers/gpio: make gpio-rc5t583.c explicitly non-modular
  drivers/gpio: make gpio-tc3589x.c explicitly non-modular
  drivers/gpio: make gpio-sx150x.c explicitly non-modular
  drivers/gpio: make gpio-palmas.c explicitly non-modular
  drivers/gpio: make gpio-tps65910.c explicitly non-modular
  drivers/gpio: make gpio-tps6586x.c explicitly non-modular

 drivers/gpio/gpio-palmas.c   | 13 +------------
 drivers/gpio/gpio-rc5t583.c  | 12 ------------
 drivers/gpio/gpio-sx150x.c   | 15 ++++-----------
 drivers/gpio/gpio-tc3589x.c  | 11 -----------
 drivers/gpio/gpio-tps6586x.c | 13 +------------
 drivers/gpio/gpio-tps65910.c | 16 ++--------------
 6 files changed, 8 insertions(+), 72 deletions(-)

-- 
2.6.1
