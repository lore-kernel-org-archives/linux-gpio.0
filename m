From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 7/9] gpio: mockup: change the type of 'offset' to unsigned int
Date: Tue, 29 Jan 2019 09:44:09 +0100
Message-ID: <20190129084411.30495-8-brgl@bgdev.pl>
References: <20190129084411.30495-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129084411.30495-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

This field can never be negative.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 0317917a3678..433adb3b4617 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -60,7 +60,7 @@ struct gpio_mockup_chip {
 struct gpio_mockup_dbgfs_private {
 	struct gpio_mockup_chip *chip;
 	struct gpio_desc *desc;
-	int offset;
+	unsigned int offset;
 };
 
 static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_RANGES];
-- 
2.19.1
