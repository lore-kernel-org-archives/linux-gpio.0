From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: revert bank bindings
Date: Tue, 19 Apr 2016 14:49:56 +0200
Message-ID: <1461070196-15382-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:36051 "EHLO
	mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753420AbcDSMuE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Apr 2016 08:50:04 -0400
Received: by mail-lf0-f43.google.com with SMTP id g184so17413782lfb.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Apr 2016 05:50:03 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>

Keep the words talking about what a GPIO bank is, but remove the
binding. We have not agreed that this is something we want to have.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 Documentation/devicetree/bindings/gpio/gpio.txt | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/gpio.txt b/Documentation/devicetree/bindings/gpio/gpio.txt
index f509ecf03ece..c88d2ccb05ca 100644
--- a/Documentation/devicetree/bindings/gpio/gpio.txt
+++ b/Documentation/devicetree/bindings/gpio/gpio.txt
@@ -138,12 +138,6 @@ exposed in the device tree as an individual gpio-controller node, reflecting
 the fact that the hardware was synthesized by reusing the same IP block a
 few times over.
 
-A GPIO controller may specify a bank ID. This is a hardware index that
-indicate the logical order of the GPIO controller in the hardware architecture,
-usually in the sequence 0, 1, 2 .. n. The hardware index may be different
-from the order of register ranges and related to the backplane of how this
-one bank is connected to the outside through a pin controller for example.
-
 Optionally, a GPIO controller may have a "ngpios" property. This property
 indicates the number of in-use slots of available slots for GPIOs. The
 typical example is something like this: the hardware register is 32 bits
@@ -165,7 +159,6 @@ gpio-controller@00000000 {
 	reg = <0x00000000 0x1000>;
 	gpio-controller;
 	#gpio-cells = <2>;
-	gpio-bank = <0>;
 	ngpios = <18>;
 }
 
-- 
2.4.11

