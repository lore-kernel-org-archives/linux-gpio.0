From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] gpio: Fix gpio_get -> gpiod_get typo in kernel-doc
Date: Fri, 25 Apr 2014 16:54:22 +0200
Message-ID: <1398437662-19936-1-git-send-email-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f50.google.com ([74.125.83.50]:55021 "EHLO
	mail-ee0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751208AbaDYOzr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Apr 2014 10:55:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The function is called gpiod_get(), not gpio_get(). Fix the kernel-doc
comment to match the name.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index b991462c22fb..f284e23c78ef 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2717,7 +2717,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 }
 
 /**
- * gpio_get - obtain a GPIO for a given GPIO function
+ * gpiod_get - obtain a GPIO for a given GPIO function
  * @dev:	GPIO consumer, can be NULL for system-global GPIOs
  * @con_id:	function within the GPIO consumer
  *
-- 
1.9.2

