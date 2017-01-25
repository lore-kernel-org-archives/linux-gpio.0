From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 3/7] gpio: mockup: set the mockup flag in struct gpio_chip
Date: Wed, 25 Jan 2017 16:34:17 +0100
Message-ID: <1485358461-24070-4-git-send-email-bgolaszewski@baylibre.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

gpio-mockup creates dummy devices, so indicate it.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 82a9efd..cf8b1b2 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -101,6 +101,7 @@ static int mockup_gpio_add(struct device *dev,
 	cntr->gc.direction_output = mockup_gpio_dirout;
 	cntr->gc.direction_input = mockup_gpio_dirin;
 	cntr->gc.get_direction = mockup_gpio_get_direction;
+	cntr->gc.mockup = true;
 	cntr->stats = devm_kzalloc(dev, sizeof(*cntr->stats) * cntr->gc.ngpio,
 				   GFP_KERNEL);
 	if (!cntr->stats) {
-- 
2.9.3
