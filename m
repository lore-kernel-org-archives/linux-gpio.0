From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/5] gpio: remove export of private of_get_named_gpio_flags()
Date: Tue, 22 Jul 2014 16:17:39 +0900
Message-ID: <1406013463-19218-2-git-send-email-acourbot@nvidia.com>
References: <1406013463-19218-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1406013463-19218-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-gpio@vger.kernel.org

of_get_named_gpio_flags() has been made gpiolib-private by commit
f01d907582, but its EXPORT statement has not been removed. Fix this.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpio/gpiolib-of.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e60cdab1d15e..3e2fae205bee 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -95,7 +95,6 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		 PTR_ERR_OR_ZERO(gg_data.out_gpio));
 	return gg_data.out_gpio;
 }
-EXPORT_SYMBOL(of_get_named_gpiod_flags);
 
 int of_get_named_gpio_flags(struct device_node *np, const char *list_name,
 			    int index, enum of_gpio_flags *flags)
-- 
2.0.1
