Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B1BC433EF
	for <linux-gpio@archiver.kernel.org>; Mon,  4 Jul 2022 13:05:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233441AbiGDNFy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 4 Jul 2022 09:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233370AbiGDNFy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Jul 2022 09:05:54 -0400
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71D4264C9;
        Mon,  4 Jul 2022 06:05:53 -0700 (PDT)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.57])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Lc5ZX6JgkzhZ4V;
        Mon,  4 Jul 2022 21:03:00 +0800 (CST)
Received: from huawei.com (10.175.112.208) by dggpeml500024.china.huawei.com
 (7.185.36.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 4 Jul
 2022 21:05:23 +0800
From:   Yuan Can <yuancan@huawei.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <brgl@bgdev.pl>, <linus.walleij@linaro.org>,
        <robert.jarzmik@free.fr>, <linux-kernel@vger.kernel.org>,
        <yuancan@huawei.com>
Subject: [PATCH -next] gpio: pxa: Add missing clk_disable_unprepare() in pxa_gpio_probe()
Date:   Mon, 4 Jul 2022 13:03:23 +0000
Message-ID: <20220704130323.104294-1-yuancan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add clk_disable_unprepare() on error path in pxa_gpio_probe().

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yuan Can <yuancan@huawei.com>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index c7fbfa3ae43b..08963975dd1b 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -676,6 +676,7 @@ static int pxa_gpio_probe(struct platform_device *pdev)
 	/* Initialize GPIO chips */
 	ret = pxa_init_gpio_chip(pchip, pxa_last_gpio + 1, gpio_reg_base);
 	if (ret) {
+		clk_disable_unprepare(clk);
 		clk_put(clk);
 		return ret;
 	}
-- 
2.17.1

