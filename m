From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 6/7] arm: dts: r7s72100-genmai:Add ethernet PFC node
Date: Wed, 11 Jan 2017 10:57:12 +0100
Message-ID: <1484128633-22683-7-git-send-email-jacopo+renesas@jmondi.org>
References: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:35118 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936188AbdAKJ6c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 04:58:32 -0500
In-Reply-To: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org

From: Simon Horman <horms+renesas@verge.net.au>

Squash Simon's original commit with his fixup of sh_eth pin names

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

[WIP] genmai sh_eth dts fixup

Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 72ae403..d003be0 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -71,9 +71,32 @@
 };
 
 &pfc {
-	pinctrl-0 = <&scif2_pins>;
+	pinctrl-0 = <&ethernet_pins &scif2_pins>;
 	pinctrl-names = "default";
 
+	ethernet_pins: ethernet {
+		renesas,groups = "ethernet_rxdv_p3_6",
+				 "ethernet_rxer_p3_5",
+				 "ethernet_rxclk_p3_4",
+				 "ethernet_mdio_p3_3",
+				 "ethernet_rxd3_p2_11",
+				 "ethernet_rxd2_p2_10",
+				 "ethernet_rxd1_p2_9",
+				 "ethernet_rxd0_p2_8",
+				 "ethernet_txd3_p2_7",
+				 "ethernet_txd2_p2_6",
+				 "ethernet_txd1_p2_5",
+				 "ethernet_txd0_p2_4",
+				 "ethernet_txcrs_p2_3",
+				 "ethernet_txen_p2_2",
+				 "ethernet_txer_p2_1",
+				 "ethernet_txclk_p2_0",
+				 "ethernet_mdc_p5_9",
+				 "ethernet_col_p1_14",
+				 "ethernet_int_p1_15";
+		renesas,function = "ethernet";
+	};
+
 	scif2_pins: serial2 {
 		renesas,groups = "scif2_txd_p3_0", "scif2_rxd_p3_2";
 		renesas,function = "scif2";
-- 
2.7.4

