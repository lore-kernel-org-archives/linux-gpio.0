From: Axel Lin <axel.lin@ingics.com>
Subject: [RFT][PATCH v2 1/3] gpio: mpc8xxx: Fixup setting gpio direction
 output
Date: Mon, 22 Feb 2016 15:22:52 +0800
Message-ID: <1456125772.27297.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f178.google.com ([209.85.192.178]:36252 "EHLO
	mail-pf0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751855AbcBVHW5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2016 02:22:57 -0500
Received: by mail-pf0-f178.google.com with SMTP id e127so88314791pfe.3
        for <linux-gpio@vger.kernel.org>; Sun, 21 Feb 2016 23:22:57 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liu Gang <Gang.Liu@nxp.com>, Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

For devtype with specific gpio_dir_out implementation, current code is
wrong because below code sets both gc->direction_output and
mpc8xxx_gc->direction_output to the same function.

gc->direction_output = devtype->gpio_dir_out ?: gc->direction_output;
mpc8xxx_gc->direction_output = gc->direction_output;

Set mpc8xxx_gc->direction_output = gc->direction_output first to fix it.
This way mpc8xxx_gc->direction_output actually calls the standard
bgpio_dir_out() to update register.

Fixes: commit 42178e2a1e42 ("drivers/gpio: Switch gpio-mpc8xxx to use gpio-generic")

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index ecdb27a..d2472c5 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -334,6 +334,7 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 
 	mpc8xxx_gc->read_reg = gc->read_reg;
 	mpc8xxx_gc->write_reg = gc->write_reg;
+	mpc8xxx_gc->direction_output = gc->direction_output;
 
 	if (!devtype)
 		devtype = &mpc8xxx_gpio_devtype_default;
@@ -348,8 +349,6 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	gc->get = devtype->gpio_get ?: gc->get;
 	gc->to_irq = mpc8xxx_gpio_to_irq;
 
-	mpc8xxx_gc->direction_output = gc->direction_output;
-
 	ret = gpiochip_add_data(gc, mpc8xxx_gc);
 	if (ret) {
 		pr_err("%s: GPIO chip registration failed with status %d\n",
-- 
2.1.4



