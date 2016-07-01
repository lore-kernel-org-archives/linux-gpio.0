From: Lars-Peter Clausen <lars@metafoo.de>
Subject: [PATCH] gpiolib: of_find_gpio(): Don't discard errors
Date: Fri,  1 Jul 2016 17:40:09 +0200
Message-ID: <1467387609-13811-1-git-send-email-lars@metafoo.de>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www381.your-server.de ([78.46.137.84]:59933 "EHLO
	www381.your-server.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751218AbcGAPkU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2016 11:40:20 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>

Since commit dd34c37aa3e8 ("gpio: of: Allow -gpio suffix for property
names") when requesting a GPIO from the devicetree gpiolib looks for
properties with both the '-gpio' and the '-gpios' suffix. This was
implemented by first searching for the property with the '-gpios' suffix
and if that yields an error try the '-gpio' suffix. This approach has the
issue that any error returned when looking for the '-gpios' suffix is
silently discarded.

Commit 06fc3b70f1dc ("gpio: of: Fix handling for deferred probe for -gpio
suffix") partially addressed the issue by treating the EPROBE_DEFER error
as a special condition. This fixed the case when the property is specified,
but the GPIO provider is not ready yet. But there are other cases in which
of_get_named_gpiod_flags() returns an error even though the property is
specified, e.g. if the specification is incorrect.

of_find_gpio() should only try to look for the property with the '-gpio'
suffix if no property with the '-gpios' suffix was found. If the property
was not found of_get_named_gpiod_flags() will return -ENOENT, so update the
condition to abort and propagate the error to the caller in all other
cases.

This is important for gpiod_get_optinal() and friends to behave correctly
in case the specifier contains errors. Without this patch they'll return
NULL if the property uses the '-gpios' suffix and the specifier contains
errors, which falsely indicates to the caller that no GPIO was specified.

Signed-off-by: Lars-Peter Clausen <lars@metafoo.de>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 6566b93..8f1d51b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2838,7 +2838,7 @@ static struct gpio_desc *of_find_gpio(struct device *dev, const char *con_id,
 
 		desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
 						&of_flags);
-		if (!IS_ERR(desc) || (PTR_ERR(desc) == -EPROBE_DEFER))
+		if (!IS_ERR(desc) || (PTR_ERR(desc) != -ENOENT))
 			break;
 	}
 
-- 
2.1.4

