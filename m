From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 04/10] gpio: mockup: support irqmask and irqunmask
Date: Thu, 25 May 2017 10:33:41 +0200
Message-ID: <1495701227-28809-5-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f169.google.com ([209.85.128.169]:33893 "EHLO
        mail-wr0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936949AbdEYIeA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2017 04:34:00 -0400
Received: by mail-wr0-f169.google.com with SMTP id j27so14357877wre.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2017 01:33:59 -0700 (PDT)
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>

Even though this is a testing module, be nice and actually implement
these functions.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index c17578e..ba8d62a 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -41,6 +41,7 @@ enum {
 struct gpio_mockup_line_status {
 	int dir;
 	bool value;
+	bool irq_enabled;
 };
 
 struct gpio_mockup_irq_context {
@@ -142,12 +143,21 @@ static int gpio_mockup_to_irq(struct gpio_chip *chip, unsigned int offset)
 	return chip->irq_base + offset;
 }
 
-/*
- * While we should generally support irqmask and irqunmask, this driver is
- * for testing purposes only so we don't care.
- */
-static void gpio_mockup_irqmask(struct irq_data *d) { }
-static void gpio_mockup_irqunmask(struct irq_data *d) { }
+static void gpio_mockup_irqmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+
+	chip->lines[data->irq - gc->irq_base].irq_enabled = false;
+}
+
+static void gpio_mockup_irqunmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+
+	chip->lines[data->irq - gc->irq_base].irq_enabled = true;
+}
 
 static struct irq_chip gpio_mockup_irqchip = {
 	.name		= GPIO_MOCKUP_NAME,
@@ -178,6 +188,7 @@ static int gpio_mockup_irqchip_setup(struct device *dev,
 
 	for (i = 0; i < gc->ngpio; i++) {
 		irq_set_chip(irq_base + i, gc->irqchip);
+		irq_set_chip_data(irq_base + i, gc);
 		irq_set_handler(irq_base + i, &handle_simple_irq);
 		irq_modify_status(irq_base + i,
 				  IRQ_NOREQUEST | IRQ_NOAUTOEN, IRQ_NOPROBE);
@@ -206,6 +217,9 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	chip = priv->chip;
 	gc = &chip->gc;
 
+	if (!chip->lines[priv->offset].irq_enabled)
+		return size;
+
 	if (copy_from_user(&buf, usr_buf, 1))
 		return -EFAULT;
 
-- 
2.9.3

