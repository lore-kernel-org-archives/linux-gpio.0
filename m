Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A725AC4332F
	for <linux-gpio@archiver.kernel.org>; Fri, 20 May 2022 05:21:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345553AbiETFUy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 20 May 2022 01:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345564AbiETFUw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 May 2022 01:20:52 -0400
Received: from smtpproxy21.qq.com (smtpbg701.qq.com [203.205.195.86])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FC67CE24
        for <linux-gpio@vger.kernel.org>; Thu, 19 May 2022 22:20:47 -0700 (PDT)
X-QQ-mid: bizesmtp66t1653024024tli9ljwk
Received: from localhost.localdomain ( [123.114.60.34])
        by bizesmtp.qq.com (ESMTP) with 
        id ; Fri, 20 May 2022 13:20:22 +0800 (CST)
X-QQ-SSF: 01400000000000C0P000B00A0000000
X-QQ-FEAT: m2MyNB0G64l0Nsuavp5W6TBGn3MsEceFfz5qolkav3oV4q3Nm43n81lToTJrn
        1Rum+E0qbsdbFFEdQL/vn5RK4gaLe8EeNI7NFR8MyxC1ADHZjS5J96UPBTReAVQvp9/yq9c
        /YyFaFktayoNIBEBGrwzuhtNvlZDOjbtIqwaXrj0YvpBNUpOcljwZanLa20H4kxnYGPNzz7
        xCwER8NIgrRGM1eOsK10XWaWWsK/cgKK7LS1838dxMIJzoIu/OiJLjaDzxFpK0IjB4FUhcY
        0Onm9AY7p3T+rM3P7mHdDWGG9SC6PHd/ENwOIyjPhlgw035mARCX5BtNO/2QEKFsMfEaCkx
        c5njvxE
X-QQ-GoodBg: 2
From:   zhaoxiao <zhaoxiao@uniontech.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        zhaoxiao <zhaoxiao@uniontech.com>
Subject: [PATCH] pinctrl: berlin: bg4ct: Use devm_platform_*ioremap_resource() APIs
Date:   Fri, 20 May 2022 13:20:21 +0800
Message-Id: <20220520052021.25631-1-zhaoxiao@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:uniontech.com:qybgforeign:qybgforeign4
X-QQ-Bgrelay: 1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use devm_platform_get_and_ioremap_resource() and
devm_platform_ioremap_resource() APIs instead of their
open coded analogues.

Signed-off-by: zhaoxiao <zhaoxiao@uniontech.com>
---
 drivers/pinctrl/berlin/berlin-bg4ct.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pinctrl/berlin/berlin-bg4ct.c b/drivers/pinctrl/berlin/berlin-bg4ct.c
index 6a7fe929a68b..3026a3b3da2d 100644
--- a/drivers/pinctrl/berlin/berlin-bg4ct.c
+++ b/drivers/pinctrl/berlin/berlin-bg4ct.c
@@ -460,8 +460,7 @@ static int berlin4ct_pinctrl_probe(struct platform_device *pdev)
 	if (!rmconfig)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
-- 
2.20.1



