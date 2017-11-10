From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: [RFC PATCH 2/2] pinctrl: sh-pfc: r8a7791: Add can_clk function
Date: Fri, 10 Nov 2017 17:16:29 +0000
Message-ID: <1510334189-8942-3-git-send-email-fabrizio.castro@bp.renesas.com>
References: <CAMuHMdV=8rAE5z2VmCjL-M_MXY6TsKM_+0c-bsqDsjDZYWU1FA@mail.gmail.com>
 <1510334189-8942-1-git-send-email-fabrizio.castro@bp.renesas.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:29026 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753641AbdKJRQr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 10 Nov 2017 12:16:47 -0500
In-Reply-To: <1510334189-8942-1-git-send-email-fabrizio.castro@bp.renesas.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>
Cc: Simon Horman <horms@verge.net.au>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Fabrizio Castro <fabrizio.castro@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>

This patch adds can_clk function to r8a7743/r8a7791 which is cleaner,
as it reduces duplication, and allows for independent configuration.

Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Reviewed-by: Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7791.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
index 10bd35f..2dbf2419 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7791.c
@@ -4826,10 +4826,6 @@ static const char * const can0_groups[] = {
 	"can0_data_d",
 	"can0_data_e",
 	"can0_data_f",
-	"can_clk",
-	"can_clk_b",
-	"can_clk_c",
-	"can_clk_d",
 };
 
 static const char * const can1_groups[] = {
@@ -4837,6 +4833,9 @@ static const char * const can1_groups[] = {
 	"can1_data_b",
 	"can1_data_c",
 	"can1_data_d",
+};
+
+static const char * const can_clk_groups[] = {
 	"can_clk",
 	"can_clk_b",
 	"can_clk_c",
@@ -5308,7 +5307,7 @@ static const char * const vin2_groups[] = {
 };
 
 static const struct {
-	struct sh_pfc_function common[56];
+	struct sh_pfc_function common[57];
 	struct sh_pfc_function r8a779x[2];
 } pinmux_functions = {
 	.common = {
@@ -5316,6 +5315,7 @@ static const struct {
 		SH_PFC_FUNCTION(avb),
 		SH_PFC_FUNCTION(can0),
 		SH_PFC_FUNCTION(can1),
+		SH_PFC_FUNCTION(can_clk),
 		SH_PFC_FUNCTION(du),
 		SH_PFC_FUNCTION(du0),
 		SH_PFC_FUNCTION(du1),
-- 
2.7.4

