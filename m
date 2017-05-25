From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 09/10] gpio: mockup: improve the error message
Date: Thu, 25 May 2017 10:33:46 +0200
Message-ID: <1495701227-28809-10-git-send-email-brgl@bgdev.pl>
References: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1495701227-28809-1-git-send-email-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

Indicate the error number and make the message a bit more elaborate.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 3ffc3ce..96a6c6e 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -385,8 +385,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
 		}
 
 		if (ret) {
-			dev_err(dev, "gpio<%d..%d> add failed\n",
-				base, base < 0 ? ngpio : base + ngpio);
+			dev_err(dev,
+				"adding gpiochip failed: %d (base: %d, ngpio: %d)\n",
+				ret, base, base < 0 ? ngpio : base + ngpio);
 
 			return ret;
 		}
-- 
2.9.3
