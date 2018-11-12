From: Johan Hovold <johan@kernel.org>
Subject: [PATCH] gpio: drop broken to_gpio_irq_chip() helper
Date: Mon, 12 Nov 2018 15:10:28 +0100
Message-ID: <20181112141028.10213-1-johan@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

Drop the broken to_gpio_irq_chip() container_of() helper, which would
break the build for anyone who tries to use it.

Specifically, struct gpio_irq_chip only holds a pointer to a struct
irq_chip so using container_of() on an irq-chip pointer makes no sense.

Fixes: da80ff81a8f5 ("gpio: Move irqchip into struct gpio_irq_chip")
Cc: Thierry Reding <treding@nvidia.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 include/linux/gpio/driver.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 2db62b550b95..21bff1f14fde 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -166,11 +166,6 @@ struct gpio_irq_chip {
 	 */
 	void		(*irq_disable)(struct irq_data *data);
 };
-
-static inline struct gpio_irq_chip *to_gpio_irq_chip(struct irq_chip *chip)
-{
-	return container_of(chip, struct gpio_irq_chip, chip);
-}
 #endif
 
 /**
-- 
2.19.1
