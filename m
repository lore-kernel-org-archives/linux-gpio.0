From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [RFC 5/5] arm: dts: genmai: Add SCIF2 pin group
Date: Wed, 25 Jan 2017 19:09:47 +0100
Message-ID: <1485367787-8109-6-git-send-email-jacopo+renesas@jmondi.org>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:52930 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751889AbdAYSKB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2017 13:10:01 -0500
In-Reply-To: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

Add  TxD and RxD pin configuration for SCIF2 serial communication
interface on r7s72100 Genmai board.

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 118a8e2..ea649c7 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include "include/dt-bindings/pinctrl/pinctrl-renesas-rz.h"
 
 / {
 	model = "Genmai";
@@ -34,6 +35,18 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
+
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&scif2_pins>;
+
+	scif2_pins: serial2 {
+		/* P3_0 as TxD2; P3_2 as RxD2 */
+		renesas-rz,pins = <RZ_PIN(3, 0) ALTERNATE_FUNC_6>,
+				  <RZ_PIN(3, 2) ALTERNATE_FUNC_4>;
+	};
 };
 
 &extal_clk {
-- 
2.7.4

