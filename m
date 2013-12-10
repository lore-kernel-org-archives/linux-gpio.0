From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v6 0/2] gpiolib, sfi: introduce SFI GPIO helpers
Date: Tue, 10 Dec 2013 15:21:18 +0200
Message-ID: <1386681680-18324-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:33796 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752968Ab3LJNVw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 10 Dec 2013 08:21:52 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Here is a sixth [1] version of the SFI GPIO helpers. This series contains SFI
GPIO helpers along with the update of GPIO library to lookup for SFI resources.

It has been tested on Medfield device on top of recent linux-next-20131210 +
Mika's ACPI gpio patches [2].

Changes since v6:
 - remove FSF address
 - require dev to be NULL when looking up for GPIO line

[1] https://lkml.org/lkml/2013/6/5/316
[2] http://www.spinics.net/lists/linux-acpi/msg47572.html

Andy Shevchenko (2):
  SFI: store GPIO table and export lookup function
  gpiolib: append SFI helpers for GPIO API

 drivers/gpio/Kconfig       |   4 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpiolib-sfi.c |  27 +++++++++++
 drivers/gpio/gpiolib.c     |   3 ++
 drivers/gpio/gpiolib.h     |  13 +++++
 drivers/sfi/Makefile       |   2 +-
 drivers/sfi/sfi_core.c     |   6 +++
 drivers/sfi/sfi_core.h     |   3 ++
 drivers/sfi/sfi_gpio.c     | 115 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/sfi.h        |  10 ++++
 10 files changed, 183 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpio/gpiolib-sfi.c
 create mode 100644 drivers/sfi/sfi_gpio.c

-- 
1.8.4.4

