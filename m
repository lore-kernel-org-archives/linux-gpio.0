From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/5] gpio: etraxfs: use container_of() to get state container
Date: Thu, 27 Aug 2015 16:54:18 +0200
Message-ID: <1440687258-16977-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lb0-f174.google.com ([209.85.217.174]:33886 "EHLO
	mail-lb0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752502AbbH0Oy0 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 27 Aug 2015 10:54:26 -0400
Received: by lbbtg9 with SMTP id tg9so13087078lbb.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Aug 2015 07:54:24 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org, Rabin Vincent <rabin@rab.in>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>

The state container of the etraxfs GPIO driver is extracted from
the gpio_chip exploiting the fact that offsetof() the
struct gpio_chip inside the struct bgpio_chip are both 0, so
the container_of() is in practice a noop. However if a member
is added to struct etraxfs_gpio_chip in front of
struct bgpio_chip, things will break. Using proper container_of()
avoids this problem.

Semantically this is a noop, the compiler will optimize it away,
but syntactically it makes me happier.

Cc: Rabin Vincent <rabin@rab.in>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-etraxfs.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-etraxfs.c b/drivers/gpio/gpio-etraxfs.c
index ca33bda8ec55..b5dc0d14780d 100644
--- a/drivers/gpio/gpio-etraxfs.c
+++ b/drivers/gpio/gpio-etraxfs.c
@@ -176,6 +176,11 @@ static const struct etraxfs_gpio_info etraxfs_gpio_artpec3 = {
 	.rw_intr_pins	= ARTPEC3_rw_intr_pins,
 };
 
+static struct etraxfs_gpio_chip *to_etraxfs(struct gpio_chip *gc)
+{
+	return container_of(gc, struct etraxfs_gpio_chip, bgc.gc);
+}
+
 static unsigned int etraxfs_gpio_chip_to_port(struct gpio_chip *gc)
 {
 	return gc->label[0] - 'A';
@@ -220,7 +225,8 @@ static unsigned int etraxfs_gpio_to_group_pin(struct etraxfs_gpio_chip *chip,
 
 static void etraxfs_gpio_irq_ack(struct irq_data *d)
 {
-	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_chip *chip =
+		to_etraxfs(irq_data_get_irq_chip_data(d));
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 
@@ -229,7 +235,8 @@ static void etraxfs_gpio_irq_ack(struct irq_data *d)
 
 static void etraxfs_gpio_irq_mask(struct irq_data *d)
 {
-	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_chip *chip =
+		to_etraxfs(irq_data_get_irq_chip_data(d));
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 
@@ -241,7 +248,8 @@ static void etraxfs_gpio_irq_mask(struct irq_data *d)
 
 static void etraxfs_gpio_irq_unmask(struct irq_data *d)
 {
-	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_chip *chip =
+		to_etraxfs(irq_data_get_irq_chip_data(d));
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 
@@ -253,7 +261,8 @@ static void etraxfs_gpio_irq_unmask(struct irq_data *d)
 
 static int etraxfs_gpio_irq_set_type(struct irq_data *d, u32 type)
 {
-	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_chip *chip =
+		to_etraxfs(irq_data_get_irq_chip_data(d));
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 	u32 cfg;
@@ -289,7 +298,8 @@ static int etraxfs_gpio_irq_set_type(struct irq_data *d, u32 type)
 
 static int etraxfs_gpio_irq_request_resources(struct irq_data *d)
 {
-	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_chip *chip =
+		to_etraxfs(irq_data_get_irq_chip_data(d));
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 
@@ -318,7 +328,8 @@ out:
 
 static void etraxfs_gpio_irq_release_resources(struct irq_data *d)
 {
-	struct etraxfs_gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	struct etraxfs_gpio_chip *chip =
+		to_etraxfs(irq_data_get_irq_chip_data(d));
 	struct etraxfs_gpio_block *block = chip->block;
 	unsigned int grpirq = etraxfs_gpio_to_group_irq(d->hwirq);
 
-- 
2.4.3

