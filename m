From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/9] gpio: batch #1: remove modular usage from non-modular drivers
Date: Sun, 27 Mar 2016 11:44:40 -0400
Message-ID: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:43675 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753018AbcC0PpW (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 27 Mar 2016 11:45:22 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Alexandre Courbot <gnurou@gmail.com>, Baruch Siach <baruch@tkos.co.il>, bcm-kernel-feedback-list@broadcom.com, Feng Kan <fkan@apm.com>, Jonas Jensen <jonas.jensen@gmail.com>, Jun Nie <jun.nie@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Ray Jui <rjui@broadcom.com>, Wu Guoxing <b39297@freescale.com>, linux-gpio@vger.kernel.org

For GPIO, I've divided up the the audit of modular usage in non-modular
drivers into three categories to ease review and limit the batch size.
The breakdown of the three groups is as follows:

1) just replacement of modular macros with their non-modular equivalents
   that CPP would have inserted anyway ; this means runtime equivalence
   and actually also binary equivalence.

[This lot represents #1, which are essentially the "free" ones that have
essentially zero impact beyond the original desired cleanup goal itself.]

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

I will send #2 once this #1 is finalized/merged and #3 once #2 is merged.

For anyone new to the underlying goal of this cleanup, we are trying to
not use module support for code that can never be built as a module since:

 (1) it is easy to accidentally write unused module_exit and remove code
 (2) it can be misleading when reading the source, thinking it can be
     modular when the Makefile and/or Kconfig prohibit it
 (3) it requires the include of the module.h header file which in turn
     includes nearly everything else, thus adding to CPP overhead.
 (4) it gets copied/replicated into other code and spreads like weeds.

Build tested for arm and arm64 on 4.6-rc1 to ensure no silly typos exist.

Paul.
---

Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: Baruch Siach <baruch@tkos.co.il>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Feng Kan <fkan@apm.com>
Cc: Jonas Jensen <jonas.jensen@gmail.com>
Cc: Jun Nie <jun.nie@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Wu Guoxing <b39297@freescale.com>
Cc: linux-gpio@vger.kernel.org

Paul Gortmaker (9):
  drivers/gpio: make gpio-bcm-kona.c explicitly non-modular
  drivers/gpio: make gpio-mb86s7x.c driver explicitly non-modular
  drivers/gpio: make gpio-mc9s08dz60.c explicitly non-modular
  drivers/gpio: make gpio-moxart.c explicitly non-modular
  drivers/gpio: make gpio-mvebu.c explicitly non-modular
  drivers/gpio: make gpio-pl061.c explicitly non-modular
  drivers/gpio: make gpio-sta2x11.c explicitly non-modular
  drivers/gpio: make gpio-xgene.c explicitly non-modular
  drivers/gpio: make gpio-zx.c explicitly non-modular

 drivers/gpio/gpio-bcm-kona.c   | 14 +++++---------
 drivers/gpio/gpio-mb86s7x.c    |  8 +-------
 drivers/gpio/gpio-mc9s08dz60.c | 12 ++----------
 drivers/gpio/gpio-moxart.c     |  7 +------
 drivers/gpio/gpio-mvebu.c      |  5 ++---
 drivers/gpio/gpio-pl061.c      | 12 ++++--------
 drivers/gpio/gpio-sta2x11.c    |  8 ++------
 drivers/gpio/gpio-xgene.c      |  9 +--------
 drivers/gpio/gpio-zx.c         | 14 ++++++--------
 9 files changed, 24 insertions(+), 65 deletions(-)

-- 
2.6.1
