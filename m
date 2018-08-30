From: Phil Edworthy <phil.edworthy@renesas.com>
Subject: [PATCH v2 3/3] ARM: dts: r9a06g032: Add pinctrl node
Date: Thu, 30 Aug 2018 14:12:55 +0100
Message-ID: <1535634775-19365-4-git-send-email-phil.edworthy@renesas.com>
References: <1535634775-19365-1-git-send-email-phil.edworthy@renesas.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1535634775-19365-1-git-send-email-phil.edworthy@renesas.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Jacopo Mondi <jacopo@jmondi.org>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Phil Edworthy <phil.edworthy@renesas.com>
List-Id: linux-gpio@vger.kernel.org

This provides a pinctrl driver for the Renesas R9A06G032 SoC

Based on a patch originally written by Michel Pollet at Renesas.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
---
v2:
 - Add "renesas,rzn1-pinctrl" compatible fallback string
 - Register size corrected.
---
 arch/arm/boot/dts/r9a06g032.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/r9a06g032.dtsi b/arch/arm/boot/dts/r9a06g032.dtsi
index 1bc1f36..282ec11 100644
--- a/arch/arm/boot/dts/r9a06g032.dtsi
+++ b/arch/arm/boot/dts/r9a06g032.dtsi
@@ -165,6 +165,14 @@
 			status = "disabled";
 		};
 
+		pinctrl: pin-controller@40067000 {
+			compatible = "renesas,r9a06g032-pinctrl", "renesas,rzn1-pinctrl";
+			reg = <0x40067000 0x1000>, <0x51000000 0x480>;
+			clocks = <&sysctrl R9A06G032_HCLK_PINCONFIG>;
+			clock-names = "bus";
+			status = "okay";
+		};
+
 		gic: gic@44101000 {
 			compatible = "arm,cortex-a7-gic", "arm,gic-400";
 			interrupt-controller;
-- 
2.7.4
