From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 2/7] gpio: mockup: tweak gpio_mockup_event_write()
Date: Tue, 30 May 2017 10:58:35 +0200
Message-ID: <1496134720-5363-3-git-send-email-brgl@bgdev.pl>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f52.google.com ([74.125.82.52]:35149 "EHLO
        mail-wm0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751262AbdE3I6t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 04:58:49 -0400
Received: by mail-wm0-f52.google.com with SMTP id b84so83131683wmh.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2017 01:58:49 -0700 (PDT)
In-Reply-To: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Invert the logic of the irq_enabled check and only access the private
data after the input is sanitized.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index da76267..d78e8e0 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -210,24 +210,23 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	struct gpio_chip *gc;
 	int rv, val;
 
-	sfile = file->private_data;
-	priv = sfile->private;
-	desc = priv->desc;
-	chip = priv->chip;
-	gc = &chip->gc;
-
 	rv = kstrtoint_from_user(usr_buf, size, 0, &val);
 	if (rv)
 		return rv;
 	if (val != 0 && val != 1)
 		return -EINVAL;
 
-	if (!chip->lines[priv->offset].irq_enabled)
-		return size;
+	sfile = file->private_data;
+	priv = sfile->private;
+	desc = priv->desc;
+	chip = priv->chip;
+	gc = &chip->gc;
 
-	gpiod_set_value_cansleep(desc, val);
-	priv->chip->irq_ctx.irq = gc->irq_base + priv->offset;
-	irq_work_queue(&priv->chip->irq_ctx.work);
+	if (chip->lines[priv->offset].irq_enabled) {
+		gpiod_set_value_cansleep(desc, val);
+		priv->chip->irq_ctx.irq = gc->irq_base + priv->offset;
+		irq_work_queue(&priv->chip->irq_ctx.work);
+	}
 
 	return size;
 }
-- 
2.9.3

