From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 3/8] gpio: mockup: refuse to accept an odd number of GPIO ranges
Date: Fri,  9 Jun 2017 13:41:27 +0200
Message-ID: <1497008492-14907-4-git-send-email-brgl@bgdev.pl>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Currently we ignore the last odd range value, since each chip is
described by two values. Be more strict and require the user to
pass an even number of ranges.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index d78e8e0..d95d37a 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -334,7 +334,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 	int ret, i, base, ngpio;
 	char *chip_name;
 
-	if (gpio_mockup_params_nr < 2)
+	if (gpio_mockup_params_nr < 2 || (gpio_mockup_params_nr % 2))
 		return -EINVAL;
 
 	chips = devm_kzalloc(dev,
-- 
2.9.3
