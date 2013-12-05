From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 0/4] gpiolib: clean up messaging part
Date: Thu,  5 Dec 2013 11:26:22 +0200
Message-ID: <1386235586-16713-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:39275 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751351Ab3LEJ1M (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 5 Dec 2013 04:27:12 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Compile tested and tested on Medfield with SFI.

Changes since v2:
 - applied Mika's Reviewed tag (except patch 2/4 as it was modified)
 - address Alexandre's comments.

[1] http://www.spinics.net/lists/kernel/msg1645907.html
[2] http://www.spinics.net/lists/linux-acpi/msg47572.html

Andy Shevchenko (4):
  gpiolib: unify pr_* messages format
  gpiolib: introduce chip_* to print with chip->label prefix
  gpiolib: convert gpiod_lookup description to kernel-doc
  gpiolib: update inline documentation of gpiod_get_index()

 drivers/gpio/gpiolib.c      | 117 ++++++++++++++++++++++++--------------------
 include/linux/gpio/driver.h |  26 ++++------
 2 files changed, 73 insertions(+), 70 deletions(-)

-- 
1.8.4.4

