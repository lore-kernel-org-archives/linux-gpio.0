Return-Path: <SRS0=ZLld=C6=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8559C43465
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Sep 2020 13:12:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7FB132076E
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Sep 2020 13:12:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727630AbgIUNL5 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 21 Sep 2020 09:11:57 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13765 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727403AbgIUNKo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 21 Sep 2020 09:10:44 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 207EF6BC6A522D0DAF07;
        Mon, 21 Sep 2020 21:10:40 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Mon, 21 Sep 2020 21:10:32 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Qinglang Miao <miaoqinglang@huawei.com>
Subject: [PATCH -next] pinctrl: mediatek: simplify the return expression of mtk_pinconf_bias_disable_set_rev1()
Date:   Mon, 21 Sep 2020 21:10:56 +0800
Message-ID: <20200921131056.92848-1-miaoqinglang@huawei.com>
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
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 2f3dfb56c..16bb15226 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -479,14 +479,8 @@ EXPORT_SYMBOL_GPL(mtk_pinconf_bias_get);
 int mtk_pinconf_bias_disable_set_rev1(struct mtk_pinctrl *hw,
 				      const struct mtk_pin_desc *desc)
 {
-	int err;
-
-	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
-			       MTK_DISABLE);
-	if (err)
-		return err;
-
-	return 0;
+	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PULLEN,
+				MTK_DISABLE);
 }
 EXPORT_SYMBOL_GPL(mtk_pinconf_bias_disable_set_rev1);
 
-- 
2.23.0

