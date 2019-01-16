From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH STABLE v4.19.15] gpiolib: fix line event timestamps for nested irqs
Date: Wed, 16 Jan 2019 16:35:57 +0100
Message-ID: <20190116153557.13720-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Nested interrupts run inside the calling thread's context and the top
half handler is never called which means that we never read the
timestamp.

This issue came up when trying to read line events from a gpiochip
using regmap_irq_chip for interrupts.

Fix it by reading the timestamp from the irq thread function if it's
still 0 by the time the second handler is called.

Fixes: d58f2bf261fd ("gpio: Timestamp events in hardirq handler")
Cc: stable@vger.kernel.org
Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
Hi Sasha,

this is a backport for v4.19.y series. The original patch didn't apply
due to a conflict.

 drivers/gpio/gpiolib.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a8e01d99919c..b3ab6c428423 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -817,7 +817,15 @@ static irqreturn_t lineevent_irq_thread(int irq, void *p)
 	/* Do not leak kernel stack to userspace */
 	memset(&ge, 0, sizeof(ge));
 
-	ge.timestamp = le->timestamp;
+	/*
+	 * We may be running from a nested threaded interrupt in which case
+	 * we didn't get the timestamp from lineevent_irq_handler().
+	 */
+	if (!le->timestamp)
+		ge.timestamp = ktime_get_real_ns();
+	else
+		ge.timestamp = le->timestamp;
+
 	level = gpiod_get_value_cansleep(le->desc);
 
 	if (le->eflags & GPIOEVENT_REQUEST_RISING_EDGE
-- 
2.19.1
