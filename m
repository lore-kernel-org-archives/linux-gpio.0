From: Alexander Stein <alexanders83@web.de>
Subject: [PATCH v2 53/63] gpio: sch: Allow compile testing
Date: Tue,  5 Apr 2016 19:39:34 +0200
Message-ID: <1459877980-31872-14-git-send-email-alexanders83@web.de>
References: <1459877772-11289-1-git-send-email-alexanders83@web.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.4]:50682 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752071AbcDERj5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 5 Apr 2016 13:39:57 -0400
In-Reply-To: <1459877772-11289-1-git-send-email-alexanders83@web.de>
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
index 799f46cb8b46..17bcf01518d4 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -520,7 +520,7 @@ config GPIO_ZX
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
-	depends on X86 # Unconditional I/O space access
+	depends on X86 || COMPILE_TEST # Unconditional I/O space access
 
 config GPIO_104_DIO_48E
 	tristate "ACCES 104-DIO-48E GPIO support"
@@ -571,7 +571,7 @@ config GPIO_IT87
 
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
-	depends on PCI
+	depends on PCI || COMPILE_TEST
 	select MFD_CORE
 	select LPC_SCH
 	help
-- 
2.8.0

