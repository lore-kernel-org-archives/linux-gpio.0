From: Jean Delvare <jdelvare@suse.de>
Subject: Modular gpio-lynxpoint
Date: Sat, 19 Oct 2013 20:57:02 +0200
Message-ID: <20131019205702.4bfba569@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:44382 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750867Ab3JSS5J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 19 Oct 2013 14:57:09 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

Hi Mathias,

What is the rationale for CONFIG_GPIO_LYNXPOINT being a bool? Device
drivers that can't be built as modules are a pain for distribution
kernels. And I tried building gpio-lynxpoint as a module and it worked
(although I can't run-time test it.)

Any problem with the patch below?

From: Jean Delvare <jdelvare@suse.de>
Subject: gpio-lynxpoint: Allow building as a module

Change CONFIG_GPIO_LYNXPOINT from bool to tristate so that the
gpio-lynxpoint driver can be built as a module.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.12-rc5.orig/drivers/gpio/Kconfig	2013-10-19 18:25:13.521488669 +0200
+++ linux-3.12-rc5/drivers/gpio/Kconfig	2013-10-19 19:31:43.527324443 +0200
@@ -344,7 +344,7 @@ config GPIO_GE_FPGA
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
