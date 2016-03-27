From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 4/9] drivers/gpio: make gpio-moxart.c explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:44 -0400
Message-ID: <1459093489-18314-5-git-send-email-paul.gortmaker@windriver.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.windriver.com ([147.11.1.11]:56733 "EHLO
	mail.windriver.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752451AbcC0PpO (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Mar 2016 11:45:14 -0400
In-Reply-To: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Jonas Jensen <jonas.jensen@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_MOXART
drivers/gpio/Kconfig:   bool "MOXART GPIO support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modular references so that when reading
the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

We don't replace module.h with init.h since the file already has that.

Cc: Jonas Jensen <jonas.jensen@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-moxart.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-moxart.c b/drivers/gpio/gpio-moxart.c
index f02d0b490978..d58d38906ba6 100644
--- a/drivers/gpio/gpio-moxart.c
+++ b/drivers/gpio/gpio-moxart.c
@@ -15,7 +15,6 @@
 #include <linux/irq.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-#include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/of_gpio.h>
 #include <linux/pinctrl/consumer.h>
@@ -82,8 +81,4 @@ static struct platform_driver moxart_gpio_driver = {
 	},
 	.probe	= moxart_gpio_probe,
 };
-module_platform_driver(moxart_gpio_driver);
-
-MODULE_DESCRIPTION("MOXART GPIO chip driver");
-MODULE_LICENSE("GPL");
-MODULE_AUTHOR("Jonas Jensen <jonas.jensen@gmail.com>");
+builtin_platform_driver(moxart_gpio_driver);
-- 
2.6.1

