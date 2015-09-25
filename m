From: Adrian Alonso <aalonso@freescale.com>
Subject: [PATCH v6 2/6] ARM: dts: imx: imx7d-sbd add iomuxc-lpsr hoggrp-2 pads
Date: Fri, 25 Sep 2015 16:05:58 -0500
Message-ID: <1443215162-13716-2-git-send-email-aalonso@freescale.com>
References: <1443215162-13716-1-git-send-email-aalonso@freescale.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0133.outbound.protection.outlook.com ([207.46.100.133]:32069
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S933216AbbIYVH4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Fri, 25 Sep 2015 17:07:56 -0400
In-Reply-To: <1443215162-13716-1-git-send-email-aalonso@freescale.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, shawn.guo@linaro.org, shawnguo@kernel.org, linus.walleij@linaro.org, lznuaa@gmail.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, robh+dt@kernel.org, Anson.Huang@freescale.com, Frank.Li@freescale.com, yibin.gong@freescale.com, nitin.garg@freescale.com

Add imx7d-sdb iomuxc-lpsr hoggrp-2 default pads settings

Signed-off-by: Adrian Alonso <aalonso@freescale.com>
---
Changes for V2: Resend
Changes for V3: Resend
Changes for V4: Resend
Changes for V5: Resend
Changes for V6:
- Add wdog pinctrl group, add comments for hog2 group gpios

 arch/arm/boot/dts/imx7d-sdb.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm/boot/dts/imx7d-sdb.dts b/arch/arm/boot/dts/imx7d-sdb.dts
index 8059458..2da704a 100644
--- a/arch/arm/boot/dts/imx7d-sdb.dts
+++ b/arch/arm/boot/dts/imx7d-sdb.dts
@@ -419,3 +419,23 @@
 
 	};
 };
+
+&iomuxc_lpsr {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hog_2>;
+
+	imx7d-sdb {
+		pinctrl_hog_2: hoggrp-2 {
+			fsl,pins = <
+				MX7D_PAD_GPIO1_IO05__GPIO1_IO5    0x14 	/* usb_otg1_pwr */
+				MX7D_PAD_GPIO1_IO07__GPIO1_IO7    0x59 	/* sensor_int_b */
+			>;
+		};
+
+		pinctrl_wdog: wdoggrp {
+			fsl,pins = <
+				MX7D_PAD_GPIO1_IO00__WDOD1_WDOG_B 0x74
+			>;
+		};
+	};
+};
-- 
2.1.4

