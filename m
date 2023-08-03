Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FEBEB64DD
	for <linux-gpio@archiver.kernel.org>; Thu,  3 Aug 2023 03:40:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229632AbjHCDk3 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 2 Aug 2023 23:40:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbjHCDk2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Aug 2023 23:40:28 -0400
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA35E4
        for <linux-gpio@vger.kernel.org>; Wed,  2 Aug 2023 20:40:26 -0700 (PDT)
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RGZMs2JLfz1GDTk;
        Thu,  3 Aug 2023 11:39:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemi500008.china.huawei.com
 (7.221.188.139) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 3 Aug
 2023 11:40:23 +0800
From:   Ruan Jinjie <ruanjinjie@huawei.com>
To:     <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>
CC:     <ruanjinjie@huawei.com>
Subject: [PATCH -next RESEND] gpio: ftgpio010: Do not check for 0 return after calling platform_get_irq()
Date:   Thu, 3 Aug 2023 11:39:37 +0800
Message-ID: <20230803033937.3051756-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since commit a85a6c86c25b ("driver core: platform: Clarify that IRQ 0
is invalid"), there is no possible for platform_get_irq() to return 0.

And the return value of platform_get_irq() is more sensible
to show the error reason.

Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
---
 drivers/gpio/gpio-ftgpio010.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-ftgpio010.c b/drivers/gpio/gpio-ftgpio010.c
index 31e26072f6ae..5ce59dcf02e3 100644
--- a/drivers/gpio/gpio-ftgpio010.c
+++ b/drivers/gpio/gpio-ftgpio010.c
@@ -250,8 +250,8 @@ static int ftgpio_gpio_probe(struct platform_device *pdev)
 		return PTR_ERR(g->base);
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq <= 0)
-		return irq ? irq : -EINVAL;
+	if (irq < 0)
+		return irq;
 
 	g->clk = devm_clk_get(dev, NULL);
 	if (!IS_ERR(g->clk)) {
-- 
2.34.1

