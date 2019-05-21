From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 2/2] gpio: max732x: use devm_gpiochip_add_data()
Date: Tue, 21 May 2019 11:03:06 +0200
Message-ID: <20190521090306.28113-2-brgl@bgdev.pl>
References: <20190521090306.28113-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521090306.28113-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

We can simplify the code a bit with a resource managed variant of
gpiochip_add_data().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-max732x.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 7fd1bdfe00e5..42c9b6ce4227 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -698,15 +698,13 @@ static int max732x_probe(struct i2c_client *client,
 			return ret;
 	}
 
-	ret = gpiochip_add_data(&chip->gpio_chip, chip);
+	ret = devm_gpiochip_add_data(&client->dev, &chip->gpio_chip, chip);
 	if (ret)
 		return ret;
 
 	ret = max732x_irq_setup(chip, id);
-	if (ret) {
-		gpiochip_remove(&chip->gpio_chip);
+	if (ret)
 		return ret;
-	}
 
 	if (pdata && pdata->setup) {
 		ret = pdata->setup(client, chip->gpio_chip.base,
@@ -736,8 +734,6 @@ static int max732x_remove(struct i2c_client *client)
 		}
 	}
 
-	gpiochip_remove(&chip->gpio_chip);
-
 	return 0;
 }
 
-- 
2.21.0
