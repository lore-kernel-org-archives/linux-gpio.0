From: Biao Huang <biao.huang@mediatek.com>
Subject: [RESEND PATCH 2/2] arm: dts: Add pinctrl/GPIO/EINT node for mt2701
Date: Wed, 13 Apr 2016 15:07:44 +0800
Message-ID: <1460531264-4405-3-git-send-email-biao.huang@mediatek.com>
References: <1460531264-4405-1-git-send-email-biao.huang@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:36859 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S934016AbcDMHIB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Apr 2016 03:08:01 -0400
In-Reply-To: <1460531264-4405-1-git-send-email-biao.huang@mediatek.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, srv_heupstream@mediatek.com, Yingjoe Chen <yingjoe.chen@mediatek.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Eddie Huang <eddie.huang@mediatek.com>, Biao Huang <biao.huang@mediatek.com>

Add pinctrl and GPIO node to mt2701.dtsi

Signed-off-by: Biao Huang <biao.huang@mediatek.com>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
This patch has been reverted in 7aec2fd74add9c4a61d77f51c805b4f7592956da
We have checked it can build pass in kernel-4.6 rc1
---
 arch/arm/boot/dts/mt2701.dtsi |   19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 88364f0..da5fef8 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -17,6 +17,7 @@
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include "skeleton64.dtsi"
+#include "mt2701-pinfunc.h"
 
 / {
 	compatible = "mediatek,mt2701";
@@ -115,6 +116,24 @@
 		#reset-cells = <1>;
 	};
 
+	pio: pinctrl@10005000 {
+		compatible = "mediatek,mt2701-pinctrl";
+		reg = <0 0x1000b000 0 0x1000>;
+		mediatek,pctl-regmap = <&syscfg_pctl_a>;
+		pins-are-numbered;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
+	syscfg_pctl_a: syscfg@10005000 {
+		compatible = "mediatek,mt2701-pctl-a-syscfg", "syscon";
+		reg = <0 0x10005000 0 0x1000>;
+	};
+
 	scpsys: scpsys@10006000 {
 		compatible = "mediatek,mt2701-scpsys", "syscon";
 		#power-domain-cells = <1>;
-- 
1.7.9.5

