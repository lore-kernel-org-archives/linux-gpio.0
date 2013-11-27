From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH v2] gpio-lynxpoint: Allow building as a module
Date: Wed, 27 Nov 2013 15:46:06 +0100
Message-ID: <20131127154606.5b6d6742@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:53235 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752274Ab3K0OqL (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 27 Nov 2013 09:46:11 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-gpio@vger.kernel.org

Change CONFIG_GPIO_LYNXPOINT from bool to tristate so that the
gpio-lynxpoint driver can be built as a module.

Add the required glue: an exit function to unregister the driver, and
module information.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig          |    2 +-
 drivers/gpio/gpio-lynxpoint.c |   11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

--- linux-3.13-rc1.orig/drivers/gpio/Kconfig	2013-11-27 14:27:39.776405958 +0100
+++ linux-3.13-rc1/drivers/gpio/Kconfig	2013-11-27 14:47:01.604049477 +0100
@@ -353,7 +353,7 @@ config GPIO_GE_FPGA
 	  board computers.
 
 config GPIO_LYNXPOINT
-	bool "Intel Lynxpoint GPIO support"
+	tristate "Intel Lynxpoint GPIO support"
 	depends on ACPI && X86
 	select IRQ_DOMAIN
 	help
--- linux-3.13-rc1.orig/drivers/gpio/gpio-lynxpoint.c	2013-11-26 15:44:46.827657836 +0100
+++ linux-3.13-rc1/drivers/gpio/gpio-lynxpoint.c	2013-11-27 15:42:16.563778124 +0100
@@ -469,4 +469,15 @@ static int __init lp_gpio_init(void)
 	return platform_driver_register(&lp_gpio_driver);
 }
 
+static void __exit lp_gpio_exit(void)
+{
+	platform_driver_unregister(&lp_gpio_driver);
+}
+
 subsys_initcall(lp_gpio_init);
+module_exit(lp_gpio_exit);
+
+MODULE_AUTHOR("Mathias Nyman (Intel)");
+MODULE_DESCRIPTION("GPIO interface for Intel Lynxpoint");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:lp_gpio");


-- 
Jean Delvare
Suse L3 Support
