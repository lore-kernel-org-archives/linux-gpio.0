From: Marek Vasut <marex@denx.de>
Subject: [PATCH] dt-bindings: gpio: altera: Fix altr,interrupt-type property
Date: Mon, 29 Feb 2016 17:23:17 +0100
Message-ID: <1456762997-7607-1-git-send-email-marex@denx.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.9]:54982 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753249AbcB2QXV (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Feb 2016 11:23:21 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Tien Hock Loh <thloh@altera.com>, Linus Walleij <linus.walleij@linaro.org>

The altr,interrupt-trigger property is not used by the driver.
Instead, altr,interrupt-type is used by the driver and the driver
does not probe if this property is not specified. Therefore, it
is expected that there are no users of the -trigger property in
the wild and that this is a typo in the documentation for the
altera-pio controller. This patch fixes the typo.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Tien Hock Loh <thloh@altera.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/gpio-altera.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-altera.txt b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
index 12f5014..826a720 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-altera.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio-altera.txt
@@ -12,7 +12,7 @@ Required properties:
 - #interrupt-cells : Should be 1. The interrupt type is fixed in the hardware.
   - The first cell is the GPIO offset number within the GPIO controller.
 - interrupts: Specify the interrupt.
-- altr,interrupt-trigger: Specifies the interrupt trigger type the GPIO
+- altr,interrupt-type: Specifies the interrupt trigger type the GPIO
   hardware is synthesized. This field is required if the Altera GPIO controller
   used has IRQ enabled as the interrupt type is not software controlled,
   but hardware synthesized. Required if GPIO is used as an interrupt
@@ -35,7 +35,7 @@ gpio_altr: gpio@0xff200000 {
 	reg = <0xff200000 0x10>;
 	interrupts = <0 45 4>;
 	altr,ngpio = <32>;
-	altr,interrupt-trigger = <IRQ_TYPE_EDGE_RISING>;
+	altr,interrupt-type = <IRQ_TYPE_EDGE_RISING>;
 	#gpio-cells = <2>;
 	gpio-controller;
 	#interrupt-cells = <1>;
-- 
2.7.0

