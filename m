From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 1/7] gpio: mockup: improve the debugfs input sanitization
Date: Tue, 30 May 2017 10:58:34 +0200
Message-ID: <1496134720-5363-2-git-send-email-brgl@bgdev.pl>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f49.google.com ([74.125.82.49]:33407 "EHLO
        mail-wm0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbdE3I6s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2017 04:58:48 -0400
Received: by mail-wm0-f49.google.com with SMTP id m7so25872798wmg.0
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2017 01:58:47 -0700 (PDT)
In-Reply-To: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

We're currently only checking the first character of the input to the
debugfs event files, so a string like '0sdfdsf' is valid and indicates
a falling edge event.

Be more strict and only allow '0', '1', '0\n' & '1\n'.

While we're at it: move the sanitization code before the irq_enabled
check so that we indicate an error on invalid input even if nobody is
waiting for events.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index ba8d62a..da76267 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -208,8 +208,7 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	struct seq_file *sfile;
 	struct gpio_desc *desc;
 	struct gpio_chip *gc;
-	int val;
-	char buf;
+	int rv, val;
 
 	sfile = file->private_data;
 	priv = sfile->private;
@@ -217,19 +216,15 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	chip = priv->chip;
 	gc = &chip->gc;
 
+	rv = kstrtoint_from_user(usr_buf, size, 0, &val);
+	if (rv)
+		return rv;
+	if (val != 0 && val != 1)
+		return -EINVAL;
+
 	if (!chip->lines[priv->offset].irq_enabled)
 		return size;
 
-	if (copy_from_user(&buf, usr_buf, 1))
-		return -EFAULT;
-
-	if (buf == '0')
-		val = 0;
-	else if (buf == '1')
-		val = 1;
-	else
-		return -EINVAL;
-
 	gpiod_set_value_cansleep(desc, val);
 	priv->chip->irq_ctx.irq = gc->irq_base + priv->offset;
 	irq_work_queue(&priv->chip->irq_ctx.work);
-- 
2.9.3

