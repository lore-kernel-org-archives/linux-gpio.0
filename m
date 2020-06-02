Return-Path: <SRS0=MAhF=7P=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A630C433DF
	for <linux-gpio@archiver.kernel.org>; Tue,  2 Jun 2020 20:06:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F20D920734
	for <linux-gpio@archiver.kernel.org>; Tue,  2 Jun 2020 20:06:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbgFBUGe (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 2 Jun 2020 16:06:34 -0400
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:26480 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgFBUGe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jun 2020 16:06:34 -0400
Received: from localhost.localdomain ([93.22.133.243])
        by mwinf5d52 with ME
        id mL6V220075FEkrh03L6VEp; Tue, 02 Jun 2020 22:06:32 +0200
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Tue, 02 Jun 2020 22:06:32 +0200
X-ME-IP: 93.22.133.243
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     aisheng.dong@nxp.com, festevam@gmail.com, shawnguo@kernel.org,
        stefan@agner.ch, kernel@pengutronix.de, linus.walleij@linaro.org,
        s.hauer@pengutronix.de, linux-imx@nxp.com, aalonso@freescale.com
Cc:     linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] pinctrl: freescale: imx: Use 'devm_of_iomap()' to avoid a resource leak in case of error in 'imx_pinctrl_probe()'
Date:   Tue,  2 Jun 2020 22:06:26 +0200
Message-Id: <20200602200626.677981-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use 'devm_of_iomap()' instead 'of_iomap()' to avoid a resource leak in
case of error.

Update the error handling code accordingly.

Fixes: 26d8cde5260b ("pinctrl: freescale: imx: add shared input select reg support")
Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 1f81569c7ae3..cb7e0f08d2cf 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -824,12 +824,13 @@ int imx_pinctrl_probe(struct platform_device *pdev,
 				return -EINVAL;
 			}
 
-			ipctl->input_sel_base = of_iomap(np, 0);
+			ipctl->input_sel_base = devm_of_iomap(&pdev->dev, np,
+							      0, NULL);
 			of_node_put(np);
-			if (!ipctl->input_sel_base) {
+			if (IS_ERR(ipctl->input_sel_base)) {
 				dev_err(&pdev->dev,
 					"iomuxc input select base address not found\n");
-				return -ENOMEM;
+				return PTR_ERR(ipctl->input_sel_base);
 			}
 		}
 	}
-- 
2.25.1

