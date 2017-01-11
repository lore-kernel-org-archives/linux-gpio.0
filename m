From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH v2 4/7] arm: dts: r7s72100-genmai: SCIF2 PINCTRL configuration
Date: Wed, 11 Jan 2017 10:57:10 +0100
Message-ID: <1484128633-22683-5-git-send-email-jacopo+renesas@jmondi.org>
References: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1484128633-22683-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Magnus Damm <damm@opensource.se>

Configure the r7s72100 PINCTRL hardware and select pin function
for the SCIF2 serial console.

Signed-off-by: Magnus Damm <damm@opensource.se>
Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 arch/arm/boot/dts/r7s72100-genmai.dts | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/r7s72100-genmai.dts b/arch/arm/boot/dts/r7s72100-genmai.dts
index 118a8e2..8d8fcc7 100644
--- a/arch/arm/boot/dts/r7s72100-genmai.dts
+++ b/arch/arm/boot/dts/r7s72100-genmai.dts
@@ -59,6 +59,16 @@
 	};
 };
 
+&pfc {
+	pinctrl-0 = <&scif2_pins>;
+	pinctrl-names = "default";
+
+	scif2_pins: serial2 {
+		renesas,groups = "scif2_txd_p3_0", "scif2_rxd_p3_2";
+		renesas,function = "scif2";
+	};
+};
+
 &scif2 {
 	status = "okay";
 };
-- 
2.7.4
