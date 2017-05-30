From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v2 6/7] gpio: mockup: improve the error message
Date: Tue, 30 May 2017 10:58:39 +0200
Message-ID: <1496134720-5363-7-git-send-email-brgl@bgdev.pl>
References: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1496134720-5363-1-git-send-email-brgl@bgdev.pl>
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
index ab2d38e..2f4fe41 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -373,8 +373,9 @@ static int gpio_mockup_probe(struct platform_device *pdev)
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
