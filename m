From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 2/3] gpio: mockup: dynamically allocate memory for chip name
Date: Tue, 20 Dec 2016 12:28:19 +0100
Message-ID: <1482233300-20078-3-git-send-email-bgolaszewski@baylibre.com>
References: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1482233300-20078-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Currently the chip name buffer is allocated on the stack and the
address of the buffer is passed to the gpio framework. It's invalid
after probe() returns, so the sysfs label attribute displays garbage.

Use devm_kasprintf() for each string instead.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index af0c1e8..10f6bf6 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -126,7 +126,7 @@ static int mockup_gpio_probe(struct platform_device *pdev)
 	int i;
 	int base;
 	int ngpio;
-	char chip_name[sizeof(GPIO_NAME) + 3];
+	char *chip_name;
 
 	if (gpio_mockup_params_nr < 2)
 		return -EINVAL;
@@ -146,8 +146,12 @@ static int mockup_gpio_probe(struct platform_device *pdev)
 			ngpio = gpio_mockup_ranges[i * 2 + 1] - base;
 
 		if (ngpio >= 0) {
-			sprintf(chip_name, "%s-%c", GPIO_NAME,
-				pins_name_start + i);
+			chip_name = devm_kasprintf(dev, GFP_KERNEL,
+						   "%s-%c", GPIO_NAME,
+						   pins_name_start + i);
+			if (!chip_name)
+				return -ENOMEM;
+
 			ret = mockup_gpio_add(dev, &cntr[i],
 					      chip_name, base, ngpio);
 		} else {
-- 
2.9.3
