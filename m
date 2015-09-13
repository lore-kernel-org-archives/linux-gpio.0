From: Jonas Gorski <jogo@openwrt.org>
Subject: [PATCH RFT 1/5] gpiolib: provide generic request/free implementations
Date: Sun, 13 Sep 2015 15:21:34 +0200
Message-ID: <1442150498-31116-2-git-send-email-jogo@openwrt.org>
References: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:54516 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751949AbbIMNWJ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 13 Sep 2015 09:22:09 -0400
In-Reply-To: <1442150498-31116-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Joachim Eastwood <manabian@gmail.com>, Jonas Jensen <jonas.jensen@gmail.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, James Hogan <james.hogan@imgtec.com>, Stefan Agner <stefan@agner.ch>, Jun Nie <jun.nie@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Alessandro Rubini <rubini@unipv.it>, Sonic Zhang <sonic.zhang@analog.com>, Laxman Dewangan <ldewangan@nvidia.com>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Jonas Aaberg <jonas.aberg@stericsson.com>, Baruch Siach <baruch@tkos.co.il>, Andrew

Provide generic request/free implementations that pinctrl aware gpio
drivers can use instead of open coding if they use a 1:1 pin to gpio
signal mapping.

Signed-off-by: Jonas Gorski <jogo@openwrt.org>
---
 drivers/gpio/gpiolib.c      | 23 +++++++++++++++++++++++
 include/linux/gpio/driver.h |  3 +++
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 5db3445..e0853fb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -15,6 +15,7 @@
 #include <linux/acpi.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
+#include <linux/pinctrl/consumer.h>
 
 #include "gpiolib.h"
 
@@ -680,6 +681,28 @@ static void gpiochip_irqchip_remove(struct gpio_chip *gpiochip) {}
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
+/**
+ * gpiochip_generic_request() - request the gpio function for a pin
+ * @chip: the gpiochip owning the GPIO
+ * @gpio: the GPIO signal to request for GPIO function
+ */
+int gpiochip_generic_request(struct gpio_chip *chip, unsigned gpio)
+{
+	return pinctrl_request_gpio(chip->base + gpio);
+}
+EXPORT_SYMBOL_GPL(gpiochip_generic_request);
+
+/**
+ * gpiochip_generic_free() - free the gpio function from a pin
+ * @chip: the gpiochip to request the gpio function for
+ * @gpio: the GPIO signal to free from GPIO
+ */
+void gpiochip_generic_free(struct gpio_chip *chip, unsigned gpio)
+{
+	pinctrl_free_gpio(chip->base + gpio);
+}
+EXPORT_SYMBOL_GPL(gpiochip_generic_free);
+
 #ifdef CONFIG_PINCTRL
 
 /**
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 1aed31c..0857c28 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -206,6 +206,9 @@ int _gpiochip_irqchip_add(struct gpio_chip *gpiochip,
 
 #endif /* CONFIG_GPIOLIB_IRQCHIP */
 
+int gpiochip_generic_request(struct gpio_chip *chip, unsigned gpio);
+void gpiochip_generic_free(struct gpio_chip *chip, unsigned gpio);
+
 #ifdef CONFIG_PINCTRL
 
 /**
-- 
2.1.4
