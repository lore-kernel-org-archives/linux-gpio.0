Return-Path: <SRS0=+g2X=WD=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F1DC32751
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Aug 2019 08:51:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CAB0422324
	for <linux-gpio@archiver.kernel.org>; Wed,  7 Aug 2019 08:51:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726461AbfHGIvL (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 7 Aug 2019 04:51:11 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:36554 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726494AbfHGIvL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Aug 2019 04:51:11 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id m8r92000B05gfCL068r97X; Wed, 07 Aug 2019 10:51:09 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHf3-0002f7-7G; Wed, 07 Aug 2019 10:51:09 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hvHf3-0006OJ-5n; Wed, 07 Aug 2019 10:51:09 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: rza1: Use devm_platform_ioremap_resource() helper
Date:   Wed,  7 Aug 2019 10:51:08 +0200
Message-Id: <20190807085108.24526-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the devm_platform_ioremap_resource() helper instead of open-coding
the same operation.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in sh-pfc-for-v5.4.

 drivers/pinctrl/pinctrl-rza1.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 021e37b7689e4fda..68aeefe29144822f 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -1359,7 +1359,6 @@ static int rza1_pinctrl_register(struct rza1_pinctrl *rza1_pctl)
 static int rza1_pinctrl_probe(struct platform_device *pdev)
 {
 	struct rza1_pinctrl *rza1_pctl;
-	struct resource *res;
 	int ret;
 
 	rza1_pctl = devm_kzalloc(&pdev->dev, sizeof(*rza1_pctl), GFP_KERNEL);
@@ -1368,8 +1367,7 @@ static int rza1_pinctrl_probe(struct platform_device *pdev)
 
 	rza1_pctl->dev = &pdev->dev;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	rza1_pctl->base = devm_ioremap_resource(&pdev->dev, res);
+	rza1_pctl->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(rza1_pctl->base))
 		return PTR_ERR(rza1_pctl->base);
 
-- 
2.17.1

