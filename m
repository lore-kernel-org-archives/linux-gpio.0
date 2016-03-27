From: Paul Gortmaker <paul.gortmaker@windriver.com>
Subject: [PATCH 8/9] drivers/gpio: make gpio-xgene.c explicitly non-modular
Date: Sun, 27 Mar 2016 11:44:48 -0400
Message-ID: <1459093489-18314-9-git-send-email-paul.gortmaker@windriver.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Feng Kan <fkan@apm.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The Kconfig currently controlling compilation of this code is:

drivers/gpio/Kconfig:config GPIO_XGENE
drivers/gpio/Kconfig:   bool "APM X-Gene GPIO controller support"

...meaning that it currently is not being built as a module by anyone.

Lets remove the modular code that is essentially orphaned, so that
when reading the driver there is no doubt it is builtin-only.

Since module_platform_driver() uses the same init level priority as
builtin_platform_driver() the init ordering remains unchanged with
this commit.

Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.

We also delete the MODULE_LICENSE tag etc. since all that information
is already contained at the top of the file in the comments.

Cc: Feng Kan <fkan@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
---
 drivers/gpio/gpio-xgene.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index c0aa387664bf..4193502fe3be 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -17,7 +17,6 @@
  * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-#include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/io.h>
@@ -211,7 +210,6 @@ static const struct of_device_id xgene_gpio_of_match[] = {
 	{ .compatible = "apm,xgene-gpio", },
 	{},
 };
-MODULE_DEVICE_TABLE(of, xgene_gpio_of_match);
 
 static struct platform_driver xgene_gpio_driver = {
 	.driver = {
@@ -221,9 +219,4 @@ static struct platform_driver xgene_gpio_driver = {
 	},
 	.probe = xgene_gpio_probe,
 };
-
-module_platform_driver(xgene_gpio_driver);
-
-MODULE_AUTHOR("Feng Kan <fkan@apm.com>");
-MODULE_DESCRIPTION("APM X-Gene GPIO driver");
-MODULE_LICENSE("GPL");
+builtin_platform_driver(xgene_gpio_driver);
-- 
2.6.1
