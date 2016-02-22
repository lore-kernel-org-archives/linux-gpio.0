From: Axel Lin <axel.lin@ingics.com>
Subject: [RFT][PATCH v2 3/3] gpio: mpc8xxx: Slightly update the code for
 better readability
Date: Mon, 22 Feb 2016 15:24:54 +0800
Message-ID: <1456125894.27297.2.camel@ingics.com>
References: <1456125772.27297.0.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f46.google.com ([209.85.220.46]:34209 "EHLO
	mail-pa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753323AbcBVHY6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Feb 2016 02:24:58 -0500
Received: by mail-pa0-f46.google.com with SMTP id fy10so86541508pac.1
        for <linux-gpio@vger.kernel.org>; Sun, 21 Feb 2016 23:24:58 -0800 (PST)
In-Reply-To: <1456125772.27297.0.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Liu Gang <Gang.Liu@nxp.com>, Alexandre Courbot <gnurou@gmail.com>, Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>, Alexander Stein <alexander.stein@systec-electronic.com>, linux-gpio@vger.kernel.org

Setting gc->direction_output to gc->direction_output looks strange.
I think this change makes the intention more clear.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 drivers/gpio/gpio-mpc8xxx.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mpc8xxx.c b/drivers/gpio/gpio-mpc8xxx.c
index bc042ad6..425501c 100644
--- a/drivers/gpio/gpio-mpc8xxx.c
+++ b/drivers/gpio/gpio-mpc8xxx.c
@@ -339,8 +339,11 @@ static int mpc8xxx_probe(struct platform_device *pdev)
 	 */
 	mpc8xxx_irq_chip.irq_set_type = devtype->irq_set_type;
 
-	gc->direction_output = devtype->gpio_dir_out ?: gc->direction_output;
-	gc->get = devtype->gpio_get ?: gc->get;
+	if (devtype->gpio_dir_out)
+		gc->direction_output = devtype->gpio_dir_out;
+	if (devtype->gpio_get)
+		gc->get = devtype->gpio_get;
+
 	gc->to_irq = mpc8xxx_gpio_to_irq;
 
 	ret = gpiochip_add_data(gc, mpc8xxx_gc);
-- 
2.1.4



