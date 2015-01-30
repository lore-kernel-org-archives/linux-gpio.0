From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] gpio: max732x: use an inline function for container cast
Date: Fri, 30 Jan 2015 11:45:54 +0100
Message-ID: <1422614754-5391-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:35204 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753101AbbA3KqB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jan 2015 05:46:01 -0500
Received: by mail-lb0-f178.google.com with SMTP id u10so35656559lbd.9
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jan 2015 02:45:59 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>, Semen Protsenko <semen.protsenko@globallogic.com>, Mans Rullgard <mans@mansr.com>

Cast the struct gpio_chip into a max732x_chip using an inline
macro and move the assignment to the variable declaration
to save lines and simplify things.

Cc: Semen Protsenko <semen.protsenko@globallogic.com>
Cc: Mans Rullgard <mans@mansr.com>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-max732x.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 745698d977a5..a095b2393fe9 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -161,6 +161,11 @@ struct max732x_chip {
 #endif
 };
 
+static inline struct max732x_chip *to_max732x(struct gpio_chip *gc)
+{
+	return container_of(gc, struct max732x_chip, gpio_chip);
+}
+
 static int max732x_writeb(struct max732x_chip *chip, int group_a, uint8_t val)
 {
 	struct i2c_client *client;
@@ -199,12 +204,10 @@ static inline int is_group_a(struct max732x_chip *chip, unsigned off)
 
 static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
-	struct max732x_chip *chip;
+	struct max732x_chip *chip = to_max732x(gc);
 	uint8_t reg_val;
 	int ret;
 
-	chip = container_of(gc, struct max732x_chip, gpio_chip);
-
 	ret = max732x_readb(chip, is_group_a(chip, off), &reg_val);
 	if (ret < 0)
 		return 0;
@@ -215,12 +218,10 @@ static int max732x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 static void max732x_gpio_set_mask(struct gpio_chip *gc, unsigned off, int mask,
 				  int val)
 {
-	struct max732x_chip *chip;
+	struct max732x_chip *chip = to_max732x(gc);
 	uint8_t reg_out;
 	int ret;
 
-	chip = container_of(gc, struct max732x_chip, gpio_chip);
-
 	mutex_lock(&chip->lock);
 
 	reg_out = (off > 7) ? chip->reg_out[1] : chip->reg_out[0];
@@ -261,11 +262,9 @@ static void max732x_gpio_set_multiple(struct gpio_chip *gc,
 
 static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
-	struct max732x_chip *chip;
+	struct max732x_chip *chip = to_max732x(gc);
 	unsigned int mask = 1u << off;
 
-	chip = container_of(gc, struct max732x_chip, gpio_chip);
-
 	if ((mask & chip->dir_input) == 0) {
 		dev_dbg(&chip->client->dev, "%s port %d is output only\n",
 			chip->client->name, off);
@@ -285,11 +284,9 @@ static int max732x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 static int max732x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
-	struct max732x_chip *chip;
+	struct max732x_chip *chip = to_max732x(gc);
 	unsigned int mask = 1u << off;
 
-	chip = container_of(gc, struct max732x_chip, gpio_chip);
-
 	if ((mask & chip->dir_output) == 0) {
 		dev_dbg(&chip->client->dev, "%s port %d is input only\n",
 			chip->client->name, off);
@@ -361,9 +358,7 @@ static void max732x_irq_update_mask(struct max732x_chip *chip)
 
 static int max732x_gpio_to_irq(struct gpio_chip *gc, unsigned off)
 {
-	struct max732x_chip *chip;
-
-	chip = container_of(gc, struct max732x_chip, gpio_chip);
+	struct max732x_chip *chip = to_max732x(gc);
 
 	if (chip->irq_domain) {
 		return irq_create_mapping(chip->irq_domain,
-- 
1.9.3

