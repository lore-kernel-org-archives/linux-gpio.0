From: Shaveta Leekha <shaveta@freescale.com>
Subject: [PATCH 3/3] arm/dts/ls1021a: Add GPIO controller nodes
Date: Thu, 30 Jul 2015 12:57:19 +0530
Message-ID: <1438241239-15178-3-git-send-email-shaveta@freescale.com>
References: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bbn0104.outbound.protection.outlook.com ([157.56.111.104]:50624
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751610AbbG3Hls (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 30 Jul 2015 03:41:48 -0400
In-Reply-To: <1438241239-15178-1-git-send-email-shaveta@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: r64188@freescale.com, gnurou@gmail.com, linus.walleij@linaro.org, Shaveta Leekha <shaveta@freescale.com>

Signed-off-by: Shaveta Leekha <shaveta@freescale.com>
---
Tested on Freescale SDK 1.8, as LS1021aQDS support is not yet complete in upstream

 arch/arm/boot/dts/ls1021a.dtsi |   47 ++++++++++++++++++++++++++++++++++++++++
 1 files changed, 47 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/ls1021a.dtsi b/arch/arm/boot/dts/ls1021a.dtsi
index 71ea37d..2630b59 100644
--- a/arch/arm/boot/dts/ls1021a.dtsi
+++ b/arch/arm/boot/dts/ls1021a.dtsi
@@ -60,6 +60,11 @@
 		serial4 = &lpuart4;
 		serial5 = &lpuart5;
 		sysclk = &sysclk;
+		gpio0 = &gpio1;
+		gpio1 = &gpio2;
+		gpio2 = &gpio3;
+		gpio3 = &gpio4;
+
 	};
 
 	cpus {
@@ -332,6 +337,48 @@
 			status = "disabled";
 		};
 
+
+		gpio1: gpio@2300000 {
+			compatible = "fsl,ls1021a-gpio";
+			reg = <0x0 0x2300000 0x0 0x10000>;
+			interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio2: gpio@2310000 {
+			compatible = "fsl,ls1021a-gpio";
+			reg = <0x0 0x2310000 0x0 0x10000>;
+			interrupts = <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio3: gpio@2320000 {
+			compatible = "fsl,ls1021a-gpio";
+			reg = <0x0 0x2320000 0x0 0x10000>;
+			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		gpio4: gpio@2330000 {
+			compatible = "fsl,ls1021a-gpio";
+			reg = <0x0 0x2330000 0x0 0x10000>;
+			interrupts = <GIC_SPI 166 IRQ_TYPE_LEVEL_HIGH>;
+			gpio-controller;
+        		#gpio-cells = <2>;
+			interrupt-controller;
+           		#interrupt-cells = <2>;
+		};
+
+
 		wdog0: watchdog@2ad0000 {
 			compatible = "fsl,imx21-wdt";
 			reg = <0x0 0x2ad0000 0x0 0x10000>;
-- 
1.7.7.4

