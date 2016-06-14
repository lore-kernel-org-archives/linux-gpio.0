From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 1/5] gpio: of: optimize "gpios" property parsing of of_parse_own_gpio()
Date: Tue, 14 Jun 2016 19:07:03 +0900
Message-ID: <1465898827-2229-2-git-send-email-yamada.masahiro@socionext.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Call of_property_read_u32_array() only once rather than iterating
of_property_read_u32_index().

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/gpio/gpiolib-of.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 0e963ef..99fc40e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -141,7 +141,7 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 		.flags = &xlate_flags,
 	};
 	u32 tmp;
-	int i, ret;
+	int ret;
 
 	chip_np = np->parent;
 	if (!chip_np)
@@ -160,12 +160,10 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 
 	gg_data.gpiospec.args_count = tmp;
 	gg_data.gpiospec.np = chip_np;
-	for (i = 0; i < tmp; i++) {
-		ret = of_property_read_u32_index(np, "gpios", i,
-					   &gg_data.gpiospec.args[i]);
-		if (ret)
-			return ERR_PTR(ret);
-	}
+	ret = of_property_read_u32_array(np, "gpios", gg_data.gpiospec.args,
+					 tmp);
+	if (ret)
+		return ERR_PTR(ret);
 
 	gpiochip_find(&gg_data, of_gpiochip_find_and_xlate);
 	if (!gg_data.out_gpio) {
-- 
1.9.1
