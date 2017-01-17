From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] pinctrl/amd: Drop pinctrl_unregister for devm_ registered device
Date: Tue, 17 Jan 2017 15:55:32 +0000
Message-ID: <20170117155532.28879-1-weiyj.lk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:36863 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751152AbdAQQC2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2017 11:02:28 -0500
Received: by mail-pg0-f68.google.com with SMTP id 75so8351381pgf.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2017 08:02:28 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, "Shah, Nehal-bakulchandra" <Nehal-Bakulchandra.shah@amd.com>
Cc: Wei Yongjun <weiyongjun1@huawei.com>, linux-gpio@vger.kernel.org

From: Wei Yongjun <weiyongjun1@huawei.com>

It's not necessary to unregister pin controller device registered
with devm_pinctrl_register() and using pinctrl_unregister() leads
to a double free.

Fixes: 3bfd44306c65 ("pinctrl: amd: Add support for additional GPIO")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/pinctrl/pinctrl-amd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index c64ea8f..586001c 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -831,7 +831,6 @@ static int amd_gpio_remove(struct platform_device *pdev)
 	gpio_dev = platform_get_drvdata(pdev);
 
 	gpiochip_remove(&gpio_dev->gc);
-	pinctrl_unregister(gpio_dev->pctrl);
 
 	return 0;
 }

