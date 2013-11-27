From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] gpio-lynxpoint: Allow building as a module
Date: Wed, 27 Nov 2013 15:19:20 +0100
Message-ID: <20131127151920.3f6c3b89@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:51789 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751871Ab3K0OTZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 27 Nov 2013 09:19:25 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>, linux-gpio@vger.kernel.org

Change CONFIG_GPIO_LYNXPOINT from bool to tristate so that the
gpio-lynxpoint driver can be built as a module.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.13-rc1.orig/drivers/gpio/Kconfig	2013-11-26 15:44:46.824657767 +0100
+++ linux-3.13-rc1/drivers/gpio/Kconfig	2013-11-27 14:27:34.911295631 +0100
@@ -353,7 +353,7 @@ config GPIO_GE_FPGA
 	  board computers.
 
 config GPIO_LYNXPOINT
-	bool "Intel Lynxpoint GPIO support"
+	tristate "Intel Lynxpoint GPIO support"
 	depends on ACPI && X86
 	select IRQ_DOMAIN
 	help


-- 
Jean Delvare
Suse L3 Support
