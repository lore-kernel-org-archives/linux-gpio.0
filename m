From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH 17/18] gpio: mockup: rename gpio_mockup_params_nr to gpio_mockup_num_ranges
Date: Mon, 27 Nov 2017 11:48:53 +0100
Message-ID: <20171127104854.333-18-brgl@bgdev.pl>
References: <20171127104854.333-1-brgl@bgdev.pl>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20171127104854.333-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
List-Id: linux-gpio@vger.kernel.org

This variable holds the number of mockup GPIO ranges so rename it
accordingly.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 drivers/gpio/gpio-mockup.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index 0abb53038ba8..a6bfbe58bc63 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -72,8 +72,8 @@ struct gpio_mockup_platform_data {
 };
 
 static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_RANGES];
-static int gpio_mockup_params_nr;
-module_param_array(gpio_mockup_ranges, int, &gpio_mockup_params_nr, 0400);
+static int gpio_mockup_num_ranges;
+module_param_array(gpio_mockup_ranges, int, &gpio_mockup_num_ranges, 0400);
 
 static bool gpio_mockup_named_lines;
 module_param_named(gpio_mockup_named_lines,
@@ -338,13 +338,13 @@ static int __init gpio_mockup_init(void)
 	struct gpio_mockup_platform_data pdata;
 	struct platform_device *pdev;
 
-	if ((gpio_mockup_params_nr < 2) ||
-	    (gpio_mockup_params_nr % 2) ||
-	    (gpio_mockup_params_nr > GPIO_MOCKUP_MAX_RANGES))
+	if ((gpio_mockup_num_ranges < 2) ||
+	    (gpio_mockup_num_ranges % 2) ||
+	    (gpio_mockup_num_ranges > GPIO_MOCKUP_MAX_RANGES))
 		return -EINVAL;
 
 	/* Each chip is described by two values. */
-	num_chips = gpio_mockup_params_nr / 2;
+	num_chips = gpio_mockup_num_ranges / 2;
 
 	/*
 	 * The second value in the <base GPIO - number of GPIOS> pair must
-- 
2.15.0
