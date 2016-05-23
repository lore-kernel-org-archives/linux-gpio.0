From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] pinctrl: xway: use devm_gpiochip_add_data()
Date: Mon, 23 May 2016 11:02:53 +0200
Message-ID: <1463994173-13599-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f179.google.com ([209.85.217.179]:35006 "EHLO
	mail-lb0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753303AbcEWJDA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2016 05:03:00 -0400
Received: by mail-lb0-f179.google.com with SMTP id ww9so53195390lbc.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2016 02:02:59 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, John Crispin <blogic@openwrt.org>, Pramod Gurav <pramod.gurav@smartplayin.com>, Martin Schiller <mschiller@tdt.de>

Avoid a gpiochip_free() and use standard functions.

Cc: John Crispin <blogic@openwrt.org>
Cc: Pramod Gurav <pramod.gurav@smartplayin.com>
Cc: Martin Schiller <mschiller@tdt.de>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/pinctrl-xway.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-xway.c b/drivers/pinctrl/pinctrl-xway.c
index a13f2b6f6fc0..b9375544dff0 100644
--- a/drivers/pinctrl/pinctrl-xway.c
+++ b/drivers/pinctrl/pinctrl-xway.c
@@ -1724,9 +1724,9 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 	}
 	xway_pctrl_desc.pins = xway_info.pads;
 
-	/* load the gpio chip */
+	/* register the gpio chip */
 	xway_chip.parent = &pdev->dev;
-	ret = gpiochip_add(&xway_chip);
+	ret = devm_gpiochip_add_data(&pdev->dev, &xway_chip, NULL);
 	if (ret) {
 		dev_err(&pdev->dev, "Failed to register gpio chip\n");
 		return ret;
@@ -1749,7 +1749,6 @@ static int pinmux_xway_probe(struct platform_device *pdev)
 	/* register with the generic lantiq layer */
 	ret = ltq_pinctrl_register(pdev, &xway_info);
 	if (ret) {
-		gpiochip_remove(&xway_chip);
 		dev_err(&pdev->dev, "Failed to register pinctrl driver\n");
 		return ret;
 	}
-- 
2.4.11

