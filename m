From: Zhou Wang <wangzhou.bry@gmail.com>
Subject: [PATCH v5 2/2] ARM: dts: hip04: add GPIO pieces
Date: Wed, 24 Dec 2014 17:23:36 +0800
Message-ID: <1419413016-31932-3-git-send-email-wangzhou.bry@gmail.com>
References: <1419413016-31932-1-git-send-email-wangzhou.bry@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:60663 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751336AbaLXJZ2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Dec 2014 04:25:28 -0500
Received: by mail-pd0-f177.google.com with SMTP id ft15so9569853pdb.22
        for <linux-gpio@vger.kernel.org>; Wed, 24 Dec 2014 01:25:27 -0800 (PST)
In-Reply-To: <1419413016-31932-1-git-send-email-wangzhou.bry@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Haojian Zhuang <haojian.zhuang@linaro.org>, Wei Xu <xuwei5@hisilicon.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Russell King <linux@arm.linux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, wangzhou1@hisilicon.com, liguozhu@hisilicon.com, Zhou Wang <wangzhou.bry@gmail.com>

Hisilicon Soc hip04 has four GPIO controllers, each one has 32
GPIOs and can be configured to be an interrupt controller.The GPIO
controllers are compatible with the snps,dw-apb-gpio driver.
This patch add the corresponding device tree nodes.

Signed-off-by: Zhou Wang <wangzhou.bry@gmail.com>
---
 arch/arm/boot/dts/hip04.dtsi |   75 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm/boot/dts/hip04.dtsi b/arch/arm/boot/dts/hip04.dtsi
index 2388145..267942a 100644
--- a/arch/arm/boot/dts/hip04.dtsi
+++ b/arch/arm/boot/dts/hip04.dtsi
@@ -269,6 +269,81 @@
 			interrupts = <0 372 4>;
 		};
 
+		gpio@4003000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4003000 0x1000>;
+
+			gpio3: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 392 4>;
+			};
+		};
+
+		gpio@4002000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4002000 0x1000>;
+
+			gpio2: gpio-controller@0 {
+			compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 391 4>;
+			};
+		};
+
+		gpio@4001000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4001000 0x1000>;
+
+			gpio1: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 390 4>;
+			};
+		};
+
+		gpio@4000000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x4000000 0x1000>;
+
+			gpio0: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				gpio-controller;
+				#gpio-cells = <2>;
+				snps,nr-gpios = <32>;
+				reg = <0>;
+				interrupt-parent = <&gic>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupts = <0 389 4>;
+			};
+		};
 	};
 
 	etb@0,e3c42000 {
-- 
1.7.9.5

