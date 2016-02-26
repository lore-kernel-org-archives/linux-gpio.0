From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH 56/63] gpio: sch: Allow compile testing
Date: Fri, 26 Feb 2016 14:21:32 +0100
Message-ID: <1456492895-21835-17-git-send-email-alexanders83@web.de>
References: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.12]:63692 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754010AbcBZNVs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 08:21:48 -0500
In-Reply-To: <1456492692-21592-1-git-send-email-alexanders83@web.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Alexander Stein <alexanders83@web.de>, linux-gpio@vger.kernel.org

Lower dependencies for compile testing.

Signed-off-by: Alexander Stein <alexanders83@web.de>
---
 drivers/gpio/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index db5e571c7fb9..b83bb56d290d 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -510,7 +510,7 @@ config GPIO_ZX
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
-	depends on X86 # Unconditional I/O space access
+	depends on X86 || COMPILE_TEST # Unconditional I/O space access
 
 config GPIO_104_DIO_48E
 	tristate "ACCES 104-DIO-48E GPIO support"
@@ -561,7 +561,7 @@ config GPIO_IT87
 
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
-	depends on PCI
+	depends on PCI || COMPILE_TEST
 	select MFD_CORE
 	select LPC_SCH
 	help
-- 
2.7.2

