From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 171/182] ssb: gpio_driver: use gpiochip data pointer
Date: Wed,  9 Dec 2015 14:49:35 +0100
Message-ID: <1449668975-6737-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:34146 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754640AbbLINtk (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Dec 2015 08:49:40 -0500
Received: by lffu14 with SMTP id u14so34652533lff.1
        for <linux-gpio@vger.kernel.org>; Wed, 09 Dec 2015 05:49:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>, Hauke Mehrtens <hauke@hauke-m.de>, Michael Buesch <m@bues.ch>
Cc: Linus Walleij <linus.walleij@linaro.org>

This makes the driver use the data pointer added to the gpio_chip
to store a pointer to the state container instead of relying on
container_of().

Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: Michael Buesch <m@bues.ch>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Micael please ACK this so I can take it through the GPIO tree.
---
 drivers/ssb/driver_gpio.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/ssb/driver_gpio.c b/drivers/ssb/driver_gpio.c
index f92e266d48f8..180e027b1c8a 100644
--- a/drivers/ssb/driver_gpio.c
+++ b/drivers/ssb/driver_gpio.c
@@ -8,7 +8,7 @@
  * Licensed under the GNU/GPL. See COPYING for details.
  */
 
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/irq.h>
 #include <linux/interrupt.h>
 #include <linux/irqdomain.h>
@@ -22,15 +22,10 @@
  * Shared
  **************************************************/
 
-static struct ssb_bus *ssb_gpio_get_bus(struct gpio_chip *chip)
-{
-	return container_of(chip, struct ssb_bus, gpio);
-}
-
 #if IS_ENABLED(CONFIG_SSB_EMBEDDED)
 static int ssb_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	if (bus->bustype == SSB_BUSTYPE_SSB)
 		return irq_find_mapping(bus->irq_domain, gpio);
@@ -45,7 +40,7 @@ static int ssb_gpio_to_irq(struct gpio_chip *chip, unsigned gpio)
 
 static int ssb_gpio_chipco_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	return !!ssb_chipco_gpio_in(&bus->chipco, 1 << gpio);
 }
@@ -53,7 +48,7 @@ static int ssb_gpio_chipco_get_value(struct gpio_chip *chip, unsigned gpio)
 static void ssb_gpio_chipco_set_value(struct gpio_chip *chip, unsigned gpio,
 				      int value)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	ssb_chipco_gpio_out(&bus->chipco, 1 << gpio, value ? 1 << gpio : 0);
 }
@@ -61,7 +56,7 @@ static void ssb_gpio_chipco_set_value(struct gpio_chip *chip, unsigned gpio,
 static int ssb_gpio_chipco_direction_input(struct gpio_chip *chip,
 					   unsigned gpio)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	ssb_chipco_gpio_outen(&bus->chipco, 1 << gpio, 0);
 	return 0;
@@ -70,7 +65,7 @@ static int ssb_gpio_chipco_direction_input(struct gpio_chip *chip,
 static int ssb_gpio_chipco_direction_output(struct gpio_chip *chip,
 					    unsigned gpio, int value)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	ssb_chipco_gpio_outen(&bus->chipco, 1 << gpio, 1 << gpio);
 	ssb_chipco_gpio_out(&bus->chipco, 1 << gpio, value ? 1 << gpio : 0);
@@ -79,7 +74,7 @@ static int ssb_gpio_chipco_direction_output(struct gpio_chip *chip,
 
 static int ssb_gpio_chipco_request(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	ssb_chipco_gpio_control(&bus->chipco, 1 << gpio, 0);
 	/* clear pulldown */
@@ -92,7 +87,7 @@ static int ssb_gpio_chipco_request(struct gpio_chip *chip, unsigned gpio)
 
 static void ssb_gpio_chipco_free(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	/* clear pullup */
 	ssb_chipco_gpio_pullup(&bus->chipco, 1 << gpio, 0);
@@ -246,7 +241,7 @@ static int ssb_gpio_chipco_init(struct ssb_bus *bus)
 	if (err)
 		return err;
 
-	err = gpiochip_add(chip);
+	err = gpiochip_add_data(chip, bus);
 	if (err) {
 		ssb_gpio_irq_chipco_domain_exit(bus);
 		return err;
@@ -263,7 +258,7 @@ static int ssb_gpio_chipco_init(struct ssb_bus *bus)
 
 static int ssb_gpio_extif_get_value(struct gpio_chip *chip, unsigned gpio)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	return !!ssb_extif_gpio_in(&bus->extif, 1 << gpio);
 }
@@ -271,7 +266,7 @@ static int ssb_gpio_extif_get_value(struct gpio_chip *chip, unsigned gpio)
 static void ssb_gpio_extif_set_value(struct gpio_chip *chip, unsigned gpio,
 				     int value)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	ssb_extif_gpio_out(&bus->extif, 1 << gpio, value ? 1 << gpio : 0);
 }
@@ -279,7 +274,7 @@ static void ssb_gpio_extif_set_value(struct gpio_chip *chip, unsigned gpio,
 static int ssb_gpio_extif_direction_input(struct gpio_chip *chip,
 					  unsigned gpio)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	ssb_extif_gpio_outen(&bus->extif, 1 << gpio, 0);
 	return 0;
@@ -288,7 +283,7 @@ static int ssb_gpio_extif_direction_input(struct gpio_chip *chip,
 static int ssb_gpio_extif_direction_output(struct gpio_chip *chip,
 					   unsigned gpio, int value)
 {
-	struct ssb_bus *bus = ssb_gpio_get_bus(chip);
+	struct ssb_bus *bus = gpiochip_get_data(chip);
 
 	ssb_extif_gpio_outen(&bus->extif, 1 << gpio, 1 << gpio);
 	ssb_extif_gpio_out(&bus->extif, 1 << gpio, value ? 1 << gpio : 0);
@@ -439,7 +434,7 @@ static int ssb_gpio_extif_init(struct ssb_bus *bus)
 	if (err)
 		return err;
 
-	err = gpiochip_add(chip);
+	err = gpiochip_add_data(chip, bus);
 	if (err) {
 		ssb_gpio_irq_extif_domain_exit(bus);
 		return err;
-- 
2.4.3

