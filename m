From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH] pinctrl: sh-pfc: core: only call pinctrl_provide_dummies() on SuperH
Date: Sat, 05 Mar 2016 01:58:22 +0300
Message-ID: <14300712.5chtEzsjIN@wasted.cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1501145.5ro9yfox2Z@wasted.cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linus.walleij@linaro.org, linux-renesas-soc@vger.kernel.org, laurent.pinchart@ideasonboard.com, linux-gpio@vger.kernel.org, geert+renesas@glider.be
List-Id: linux-gpio@vger.kernel.org

The 'ravb' Ethernet driver couldn't connect to  the PHY as the MDIO bus
appeared empty on the Renesas R-Car boards. The bug hunt finally pointed
at  the commit adding the "init" pintcrl state: it tries to switch to non-
default state before the driver probe which should fail but doesn't as the
PFC pinctrl driver happens to call pinctrl_provide_dummies()  which makes
all state lookups succeed, even though the state doesn't really exist.
That feature is only relevant to non-DT systems and all the ARM boards
that use the PFC driver  have been converted to the DT boot, so limiting
it to the SuperH architecture seems The Right Thing...

Fixes: ef0eebc05130 ("drivers/pinctrl: Add the concept of an "init" state")
Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
CC: stable@vger.kernel.org

---
The patch is against the 'fixes' branch of Linus W.'s 'linux-pinctrl.git' repo.
As  the bug only seems to happen  to the hardware that's not pre-configured by
U-Boot, this patch can wait till 4.6 in principle...

 drivers/pinctrl/sh-pfc/core.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

Index: linux-pinctrl/drivers/pinctrl/sh-pfc/core.c
===================================================================
--- linux-pinctrl.orig/drivers/pinctrl/sh-pfc/core.c
+++ linux-pinctrl/drivers/pinctrl/sh-pfc/core.c
@@ -545,7 +545,8 @@ static int sh_pfc_probe(struct platform_
 			return ret;
 	}
 
-	pinctrl_provide_dummies();
+	if (IS_ENABLED(CONFIG_SUPERH))
+		pinctrl_provide_dummies();
 
 	ret = sh_pfc_init_ranges(pfc);
 	if (ret < 0)
