From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 03/18] gpio: mockup: verify the number of GPIO chips requested
Date: Mon, 27 Nov 2017 11:48:39 +0100
Message-ID: <20171127104854.333-4-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

The number of supported mockup chips is limited. Check this limit when
parsing the module parameters.

Also: make sure that each chip is described with a <base - ngpio> pair.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index b70f3b0c30b1..0a269cbe197c 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -330,7 +330,9 @@ static int __init gpio_mockup_init(void)
 {
 	int err;
 
-	if (gpio_mockup_params_nr < 2 || (gpio_mockup_params_nr % 2))
+	if ((gpio_mockup_params_nr < 2) ||
+	    (gpio_mockup_params_nr % 2) ||
+	    (gpio_mockup_params_nr > GPIO_MOCKUP_MAX_RANGES))
 		return -EINVAL;
 
 	gpio_mockup_dbg_dir = debugfs_create_dir("gpio-mockup-event", NULL);
-- 
2.15.0
