From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: pch: fix non-DT build
Date: Tue, 15 Dec 2015 14:43:22 +0100
Message-ID: <1450187002-25804-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:35655 "EHLO
	mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932487AbbLONn1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 08:43:27 -0500
Received: by mail-lf0-f51.google.com with SMTP id l133so6680161lfd.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Dec 2015 05:43:26 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Paul Burton <paul.burton@imgtec.com>

commit 1cfadea8f395e3fb6a15ea548e3e86c8b6d64f98
"gpio: pch: allow use from device tree"
makes the driver not compile unless CONFIG_OF_GPIO is set.
Fix it.

Cc: Paul Burton <paul.burton@imgtec.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-pch.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index a650a6cc1312..af0715f8524b 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -394,7 +394,9 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	pci_set_drvdata(pdev, chip);
 	spin_lock_init(&chip->spinlock);
 	pch_gpio_setup(chip);
+#ifdef CONFIG_OF_GPIO
 	chip->gpio.of_node = pdev->dev.of_node;
+#endif
 	ret = gpiochip_add(&chip->gpio);
 	if (ret) {
 		dev_err(&pdev->dev, "PCH gpio: Failed to register GPIO\n");
-- 
2.4.3

