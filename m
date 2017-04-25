From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] pinctrl: artpec6: Fix return value check in artpec6_pmx_probe()
Date: Tue, 25 Apr 2017 03:29:45 +0000
Message-ID: <20170425032945.22157-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35718 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S980129AbdDYD3y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 23:29:54 -0400
Received: by mail-pg0-f65.google.com with SMTP id g2so8159678pge.2
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 20:29:53 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function pinctrl_register() returns
NULL not ERR_PTR(). The IS_ERR() test in the return value
check should be replaced with NULL test.

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pinctrl/pinctrl-artpec6.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
index b5a2eff..6a16019 100644
--- a/drivers/pinctrl/pinctrl-artpec6.c
+++ b/drivers/pinctrl/pinctrl-artpec6.c
@@ -938,9 +938,9 @@ static int artpec6_pmx_probe(struct platform_device *pdev)
 	pmx->num_pin_groups = ARRAY_SIZE(artpec6_pin_groups);
 	pmx->pctl	    = pinctrl_register(&artpec6_desc, &pdev->dev, pmx);
 
-	if (!pmx->pctl) {
+	if (IS_ERR(pmx->pctl)) {
 		dev_err(&pdev->dev, "could not register pinctrl driver\n");
-		return -EINVAL;
+		return PTR_ERR(pmx->pctl);
 	}
 
 	platform_set_drvdata(pdev, pmx);

