From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH] ACPI / gpio: avoid warning for gpio hogging code
Date: Tue,  8 Nov 2016 14:40:06 +0100
Message-ID: <20161108134035.1764500-1-arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, Christophe Ricard <christophe.ricard@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

The newly added acpi_gpiochip_scan_gpios function produces a few harmless
warnings:

drivers/gpio/gpiolib-acpi.c: In function ‘acpi_gpiochip_add’:
drivers/gpio/gpiolib-acpi.c:925:7: error: ‘dflags’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
drivers/gpio/gpiolib-acpi.c:925:9: error: ‘lflags’ may be used uninitialized in this function [-Werror=maybe-uninitialized]

The problem is that he compiler cannot know that a negative return value
from fwnode_property_read_u32_array() or acpi_gpiochip_pin_to_gpio_offset()
implies that the IS_ERR(gpio_desc) is true, as the value could in theory
be below -MAX_ERRNO.

The function already initializes its output values to zero, and moving
that intialization a little higher up ensures that we can never have
uninitialized data in the caller.

Fixes: c80f1ba75df2 ("ACPI / gpio: Add hogging support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpio/gpiolib-acpi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-acpi.c b/drivers/gpio/gpiolib-acpi.c
index 265e0fad518e..a3faefa44f68 100644
--- a/drivers/gpio/gpiolib-acpi.c
+++ b/drivers/gpio/gpiolib-acpi.c
@@ -869,6 +869,10 @@ static struct gpio_desc *acpi_gpiochip_parse_own_gpio(
 	u32 gpios[2];
 	int ret;
 
+	*lflags = 0;
+	*dflags = 0;
+	*name = NULL;
+
 	ret = fwnode_property_read_u32_array(fwnode, "gpios", gpios,
 					     ARRAY_SIZE(gpios));
 	if (ret < 0)
@@ -882,10 +886,6 @@ static struct gpio_desc *acpi_gpiochip_parse_own_gpio(
 	if (IS_ERR(desc))
 		return desc;
 
-	*lflags = 0;
-	*dflags = 0;
-	*name = NULL;
-
 	if (gpios[1])
 		*lflags |= GPIO_ACTIVE_LOW;
 
-- 
2.9.0
