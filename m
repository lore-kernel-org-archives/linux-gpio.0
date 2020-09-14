Return-Path: <SRS0=IeOR=CX=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A56FCC43461
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Sep 2020 06:31:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64E75208DB
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Sep 2020 06:31:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726067AbgINGbk (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Sep 2020 02:31:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:11830 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726098AbgINGbh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 14 Sep 2020 02:31:37 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id E34E6C0B2D3D50EC1778;
        Mon, 14 Sep 2020 14:31:33 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 14 Sep 2020
 14:31:22 +0800
From:   Liu Shixin <liushixin2@huawei.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Liu Shixin <liushixin2@huawei.com>
Subject: [PATCH -next] pinctrl: sprd: use module_platform_driver to simplify the code
Date:   Mon, 14 Sep 2020 14:54:02 +0800
Message-ID: <20200914065402.3726408-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

module_platform_driver() makes the code simpler by eliminating
boilerplate code.

Signed-off-by: Liu Shixin <liushixin2@huawei.com>
---
 drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
index 06c8671b40e7..d14f382f2392 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd-sc9860.c
@@ -946,18 +946,7 @@ static struct platform_driver sprd_pinctrl_driver = {
 	.remove = sprd_pinctrl_remove,
 	.shutdown = sprd_pinctrl_shutdown,
 };
-
-static int sprd_pinctrl_init(void)
-{
-	return platform_driver_register(&sprd_pinctrl_driver);
-}
-module_init(sprd_pinctrl_init);
-
-static void sprd_pinctrl_exit(void)
-{
-	platform_driver_unregister(&sprd_pinctrl_driver);
-}
-module_exit(sprd_pinctrl_exit);
+module_platform_driver(sprd_pinctrl_driver);
 
 MODULE_DESCRIPTION("SPREADTRUM Pin Controller Driver");
 MODULE_AUTHOR("Baolin Wang <baolin.wang@spreadtrum.com>");
-- 
2.25.1

