From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 0/9] pinctrl: make non-modular drivers really non modular
Date: Mon, 6 Jun 2016 22:42:59 -0400
Message-ID: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail5.windriver.com ([192.103.53.11]:58691 "EHLO mail5.wrs.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753246AbcFGCnp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 6 Jun 2016 22:43:45 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Baruch Siach <baruch@tkos.co.il>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jeff Wu <Jeff.Wu@amd.com>, Joachim Eastwood <manabian@gmail.com>, Ken Xue <Ken.Xue@amd.com>, Laxman Dewangan <ldewangan@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Ludovic Desroches <ludovic.desroches@atmel.com>, Michal Simek <michal.simek@xilinx.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, linux-gpio@vger.kernel.org

=46or anyone new to the underlying goal of this cleanup, we are trying =
to
not use module support for code that can never be built as a module sin=
ce:

 (1) it is easy to accidentally write unused module_exit and remove cod=
e
 (2) it can be misleading when reading the source, thinking it can be
     modular when the Makefile and/or Kconfig prohibit it
 (3) it requires the include of the module.h header file which in turn
     includes nearly everything else, thus adding to CPP overhead.
 (4) it gets copied/replicated into other code and spreads like weeds.

Similar to what was done for GPIO, I'd divided up the the audit of
modular usage in non-modular pinctrl drivers into reasonable batch
sizes to hopefully ease review.

This batch deals with individual standalone drivers that are nearly
all in the top level directory.

Changes seen here cover the following categories:

  -just replacement of modular macros with their non-modular
   equivalents that CPP would have inserted anyway

  -the removal of including module.h ; replaced with init.h
   as required based on whether the file already had it.

  -the removal of any/all unused/orphaned __exit functions
   that would never be called/exercised.

  -the removal of any ".remove" functions that were hooked into
   the driver struct.   This ".remove" function would of
   course not be called from the __exit function since that was
   never run.  However in theory, someone could have triggered it
   via sysfs unbind, even though there isn't a sensible use case
   for doing so.  So to cover that possibility, we've also disabled
   sysfs unbind in these drivers.

There are no initcall level changes here; everything was at the level
of device_initcall and remains so, by using the builtin equivalents.

Build tested for several different key arch on the Monday linux-next
tree to ensure no silly typos crept in.

Paul.
---

Cc: Baruch Siach <baruch@tkos.co.il>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>
Cc: Jeff Wu <Jeff.Wu@amd.com>
Cc: Joachim Eastwood <manabian@gmail.com>
Cc: Ken Xue <Ken.Xue@amd.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Ludovic Desroches <ludovic.desroches@atmel.com>
Cc: Michal Simek <michal.simek@xilinx.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: "S=C3=B6ren Brinkmann" <soren.brinkmann@xilinx.com>
Cc: linux-gpio@vger.kernel.org

Paul Gortmaker (9):
  pinctrl: as3722: make it explicitly non-modular
  pinctrl: baytrail: make it explicitly non-modular
  pinctrl: at91: make it explicitly non-modular
  pinctrl: lpc18xx: make it explicitly non-modular
  pinctrl: amd: make it explicitly non-modular
  pinctrl: palmas: make it explicitly non-modular
  pinctrl: zynq: make it explicitly non-modular
  pinctrl: digicolor: make it explicitly non-modular
  pinctrl: at91-pio4: make it explicitly non-modular

 drivers/pinctrl/intel/pinctrl-baytrail.c | 25 ++++--------------------=
-
 drivers/pinctrl/pinctrl-amd.c            | 23 +++--------------------
 drivers/pinctrl/pinctrl-as3722.c         | 20 +++-----------------
 drivers/pinctrl/pinctrl-at91-pio4.c      | 22 +++-------------------
 drivers/pinctrl/pinctrl-at91.c           | 11 -----------
 drivers/pinctrl/pinctrl-digicolor.c      | 16 +++-------------
 drivers/pinctrl/pinctrl-lpc18xx.c        | 20 +++-----------------
 drivers/pinctrl/pinctrl-palmas.c         | 10 ++--------
 drivers/pinctrl/pinctrl-zynq.c           | 13 +------------
 9 files changed, 22 insertions(+), 138 deletions(-)

--=20
2.8.0

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
