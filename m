From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH 0/4] gpiolib: clean up and potential bug fix
Date: Tue,  3 Dec 2013 21:03:22 +0200
Message-ID: <1386097406-24585-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:7409 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753409Ab3LCTD4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 3 Dec 2013 14:03:56 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The patch series mostly addressing messaging format and fix for one potential
bug. It depends on recent Alex's patch [1] and Mika's patchset [2].

Compile tested and tested on Medfield with SFI. If Mika would have time, he
might test it tomorrow on newer machines.

[1] http://www.spinics.net/lists/kernel/msg1645907.html
[2] http://www.spinics.net/lists/linux-acpi/msg47572.html

Andy Shevchenko (4):
  gpiolib: unify pr_* messages format
  gpiolib: introduce chip_* to print with chip->label prefix
  gpiolib: convert gpiod_lookup description to kernel-doc
  gpiolib: fix potential crash in gpiod_get() et alia

 drivers/gpio/gpiolib.c      | 148 ++++++++++++++++++++++++--------------------
 include/linux/gpio/driver.h |  26 +++-----
 2 files changed, 89 insertions(+), 85 deletions(-)

-- 
1.8.4.4

