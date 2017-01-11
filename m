From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 5/7] arm: dts: r7s72100-genmai: LED1 and LED2 support
Date: Wed, 11 Jan 2017 10:57:11 +0100
Message-ID: <1484128633-22683-6-git-send-email-jacopo+renesas@jmondi.org>
References: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:37800 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936163AbdAKJ6c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 04:58:32 -0500
In-Reply-To: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

From: Magnus Damm <damm@opensource.se>

Add support for Genmai board LED1 and LED2 via gpio-leds.

Signed-off-by: Magnus Damm <damm@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 8d8fcc7..72ae403 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -11,6 +11,7 @@
 
 /dts-v1/;
 #include "r7s72100.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Genmai";
@@ -34,6 +35,16 @@
 		#address-cells = <1>;
 		#size-cells = <1>;
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		led1 {
+			gpios = <&port4 10 GPIO_ACTIVE_LOW>;
+		};
+		led2 {
+			gpios = <&port4 11 GPIO_ACTIVE_LOW>;
+		};
+	};
 };
 
 &extal_clk {
-- 
2.7.4

