From: weiyj_lk@163.com
Subject: [PATCH] pinctrl: Fix return value check in amd_gpio_probe()
Date: Sat,  6 Feb 2016 22:56:36 +0800
Message-ID: <1454770596-11299-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from m12-15.163.com ([220.181.12.15]:51750 "EHLO m12-15.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750779AbcBFO6E (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 6 Feb 2016 09:58:04 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-gpio@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function devm_ioremap_nocache() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/pinctrl/pinctrl-amd.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 6574494..5c025f5 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -753,8 +753,8 @@ static int amd_gpio_probe(struct platform_device *pdev)
 
 	gpio_dev->base = devm_ioremap_nocache(&pdev->dev, res->start,
 						resource_size(res));
-	if (IS_ERR(gpio_dev->base))
-		return PTR_ERR(gpio_dev->base);
+	if (!gpio_dev->base)
+		return -ENOMEM;
 
 	irq_base = platform_get_irq(pdev, 0);
 	if (irq_base < 0) {

