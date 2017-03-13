From: Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 1/4] pinctrl: sh-pfc: Update info pointer after SoC-specific init
Date: Mon, 13 Mar 2017 18:12:44 +0100
Message-ID: <1489425167-22711-2-git-send-email-geert+renesas@glider.be>
References: <1489425167-22711-1-git-send-email-geert+renesas@glider.be>
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1489425167-22711-1-git-send-email-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
List-Id: linux-gpio@vger.kernel.org

Update the sh_pfc_soc_info pointer after calling the SoC-specific
initialization function, as it may have been updated to e.g. handle
different SoC revisions.  This makes sure the correct subdriver name is
printed later.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - new.
---
 drivers/pinctrl/sh-pfc/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
index cf80ce1dd7cea5a0..4a5a0feb931bf43c 100644
--- a/drivers/pinctrl/sh-pfc/core.c
+++ b/drivers/pinctrl/sh-pfc/core.c
@@ -586,6 +586,9 @@ static int sh_pfc_probe(struct platform_device *pdev)
 		ret = info->ops->init(pfc);
 		if (ret < 0)
 			return ret;
+
+		/* .init() may have overridden pfc->info */
+		info = pfc->info;
 	}
 
 	/* Enable dummy states for those platforms without pinctrl support */
-- 
2.7.4
