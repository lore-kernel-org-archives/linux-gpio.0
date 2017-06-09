From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 5/8] gpio: mockup: don't return magic numbers from probe()
Date: Fri,  9 Jun 2017 13:41:29 +0200
Message-ID: <1497008492-14907-6-git-send-email-brgl@bgdev.pl>
References: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1497008492-14907-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

When the requested number of GPIO lines is 0, return -EINVAL, not
-1 which is -EPERM.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 0cb6cba..ab2d38e 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -369,7 +369,7 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 			ret = gpio_mockup_add(dev, &chips[i],
 					      chip_name, base, ngpio);
 		} else {
-			ret = -1;
+			ret = -EINVAL;
 		}
 
 		if (ret) {
-- 
2.9.3
