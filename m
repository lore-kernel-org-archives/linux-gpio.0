From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/2] gpio: mockup: use irq_sim_fire_edge()
Date: Tue, 20 Nov 2018 14:40:32 +0100
Message-ID: <20181120134032.31645-3-brgl@bgdev.pl>
References: <20181120134032.31645-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181120134032.31645-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Gleixner <tglx@linutronix.de>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We now have a specialized variant of irq_sim_fire() - use it in
gpio-mockup so that we only generate events of types that were
requested with the LINEEVENT ioctl().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index a4c054cf9c5f..18563d2c7876 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -199,7 +199,7 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	struct gpio_mockup_chip *chip;
 	struct seq_file *sfile;
 	struct gpio_desc *desc;
-	int rv, val;
+	int rv, val, edge;
 
 	rv = kstrtoint_from_user(usr_buf, size, 0, &val);
 	if (rv)
@@ -213,7 +213,8 @@ static ssize_t gpio_mockup_event_write(struct file *file,
 	chip = priv->chip;
 
 	gpiod_set_value_cansleep(desc, val);
-	irq_sim_fire(&chip->irqsim, priv->offset);
+	edge = val == 0 ? IRQ_TYPE_EDGE_FALLING : IRQ_TYPE_EDGE_RISING;
+	irq_sim_fire_edge(&chip->irqsim, priv->offset, edge);
 
 	return size;
 }
-- 
2.19.1
