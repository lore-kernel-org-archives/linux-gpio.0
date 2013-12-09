From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v4 0/2] gpiolib, sfi: introduce SFI GPIO helpers
Date: Mon,  9 Dec 2013 13:50:27 +0200
Message-ID: <1386589829-2877-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:53163 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932744Ab3LILvD (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Dec 2013 06:51:03 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, David Cohen <david.a.cohen@intel.com>, Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@intel.com>, Len Brown <lenb@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Here is a fourth [1] version of the SFI GPIO helpers. This series contains SFI
GPIO helpers along with the update of GPIO library to lookup for SFI resources.

It has been tested on Medfield device on top of linux-next 20131209 +
Alexandre's GPIO descriptor API update [2], Mika's ACPI gpio patches [3] and my
GPIO library clean up [4].

Changes since v3:
 - push patch 1/3 separate from this series
 - address David's and Alexandre's comments

[1] https://lkml.org/lkml/2013/6/5/316
[2] http://www.spinics.net/lists/kernel/msg1645907.html
[3] http://www.spinics.net/lists/linux-acpi/msg47572.html
[4] https://www.mail-archive.com/linux-gpio@vger.kernel.org/msg01515.html

Andy Shevchenko (2):
  SFI: store GPIO table and export lookup function
  gpiolib: append SFI helpers for GPIO API

 drivers/gpio/Kconfig       |   4 ++
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpiolib-sfi.c |  28 +++++++++++
 drivers/gpio/gpiolib.c     |   3 ++
 drivers/gpio/gpiolib.h     |  13 +++++
 drivers/sfi/Makefile       |   2 +-
 drivers/sfi/sfi_core.c     |   6 +++
 drivers/sfi/sfi_core.h     |   3 ++
 drivers/sfi/sfi_gpio.c     | 121 +++++++++++++++++++++++++++++++++++++++++++++
 include/linux/sfi.h        |  10 ++++
 10 files changed, 190 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpio/gpiolib-sfi.c
 create mode 100644 drivers/sfi/sfi_gpio.c

-- 
1.8.4.4

