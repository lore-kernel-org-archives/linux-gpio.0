From: Baruch Siach <baruch@tkos.co.il>
Subject: [PATCH] dt-binding: mrvl-gpio: remove orion-gpio description
Date: Mon,  5 Sep 2016 22:00:10 +0300
Message-ID: <9d76063cb0b0a0ff96cfd6f389f3697db7734015.1473102010.git.baruch@tkos.co.il>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from guitar.tcltek.co.il ([192.115.133.116]:47751 "EHLO
        mx.tkos.co.il" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933391AbcIETCj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 5 Sep 2016 15:02:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Jason Cooper <jason@lakedaemon.net>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Baruch Siach <baruch@tkos.co.il>

The Orion GPIO controller binding description in mrvl-gpio.txt is obsolete, and
duplicates the description in gpio-mvebu.txt.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 .../devicetree/bindings/gpio/mrvl-gpio.txt         | 23 ----------------------
 1 file changed, 23 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
index 98d198396956..c3d016532d8e 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
@@ -44,26 +44,3 @@ Example for a PXA3xx platform:
 		interrupt-controller;
 		#interrupt-cells = <0x2>;
 	};
-
-* Marvell Orion GPIO Controller
-
-Required properties:
-- compatible         : Should be "marvell,orion-gpio"
-- reg                : Address and length of the register set for controller.
-- gpio-controller    : So we know this is a gpio controller.
-- ngpio              : How many gpios this controller has.
-- interrupts	     : Up to 4 Interrupts for the controller.
-
-Optional properties:
-- mask-offset        : For SMP Orions, offset for Nth CPU
-
-Example:
-
-		gpio0: gpio@10100 {
-			compatible = "marvell,orion-gpio";
-			#gpio-cells = <2>;
-			gpio-controller;
-			reg = <0x10100 0x40>;
-			ngpio = <32>;
-			interrupts = <35>, <36>, <37>, <38>;
-		};
-- 
2.9.3

