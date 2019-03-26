From: Andrey Smirnov <andrew.smirnov@gmail.com>
Subject: [PATCH 2/2] gpio: of: Check for "spi-cs-high" in child instead of parent node
Date: Mon, 25 Mar 2019 23:32:09 -0700
Message-ID: <20190326063209.6421-2-andrew.smirnov@gmail.com>
References: <20190326063209.6421-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190326063209.6421-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Chris Healy <cphealy@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

"spi-cs-high" is going to be specified in child node of an SPI
controller's representing attached SPI device, so change the code to
look for it there, instead of checking parent node.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: Chris Healy <cphealy@gmail.com>
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpiolib-of.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ee7f08386a72..0220dd6d64ed 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -143,16 +143,16 @@ static void of_gpio_flags_quirks(struct device_node *np,
 				 * conflict and the "spi-cs-high" flag will
 				 * take precedence.
 				 */
-				if (of_property_read_bool(np, "spi-cs-high")) {
+				if (of_property_read_bool(child, "spi-cs-high")) {
 					if (*flags & OF_GPIO_ACTIVE_LOW) {
 						pr_warn("%s GPIO handle specifies active low - ignored\n",
-							of_node_full_name(np));
+							of_node_full_name(child));
 						*flags &= ~OF_GPIO_ACTIVE_LOW;
 					}
 				} else {
 					if (!(*flags & OF_GPIO_ACTIVE_LOW))
 						pr_info("%s enforce active low on chipselect handle\n",
-							of_node_full_name(np));
+							of_node_full_name(child));
 					*flags |= OF_GPIO_ACTIVE_LOW;
 				}
 				break;
-- 
2.20.1
