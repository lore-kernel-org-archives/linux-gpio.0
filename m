Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C36F6C4332D
	for <linux-gpio@archiver.kernel.org>; Wed,  6 Jan 2021 13:19:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 869612311E
	for <linux-gpio@archiver.kernel.org>; Wed,  6 Jan 2021 13:19:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbhAFNTI (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 6 Jan 2021 08:19:08 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:10026 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727119AbhAFNTH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 08:19:07 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D9qfL4qSbzhsfY;
        Wed,  6 Jan 2021 21:17:30 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Wed, 6 Jan 2021 21:18:16 +0800
From:   Zheng Yongjun <zhengyongjun3@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC:     Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [PATCH -next] gpio: use resource_size
Date:   Wed, 6 Jan 2021 21:19:00 +0800
Message-ID: <20210106131900.517-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use resource_size rather than a verbose computation on
the end and start fields.

Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
---
 drivers/gpio/gpio-mc33880.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mc33880.c b/drivers/gpio/gpio-mc33880.c
index f8194f7c6186..704cd4e6171f 100644
--- a/drivers/gpio/gpio-mc33880.c
+++ b/drivers/gpio/gpio-mc33880.c
@@ -99,7 +99,7 @@ static int mc33880_probe(struct spi_device *spi)
 
 	mc->spi = spi;
 
-	mc->chip.label = DRIVER_NAME,
+	mc->chip.label = DRIVER_NAME;
 	mc->chip.set = mc33880_set;
 	mc->chip.base = pdata->base;
 	mc->chip.ngpio = PIN_NUMBER;
-- 
2.22.0

