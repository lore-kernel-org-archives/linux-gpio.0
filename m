From: Daniel Mack <zonque@gmail.com>
Subject: [PATCH] gpio: pxa: Documentation: provide example bindings for PXA3xx
Date: Thu, 14 Aug 2014 11:40:24 +0200
Message-ID: <1408009224-15838-1-git-send-email-zonque@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f182.google.com ([209.85.212.182]:54619 "EHLO
	mail-wi0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751861AbaHNJkf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Aug 2014 05:40:35 -0400
Received: by mail-wi0-f182.google.com with SMTP id d1so2002531wiv.9
        for <linux-gpio@vger.kernel.org>; Thu, 14 Aug 2014 02:40:32 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: gnurou@gmail.com, linux-gpio@vger.kernel.org, haojian.zhuang@gmail.com, eric.y.miao@gmail.com, linux-arm-kernel@lists.infradead.org, Daniel Mack <zonque@gmail.com>

Add another example to describe bindings that work for PXA3xx boards.

Signed-off-by: Daniel Mack <zonque@gmail.com>
---
 Documentation/devicetree/bindings/gpio/mrvl-gpio.txt | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
index 6641626..b2afdb2 100644
--- a/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/mrvl-gpio.txt
@@ -19,7 +19,7 @@ Required properties:
 - gpio-controller : Marks the device node as a gpio controller.
 - #gpio-cells : Should be one.  It is the pin number.
 
-Example:
+Example for a MMP platform:
 
 	gpio: gpio@d4019000 {
 		compatible = "marvell,mmp-gpio";
@@ -32,6 +32,19 @@ Example:
 		#interrupt-cells = <1>;
       };
 
+Example for a PXA3xx platform:
+
+	gpio: gpio@40e00000 {
+		compatible = "intel,pxa3xx-gpio";
+		reg = <0x40e00000 0x10000>;
+		interrupt-names = "gpio0", "gpio1", "gpio_mux";
+		interrupts = <8 9 10>;
+		gpio-controller;
+		#gpio-cells = <0x2>;
+		interrupt-controller;
+		#interrupt-cells = <0x2>;
+	};
+
 * Marvell Orion GPIO Controller
 
 Required properties:
-- 
2.0.4

