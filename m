From: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH 5/5] GPIO: ingenic: Implement .get_direction
Date: Wed, 27 Jun 2018 13:49:04 +0200
Message-ID: <20180627114904.10890-6-paul@crapouillou.net>
References: <20180627114904.10890-1-paul@crapouillou.net>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180627114904.10890-1-paul@crapouillou.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
List-Id: linux-gpio@vger.kernel.org

Use the newly introduced pinctrl_gpio_get_direction to implement the
.get_direction callback.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpio/gpio-ingenic.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpio/gpio-ingenic.c b/drivers/gpio/gpio-ingenic.c
index e738e384a5ca..79e8b67fe83d 100644
--- a/drivers/gpio/gpio-ingenic.c
+++ b/drivers/gpio/gpio-ingenic.c
@@ -274,6 +274,12 @@ static int ingenic_gpio_direction_output(struct gpio_chip *gc,
 	return pinctrl_gpio_direction_output(gc->base + offset);
 }
 
+static int ingenic_gpio_get_direction(struct gpio_chip *gc,
+		unsigned int offset)
+{
+	return pinctrl_gpio_get_direction(gc->base + offset);
+}
+
 static const struct of_device_id ingenic_gpio_of_match[] = {
 	{ .compatible = "ingenic,jz4740-gpio", .data = (void *)ID_JZ4740 },
 	{ .compatible = "ingenic,jz4770-gpio", .data = (void *)ID_JZ4770 },
@@ -325,6 +331,7 @@ static int ingenic_gpio_probe(struct platform_device *pdev)
 
 	jzgc->gc.set = ingenic_gpio_set;
 	jzgc->gc.get = ingenic_gpio_get;
+	jzgc->gc.get_direction = ingenic_gpio_get_direction;
 	jzgc->gc.direction_input = ingenic_gpio_direction_input;
 	jzgc->gc.direction_output = ingenic_gpio_direction_output;
 
-- 
2.11.0
