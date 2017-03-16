From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 4/6] gpio: mvebu: checkpatch: whitespace fixes
Date: Thu, 16 Mar 2017 07:33:59 +0100
Message-ID: <20170316063402.8667-5-ralph.sennhauser@gmail.com>
References: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Fix whitespace errors reported by checkpatch.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index a9522f4..1933e63 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -290,6 +290,7 @@ static int mvebu_gpio_direction_output(struct gpio_chip *chip, unsigned int pin,
 static int mvebu_gpio_to_irq(struct gpio_chip *chip, unsigned int pin)
 {
 	struct mvebu_gpio_chip *mvchip = gpiochip_get_data(chip);
+
 	return irq_create_mapping(mvchip->domain, pin);
 }
 
-- 
2.10.2
