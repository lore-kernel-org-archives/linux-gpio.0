From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v4 2/7] gpio: mockup: add locking
Date: Thu, 14 Feb 2019 14:42:27 +0100
Message-ID: <20190214134232.3821-3-brgl@bgdev.pl>
References: <20190214134232.3821-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190214134232.3821-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

While no user reported any race condition problems with gpio-mockup,
let's be on the safe side and use a spinlock when performing any
changes on the dummy chip structures. We're using a spinlock because
a subsequent patch will register an irq_sim notifier which holds
the irq_desc lock and if using a mutex we'd get the
"HARDIRQ-safe -> HARDIRQ-unsafe" lockdep error.

Suggested-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 50 ++++++++++++++++++++++++++++++++------
 1 file changed, 43 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 6a50f9f59c90..9697bf622284 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -54,6 +54,7 @@ struct gpio_mockup_chip {
 	struct gpio_mockup_line_status *lines;
 	struct irq_sim irqsim;
 	struct dentry *dbg_dir;
+	spinlock_t lock;
 };
 
 struct gpio_mockup_dbgfs_private {
@@ -82,29 +83,53 @@ static int gpio_mockup_range_ngpio(unsigned int index)
 	return gpio_mockup_ranges[index * 2 + 1];
 }
 
-static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
+static int __gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
 	return chip->lines[offset].value;
 }
 
-static void gpio_mockup_set(struct gpio_chip *gc,
-			    unsigned int offset, int value)
+static int gpio_mockup_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+	int val;
+
+	spin_lock(&chip->lock);
+	val = __gpio_mockup_get(gc, offset);
+	spin_unlock(&chip->lock);
+
+	return val;
+}
+
+static void __gpio_mockup_set(struct gpio_chip *gc,
+			      unsigned int offset, int value)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
 	chip->lines[offset].value = !!value;
 }
 
+static void gpio_mockup_set(struct gpio_chip *gc,
+			   unsigned int offset, int value)
+{
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+
+	spin_lock(&chip->lock);
+	__gpio_mockup_set(gc, offset, value);
+	spin_unlock(&chip->lock);
+}
+
 static void gpio_mockup_set_multiple(struct gpio_chip *gc,
 				     unsigned long *mask, unsigned long *bits)
 {
+	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 	unsigned int bit;
 
+	spin_lock(&chip->lock);
 	for_each_set_bit(bit, mask, gc->ngpio)
-		gpio_mockup_set(gc, bit, test_bit(bit, bits));
-
+		__gpio_mockup_set(gc, bit, test_bit(bit, bits));
+	spin_unlock(&chip->lock);
 }
 
 static int gpio_mockup_dirout(struct gpio_chip *gc,
@@ -112,8 +137,10 @@ static int gpio_mockup_dirout(struct gpio_chip *gc,
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
-	gpio_mockup_set(gc, offset, value);
+	spin_lock(&chip->lock);
 	chip->lines[offset].dir = GPIO_MOCKUP_DIR_OUT;
+	__gpio_mockup_set(gc, offset, value);
+	spin_unlock(&chip->lock);
 
 	return 0;
 }
@@ -122,7 +149,9 @@ static int gpio_mockup_dirin(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
 
+	spin_lock(&chip->lock);
 	chip->lines[offset].dir = GPIO_MOCKUP_DIR_IN;
+	spin_unlock(&chip->lock);
 
 	return 0;
 }
@@ -130,8 +159,13 @@ static int gpio_mockup_dirin(struct gpio_chip *gc, unsigned int offset)
 static int gpio_mockup_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	struct gpio_mockup_chip *chip = gpiochip_get_data(gc);
+	int direction;
 
-	return !chip->lines[offset].dir;
+	spin_lock(&chip->lock);
+	direction = !chip->lines[offset].dir;
+	spin_unlock(&chip->lock);
+
+	return direction;
 }
 
 static int gpio_mockup_to_irq(struct gpio_chip *gc, unsigned int offset)
@@ -283,6 +317,8 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 			return -ENOMEM;
 	}
 
+	spin_lock_init(&chip->lock);
+
 	gc = &chip->gc;
 	gc->base = base;
 	gc->ngpio = ngpio;
-- 
2.20.1
