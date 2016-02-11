From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: mpc8xxx: Fixup setting gpio direction output
Date: Thu, 11 Feb 2016 21:13:19 +0800
Message-ID: <1455196399.18445.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f179.google.com ([209.85.192.179]:32960 "EHLO
	mail-pf0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751099AbcBKNNY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Feb 2016 08:13:24 -0500
Received: by mail-pf0-f179.google.com with SMTP id q63so29406418pfb.0
        for <linux-gpio@vger.kernel.org>; Thu, 11 Feb 2016 05:13:23 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liu Gang <Gang.Liu@nxp.com>, Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

For devtype with specific gpio_dir_out implementation, current code looks
wrong because below code sets both gc->direction_output and
mpc8xxx_gc->direction_output to the same function.

gc->direction_output = devtype->gpio_dir_out ?: gc->direction_output;
mpc8xxx_gc->direction_output = gc->direction_output;

Set mpc8xxx_gc->direction_output = gc->direction_output first to fix it.
This way mpc8xxx_gc->direction_output actually calls the standard
bgpio_dir_out() to update register.

Setting gc->direction_output to gc->direction_output looks strange.
This patch also slightly changes the code for better readability.

Fixes: commit 42178e2a1e42 ("drivers/gpio: Switch gpio-mpc8xxx to use gpio-generic")
Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi,
I don't have this h/w, please review and test if this patch works.
Thank,
Axel
 drivers/gpio/gpio-mpc8xxx.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index ecdb27a..0ed279a 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -344,11 +344,14 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	 */
 	mpc8xxx_irq_chip.irq_set_type = devtype->irq_set_type;
 
-	gc->direction_output = devtype->gpio_dir_out ?: gc->direction_output;
-	gc->get = devtype->gpio_get ?: gc->get;
-	gc->to_irq = mpc8xxx_gpio_to_irq;
-
 	mpc8xxx_gc->direction_output = gc->direction_output;
+	if (devtype->gpio_dir_out)
+		gc->direction_output = devtype->gpio_dir_out;
+
+	if (devtype->gpio_get)
+		gc->get = devtype->gpio_get;
+
+	gc->to_irq = mpc8xxx_gpio_to_irq;
 
 	ret = gpiochip_add_data(gc, mpc8xxx_gc);
 	if (ret) {
-- 
2.1.4



