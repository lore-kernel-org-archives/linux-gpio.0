From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2] gpio: of: fix GPIO drivers with multiple gpio_chip for a single node
Date: Tue, 25 Oct 2016 10:47:44 +0900
Message-ID: <1477360064-6644-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:57959 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756439AbcJYBpy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2016 21:45:54 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Vladimir Zapolskiy <vz@mleia.com>, Alexandre Courbot <gnurou@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

Sylvain Lemieux reports the LPC32xx GPIO driver is broken since
commit 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and
struct gg_data").  Probably, gpio-etraxfs.c and gpio-davinci.c are
broken too.

Those drivers register multiple gpio_chip that are associated to a
single OF node, and their own .of_xlate() checks if the passed
gpio_chip is valid.

Now, the problem is of_find_gpiochip_by_node() returns the first
gpio_chip found to match the given node.  So, .of_xlate() fails,
except for the first GPIO bank.

Reverting the commit could be a solution, but I do not want to go
back to the mess of struct gg_data.  Another solution here is to
take the match by a node pointer and the success of .of_xlate().
It is a bit clumsy to call .of_xlate twice; for gpio_chip matching
and for really getting the gpio_desc index.  Perhaps, our long-term
goal might be to convert the drivers to single chip registration,
but this commit will solve the problem until then.

Fixes: 762c2e46c059 ("gpio: of: remove of_gpiochip_and_xlate() and struct gg_data")
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Reported-by: Sylvain Lemieux <slemieux.tyco@gmail.com>
Tested-by: David Lechner <david@lechnology.com>
---

Changes in v2:
  - correcton pointed out by Sylvain:
       chip->of_xlate(chip, gpiospec, NULL) >= 0

 drivers/gpio/gpiolib-of.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index ecad3f0..193f15d 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -26,14 +26,18 @@
 
 #include "gpiolib.h"
 
-static int of_gpiochip_match_node(struct gpio_chip *chip, void *data)
+static int of_gpiochip_match_node_and_xlate(struct gpio_chip *chip, void *data)
 {
-	return chip->gpiodev->dev.of_node == data;
+	struct of_phandle_args *gpiospec = data;
+
+	return chip->gpiodev->dev.of_node == gpiospec->np &&
+				chip->of_xlate(chip, gpiospec, NULL) >= 0;
 }
 
-static struct gpio_chip *of_find_gpiochip_by_node(struct device_node *np)
+static struct gpio_chip *of_find_gpiochip_by_xlate(
+					struct of_phandle_args *gpiospec)
 {
-	return gpiochip_find(np, of_gpiochip_match_node);
+	return gpiochip_find(gpiospec, of_gpiochip_match_node_and_xlate);
 }
 
 static struct gpio_desc *of_xlate_and_get_gpiod_flags(struct gpio_chip *chip,
@@ -79,7 +83,7 @@ struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		return ERR_PTR(ret);
 	}
 
-	chip = of_find_gpiochip_by_node(gpiospec.np);
+	chip = of_find_gpiochip_by_xlate(&gpiospec);
 	if (!chip) {
 		desc = ERR_PTR(-EPROBE_DEFER);
 		goto out;
-- 
1.9.1

