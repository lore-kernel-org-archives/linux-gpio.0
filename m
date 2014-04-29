From: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Subject: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Tue, 29 Apr 2014 14:38:35 +0200
Message-ID: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smarthost.TechFak.Uni-Bielefeld.DE ([129.70.137.17]:37965 "EHLO
	smarthost.TechFak.Uni-Bielefeld.DE" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S933248AbaD2Mim (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Tue, 29 Apr 2014 08:38:42 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, Robert ABEL <rabel@cit-ec.uni-bielefeld.de>

GPIO descriptions were assumed to be initialized with correct flags
by GPIO chips. Hence, DT flags were being ignored.
Translate flags from DTS flags to GPIOD flags when of_get_*gpiod_* is
called.

Signed-off-by: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
---
 drivers/gpio/gpiolib-of.c     | 12 ++++++++----
 drivers/gpio/gpiolib.c        | 12 ++++++++++++
 include/linux/gpio/consumer.h |  4 ++++
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 2024d45..03f261c 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -66,18 +66,21 @@ static int of_gpiochip_find_and_xlate(struct gpio_chip *gc, void *data)
 struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		     const char *propname, int index, enum of_gpio_flags *flags)
 {
+
+	enum of_gpio_flags tmp_flags;
+	enum of_gpio_flags* priv_flags = flags ? : &tmp_flags;
+
 	/* Return -EPROBE_DEFER to support probe() functions to be called
 	 * later when the GPIO actually becomes available
 	 */
 	struct gg_data gg_data = {
-		.flags = flags,
+		.flags = priv_flags,
 		.out_gpio = ERR_PTR(-EPROBE_DEFER)
 	};
 	int ret;
 
 	/* .of_xlate might decide to not fill in the flags, so clear it. */
-	if (flags)
-		*flags = 0;
+	*priv_flags = 0;
 
 	ret = of_parse_phandle_with_args(np, propname, "#gpio-cells", index,
 					 &gg_data.gpiospec);
@@ -87,7 +90,8 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		return ERR_PTR(ret);
 	}
 
-	gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
+	if (gpiochip_find(&gg_data, of_gpiochip_find_and_xlate))
+		gpiod_translate_flags(gg_data.out_gpio, gg_data.flags);
 
 	of_node_put(gg_data.gpiospec.np);
 	pr_debug("%s exited with status %d\n", __func__,
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f48817d..8bd4dbb 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -187,6 +187,18 @@ int desc_to_gpio(const struct gpio_desc *desc)
 }
 EXPORT_SYMBOL_GPL(desc_to_gpio);
 
+#if defined(CONFIG_OF)
+void gpiod_translate_flags(struct gpio_desc *desc, enum of_gpio_flags *flags)
+{
+
+	desc->flags = 0;
+
+	if (*flags & OF_GPIO_ACTIVE_LOW)
+		set_bit(FLAG_ACTIVE_LOW, &desc->flags);
+
+}
+EXPORT_SYMBOL_GPL(gpiod_translate_flags);
+#endif /* CONFIG_OF */
 
 /* Warn when drivers omit gpio_request() calls -- legal but ill-advised
  * when setting direction, and otherwise illegal.  Until board setup code
diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index bed128e..4d120dc 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -59,6 +59,10 @@ int gpiod_to_irq(const struct gpio_desc *desc);
 /* Convert between the old gpio_ and new gpiod_ interfaces */
 struct gpio_desc *gpio_to_desc(unsigned gpio);
 int desc_to_gpio(const struct gpio_desc *desc);
+#if defined(CONFIG_OF)
+enum of_gpio_flags;
+void gpiod_translate_flags(struct gpio_desc *desc, enum of_gpio_flags *flags);
+#endif /* CONFIG_OF */
 
 #else /* CONFIG_GPIOLIB */
 
-- 
1.9.2

