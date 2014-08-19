From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 0/2] gpio: acpi: some sanity fixes
Date: Tue, 19 Aug 2014 10:06:07 -0700
Message-ID: <1408467969-21226-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:6226 "EHLO
	hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752252AbaHSRGU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Aug 2014 13:06:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>

These two small patches perform some sanity changes in gpiolib-acpi:

1) Stop assuming there is a direct 1:1 mapping between GPIO descriptors
and GPIO numbers. This should not be taken for granted and will likely
change in the future. GPIO descriptors should be handled like regulators
and other allocated resources, i.e. obtained and preserved for later use
instead of constantly requested using gpiochip_get_desc()

2) Change the prototype of gpiochip_request_own_desc() to match other
functions in driver.h. This results is a simplification of the related
code in gpiolib-acpi, which should be a good thing.

Changes since v1:
- Fixed a misdeclaration of struct gpio_desc
- Added Mika's Tested-by

Alexandre Courbot (2):
  gpio: acpi: normalize use of gpiochip_get_desc()
  gpio: change gpiochip_request_own_desc() prototype

 Documentation/gpio/driver.txt |  3 ++-
 drivers/gpio/gpiolib-acpi.c   | 30 +++++++++++-------------------
 drivers/gpio/gpiolib.c        | 18 ++++++++++++++----
 include/linux/gpio/driver.h   |  3 ++-
 4 files changed, 29 insertions(+), 25 deletions(-)

-- 
2.0.4

