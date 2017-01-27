From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC fixes 1/2] arm: dts: genmai: Configure RIIC2 pins
Date: Fri, 27 Jan 2017 17:47:07 +0100
Message-ID: <1485535628-17097-2-git-send-email-jacopo+renesas@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
 <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:32790 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755152AbdA0QsR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2017 11:48:17 -0500
In-Reply-To: <1485535628-17097-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org, Chris.Brandt@renesas.com, wsa@the-dreams.de
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Add pin configuration for RIIC2 pins interface.
The i2c2 is connected to internal eeprom.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index ea649c7..0068a1a 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -40,13 +40,19 @@
 
 &pinctrl {
 	pinctrl-names = "default";
-	pinctrl-0 = <&scif2_pins>;
+	pinctrl-0 = <&scif2_pins &i2c2_pins>;
 
 	scif2_pins: serial2 {
 		/* P3_0 as TxD2; P3_2 as RxD2 */
 		renesas-rz,pins = <RZ_PIN(3, 0) ALTERNATE_FUNC_6>,
 				  <RZ_PIN(3, 2) ALTERNATE_FUNC_4>;
 	};
+
+	i2c2_pins: i2c2 {
+		/* RIIC2: P1_4 as SCL, P1_5 as SDA */
+		renesas-rz,pins = <RZ_PIN(1, 4) ALTERNATE_FUNC_1>,
+				  <RZ_PIN(1, 5) ALTERNATE_FUNC_1>;
+	};
 };
 
 &extal_clk {
-- 
2.7.4

