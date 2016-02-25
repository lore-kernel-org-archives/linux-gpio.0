From: Joachim Eastwood <manabian@gmail.com>
Subject: [PATCH v2 3/3] pinctrl: lpc1850-scu: document nxp,gpio-pin-interrupt
Date: Thu, 25 Feb 2016 22:44:39 +0100
Message-ID: <1456436679-22077-4-git-send-email-manabian@gmail.com>
References: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:36680 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750789AbcBYVox (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 16:44:53 -0500
Received: by mail-lf0-f46.google.com with SMTP id 78so41841954lfy.3
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 13:44:52 -0800 (PST)
In-Reply-To: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

Update devicetree documention for lpc1850-scu with the new
nxp,gpio-pin-interrupt property.

Signed-off-by: Joachim Eastwood <manabian@gmail.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt        | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
index df0309c57505..bd8b0c69fa44 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,lpc1850-scu.txt
@@ -22,6 +22,10 @@ The following generic nodes are supported:
  - input-schmitt-disable
  - slew-rate
 
+NXP specific properties:
+ - nxp,gpio-pin-interrupt : Assign pin to gpio pin interrupt controller
+			    irq number 0 to 7. See example below.
+
 Not all pins support all properties so either refer to the NXP 1850/4350
 user manual or the pin table in the pinctrl-lpc18xx driver for supported
 pin properties.
@@ -54,4 +58,14 @@ pinctrl: pinctrl@40086000 {
 			bias-disable;
 		};
 	};
+
+	gpio_joystick_pins: gpio-joystick-pins {
+		gpio_joystick_1_cfg {
+			pins =  "p9_0";
+			function = "gpio";
+			nxp,gpio-pin-interrupt = <0>;
+			input-enable;
+			bias-disable;
+		};
+	};
 };
-- 
1.8.0

