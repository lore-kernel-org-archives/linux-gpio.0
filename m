From: Jacopo Mondi <jacopo+renesas@jmondi.org>
Subject: [PATCH 3/3] pinctrl: sh-pfc: r7s72100: Add LVDS pin group
Date: Mon,  9 Jan 2017 20:32:26 +0100
Message-ID: <1483990346-26998-4-git-send-email-jacopo+renesas@jmondi.org>
References: <1483990346-26998-1-git-send-email-jacopo+renesas@jmondi.org>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1483990346-26998-1-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: magnus.damm@gmail.com, laurent.pinchart@ideasonboard.com, geert+renesas@glider.be, chris.brandt@renesas.com, linus.walleij@linaro.org
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The LVDS pin group has to be configured in software driven output
mode

Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
---
 drivers/pinctrl/sh-pfc/pfc-r7s72100.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
index e67b0d1..b531de3 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r7s72100.c
@@ -438,6 +438,18 @@ SCIF7(RZ_PIN_AND_MUX)
 
 ETHERNET(RZ_PIN_AND_MUX)
 
+#define LVDS(fn)				\
+	fn(lvds, clkoutp, 5, 0, 1)		\
+	fn(lvds, clkoutm, 5, 1, 1)		\
+	fn(lvds, out2p, 5, 2, 1)		\
+	fn(lvds, out2m, 5, 3, 1)		\
+	fn(lvds, out1p, 5, 4, 1)		\
+	fn(lvds, out2m, 5, 5, 1)		\
+	fn(lvds, out0p, 5, 6, 1)		\
+	fn(lvds, out0m, 5, 7, 1)
+
+LVDS(RZ_PIN_AND_MUX_SWO)
+
 static const struct sh_pfc_pin_group pinmux_groups[] = {
 	RIIC0(RZ_PMX_GROUP)
 	RIIC1(RZ_PMX_GROUP)
@@ -457,6 +469,7 @@ static const struct sh_pfc_pin_group pinmux_groups[] = {
 	SCIF6(RZ_PMX_GROUP)
 	SCIF7(RZ_PMX_GROUP)
 	ETHERNET(RZ_PMX_GROUP)
+	LVDS(RZ_PMX_GROUP)
 };
 
 static const char * const riic0_groups[] = {
@@ -531,6 +544,10 @@ static const char * const ethernet_groups[] = {
 	ETHERNET(RZ_GROUPS)
 };
 
+static const char * const lvds_groups[] = {
+	LVDS(RZ_GROUPS)
+};
+
 static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(riic0),
 	SH_PFC_FUNCTION(riic1),
@@ -550,6 +567,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(scif6),
 	SH_PFC_FUNCTION(scif7),
 	SH_PFC_FUNCTION(ethernet),
+	SH_PFC_FUNCTION(lvds),
 };
 
 #define PFC_REG(idx, name, reg)						\
-- 
2.7.4
