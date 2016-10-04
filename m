From: Jerome Brunet <jbrunet@baylibre.com>
Subject: [RFC 08/10] ARM64: dts: amlogic: enable gpio interrupt controller on gxbb
Date: Tue,  4 Oct 2016 17:08:26 +0200
Message-ID: <1475593708-10526-9-git-send-email-jbrunet@baylibre.com>
References: <1475593708-10526-1-git-send-email-jbrunet@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f47.google.com ([209.85.215.47]:36171 "EHLO
        mail-lf0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753651AbcJDPI4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Oct 2016 11:08:56 -0400
Received: by mail-lf0-f47.google.com with SMTP id b75so54399797lfg.3
        for <linux-gpio@vger.kernel.org>; Tue, 04 Oct 2016 08:08:55 -0700 (PDT)
In-Reply-To: <1475593708-10526-1-git-send-email-jbrunet@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Kevin Hilman <khilman@baylibre.com>, Carlo Caione <carlo@caione.org>, Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
index 610e0e1c3cee..e5c6372dbe1c 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi
@@ -183,6 +183,21 @@
 				#reset-cells = <1>;
 			};
 
+			gpio_interrupt: interrupt-controller@9880 {
+				compatible = "amlogic,gxbb-gpio-intc";
+				reg = <0x0 0x9880 0x0 0x10>;
+				interrupts = <GIC_SPI 64 IRQ_TYPE_NONE>,
+					   <GIC_SPI 65 IRQ_TYPE_NONE>,
+					   <GIC_SPI 66 IRQ_TYPE_NONE>,
+					   <GIC_SPI 67 IRQ_TYPE_NONE>,
+					   <GIC_SPI 68 IRQ_TYPE_NONE>,
+					   <GIC_SPI 69 IRQ_TYPE_NONE>,
+					   <GIC_SPI 70 IRQ_TYPE_NONE>,
+					   <GIC_SPI 71 IRQ_TYPE_NONE>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+			};
+
 			uart_A: serial@84c0 {
 				compatible = "amlogic,meson-uart";
 				reg = <0x0 0x84c0 0x0 0x14>;
@@ -307,6 +322,7 @@
 					reg-names = "mux", "pull", "gpio";
 					gpio-controller;
 					#gpio-cells = <2>;
+					interrupt-parent = <&gpio_interrupt>;
 				};
 
 				uart_ao_a_pins: uart_ao_a {
@@ -426,6 +442,7 @@
 					reg-names = "mux", "pull", "pull-enable", "gpio";
 					gpio-controller;
 					#gpio-cells = <2>;
+					interrupt-parent = <&gpio_interrupt>;
 				};
 
 				emmc_pins: emmc {
-- 
2.7.4

