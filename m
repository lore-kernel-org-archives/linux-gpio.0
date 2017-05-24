From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC] ARM: dts: armadillo800eva: Split LCD mux and gpio
Date: Wed, 24 May 2017 13:43:34 +0200
Message-ID: <1495626214-15502-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from michel.telenet-ops.be ([195.130.137.88]:35206 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965586AbdEXLnn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 24 May 2017 07:43:43 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Configuration of the lcd0 pinmux group and GPIO hog for the external
GPIO mux are done using a single device node, causing the "output-high"
property to be applied to both.  This will fail for the pinmux group,
but doesn't cause any harm, as the failure is ignored silently.

However, after "pinctrl: sh-pfc: propagate errors on group config", the
failure will become fatal, leading to a broken display:

    sh-pfc e6050000.pin-controller: pin_config_group_set op failed for group 102
    sh-pfc e6050000.pin-controller: Error applying setting, reverse things back
    sh-pfc e6050000.pin-controller: failed to select default state

Split the configuration in two subnodes, and replace the GPIO hog by a
pull-up pin bias to fix this.

Fixes: ffd2f9a5afb730b9 ("ARM: shmobile: armadillo800eva dts: Add pinctrl and gpio-hog for lcdc0")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This is a hard dependency for "pinctrl: sh-pfc: propagate errors on
group config" (https://patchwork.kernel.org/patch/9186713/).

Notes:
  1. Just keeping the GPIO hog doesn't work, as the sh-pfc driver
     requires each pinctrl (sub)node to have at least one "pins" or
     "groups" property,
  2. Keeping "output-high" doesn't work, as the sh-pfc driver does not
     implement PIN_CONFIG_OUTPUT.

Should I fix 1 and/or 2 instead?
---
 arch/arm/boot/dts/r8a7740-armadillo800eva.dts | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
index 44b335b9f035436d..7feedc86f6915654 100644
--- a/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
+++ b/arch/arm/boot/dts/r8a7740-armadillo800eva.dts
@@ -267,13 +267,16 @@
 	};
 
 	lcd0_pins: lcd0 {
-		groups = "lcd0_data24_0", "lcd0_lclk_1", "lcd0_sync";
-		function = "lcd0";
+		mux {
+			groups = "lcd0_data24_0", "lcd0_lclk_1", "lcd0_sync";
+			function = "lcd0";
+		};
 
-		/* DBGMD/LCDC0/FSIA MUX */
-		gpio-hog;
-		gpios = <176 0>;
-		output-high;
+		gpio {
+			/* DBGMD/LCDC0/FSIA MUX */
+			pins = "PORT176";
+			bias-pull-up;
+		};
 	};
 };
 
-- 
2.7.4

