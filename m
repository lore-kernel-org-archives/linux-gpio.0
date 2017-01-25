From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/7] gpiolib: support monitoring mockup devices
Date: Wed, 25 Jan 2017 16:34:16 +0100
Message-ID: <1485358461-24070-3-git-send-email-bgolaszewski@baylibre.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f44.google.com ([74.125.82.44]:37897 "EHLO
        mail-wm0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751878AbdAYPe4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Jan 2017 10:34:56 -0500
Received: by mail-wm0-f44.google.com with SMTP id r144so37006351wme.1
        for <linux-gpio@vger.kernel.org>; Wed, 25 Jan 2017 07:34:41 -0800 (PST)
In-Reply-To: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>

Add a new flag to struct gpio_chip indicating that the chip doesn't
model a real device. When setting up the line event queue, check if
a device is a mockup chip and don't actually request the interrupt.

This way we can monitor mockup GPIOs.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c      | 27 +++++++++++++++++----------
 include/linux/gpio/driver.h |  4 ++++
 2 files changed, 21 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6722579..19b4b8b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -735,6 +735,7 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 
 static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 {
+	struct gpio_chip *chip = gdev->chip;
 	struct gpioevent_request eventreq;
 	struct lineevent_state *le;
 	struct gpio_desc *desc;
@@ -807,7 +808,8 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 		goto out_free_desc;
 
 	le->irq = gpiod_to_irq(desc);
-	if (le->irq <= 0) {
+	/* Mockup gpiochips don't have to support this. */
+	if (le->irq <= 0 && !chip->mockup) {
 		ret = -ENODEV;
 		goto out_free_desc;
 	}
@@ -823,15 +825,20 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 	init_waitqueue_head(&le->wait);
 	mutex_init(&le->read_lock);
 
-	/* Request a thread to read the events */
-	ret = request_threaded_irq(le->irq,
-			NULL,
-			lineevent_irq_thread,
-			irqflags,
-			le->label,
-			le);
-	if (ret)
-		goto out_free_desc;
+	if (!chip->mockup) {
+		/*
+		 * Request a thread to read the events unless we're dealing
+		 * with a mockup gpiochip.
+		 */
+		ret = request_threaded_irq(le->irq,
+				NULL,
+				lineevent_irq_thread,
+				irqflags,
+				le->label,
+				le);
+		if (ret)
+			goto out_free_desc;
+	}
 
 	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
 	if (fd < 0) {
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index e973fab..912eae1 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -82,6 +82,9 @@ enum single_ended_mode {
  *	implies that if the chip supports IRQs, these IRQs need to be threaded
  *	as the chip access may sleep when e.g. reading out the IRQ status
  *	registers.
+ * @mockup: if set, the flag signifies that this gpiochip does not model a
+ *      real device; this can affect the way the chip is handled internally
+ *      by gpiolib.
  * @read_reg: reader function for generic GPIO
  * @write_reg: writer function for generic GPIO
  * @pin2mask: some generic GPIO controllers work with the big-endian bits
@@ -166,6 +169,7 @@ struct gpio_chip {
 	u16			ngpio;
 	const char		*const *names;
 	bool			can_sleep;
+	bool			mockup;
 
 #if IS_ENABLED(CONFIG_GPIO_GENERIC)
 	unsigned long (*read_reg)(void __iomem *reg);
-- 
2.9.3

