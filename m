From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [RFC PATCH 1/2] pinctrl: sh-pfc: r8a7794: Add can_clk function
Date: Fri, 10 Nov 2017 17:16:28 +0000
Message-ID: <1510334189-8942-2-git-send-email-fabrizio.castro@bp.renesas.com>
References: <CAMuHMdV=8rAE5z2VmCjL-M_MXY6TsKM_+0c-bsqDsjDZYWU1FA@mail.gmail.com>
 <1510334189-8942-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1510334189-8942-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

This patch adds can_clk function to r8a7745/r8a7794 which is cleaner,
as it reduces duplication, and allows for independent configuration.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7794.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
index e5b3d5f..73796aa 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -3858,10 +3858,6 @@ static const char * const can0_groups[] = {
 	"can0_data_b",
 	"can0_data_c",
 	"can0_data_d",
-	"can_clk",
-	"can_clk_b",
-	"can_clk_c",
-	"can_clk_d",
 };
 
 static const char * const can1_groups[] = {
@@ -3869,6 +3865,9 @@ static const char * const can1_groups[] = {
 	"can1_data_b",
 	"can1_data_c",
 	"can1_data_d",
+};
+
+static const char * const can_clk_groups[] = {
 	"can_clk",
 	"can_clk_b",
 	"can_clk_c",
@@ -4248,6 +4247,7 @@ static const struct sh_pfc_function pinmux_functions[] = {
 	SH_PFC_FUNCTION(avb),
 	SH_PFC_FUNCTION(can0),
 	SH_PFC_FUNCTION(can1),
+	SH_PFC_FUNCTION(can_clk),
 	SH_PFC_FUNCTION(du0),
 	SH_PFC_FUNCTION(du1),
 	SH_PFC_FUNCTION(eth),
-- 
2.7.4
