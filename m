From: Kevin Hilman <khilman@baylibre.com>
Subject: [PATCH 7/7] ARM64: dts: amlogic: gxbb: add ethernet
Date: Fri,  6 May 2016 07:21:26 -0700
Message-ID: <1462544486-9516-8-git-send-email-khilman@baylibre.com>
References: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f49.google.com ([209.85.220.49]:35759 "EHLO
	mail-pa0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757924AbcEFOVf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 May 2016 10:21:35 -0400
Received: by mail-pa0-f49.google.com with SMTP id iv1so48011334pac.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 May 2016 07:21:34 -0700 (PDT)
In-Reply-To: <1462544486-9516-1-git-send-email-khilman@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-amlogic@lists.infradead.org, Carlo Caione <carlo@caione.org>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-meson@googlegroups.com, =?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>, Victor Wan <victor.wan@amlogic.com>, Jerry Cao <jerry.cao@amlogic.com>, Xing Wu <xing.xu@amlogic.com>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org

Add node for ethernet interface and pinctrl pins.
Enable on odroid-C2 and P20x boards.

Signed-off-by: Kevin Hilman <khilman@baylibre.com>
---
 .../arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts |  6 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi   |  7 +++++
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi        | 32 ++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
index 45778896bd3d..90a84c514d3d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts
@@ -81,3 +81,9 @@
 	pinctrl-names = "default";
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+};
+
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
index 22e629841a99..f4f30f674b4c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb-p20x.dtsi
@@ -65,3 +65,10 @@
 	pinctrl-0 = <&uart_ao_a_pins>;
 	pinctrl-names = "default";
 };
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+};
+
diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 86c41b3798db..76b3b6d0526b 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -274,6 +274,26 @@
 						function = "uart_c";
 					};
 				};
+
+				eth_pins: eth_c {
+					mux {
+						groups = "eth_mdio",
+						       "eth_mdc",
+						       "eth_clk_rx_clk",
+						       "eth_rx_dv",
+						       "eth_rxd0",
+						       "eth_rxd1",
+						       "eth_rxd2",
+						       "eth_rxd3",
+						       "eth_rgmii_tx_clk",
+						       "eth_tx_en",
+						       "eth_txd0",
+						       "eth_txd1",
+						       "eth_txd2",
+						       "eth_txd3";
+						function = "eth";
+					};
+				};
 			};
 		};
 
@@ -292,5 +312,17 @@
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xd0000000 0x0 0x200000>;
 		};
+
+		ethmac: ethernet@c9410000 {
+			compatible = "amlogic,meson6-dwmac", "snps,dwmac";
+			reg = <0x0 0xc9410000 0x0 0x10000
+			       0x0 0xc8834540 0x0 0x4>;
+			interrupts = <0 8 1>;
+			interrupt-names = "macirq";
+			clocks = <&xtal>;
+			clock-names = "stmmaceth";
+			phy-mode = "rgmii";
+			status = "disabled";
+		};
 	};
 };
-- 
2.7.4

