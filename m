Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF73C77B73
	for <linux-gpio@archiver.kernel.org>; Sun, 30 Apr 2023 04:23:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjD3EX5 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 30 Apr 2023 00:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjD3EX4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Apr 2023 00:23:56 -0400
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E737312F;
        Sat, 29 Apr 2023 21:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qS63V
        bA9VLHyDMasvm7Ft009tQW4scOgwMZkX8i1AEE=; b=AVdCFteFfFT5oKkJBpaax
        UvV2HF97t/OntLR67emuqmehv09sCuP6h2Ng1hc5F4GQ76LOdGzqhtoQrjARyOJQ
        OAAIhQa/WL1TWTAZdrf5g/njT63KuQAgfZYH6wW22okeXUg0LZz8xmn0Uy9pomfx
        muEC2TnlKwTK3rqavav/I4=
Received: from lizhe.. (unknown [120.245.132.239])
        by zwqz-smtp-mta-g3-1 (Coremail) with SMTP id _____wCnVFYi7U1kk68oAg--.9220S4;
        Sun, 30 Apr 2023 12:23:33 +0800 (CST)
From:   Lizhe <sensor1010@163.com>
To:     linus.walleij@linaro.org, orsonzhai@gmail.com,
        baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
        andriy.shevchenko@linux.intel.com, sensor1010@163.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl:sprd: Check if the pinctrl_dev still exists
Date:   Sun, 30 Apr 2023 12:22:54 +0800
Message-Id: <20230430042254.7543-1-sensor1010@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnVFYi7U1kk68oAg--.9220S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrKF13GFW7tw4DCr1rCryrtFb_yoW3ZFg_WF
        yrGrWxJ3yUGw4Y9w1jkry3ZFW0yF43Xr1SvFnFqFy3C347Xw4UtrykCF45G34xG3s7CryU
        Gryjq393Ar13AjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKpBTDUUUUU==
X-Originating-IP: [120.245.132.239]
X-CM-SenderInfo: 5vhq20jurqiii6rwjhhfrp/1tbiKAhhq17WMwX-sAAAsb
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

to check if the pinctrl_dev still exists before calling
pinctrl_unregister().

Signed-off-by: Lizhe <sensor1010@163.com>
---
 drivers/pinctrl/sprd/pinctrl-sprd.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/sprd/pinctrl-sprd.c b/drivers/pinctrl/sprd/pinctrl-sprd.c
index ca9659f4e4b1..6f3369130e8a 100644
--- a/drivers/pinctrl/sprd/pinctrl-sprd.c
+++ b/drivers/pinctrl/sprd/pinctrl-sprd.c
@@ -1115,7 +1115,9 @@ int sprd_pinctrl_remove(struct platform_device *pdev)
 {
 	struct sprd_pinctrl *sprd_pctl = platform_get_drvdata(pdev);
 
-	pinctrl_unregister(sprd_pctl->pctl);
+	if (sprd_pctl->dev)
+		pinctrl_unregister(sprd_pctl->pctl);
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(sprd_pinctrl_remove);
-- 
2.34.1

