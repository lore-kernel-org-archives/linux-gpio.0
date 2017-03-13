From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
Date: Mon, 13 Mar 2017 17:41:41 +0100
Message-ID: <1489423302-21296-2-git-send-email-geert+renesas@glider.be>
References: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from laurent.telenet-ops.be ([195.130.137.89]:58278 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932198AbdCMQlr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2017 12:41:47 -0400
In-Reply-To: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>

Fix typos in hscif2_clk_[bc]_mux[] and hscif4_ctrl_mux[].

Fixes: a56069c46c102710 ("pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/pinctrl/sh-pfc/pfc-r8a7795.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
index 504d0c3d7f741849..6ba7ed15a4610366 100644
--- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
+++ b/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
@@ -2167,7 +2167,7 @@ static const unsigned int hscif2_clk_b_pins[] = {
 	RCAR_GP_PIN(6, 21),
 };
 static const unsigned int hscif2_clk_b_mux[] = {
-	HSCK1_B_MARK,
+	HSCK2_B_MARK,
 };
 static const unsigned int hscif2_ctrl_b_pins[] = {
 	/* RTS, CTS */
@@ -2240,7 +2240,7 @@ static const unsigned int hscif4_ctrl_pins[] = {
 	RCAR_GP_PIN(1, 15), RCAR_GP_PIN(1, 14),
 };
 static const unsigned int hscif4_ctrl_mux[] = {
-	HRTS4_N_MARK, HCTS3_N_MARK,
+	HRTS4_N_MARK, HCTS4_N_MARK,
 };
 
 static const unsigned int hscif4_data_b_pins[] = {
-- 
2.7.4

