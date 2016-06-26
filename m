From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 19/19] pinctrl: remove orphaned exported ".remove" function
Date: Sat, 25 Jun 2016 22:46:52 -0400
Message-ID: <20160626024652.5081-20-paul.gortmaker@windriver.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160626024652.5081-1-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/pinctrl/freescale/Kconfig:config PINCTRL_MXS
drivers/pinctrl/freescale/Kconfig:	bool

...meaning that it currently is not being built as a module by anyone.

It also doesn't have any modular functionality, so it doesn't need
module.h included at all.

What it does have is an exported function that was used as a shared
".remove" by other drivers, but those use cases (imx23 and imx28)
are now gone, and hence this can disappear as well.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/pinctrl/freescale/pinctrl-mxs.c | 12 ------------
 drivers/pinctrl/freescale/pinctrl-mxs.h |  1 -
 2 files changed, 13 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.c b/drivers/pinctrl/freescale/pinctrl-mxs.c
index 6bbda6b4ab50..41b5b07d5a2b 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.c
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.c
@@ -12,7 +12,6 @@
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/io.h>
-#include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/pinctrl/machine.h>
@@ -553,14 +552,3 @@ err:
 	return ret;
 }
 EXPORT_SYMBOL_GPL(mxs_pinctrl_probe);
-
-int mxs_pinctrl_remove(struct platform_device *pdev)
-{
-	struct mxs_pinctrl_data *d = platform_get_drvdata(pdev);
-
-	pinctrl_unregister(d->pctl);
-	iounmap(d->base);
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mxs_pinctrl_remove);
diff --git a/drivers/pinctrl/freescale/pinctrl-mxs.h b/drivers/pinctrl/freescale/pinctrl-mxs.h
index fdd88d0bae22..34dbf75208dc 100644
--- a/drivers/pinctrl/freescale/pinctrl-mxs.h
+++ b/drivers/pinctrl/freescale/pinctrl-mxs.h
@@ -86,6 +86,5 @@ struct mxs_pinctrl_soc_data {
 
 int mxs_pinctrl_probe(struct platform_device *pdev,
 		      struct mxs_pinctrl_soc_data *soc);
-int mxs_pinctrl_remove(struct platform_device *pdev);
 
 #endif /* __PINCTRL_MXS_H */
-- 
2.8.4
