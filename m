From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] pinctrl: ingenic: checking for NULL instead of IS_ERR()
Date: Wed, 14 Jun 2017 12:12:09 +0300
Message-ID: <20170614091209.GC29394@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <kernel-janitors-owner@vger.kernel.org>
Content-Disposition: inline
Sender: kernel-janitors-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Paul Cercueil <paul@crapouillou.net>
Cc: linux-gpio@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

devm_pinctrl_register() returns error pointers, it doesn't return NULL.

Fixes: b5c23aa46537 ("pinctrl: add a pinctrl driver for the Ingenic jz47xx SoCs")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index d8473d929cb1..d8e8842967d6 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -785,9 +785,9 @@ int ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	jzpc->pctl = devm_pinctrl_register(dev, pctl_desc, jzpc);
-	if (!jzpc->pctl) {
+	if (IS_ERR(jzpc->pctl)) {
 		dev_err(dev, "Failed to register pinctrl\n");
-		return -EINVAL;
+		return PTR_ERR(jzpc->pctl);
 	}
 
 	for (i = 0; i < chip_info->num_groups; i++) {
