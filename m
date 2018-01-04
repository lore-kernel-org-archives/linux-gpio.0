From: Wei Yongjun <weiyongjun1@huawei.com>
Subject: [PATCH -next] gpio: ath79: Fix potential NULL dereference in ath79_gpio_probe()
Date: Thu, 4 Jan 2018 06:31:23 +0000
Message-ID: <1515047483-168600-1-git-send-email-weiyongjun1@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from szxga06-in.huawei.com ([45.249.212.32]:51790 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752138AbeADG0J (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 4 Jan 2018 01:26:09 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alban Bedel <albeu@free.fr>, Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

platform_get_resource() may return NULL, add proper
check to avoid potential NULL dereferencing.

This is detected by Coccinelle semantic patch.

@@
expression pdev, res, n, t, e, e1, e2;
@@

res = platform_get_resource(pdev, t, n);
+ if (!res)
+   return -EINVAL;
... when != res == NULL
e = devm_ioremap(e1, res->start, e2);

Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-ath79.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-ath79.c b/drivers/gpio/gpio-ath79.c
index a757171..0bebcba 100644
--- a/drivers/gpio/gpio-ath79.c
+++ b/drivers/gpio/gpio-ath79.c
@@ -258,6 +258,8 @@ static int ath79_gpio_probe(struct platform_device *pdev)
 	}
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
 	ctrl->base = devm_ioremap(&pdev->dev, res->start, resource_size(res));
 	if (!ctrl->base)
 		return -ENOMEM;



