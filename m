From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [PATCH v2 1/2] pinctrl: sh-pfc: r8a7794: Add can_clk function
Date: Tue, 14 Nov 2017 15:41:16 +0000
Message-ID: <1510674077-31136-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1510674077-31136-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:62150 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752887AbdKNPlf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 14 Nov 2017 10:41:35 -0500
In-Reply-To: <1510674077-31136-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

This patch adds can_clk function to r8a7745/r8a7794 which is cleaner,
and allows for independent configuration.
We keep the can_clk* pins definitions from within can0_groups and
can1_groups for uniformity and backwards compatibility.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
v1->v2
* Retained can_clk* pins inside can[01]_groups
* Added comments

 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index e5b3d5f..c557bc8 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -3858,6 +3858,10 @@ static const char * const can0_groups[] = {
 	"can0_data_b",
 	"can0_data_c",
 	"can0_data_d",
+	/*
+	 * Retained for backwards compatibility, use can_clk_groups in new
+	 * designs.
+	 */
 	"can_clk",
 	"can_clk_b",
 	"can_clk_c",
@@ -3869,6 +3873,21 @@ static const char * const can1_groups[] = {
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
@@ -4248,6 +4267,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(can0),
 	SH_PFC_FUNCTION(can1),
+	SH_PFC_FUNCTION(can_clk),
 	SH_PFC_FUNCTION(du0),
 	SH_PFC_FUNCTION(du1),
 	SH_PFC_FUNCTION(eth),
-- 
2.7.4

