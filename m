From: hao_zhang <hao5781286@gmail.com>
Subject: [PATCH v1 4/4] ARM: dts: add pwm node for r40.
Date: Thu, 11 Jan 2018 19:34:12 +0800
Message-ID: <20180111113412.GA22008@arx-s1>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f193.google.com ([209.85.128.193]:45467 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752003AbeAKLed (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Jan 2018 06:34:33 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: thierry.reding@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, linux@armlinux.org.uk, wens@csie.org, linus.walleij@linaro.org, maxime.ripard@free-electrons.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, hao5781286@gmail.com

This patch add pwm node for r40.

Signed-off-by: hao_zhang <hao5781286@gmail.com>
---
 arch/arm/boot/dts/sun8i-r40.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm/boot/dts/sun8i-r40.dtsi b/arch/arm/boot/dts/sun8i-r40.dtsi
index 173dcc1..84c963c 100644
--- a/arch/arm/boot/dts/sun8i-r40.dtsi
+++ b/arch/arm/boot/dts/sun8i-r40.dtsi
@@ -295,6 +295,11 @@
 				bias-pull-up;
 			};
 
+			pwm_pins: pwm-pins {
+				pins = "PB2", "PB3";
+				function = "pwm";
+			};
+
 			uart0_pb_pins: uart0-pb-pins {
 				pins = "PB22", "PB23";
 				function = "uart0";
@@ -306,6 +311,14 @@
 			reg = <0x01c20c90 0x10>;
 		};
 
+		pwm: pwm@1c23400 {
+			     compatible = "allwinner,sun8i-r40-pwm";
+			     reg = <0x01c23400 0x154>;
+			     clocks = <&osc24M>;
+			     #pwm-cells = <3>;
+			     status = "disabled";
+		};
+
 		uart0: serial@1c28000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x01c28000 0x400>;
-- 
2.7.4

