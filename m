From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 5/9] drivers/gpio: make gpio-mvebu.c explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:45 -0400
Message-ID: <1459093489-18314-6-git-send-email-paul.gortmaker@windriver.com>
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

drivers/gpio/Kconfig:config GPIO_MVEBU
drivers/gpio/Kconfig:   def_bool y

...meaning that it currently is not being built as a module by anyone.

Lets remove the couple traces of modularity so that when reading the
driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-mvebu.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 11c6582ef0a6..cd5dc27320a2 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -34,7 +34,7 @@
  */
 
 #include <linux/err.h>
-#include <linux/module.h>
+#include <linux/init.h>
 #include <linux/gpio.h>
 #include <linux/irq.h>
 #include <linux/slab.h>
@@ -557,7 +557,6 @@ static const struct of_device_id mvebu_gpio_of_match[] = {
 		/* sentinel */
 	},
 };
-MODULE_DEVICE_TABLE(of, mvebu_gpio_of_match);
 
 static int mvebu_gpio_suspend(struct platform_device *pdev, pm_message_t state)
 {
@@ -838,4 +837,4 @@ static struct platform_driver mvebu_gpio_driver = {
 	.suspend        = mvebu_gpio_suspend,
 	.resume         = mvebu_gpio_resume,
 };
-module_platform_driver(mvebu_gpio_driver);
+builtin_platform_driver(mvebu_gpio_driver);
-- 
2.6.1
