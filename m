From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 0/5] gpiolib: clean up and potential bug fix
Date: Wed,  4 Dec 2013 15:42:55 +0200
Message-ID: <1386164580-32288-1-git-send-email-andriy.shevchenko@linux.intel.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:17755 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932419Ab3LDNnb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 4 Dec 2013 08:43:31 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <acourbot@nvidia.com>, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

The patch series mostly addressing messaging format and fix for one potential
bug. It depends on recent Alex's patch [1] and Mika's patchset [2].

Compile tested and tested on Medfield with SFI.

Changes since v1:
 - applied Acked and Reviewed tags
 - instead of patch 4/4 create patch 4/5 and 5/5 that don't change
   functionality, and indentation things moved to patch 1/5

[1] http://www.spinics.net/lists/kernel/msg1645907.html
[2] http://www.spinics.net/lists/linux-acpi/msg47572.html

Andy Shevchenko (5):
  gpiolib: unify pr_* messages format
  gpiolib: introduce chip_* to print with chip->label prefix
  gpiolib: convert gpiod_lookup description to kernel-doc
  gpiolib: update commentary at gpiod_get_index()
  gpiolib: uniform messages in gpiod_find()

 drivers/gpio/gpiolib.c      | 121 ++++++++++++++++++++++++--------------------
 include/linux/gpio/driver.h |  26 ++++------
 2 files changed, 75 insertions(+), 72 deletions(-)

-- 
1.8.4.4

