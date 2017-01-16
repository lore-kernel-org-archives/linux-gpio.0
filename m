From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v3 8/8] arm: dts: r7s72100-genmai: Add pinctrl for RSPI
Date: Mon, 16 Jan 2017 13:12:52 +0100
Message-ID: <1484568772-18137-9-git-send-email-jacopo+renesas@jmondi.org>
References: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay4-d.mail.gandi.net ([217.70.183.196]:46556 "EHLO
        relay4-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751054AbdAPMNS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Jan 2017 07:13:18 -0500
In-Reply-To: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

From: Geert Uytterhoeven <geert+renesas@glider.be>

Add pinctrl for the existing rspi4 node on Genmai.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index b36c84f..01c08e0 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -71,7 +71,7 @@
 };
 
 &pfc {
-	pinctrl-0 = <&ethernet_pins &scif2_pins>;
+	pinctrl-0 = <&ethernet_pins &rspi4_pins &scif2_pins>;
 	pinctrl-names = "default";
 
 	ethernet_pins: ethernet {
@@ -97,6 +97,12 @@
 		function = "ethernet";
 	};
 
+	rspi4_pins: spi4 {
+		groups = "rspi4_rspck_p4_0", "rspi4_ssl0_p4_1",
+			 "rspi4_mosi_p4_2", "rspi4_miso_p4_3";
+		function = "rspi4";
+	};
+
 	scif2_pins: serial2 {
 		groups = "scif2_txd_p3_0", "scif2_rxd_p3_2";
 		function = "scif2";
-- 
2.7.4

