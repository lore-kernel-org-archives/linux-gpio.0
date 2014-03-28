From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: gpio / ACPI: Add support for ACPI GPIO operation regions
Date: Fri, 28 Mar 2014 11:37:32 +0300
Message-ID: <20140328083732.GP25192@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:36131 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752595AbaC1Ihw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Mar 2014 04:37:52 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mika.westerberg@linux.intel.com
Cc: linux-gpio@vger.kernel.org

Hello Mika Westerberg,

The patch 473ed7be0da0: "gpio / ACPI: Add support for ACPI GPIO
operation regions" from Mar 14, 2014, leads to the following static
checker warning:

	drivers/gpio/gpiolib-acpi.c:454 acpi_gpio_adr_space_handler()
	warn: should 'gpiod_get_raw_value(desc) << i' be a 64 bit type?

drivers/gpio/gpiolib-acpi.c
   451                  if (function == ACPI_WRITE)
   452                          gpiod_set_raw_value(desc, !!((1 << i) & *value));
   453                  else
   454                          *value |= gpiod_get_raw_value(desc) << i;
   455          }

"value" is u64 pointer but gpiod_get_raw_value() is an int so this could
lead to wrapping bugs.

regards,
dan carpenter
