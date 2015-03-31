From: Aaron Sierra <asierra@xes-inc.com>
Subject: [PATCH] gpio: ich: Implement get_direction function
Date: Tue, 31 Mar 2015 10:11:47 -0500 (CDT)
Message-ID: <1061824414.20722.1427814707516.JavaMail.zimbra@xes-inc.com>
References: <1599636860.20707.1427814686822.JavaMail.zimbra@xes-inc.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from xes-mad.com ([216.165.139.218]:33961 "EHLO xes-mad.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754586AbbCaPlM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 31 Mar 2015 11:41:12 -0400
In-Reply-To: <1599636860.20707.1427814686822.JavaMail.zimbra@xes-inc.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Vincent Donnefort <vdonnefort@gmail.com>, Lee Jones <lee.jones@linaro.org>
Cc: linux-gpio@vger.kernel.org

Allow the kernel to query the driver for a GPIO's pin direction.

Signed-off-by: Aaron Sierra <asierra@xes-inc.com>
---
 drivers/gpio/gpio-ich.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpio/gpio-ich.c b/drivers/gpio/gpio-ich.c
index 7818cd1..4ba7ed5 100644
--- a/drivers/gpio/gpio-ich.c
+++ b/drivers/gpio/gpio-ich.c
@@ -173,6 +173,11 @@ static bool ichx_gpio_check_available(struct gpio_chip *gpio, unsigned nr)
 	return !!(ichx_priv.use_gpio & (1 << (nr / 32)));
 }
 
+static int ichx_gpio_get_direction(struct gpio_chip *gpio, unsigned nr)
+{
+	return ichx_read_bit(GPIO_IO_SEL, nr) ? GPIOF_DIR_IN : GPIOF_DIR_OUT;
+}
+
 static int ichx_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 {
 	/*
@@ -286,6 +291,7 @@ static void ichx_gpiolib_setup(struct gpio_chip *chip)
 		ichx_priv.desc->get : ichx_gpio_get;
 
 	chip->set = ichx_gpio_set;
+	chip->get_direction = ichx_gpio_get_direction;
 	chip->direction_input = ichx_gpio_direction_input;
 	chip->direction_output = ichx_gpio_direction_output;
 	chip->base = modparam_gpiobase;
-- 
1.9.1
