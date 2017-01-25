From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC 4/5] arm: dts: r7s1000: Add pincontroller node
Date: Wed, 25 Jan 2017 19:09:46 +0100
Message-ID: <1485367787-8109-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:55190 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751685AbdAYSKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2017 13:10:01 -0500
In-Reply-To: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Add pincontroller node compatible with the new Renesas RZ/A1
pincontroller driver.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100.dtsi b/arch/arm/boot/dts/r7s72100.dtsi
index 3dd427d..764006d 100644
--- a/arch/arm/boot/dts/r7s72100.dtsi
+++ b/arch/arm/boot/dts/r7s72100.dtsi
@@ -171,6 +171,18 @@
 		};
 	};
 
+	pinctrl: pinctrl@fcfe3000 {
+		compatible = "renesas,rza1-pinctrl";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		#pinctrl-cells = <2>;
+
+		reg = <0xfcfe3000 0xa30>, /* Pn, ..., PFCAEn */
+		      <0xfcfe7000 0x230>, /* PIBCn, ..., PIPCn */
+		      <0xfcfe7B00 0x430>; /* JPPR0, ..., JPIBC0 */
+	};
+
 	scif0: serial@e8007000 {
 		compatible = "renesas,scif-r7s72100", "renesas,scif";
 		reg = <0xe8007000 64>;
-- 
2.7.4

