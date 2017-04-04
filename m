From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7794: swap ATA signals
Date: Tue, 04 Apr 2017 23:20:16 +0300
Message-ID: <20170404202025.306556752@cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-15
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:34568 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754549AbdDDUUb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Apr 2017 16:20:31 -0400
Received: by mail-lf0-f53.google.com with SMTP id z15so99458225lfd.1
        for <linux-gpio@vger.kernel.org>; Tue, 04 Apr 2017 13:20:30 -0700 (PDT)
Content-Disposition: inline; filename=pinctrl-sh-pfc-r8a7794-swap-ATA-signals.patch
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

All R8A7794 manuals  I have here (0.50 and 1.10) agree that the PFC driver
has ATAG0#  and ATAWR# signals in IPSR12 swapped -- fix this.

Fixes: 43c4436e2f18 ("pinctrl: sh-pfc: add R8A7794 PFC support")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
This patch is against the 'fixes' branch of Linus Walleij's 'linux-pinctrl.git'
repo.

 drivers/pinctrl/sh-pfc/pfc-r8a7794.c |   16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -281,8 +281,8 @@ enum {
 	FN_AVB_AVTP_CAPTURE, FN_ETH_CRS_DV_B, FN_SSI_WS1, FN_SCIF1_TXD_B,
 	FN_IIC1_SDA_C, FN_VI1_DATA0, FN_CAN0_TX_D, FN_AVB_AVTP_MATCH,
 	FN_ETH_RX_ER_B, FN_SSI_SDATA1, FN_HSCIF1_HRX_B, FN_SDATA, FN_VI1_DATA1,
-	FN_ATAG0_N, FN_ETH_RXD0_B, FN_SSI_SCK2, FN_HSCIF1_HTX_B, FN_VI1_DATA2,
-	FN_MDATA, FN_ATAWR0_N, FN_ETH_RXD1_B,
+	FN_ATAWR0_N, FN_ETH_RXD0_B, FN_SSI_SCK2, FN_HSCIF1_HTX_B, FN_VI1_DATA2,
+	FN_MDATA, FN_ATAG0_N, FN_ETH_RXD1_B,
 
 	/* IPSR13 */
 	FN_SSI_WS2, FN_HSCIF1_HCTS_N_B, FN_SCIFA0_RXD_D, FN_VI1_DATA3, FN_SCKZ,
@@ -575,8 +575,8 @@ enum {
 	ETH_CRS_DV_B_MARK, SSI_WS1_MARK, SCIF1_TXD_B_MARK, IIC1_SDA_C_MARK,
 	VI1_DATA0_MARK, CAN0_TX_D_MARK, AVB_AVTP_MATCH_MARK, ETH_RX_ER_B_MARK,
 	SSI_SDATA1_MARK, HSCIF1_HRX_B_MARK, VI1_DATA1_MARK, SDATA_MARK,
-	ATAG0_N_MARK, ETH_RXD0_B_MARK, SSI_SCK2_MARK, HSCIF1_HTX_B_MARK,
-	VI1_DATA2_MARK, MDATA_MARK, ATAWR0_N_MARK, ETH_RXD1_B_MARK,
+	ATAWR0_N_MARK, ETH_RXD0_B_MARK, SSI_SCK2_MARK, HSCIF1_HTX_B_MARK,
+	VI1_DATA2_MARK, MDATA_MARK, ATAG0_N_MARK, ETH_RXD1_B_MARK,
 
 	/* IPSR13 */
 	SSI_WS2_MARK, HSCIF1_HCTS_N_B_MARK, SCIFA0_RXD_D_MARK, VI1_DATA3_MARK,
@@ -1413,13 +1413,13 @@ static const u16 pinmux_data[] = {
 	PINMUX_IPSR_MSEL(IP12_26_24, HSCIF1_HRX_B, SEL_HSCIF1_1),
 	PINMUX_IPSR_GPSR(IP12_26_24, VI1_DATA1),
 	PINMUX_IPSR_MSEL(IP12_26_24, SDATA, SEL_FSN_0),
-	PINMUX_IPSR_GPSR(IP12_26_24, ATAG0_N),
+	PINMUX_IPSR_GPSR(IP12_26_24, ATAWR0_N),
 	PINMUX_IPSR_MSEL(IP12_26_24, ETH_RXD0_B, SEL_ETH_1),
 	PINMUX_IPSR_MSEL(IP12_29_27, SSI_SCK2, SEL_SSI2_0),
 	PINMUX_IPSR_MSEL(IP12_29_27, HSCIF1_HTX_B, SEL_HSCIF1_1),
 	PINMUX_IPSR_GPSR(IP12_29_27, VI1_DATA2),
 	PINMUX_IPSR_MSEL(IP12_29_27, MDATA, SEL_FSN_0),
-	PINMUX_IPSR_GPSR(IP12_29_27, ATAWR0_N),
+	PINMUX_IPSR_GPSR(IP12_29_27, ATAG0_N),
 	PINMUX_IPSR_MSEL(IP12_29_27, ETH_RXD1_B, SEL_ETH_1),
 
 	/* IPSR13 */
@@ -4938,10 +4938,10 @@ static const struct pinmux_cfg_reg pinmu
 		0, 0, 0, 0,
 		/* IP12_29_27 [3] */
 		FN_SSI_SCK2, FN_HSCIF1_HTX_B, FN_VI1_DATA2, FN_MDATA,
-		FN_ATAWR0_N, FN_ETH_RXD1_B, 0, 0,
+		FN_ATAG0_N, FN_ETH_RXD1_B, 0, 0,
 		/* IP12_26_24 [3] */
 		FN_SSI_SDATA1, FN_HSCIF1_HRX_B, FN_VI1_DATA1, FN_SDATA,
-		FN_ATAG0_N, FN_ETH_RXD0_B, 0, 0,
+		FN_ATAWR0_N, FN_ETH_RXD0_B, 0, 0,
 		/* IP12_23_21 [3] */
 		FN_SSI_WS1, FN_SCIF1_TXD_B, FN_IIC1_SDA_C, FN_VI1_DATA0,
 		FN_CAN0_TX_D, FN_AVB_AVTP_MATCH, FN_ETH_RX_ER_B, 0,

