From: Jonas Gorski <jogo@openwrt.org>
Subject: [PATCH V2 1/5] gpiolib: provide generic request/free implementations
Date: Sun, 11 Oct 2015 17:34:15 +0200
Message-ID: <1444577659-17621-2-git-send-email-jogo@openwrt.org>
References: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:54588 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751585AbbJKPin (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 11 Oct 2015 11:38:43 -0400
In-Reply-To: <1444577659-17621-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Baruch Siach <baruch@tkos.co.il>, Andrew Bresticker <abrestic@chromium.org>, Heiko

Provide generic request/free implementations that pinctrl aware gpio
drivers can use instead of open coding if they use a 1:1 pin to gpio
signal mapping.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
RFC -> V2:
 * renamed gpio to offset

 drivers/gpio/gpiolib.c      | 23 +++++++++++++++++++++++
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8f18077..8eba02d 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -15,6 +15,7 @@
 #include <linux/acpi.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
+#include <linux/pinctrl/consumer.h>
 
 #include "gpiolib.h"
 
@@ -745,6 +746,28 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
+/**
+ * gpiochip_generic_request() - request the gpio function for a pin
+ * @chip: the gpiochip owning the GPIO
+ * @offset: the offset of the GPIO to request for GPIO function
+ */
+int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset)
+{
+	return pinctrl_request_gpio(chip->base + offset);
+}
+EXPORT_SYMBOL_GPL(gpiochip_generic_request);
+
+/**
+ * gpiochip_generic_free() - free the gpio function from a pin
+ * @chip: the gpiochip to request the gpio function for
+ * @offset: the offset of the GPIO to free from GPIO function
+ */
+void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset)
+{
+	pinctrl_free_gpio(chip->base + offset);
+}
+EXPORT_SYMBOL_GPL(gpiochip_generic_free);
+
 #ifdef CONFIG_PINCTRL
 
 /**
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 1aed31c..d1baebf 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -206,6 +206,9 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
+int gpiochip_generic_request(struct gpio_chip *chip, unsigned offset);
+void gpiochip_generic_free(struct gpio_chip *chip, unsigned offset);
+
 #ifdef CONFIG_PINCTRL
 
 /**
-- 
2.1.4
