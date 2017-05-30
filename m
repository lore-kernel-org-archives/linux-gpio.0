From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 5/7] gpio: mockup: don't return magic numbers from probe()
Date: Tue, 30 May 2017 10:58:38 +0200
Message-ID: <1496134720-5363-6-git-send-email-brgl@bgdev.pl>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
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
