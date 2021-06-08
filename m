Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13574C47082
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Jun 2021 06:16:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFFEF61185
	for <linux-gpio@archiver.kernel.org>; Tue,  8 Jun 2021 06:16:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229657AbhFHGSW (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 8 Jun 2021 02:18:22 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:5281 "EHLO
        szxga08-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbhFHGSW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Jun 2021 02:18:22 -0400
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.57])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4FzfyL0Jhdz1BK2j;
        Tue,  8 Jun 2021 14:11:38 +0800 (CST)
Received: from dggemi762-chm.china.huawei.com (10.1.198.148) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 8 Jun 2021 14:16:28 +0800
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 dggemi762-chm.china.huawei.com (10.1.198.148) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 8 Jun 2021 14:16:27 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <linus.walleij@linaro.org>, <radim.pavlik@tbs-biometrics.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Zou Wei <zou_wei@huawei.com>
Subject: [PATCH -next v2] pinctrl: mcp23s08: Fix missing unlock on error in mcp23s08_irq()
Date:   Tue, 8 Jun 2021 14:34:08 +0800
Message-ID: <1623134048-56051-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggemi762-chm.china.huawei.com (10.1.198.148)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add the missing unlock before return from function mcp23s08_irq()
in the error handling case.

v1-->v2:
   remove the "return IRQ_HANDLED" line

Fixes: 897120d41e7a ("pinctrl: mcp23s08: fix race condition in irq handler")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 799d596..d025957 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -353,7 +353,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
 
 	if (intf == 0) {
 		/* There is no interrupt pending */
-		return IRQ_HANDLED;
+		goto unlock;
 	}
 
 	if (mcp_read(mcp, MCP_INTCAP, &intcap))
-- 
2.6.2

