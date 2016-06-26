From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 00/19] pinctrl/freescale: fix module usage in non-modular code
Date: Sat, 25 Jun 2016 22:46:33 -0400
Message-ID: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:58266 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752139AbcFZCrp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 25 Jun 2016 22:47:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Alexander Shiyan <shc_work@mail.ru>, Anson Huang <Anson.Huang@freescale.com>, Denis Carikli <denis@eukrea.com>, Dong Aisheng <dong.aisheng@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Markus Pargmann <mpa@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, linux-gpio@vger.kernel.org

This series covers the audit of non-modular module code use in the
drivers/pinctrl/freescale directory.  It has a few more commits than
I'd normally like in a single series, but fortunately the most of them
are dead simple.  That said, I can put the branch on kernel.org if
that makes life easier for merge processing, given the quantity.

FWIW, I originally had [locally] treated this whole Fsl directory as a
single patch, but upon reflection that didn't seem right either, given
the various authors, and the size of the combined changeset virtually
ensured that nobody Cc'd would genuinely review it all.  So 19 it is.

The changes in the drivers for #2-#16 inclusive are just removing the
module.h include, the unused exit function, and the no-op AUTHOR/LICENSE
tags with the occasional no-op MODULE_DEVICE_TABLE remove sprinkled in.

Only the imx23 and imx28 drivers still linked in a ".remove" function
(a shared one) and that usage is phased out in the patch #17 and #18,
where we also block sysfs unbind.  We get rid of the shared fcn in #19.

Quasi generic boiler plate description follows; included for folks who
haven't yet seen what we are aiming to achieve with this operation.

We are trying to not use module support for code that can never be built
as a module because:

 (1) it is easy to accidentally write unused module_exit and remove code
 (2) it can be misleading when reading the source, thinking it can be
     modular when the Makefile and/or Kconfig prohibit it
 (3) it requires the include of the module.h header file which in turn
     includes nearly everything else, thus adding to CPP overhead.
 (4) it gets copied/replicated into other code and spreads like weeds.

The freescale directory is a good example of #4, since all the
drivers seem to share a common heritage from one driver that had the
fundamental Kconfig vs. code mismatch originally (probably imx1).

Changes seen here cover the following categories:

  -just replacement of modular macros with their non-modular
   equivalents that CPP would have inserted anyway

  -the removal of including module.h ; replaced with init.h
   and/or export.h as required based on whether the file used it.

  -the removal of any/all unused/orphaned __exit functions that
   would never be called.

  -the removal of any ".remove" functions that were hooked into
   the driver struct.   This ".remove" function would of
   course not be called from the __exit function since that was
   never run.  However in theory, someone could have triggered it
   via sysfs unbind, even though there isn't a sensible use case
   for doing so.  So to cover that possibility, we've also disabled
   sysfs unbind in the driver.  [only imx23 and imx28]

There are no initcall level changes here; everything stays at the level
of initcall it was previously - either by not using modular versions to
begin with, or by using the builtin level equivalents.

As usual, we can consider making some of these tristate if the author
has strong feelings about extending support into the modular realm,
but I won't be able to run-time test any of that.

Build testing done on linux-next (on arm) as usual.

Paul.
---

Cc: Alexander Shiyan <shc_work@mail.ru>
Cc: Anson Huang <Anson.Huang@freescale.com>
Cc: Denis Carikli <denis@eukrea.com>
Cc: Dong Aisheng <dong.aisheng@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Markus Pargmann <mpa@pengutronix.de>
Cc: Shawn Guo <shawn.guo@linaro.org>
Cc: linux-gpio@vger.kernel.org

Paul Gortmaker (19):
  pinctrl: freescale: remove needless module.h include
  pinctrl: imx1: make it explicitly non-modular
  pinctrl: imx21: make it explicitly non-modular
  pinctrl: imx25: make it explicitly non-modular
  pinctrl: imx27: make it explicitly non-modular
  pinctrl: imx35: make it explicitly non-modular
  pinctrl: imx50: make it explicitly non-modular
  pinctrl: imx51: make it explicitly non-modular
  pinctrl: imx53: make it explicitly non-modular
  pinctrl: imx6dl: make it explicitly non-modular
  pinctrl: imx6q: make it explicitly non-modular
  pinctrl: imx6sl: make it explicitly non-modular
  pinctrl: imx6sx: make it explicitly non-modular
  pinctrl: imx6ul: make it explicitly non-modular
  pinctrl: imx7d: make it explicitly non-modular
  pinctrl: vf610: make it explicitly non-modular
  pinctrl: imx23: make it explicitly non-modular
  pinctrl: imx28: make it explicitly non-modular
  pinctrl: remove orphaned exported ".remove" function

 drivers/pinctrl/freescale/pinctrl-imx.c       |  1 -
 drivers/pinctrl/freescale/pinctrl-imx1-core.c |  1 -
 drivers/pinctrl/freescale/pinctrl-imx1.c      |  9 ++-------
 drivers/pinctrl/freescale/pinctrl-imx21.c     |  8 ++------
 drivers/pinctrl/freescale/pinctrl-imx23.c     | 17 ++++-------------
 drivers/pinctrl/freescale/pinctrl-imx25.c     | 10 ----------
 drivers/pinctrl/freescale/pinctrl-imx27.c     | 10 ----------
 drivers/pinctrl/freescale/pinctrl-imx28.c     | 17 ++++-------------
 drivers/pinctrl/freescale/pinctrl-imx35.c     | 10 ----------
 drivers/pinctrl/freescale/pinctrl-imx50.c     |  9 ---------
 drivers/pinctrl/freescale/pinctrl-imx51.c     | 10 ----------
 drivers/pinctrl/freescale/pinctrl-imx53.c     | 10 ----------
 drivers/pinctrl/freescale/pinctrl-imx6dl.c    | 14 +++-----------
 drivers/pinctrl/freescale/pinctrl-imx6q.c     | 10 ----------
 drivers/pinctrl/freescale/pinctrl-imx6sl.c    | 15 +++------------
 drivers/pinctrl/freescale/pinctrl-imx6sx.c    | 14 +++-----------
 drivers/pinctrl/freescale/pinctrl-imx6ul.c    | 14 +++-----------
 drivers/pinctrl/freescale/pinctrl-imx7d.c     | 14 +++-----------
 drivers/pinctrl/freescale/pinctrl-mxs.c       | 12 ------------
 drivers/pinctrl/freescale/pinctrl-mxs.h       |  1 -
 drivers/pinctrl/freescale/pinctrl-vf610.c     | 10 ----------
 21 files changed, 27 insertions(+), 189 deletions(-)

-- 
2.8.4

