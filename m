From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] gpio: of: remove unnecessary variable in of_get_gpio_hog()
Date: Tue, 14 Jul 2015 10:01:44 +0900
Message-ID: <1436835704-6371-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg012.nifty.com ([202.248.44.38]:65351 "EHLO
	conuserg012-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752055AbbGNBC3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 21:02:29 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org

The variable "desc" is only used for storing the return value at the
end of the function.  It is unneeded.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Acked-by: Alexandre Courbot <acourbot@nvidia.com>
---

Changes in v2:
  - Fix a typo in git-log.   "It is is unneeded" -> "It is unneeded"

 drivers/gpio/gpiolib-of.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 9a0ec48..fd2db4b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -136,7 +136,6 @@ static struct gpio_desc *of_get_gpio_hog(struct device_node *np,
 {
 	struct device_node *chip_np;
 	enum of_gpio_flags xlate_flags;
-	struct gpio_desc *desc;
 	struct gg_data gg_data = {
 		.flags = &xlate_flags,
 	};
@@ -193,9 +192,7 @@ static struct gpio_desc *of_get_gpio_hog(struct device_node *np,
 	if (name && of_property_read_string(np, "line-name", name))
 		*name = np->name;
 
-	desc = gg_data.out_gpio;
-
-	return desc;
+	return gg_data.out_gpio;
 }
 
 /**
-- 
1.9.1

