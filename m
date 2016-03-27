From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 7/9] drivers/gpio: make gpio-sta2x11.c explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:47 -0400
Message-ID: <1459093489-18314-8-git-send-email-paul.gortmaker@windriver.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_STA2X11
drivers/gpio/Kconfig:   bool "STA2x11/ConneXt GPIO support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modularity, so that when reading
the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-sta2x11.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-sta2x11.c b/drivers/gpio/gpio-sta2x11.c
index 0d5b8c525dd9..853ca23cad88 100644
--- a/drivers/gpio/gpio-sta2x11.c
+++ b/drivers/gpio/gpio-sta2x11.c
@@ -20,7 +20,7 @@
  *
  */
 
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
@@ -432,8 +432,4 @@ static struct platform_driver sta2x11_gpio_platform_driver = {
 	},
 	.probe = gsta_probe,
 };
-
-module_platform_driver(sta2x11_gpio_platform_driver);
-
-MODULE_LICENSE("GPL v2");
-MODULE_DESCRIPTION("sta2x11_gpio GPIO driver");
+builtin_platform_driver(sta2x11_gpio_platform_driver);
-- 
2.6.1
