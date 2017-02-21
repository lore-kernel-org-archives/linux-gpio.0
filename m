From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH] gpio: reintroduce devm_get_gpiod_from_child()
Date: Tue, 21 Feb 2017 14:21:29 +0100
Message-ID: <20170221132129.25424-1-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36489 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752388AbdBUNVk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Feb 2017 08:21:40 -0500
Received: by mail-lf0-f42.google.com with SMTP id b80so27383958lfe.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Feb 2017 05:21:34 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee.jones@linaro.org>

We need to keep this API around for the merge window to avoid
nasty build problems in the merges.

Cc: Lee Jones <lee.jones@linaro.org>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 include/linux/gpio/consumer.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index ea9b01d40017..2484b2fcc6eb 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -143,6 +143,16 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 						struct fwnode_handle *child,
 						enum gpiod_flags flags,
 						const char *label);
+/* FIXME: delete this helper when users are switched over */
+static inline struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
+			  const char *con_id, struct fwnode_handle *child)
+{
+	return devm_fwnode_get_index_gpiod_from_child(dev, con_id,
+						      0, child,
+						      GPIOD_ASIS,
+						      "?");
+}
+
 #else /* CONFIG_GPIOLIB */
 
 static inline int gpiod_count(struct device *dev, const char *con_id)
@@ -434,6 +444,13 @@ struct gpio_desc *devm_fwnode_get_index_gpiod_from_child(struct device *dev,
 	return ERR_PTR(-ENOSYS);
 }
 
+/* FIXME: delete this when all users are switched over */
+static inline struct gpio_desc *devm_get_gpiod_from_child(struct device *dev,
+			  const char *con_id, struct fwnode_handle *child)
+{
+	return ERR_PTR(-ENOSYS);
+}
+
 #endif /* CONFIG_GPIOLIB */
 
 static inline
-- 
2.9.3

