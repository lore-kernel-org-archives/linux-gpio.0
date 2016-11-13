From: Jacob Chen <jacob-chen@iotwrt.com>
Subject: [PATCH 1/2] ARM: dts: rockchip: add the sdmmc pinctrl for rk1108
Date: Sun, 13 Nov 2016 16:13:18 +0800
Message-ID: <1479024799-29198-1-git-send-email-jacob-chen@iotwrt.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36218 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751665AbcKMINi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 13 Nov 2016 03:13:38 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: heiko@sntech.de
Cc: andy.yan@rock-chips.com, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacob Chen <jacob2.chen@rock-chips.com>

From: Jacob Chen <jacob2.chen@rock-chips.com>

Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
---
 arch/arm/boot/dts/rk1108.dtsi | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rk1108.dtsi
index 9dccfea..6a06ad7 100644
--- a/arch/arm/boot/dts/rk1108.dtsi
+++ b/arch/arm/boot/dts/rk1108.dtsi
@@ -321,6 +321,31 @@
 			input-enable;
 		};
 
+        sdmmc {
+			sdmmc_clk: sdmmc-clk {
+				rockchip,pins = <3 RK_PC4 RK_FUNC_1 &pcfg_pull_none_drv_4ma>;
+			};
+
+			sdmmc_cmd: sdmmc-cmd {
+				rockchip,pins = <3 RK_PC5 RK_FUNC_1 &pcfg_pull_up_drv_4ma>;
+			};
+
+			sdmmc_cd: sdmmc-cd {
+				rockchip,pins = <0 RK_PA1 RK_FUNC_1 &pcfg_pull_up_drv_4ma>;
+			};
+
+			sdmmc_bus1: sdmmc-bus1 {
+				rockchip,pins = <3 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_4ma>;
+			};
+
+			sdmmc_bus4: sdmmc-bus4 {
+				rockchip,pins = <3 RK_PC3 RK_FUNC_1 &pcfg_pull_up_drv_4ma>,
+						<3 RK_PC2 RK_FUNC_1 &pcfg_pull_up_drv_4ma>,
+						<3 RK_PC1 RK_FUNC_1 &pcfg_pull_up_drv_4ma>,
+						<3 RK_PC0 RK_FUNC_1 &pcfg_pull_up_drv_4ma>;
+			};
+		};
+
 		i2c1 {
 			i2c1_xfer: i2c1-xfer {
 				rockchip,pins = <2 RK_PD3 RK_FUNC_1 &pcfg_pull_up>,
-- 
2.7.4

