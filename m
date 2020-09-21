Return-Path: <SRS0=ZLld=C6=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E748C43465
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Sep 2020 13:12:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 042932076E
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Sep 2020 13:12:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgIUNMF (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 21 Sep 2020 09:12:05 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:59822 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727405AbgIUNKn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:43 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id C6A5231E7104130C6C36;
        Mon, 21 Sep 2020 21:10:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:34 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Viresh Kumar <vireshk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH -next] pinctrl: spear: simplify the return expression of tvc_connect()
Date:   Mon, 21 Sep 2020 21:10:58 +0800
Message-ID: <20200921131058.92941-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the return expression.

Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
---
 drivers/pinctrl/spear/pinctrl-spear320.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/pinctrl/spear/pinctrl-spear320.c b/drivers/pinctrl/spear/pinctrl-spear320.c
index 99c10fc3d..e629e3035 100644
--- a/drivers/pinctrl/spear/pinctrl-spear320.c
+++ b/drivers/pinctrl/spear/pinctrl-spear320.c
@@ -3418,8 +3418,6 @@ static const struct of_device_id spear320_pinctrl_of_match[] = {
 
 static int spear320_pinctrl_probe(struct platform_device *pdev)
 {
-	int ret;
-
 	spear3xx_machdata.groups = spear320_pingroups;
 	spear3xx_machdata.ngroups = ARRAY_SIZE(spear320_pingroups);
 	spear3xx_machdata.functions = spear320_functions;
@@ -3433,11 +3431,7 @@ static int spear320_pinctrl_probe(struct platform_device *pdev)
 	pmx_init_gpio_pingroup_addr(spear3xx_machdata.gpio_pingroups,
 			spear3xx_machdata.ngpio_pingroups, PMX_CONFIG_REG);
 
-	ret = spear_pinctrl_probe(pdev, &spear3xx_machdata);
-	if (ret)
-		return ret;
-
-	return 0;
+	return spear_pinctrl_probe(pdev, &spear3xx_machdata);
 }
 
 static struct platform_driver spear320_pinctrl_driver = {
-- 
2.23.0

