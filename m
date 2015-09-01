From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH v2 3/8] ARM: dts: imx: imx7d add iomuxc lpsr device node
Date: Tue, 1 Sep 2015 17:49:08 -0500
Message-ID: <1441147753-13239-3-git-send-email-aalonso@freescale.com>
References: <1441147753-13239-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn1bon0146.outbound.protection.outlook.com ([157.56.111.146]:3152
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754597AbbIAWvA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 1 Sep 2015 18:51:00 -0400
In-Reply-To: <1441147753-13239-1-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com

Add device tree node to support iomuxc-lpsr controller

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
Changes for V2: Resend

 arch/arm/boot/dts/imx7d.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d.dtsi b/arch/arm/boot/dts/imx7d.dtsi
index b738ce0..00f70db 100644
--- a/arch/arm/boot/dts/imx7d.dtsi
+++ b/arch/arm/boot/dts/imx7d.dtsi
@@ -446,6 +446,11 @@
 				status = "disabled";
 			};
 
+			iomuxc_lpsr: iomuxc-lpsr@302c0000 {
+				compatible = "fsl,imx7d-iomuxc-lpsr";
+				reg = <0x302c0000 0x10000>;
+			};
+
 			gpt1: gpt@302d0000 {
 				compatible = "fsl,imx7d-gpt", "fsl,imx6sx-gpt";
 				reg = <0x302d0000 0x10000>;
-- 
2.1.4

