From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: drop surplus X86 dependencies
Date: Sun,  1 Nov 2015 10:40:34 +0100
Message-ID: <1446370834-30712-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:35390 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751083AbbKAJkj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 1 Nov 2015 04:40:39 -0500
Received: by lbbes7 with SMTP id es7so71256878lbb.2
        for <linux-gpio@vger.kernel.org>; Sun, 01 Nov 2015 01:40:37 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>

Port-mapped I/O depends on X86 already, so individual drivers need
not specify this dependency.

Suggested-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/Kconfig | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index d20644b9e5b9..777f401aa8ec 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -486,17 +486,15 @@ config GPIO_ZYNQ
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
-	depends on X86
+	depends on X86 # Unconditional I/O space access
 
 config GPIO_104_IDIO_16
 	tristate "ACCES 104-IDIO-16 GPIO support"
-	depends on X86
 	help
 	  Enables GPIO support for the ACCES 104-IDIO-16 family.
 
 config GPIO_F7188X
 	tristate "F71869, F71869A, F71882FG and F71889F GPIO support"
-	depends on X86
 	help
 	  This option enables support for GPIOs found on Fintek Super-I/O
 	  chips F71869, F71869A, F71882FG and F71889F.
@@ -506,7 +504,6 @@ config GPIO_F7188X
 
 config GPIO_IT87
 	tristate "IT87xx GPIO support"
-	depends on X86 # unconditional access to IO space.
 	help
 	  Say yes here to support GPIO functionality of IT87xx Super I/O chips.
 
@@ -518,7 +515,7 @@ config GPIO_IT87
 
 config GPIO_SCH
 	tristate "Intel SCH/TunnelCreek/Centerton/Quark X1000 GPIO"
-	depends on PCI && X86
+	depends on PCI
 	select MFD_CORE
 	select LPC_SCH
 	help
-- 
2.4.3

