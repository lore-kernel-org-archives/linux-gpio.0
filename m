Return-Path: <SRS0=pJLv=6U=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 988CDC28CBC
	for <linux-gpio@archiver.kernel.org>; Wed,  6 May 2020 12:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 79E0620736
	for <linux-gpio@archiver.kernel.org>; Wed,  6 May 2020 12:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727933AbgEFMjC (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 6 May 2020 08:39:02 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3821 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727874AbgEFMjB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 6 May 2020 08:39:01 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 0AD9CB85326AE967CA46;
        Wed,  6 May 2020 20:38:59 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Wed, 6 May 2020 20:38:50 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kangjie Lu <kjlu@umn.edu>
CC:     Wei Yongjun <weiyongjun1@huawei.com>, <linux-gpio@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] gpio: exar: Fix error return code in gpio_exar_probe()
Date:   Wed, 6 May 2020 12:42:56 +0000
Message-ID: <20200506124256.87628-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix to return a negative error code from the error handling
case instead of 0, as done elsewhere in this function.

Fixes: 7ecced0934e5 ("gpio: exar: add a check for the return value of ida_simple_get fails")
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpio/gpio-exar.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index da1ef0b1c291..c5c3fa5b519f 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -148,8 +148,10 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	mutex_init(&exar_gpio->lock);
 
 	index = ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
-	if (index < 0)
+	if (index < 0) {
+		ret = index;
 		goto err_destroy;
+	}
 
 	sprintf(exar_gpio->name, "exar_gpio%d", index);
 	exar_gpio->gpio_chip.label = exar_gpio->name;



