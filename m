From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: r8a7794: fix GP2[29] muxing
Date: Thu, 25 Feb 2016 22:58:15 +0300
Message-ID: <2253759.3Cn6OZRLxj@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be
List-Id: linux-gpio@vger.kernel.org

From: Andrey Gusakov <andrey.gusakov@cogentembedded.com>

GP2[29] muxing is controlled by 2-bit IP6[3:2] field, yet only 3 values
are listed  instead of 4...

[Sergei: fixed up the formatting, renamed, added the changelog.]

Signed-off-by: Andrey Gusakov <andrey.gusakov@cogentembedded.com>
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

---
The patch is against the 'fixes' branch of Linus W.'s 'linux-pinctrl.git' repo.

 drivers/pinctrl/sh-pfc/pfc-r8a7794.c |    1 +
 1 file changed, 1 insertion(+)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/pfc-r8a7794.c
@@ -3974,6 +3974,7 @@ static const struct pinmux_cfg_reg pinmu
 		FN_DU0_DISP, FN_QPOLA, FN_CC50_STATE30, 0,
 		/* IP6_3_2 [2] */
 		FN_DU0_EXODDF_DU0_ODDF_DISP_CDE, FN_QCPV_QDE, FN_CC50_STATE29,
+		0,
 		/* IP6_1_0 [2] */
 		FN_DU0_EXVSYNC_DU0_VSYNC, FN_QSTB_QHE, FN_CC50_STATE28, 0, }
 	},
