From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next v2] pinctrl: artpec6: Fix return value check in artpec6_pmx_probe()
Date: Tue, 25 Apr 2017 11:29:30 +0000
Message-ID: <20170425112930.19555-1-weiyj.lk@gmail.com>
References: <20170425032945.22157-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:36738 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031724AbdDYL3g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Apr 2017 07:29:36 -0400
Received: by mail-pg0-f66.google.com with SMTP id v1so3309685pgv.3
        for <linux-gpio@vger.kernel.org>; Tue, 25 Apr 2017 04:29:35 -0700 (PDT)
In-Reply-To: <20170425032945.22157-1-weiyj.lk@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jesper Nilsson <jesper.nilsson@axis.com>, Lars Persson <lars.persson@axis.com>, Niklas Cassel <niklas.cassel@axis.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-arm-kernel@axis.com, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

In case of error, the function pinctrl_register() returns
ERR_PTR() not NULL. The NULL test in the return value check
should be replaced with IS_ERR().

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
v1 -> v2: fix comment
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

