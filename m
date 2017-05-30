From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] gpiolib: remove unused variable
Date: Tue, 30 May 2017 11:21:05 +0200
Message-ID: <20170530092128.1180841-1-arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Lars-Peter Clausen <lars@metafoo.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

This was left behind by a cleanup patch:

drivers/gpio/gpiolib.c: In function 'gpiochip_irqchip_init_valid_mask':
drivers/gpio/gpiolib.c:1474:6: error: unused variable 'i' [-Werror=unused-variable]

Fixes: 923a654c186c ("gpiolib: Re-use bitmap_fill() instead of open coded loop")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpiolib.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index be8097097326..62ffb4e293d2 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1471,8 +1471,6 @@ static struct gpio_chip *find_chip_by_name(const char *name)
 
 static int gpiochip_irqchip_init_valid_mask(struct gpio_chip *gpiochip)
 {
-	int i;
-
 	if (!gpiochip->irq_need_valid_mask)
 		return 0;
 
-- 
2.9.0
