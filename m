From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] pinctrl: sh-pfc: core: don't open code of_device_get_match_data()
Date: Tue,  1 Mar 2016 17:38:46 +0100
Message-ID: <1456850332-8432-1-git-send-email-wsa@the-dreams.de>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

This change will also make Coverity happy by avoiding a theoretical NULL
pointer dereference; yet another reason is to use the above helper function
to tighten the code and make it more readable.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Tested on a Lager board.

 drivers/pinctrl/sh-pfc/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index 181ea98a63b7ab..cd42d32791e3b7 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -518,7 +518,7 @@ static int sh_pfc_probe(struct platform_device *pdev)
 
 #ifdef CONFIG_OF
 	if (np)
-		info = of_match_device(sh_pfc_of_table, &pdev->dev)->data;
+		info = of_device_get_match_data(&pdev->dev);
 	else
 #endif
 		info = platid ? (const void *)platid->driver_data : NULL;
-- 
2.7.0
