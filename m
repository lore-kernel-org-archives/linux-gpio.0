Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 127A1C63697
	for <linux-gpio@archiver.kernel.org>; Mon, 23 Nov 2020 07:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C54AA2074B
	for <linux-gpio@archiver.kernel.org>; Mon, 23 Nov 2020 07:38:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726163AbgKWHil (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 23 Nov 2020 02:38:41 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:8385 "EHLO
        szxga07-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKWHik (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Nov 2020 02:38:40 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CffCH2xSZz72QX;
        Mon, 23 Nov 2020 15:38:19 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.487.0; Mon, 23 Nov 2020
 15:38:27 +0800
From:   Zheng Liang <zhengliang6@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <wangli74@huawei.com>,
        <fangwei1@huawei.com>, <zhengliang6@huawei.com>
Subject: [PATCH] gpio: arizona: disable pm_runtime in case of failure
Date:   Mon, 23 Nov 2020 16:35:55 +0800
Message-ID: <20201123083555.42776-1-zhengliang6@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pm_runtime_enable will increase power disable depth. Thus a
pairing decrement is needed on the error handling path to keep
it balanced.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zheng Liang <zhengliang6@huawei.com>
---
 drivers/gpio/gpio-arizona.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-arizona.c b/drivers/gpio/gpio-arizona.c
index 5bda38e0780f..2bc173c352ce 100644
--- a/drivers/gpio/gpio-arizona.c
+++ b/drivers/gpio/gpio-arizona.c
@@ -192,6 +192,7 @@ static int arizona_gpio_probe(struct platform_device *pdev)
 	ret = devm_gpiochip_add_data(&pdev->dev, &arizona_gpio->gpio_chip,
 				     arizona_gpio);
 	if (ret < 0) {
+		pm_runtime_disable(&pdev->dev);
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n",
 			ret);
 		return ret;
-- 
2.17.1

