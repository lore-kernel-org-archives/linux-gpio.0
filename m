Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98662C43460
	for <linux-gpio@archiver.kernel.org>; Sat,  8 May 2021 01:51:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7455061006
	for <linux-gpio@archiver.kernel.org>; Sat,  8 May 2021 01:51:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230363AbhEHBwm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 7 May 2021 21:52:42 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:18011 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbhEHBwl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 May 2021 21:52:41 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FcVZs5F7YzQjpc;
        Sat,  8 May 2021 09:48:21 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.498.0; Sat, 8 May 2021
 09:51:31 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <cuibixuan@huawei.com>, Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-gpio@vger.kernel.org>, <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] pinctrl: equilibrium: Add missing MODULE_DEVICE_TABLE
Date:   Sat, 8 May 2021 11:15:02 +0800
Message-ID: <20210508031502.53637-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/pinctrl/pinctrl-equilibrium.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/pinctrl-equilibrium.c b/drivers/pinctrl/pinctrl-equilibrium.c
index a194d8089b6f..38cc20fa9d5a 100644
--- a/drivers/pinctrl/pinctrl-equilibrium.c
+++ b/drivers/pinctrl/pinctrl-equilibrium.c
@@ -939,6 +939,7 @@ static const struct of_device_id eqbr_pinctrl_dt_match[] = {
 	{ .compatible = "intel,lgm-io" },
 	{}
 };
+MODULE_DEVICE_TABLE(of, eqbr_pinctrl_dt_match);
 
 static struct platform_driver eqbr_pinctrl_driver = {
 	.probe	= eqbr_pinctrl_probe,

