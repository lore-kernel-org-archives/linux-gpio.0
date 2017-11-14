From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 2/2] pinctrl: sh-pfc: r8a7791: Add can_clk function
Date: Tue, 14 Nov 2017 15:41:17 +0000
Message-ID: <1510674077-31136-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1510674077-31136-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1510674077-31136-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds can_clk function to r8a7743/r8a7791 which is cleaner,
and allows for independent configuration.
We keep the can_clk* pins definitions from within can0_groups and
can1_groups for uniformity and backwards compatibility.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
v1->v2
* Retained can_clk* pins inside can[01]_groups
* Added comments

 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 10bd35f..c01ef02d 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -4826,6 +4826,10 @@ static const char * const can0_groups[] = {
 	"can0_data_d",
 	"can0_data_e",
 	"can0_data_f",
+	/*
+	 * Retained for backwards compatibility, use can_clk_groups in new
+	 * designs.
+	 */
 	"can_clk",
 	"can_clk_b",
 	"can_clk_c",
@@ -4837,6 +4841,21 @@ static const char * const can1_groups[] = {
 	"can1_data_b",
 	"can1_data_c",
 	"can1_data_d",
+	/*
+	 * Retained for backwards compatibility, use can_clk_groups in new
+	 * designs.
+	 */
+	"can_clk",
+	"can_clk_b",
+	"can_clk_c",
+	"can_clk_d",
+};
+
+/*
+ * can_clk_groups allows for independent configuration, use can_clk function
+ * in new designs.
+ */
+static const char * const can_clk_groups[] = {
 	"can_clk",
 	"can_clk_b",
 	"can_clk_c",
@@ -5308,7 +5327,7 @@ static const char * const vin2_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[56];
+	struct sh_pfc_function common[57];
 	struct sh_pfc_function r8a779x[2];
 } pinmux_functions = {
 	.common = {
@@ -5316,6 +5335,7 @@ static const struct {
 		SH_PFC_FUNCTION(avb),
 		SH_PFC_FUNCTION(can0),
 		SH_PFC_FUNCTION(can1),
+		SH_PFC_FUNCTION(can_clk),
 		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(du0),
 		SH_PFC_FUNCTION(du1),
-- 
2.7.4
