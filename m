From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: Timestamp events in hardirq handler
Date: Thu, 30 Nov 2017 10:26:55 +0100
Message-ID: <20171130092655.25965-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:41832 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750782AbdK3J1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Nov 2017 04:27:01 -0500
Received: by mail-lf0-f66.google.com with SMTP id f18so7101194lfg.8
        for <linux-gpio@vger.kernel.org>; Thu, 30 Nov 2017 01:27:01 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Felipe Balbi <felipe.balbi@linux.intel.com>

Add a hardirq handler to the GPIO userspace event loop, making
sure to pick up the timestamp there, as close as possible in time
relative to the actual event causing the interrupt.

Tested with a simple pushbutton GPIO on ux500 and seems to work
fine.

Cc: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
Reported-by: Felipe Balbi <felipe.balbi@linux.intel.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpiolib.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index aad84a6306c4..6e006e6df95a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -587,6 +587,9 @@ static int linehandle_create(struct gpio_device *gdev, void __user *ip)
  * @events: KFIFO for the GPIO events
  * @read_lock: mutex lock to protect reads from colliding with adding
  * new events to the FIFO
+ * @timestamp: cache for the timestamp storing it between hardirq
+ * and IRQ thread, used to bring the timestamp close to the actual
+ * event
  */
 struct lineevent_state {
 	struct gpio_device *gdev;
@@ -597,6 +600,7 @@ struct lineevent_state {
 	wait_queue_head_t wait;
 	DECLARE_KFIFO(events, struct gpioevent_data, 16);
 	struct mutex read_lock;
+	s64 timestamp;
 };
 
 #define GPIOEVENT_REQUEST_VALID_FLAGS \
@@ -731,7 +735,7 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	struct gpioevent_data ge;
 	int ret, level;
 
-	ge.timestamp = ktime_get_real_ns();
+	ge.timestamp = le->timestamp;
 	level = gpiod_get_value_cansleep(le->desc);
 
 	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
@@ -759,6 +763,19 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t lineevent_irq_handler(int irq, void *p)
+{
+	struct lineevent_state *le = p;
+
+	/*
+	 * Just store the timestamp in hardirq context so we get it as
+	 * close in time as possible to the actual event.
+	 */
+	le->timestamp = ktime_get_real_ns();
+
+	return IRQ_WAKE_THREAD;
+}
+
 static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 {
 	struct gpioevent_request eventreq;
@@ -851,7 +868,7 @@ static int lineevent_create(struct gpio_device *gdev, void __user *ip)
 
 	/* Request a thread to read the events */
 	ret = request_threaded_irq(le->irq,
-			NULL,
+			lineevent_irq_handler,
 			lineevent_irq_thread,
 			irqflags,
 			le->label,
-- 
2.14.3

