Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9C0C433E0
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Dec 2020 08:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D111322ADC
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Dec 2020 08:26:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbgLUI0E (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 21 Dec 2020 03:26:04 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:9233 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725878AbgLUI0E (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Dec 2020 03:26:04 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Czsvc18RMzktNl;
        Mon, 21 Dec 2020 16:24:28 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.498.0; Mon, 21 Dec 2020
 16:25:18 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <andy.shevchenko@gmail.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v1] gpio: hisi: delete some unused variables in hisi_gpio_probe()
Date:   Mon, 21 Dec 2020 16:25:24 +0800
Message-ID: <1608539124-4914-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

kernel test rebot report that dat, set and clr in hisi_gpio_probe() is
unused variables. So delete it.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpio/gpio-hisi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
index a389780..d2971c9 100644
--- a/drivers/gpio/gpio-hisi.c
+++ b/drivers/gpio/gpio-hisi.c
@@ -254,7 +254,6 @@ static void hisi_gpio_get_pdata(struct device *dev,
 static int hisi_gpio_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	void __iomem *dat, *set, *clr;
 	struct hisi_gpio *hisi_gpio;
 	int port_num;
 	int ret;
-- 
2.7.4

