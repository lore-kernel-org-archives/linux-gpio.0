From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH 7/7] gpio: mockup: readability tweaks
Date: Wed, 25 Jan 2017 16:34:21 +0100
Message-ID: <1485358461-24070-8-git-send-email-bgolaszewski@baylibre.com>
References: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485358461-24070-1-git-send-email-bgolaszewski@baylibre.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

Add some newlines and use a temporary pointer in mockup_gpio_add().

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/gpio/gpio-mockup.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
index dabf3ec..4289bbd 100644
--- a/drivers/gpio/gpio-mockup.c
+++ b/drivers/gpio/gpio-mockup.c
@@ -78,6 +78,7 @@ static int mockup_gpio_dirout(struct gpio_chip *gc, unsigned int offset,
 
 	mockup_gpio_set(gc, offset, value);
 	cntr->stats[offset].dir = OUT;
+
 	return 0;
 }
 
@@ -86,6 +87,7 @@ static int mockup_gpio_dirin(struct gpio_chip *gc, unsigned int offset)
 	struct mockup_gpio_controller *cntr = gpiochip_get_data(gc);
 
 	cntr->stats[offset].dir = IN;
+
 	return 0;
 }
 
@@ -174,21 +176,22 @@ static int mockup_gpio_add(struct device *dev,
 			   struct mockup_gpio_controller *cntr,
 			   const char *name, int base, int ngpio)
 {
+	struct gpio_chip *gc = &cntr->gc;
 	char **names;
 	int ret, i;
 
-	cntr->gc.base = base;
-	cntr->gc.ngpio = ngpio;
-	cntr->gc.label = name;
-	cntr->gc.owner = THIS_MODULE;
-	cntr->gc.parent = dev;
-	cntr->gc.get = mockup_gpio_get;
-	cntr->gc.set = mockup_gpio_set;
-	cntr->gc.direction_output = mockup_gpio_dirout;
-	cntr->gc.direction_input = mockup_gpio_dirin;
-	cntr->gc.get_direction = mockup_gpio_get_direction;
-	cntr->gc.mockup = true;
-	cntr->stats = devm_kzalloc(dev, sizeof(*cntr->stats) * cntr->gc.ngpio,
+	gc->base = base;
+	gc->ngpio = ngpio;
+	gc->label = name;
+	gc->owner = THIS_MODULE;
+	gc->parent = dev;
+	gc->get = mockup_gpio_get;
+	gc->set = mockup_gpio_set;
+	gc->direction_output = mockup_gpio_dirout;
+	gc->direction_input = mockup_gpio_dirin;
+	gc->get_direction = mockup_gpio_get_direction;
+	gc->mockup = true;
+	cntr->stats = devm_kzalloc(dev, sizeof(*cntr->stats) * gc->ngpio,
 				   GFP_KERNEL);
 	if (!cntr->stats) {
 		ret = -ENOMEM;
@@ -197,26 +200,25 @@ static int mockup_gpio_add(struct device *dev,
 
 	if (gpio_mockup_named_lines) {
 		names = devm_kzalloc(dev,
-				     sizeof(char *) * cntr->gc.ngpio,
-				     GFP_KERNEL);
+				     sizeof(char *) * gc->ngpio, GFP_KERNEL);
 		if (!names) {
 			ret = -ENOMEM;
 			goto err;
 		}
 
-		for (i = 0; i < cntr->gc.ngpio; i++) {
+		for (i = 0; i < gc->ngpio; i++) {
 			names[i] = devm_kasprintf(dev, GFP_KERNEL,
-						  "%s-%d", cntr->gc.label, i);
+						  "%s-%d", gc->label, i);
 			if (!names[i]) {
 				ret = -ENOMEM;
 				goto err;
 			}
 		}
 
-		cntr->gc.names = (const char *const*)names;
+		gc->names = (const char *const*)names;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &cntr->gc, cntr);
+	ret = devm_gpiochip_add_data(dev, gc, cntr);
 	if (ret)
 		goto err;
 
-- 
2.9.3
