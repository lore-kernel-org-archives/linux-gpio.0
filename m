From: Rob Herring <robh@kernel.org>
Subject: [PATCH] gpio: Convert to using %pOFn instead of device_node.name
Date: Mon, 27 Aug 2018 20:52:19 -0500
Message-ID: <20180828015252.28511-18-robh@kernel.org>
References: <20180828015252.28511-1-robh@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180828015252.28511-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

In preparation to remove the node name pointer from struct device_node,
convert printf users to use the %pOFn format specifier.

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpio/gpiolib-of.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index a4f1157d6aa0..089783b11e87 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -348,8 +348,8 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	else if (of_property_read_bool(np, "output-high"))
 		*dflags |= GPIOD_OUT_HIGH;
 	else {
-		pr_warn("GPIO line %d (%s): no hogging state specified, bailing out\n",
-			desc_to_gpio(desc), np->name);
+		pr_warn("GPIO line %d (%pOFn): no hogging state specified, bailing out\n",
+			desc_to_gpio(desc), np);
 		return ERR_PTR(-EINVAL);
 	}
 
-- 
2.17.1
