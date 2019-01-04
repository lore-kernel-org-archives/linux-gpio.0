From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH] gpiolib: fix line event timestamps for nested irqs
Date: Fri,  4 Jan 2019 11:32:26 +0100
Message-ID: <20190104103226.2878-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Nested interrupts run inside the calling thread's context and the top
half handler is never called which means that we never read the
timestamp.

This issue came up when trying to read line events from a gpiochip
using regmap_irq_chip for interrupts.

Fix it by reading the timestamp from the irq thread function if it's
still 0 by the time the second handler is called.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpiolib.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1651d7f0a303..330c52e19b7e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -828,6 +828,13 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	/* Do not leak kernel stack to userspace */
 	memset(&ge, 0, sizeof(ge));
 
+	/*
+	 * We may be running from a nested threaded interrupt in which case
+	 * we didn't get the timestamp from lineevent_irq_handler().
+	 */
+	if (!le->timestamp)
+		le->timestamp = ktime_get_real_ns();
+
 	ge.timestamp = le->timestamp;
 
 	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
-- 
2.19.1
