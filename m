From: Jean Delvare <jdelvare@suse.de>
Subject: [PATCH] gpio-pch: Fix Kconfig dependencies
Date: Fri, 16 May 2014 11:59:14 +0200
Message-ID: <20140516115914.2e250976@endymion.delvare>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:36157 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756419AbaEPJ7T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 16 May 2014 05:59:19 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

The gpio-pch driver is for a companion chip to the Intel Atom E600
series processors. These are 32-bit x86 processors so the driver is
only needed on X86_32. Add COMPILE_TEST as an alternative, so that the
driver can still be build-tested elsewhere.

Signed-off-by: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
---
 drivers/gpio/Kconfig |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-3.15-rc5.orig/drivers/gpio/Kconfig	2014-05-12 10:44:35.223342067 +0200
+++ linux-3.15-rc5/drivers/gpio/Kconfig	2014-05-16 11:41:19.838319948 +0200
@@ -705,7 +705,7 @@ config GPIO_INTEL_MID
 
 config GPIO_PCH
 	tristate "Intel EG20T PCH/LAPIS Semiconductor IOH(ML7223/ML7831) GPIO"
-	depends on PCI && X86
+	depends on PCI && (X86_32 || COMPILE_TEST)
 	select GENERIC_IRQ_CHIP
 	help
 	  This driver is for PCH(Platform controller Hub) GPIO of Intel Topcliff


-- 
Jean Delvare
SUSE L3 Support
