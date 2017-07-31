From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/6] pinctrl: uniphier: clean up GPIO port muxing
Date: Mon, 31 Jul 2017 15:21:08 +0900
Message-ID: <1501482071-9819-4-git-send-email-yamada.masahiro@socionext.com>
References: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1501482071-9819-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

There are a bunch of GPIO muxing data, but most of them are actually
unneeded because GPIO-to-pin mapping can be specified by "gpio-ranges"
DT properties.

Tables that contain a set of GPIO pins are still needed for the named
mapping by "gpio-ranges-group-names".  This is a much cleaner way for
UniPhier SoC family where GPIO numbers are not straight mapped to pin
numbers.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 drivers/pinctrl/uniphier/pinctrl-uniphier-core.c |  39 +-
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c | 375 ++-----------------
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c | 356 ++----------------
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c  | 272 ++------------
 drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c | 385 +------------------
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c | 450 +++-------------------
 drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c | 457 +++--------------------
 drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c | 385 +------------------
 drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c | 272 ++------------
 drivers/pinctrl/uniphier/pinctrl-uniphier.h      |  35 +-
 10 files changed, 274 insertions(+), 2752 deletions(-)

diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
index f2f0f9dcfec3..6de6fdca4e9c 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-core.c
@@ -651,30 +651,27 @@ static int uniphier_pmx_gpio_request_enable(struct pinctrl_dev *pctldev,
 					    unsigned offset)
 {
 	struct uniphier_pinctrl_priv *priv = pinctrl_dev_get_drvdata(pctldev);
-	const struct uniphier_pinctrl_group *groups = priv->socdata->groups;
-	int groups_count = priv->socdata->groups_count;
-	enum uniphier_pinmux_gpio_range_type range_type;
-	int i, j;
-
-	if (strstr(range->name, "irq"))
-		range_type = UNIPHIER_PINMUX_GPIO_RANGE_IRQ;
-	else
-		range_type = UNIPHIER_PINMUX_GPIO_RANGE_PORT;
-
-	for (i = 0; i < groups_count; i++) {
-		if (groups[i].range_type != range_type)
-			continue;
-
-		for (j = 0; j < groups[i].num_pins; j++)
-			if (groups[i].pins[j] == offset)
-				goto found;
+	unsigned int gpio_offset;
+	int muxval, i;
+
+	if (range->pins) {
+		for (i = 0; i < range->npins; i++)
+			if (range->pins[i] == offset)
+				break;
+
+		if (WARN_ON(i == range->npins))
+			return -EINVAL;
+
+		gpio_offset = i;
+	} else {
+		gpio_offset = offset - range->pin_base;
 	}
 
-	dev_err(pctldev->dev, "pin %u does not support GPIO\n", offset);
-	return -EINVAL;
+	gpio_offset += range->id;
+
+	muxval = priv->socdata->get_gpio_muxval(offset, gpio_offset);
 
-found:
-	return uniphier_pmx_set_one_mux(pctldev, offset, groups[i].muxvals[j]);
+	return uniphier_pmx_set_one_mux(pctldev, offset, muxval);
 }
 
 static const struct pinmux_ops uniphier_pmxops = {
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
index ad73db8d067b..01bff06f1277 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld11.c
@@ -508,100 +508,41 @@ static const unsigned usb1_pins[] = {48, 49};
 static const int usb1_muxvals[] = {0, 0};
 static const unsigned usb2_pins[] = {50, 51};
 static const int usb2_muxvals[] = {0, 0};
-static const unsigned port_range0_pins[] = {
+static const unsigned int gpio_range0_pins[] = {
 	159, 160, 161, 162, 163, 164, 165, 166,		/* PORT0x */
 	0, 1, 2, 3, 4, 5, 6, 7,				/* PORT1x */
 	8, 9, 10, 11, 12, 13, 14, 15,			/* PORT2x */
 	16, 17, 18,					/* PORT30-32 */
 };
-static const int port_range0_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT0x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT1x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT2x */
-	15, 15, 15,					/* PORT30-32 */
-};
-static const unsigned port_range1_pins[] = {
+static const unsigned int gpio_range1_pins[] = {
 	46, 47, 48, 49, 50,				/* PORT53-57 */
 	51,						/* PORT60 */
 };
-static const int port_range1_muxvals[] = {
-	15, 15, 15, 15, 15,				/* PORT53-57 */
-	15,						/* PORT60 */
-};
-static const unsigned port_range2_pins[] = {
+static const unsigned int gpio_range2_pins[] = {
 	54, 55, 56, 57, 58,				/* PORT63-67 */
 	59, 60, 69, 70, 71, 72, 73, 74,			/* PORT7x */
 	75, 76, 77, 78, 79, 80, 81, 82,			/* PORT8x */
 	83, 84, 85, 86, 87, 88, 89, 90,			/* PORT9x */
 	91, 92, 93, 94, 95, 96, 97, 98,			/* PORT10x */
 };
-static const int port_range2_muxvals[] = {
-	15, 15, 15, 15, 15,				/* PORT63-67 */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT7x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT8x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT9x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT10x */
-};
-static const unsigned port_range3_pins[] = {
+static const unsigned int gpio_range3_pins[] = {
 	99, 100, 101, 102, 103, 104, 105, 106,		/* PORT12x */
 	107, 108, 109, 110, 111, 112, 113, 114,		/* PORT13x */
 	115, 116, 117, 118, 119, 120, 121, 122,		/* PORT14x */
-};
-static const int port_range3_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT12x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT13x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT14x */
-};
-static const unsigned port_range4_pins[] = {
+	149, 150, 151, 152, 153, 154, 155, 156,		/* XIRQ0-7 */
+	157, 143, 144, 145, 85, 146, 158, 84,		/* XIRQ8-15 */
+	141, 142, 148, 50, 51, 159, 160, 161,		/* XIRQ16-23 */
 	61, 62, 63, 64, 65, 66, 67, 68,			/* PORT18x */
 };
-static const int port_range4_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT18x */
-};
-static const unsigned port_range5_pins[] = {
+static const unsigned int gpio_range4_pins[] = {
 	123, 124, 125, 126, 127, 128, 129, 130,		/* PORT20x */
 	131, 132, 133, 134, 135, 136, 137, 138,		/* PORT21x */
 	139, 140, 141, 142,				/* PORT220-223 */
 };
-static const int port_range5_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT20x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT21x */
-	15, 15, 15, 15,					/* PORT220-223 */
-};
-static const unsigned port_range6_pins[] = {
+static const unsigned int gpio_range5_pins[] = {
 	147, 148, 149, 150, 151, 152, 153, 154,		/* PORT23x */
 	155, 156, 157, 143, 144, 145, 146, 158,		/* PORT24x */
 };
-static const int port_range6_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT23x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT24x */
-};
-static const unsigned xirq_pins[] = {
-	149, 150, 151, 152, 153, 154, 155, 156,		/* XIRQ0-7 */
-	157, 143, 144, 145, 85, 146, 158, 84,		/* XIRQ8-15 */
-	141, 142, 148, 50, 51, 159, 160, 161,		/* XIRQ16-23 */
-};
-static const int xirq_muxvals[] = {
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ0-7 */
-	14, 14, 14, 14, 13, 14, 14, 13,			/* XIRQ8-15 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ16-23 */
-};
-static const unsigned xirq_alternatives_pins[] = {
-	94, 95, 96, 97, 98, 99, 100, 101,		/* XIRQ0-7 */
-	102, 103, 104, 105, 106, 107,			/* XIRQ8-11,13,14 */
-	108, 109, 110, 111, 112, 113, 114, 115,		/* XIRQ16-23 */
-	9, 10, 11, 12, 13, 14, 15, 16,			/* XIRQ4-11 */
-	17, 0, 1, 2, 3, 4, 5, 6, 7, 8,			/* XIRQ13,14,16-23 */
-	139, 140, 135, 147,				/* XIRQ17,18,21,22 */
-};
-static const int xirq_alternatives_muxvals[] = {
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ0-7 */
-	14, 14, 14, 14, 14, 14,				/* XIRQ8-11,13,14 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ16-23 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ4-11 */
-	14, 14, 14, 14, 14, 14, 14, 14, 14, 14,		/* XIRQ13,14,16-23 */
-	14, 14, 14, 14,					/* XIRQ17,18,21,22 */
-};
 
 static const struct uniphier_pinctrl_group uniphier_ld11_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(emmc),
@@ -621,221 +562,12 @@ static const struct uniphier_pinctrl_group uniphier_ld11_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb0),
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range1),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range2),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range3),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range4),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range5),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range6),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq_alternatives),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port00, port_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port01, port_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port02, port_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port03, port_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port04, port_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port05, port_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port06, port_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port07, port_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port10, port_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port11, port_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port12, port_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port13, port_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port14, port_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port15, port_range0, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port16, port_range0, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port17, port_range0, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port20, port_range0, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port21, port_range0, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port22, port_range0, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port23, port_range0, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port24, port_range0, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port25, port_range0, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port26, port_range0, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port27, port_range0, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port30, port_range0, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port31, port_range0, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port32, port_range0, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port53, port_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port54, port_range1, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port55, port_range1, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port56, port_range1, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port57, port_range1, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port60, port_range1, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port63, port_range2, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port64, port_range2, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port65, port_range2, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port66, port_range2, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port67, port_range2, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port70, port_range2, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port71, port_range2, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port72, port_range2, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port73, port_range2, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port74, port_range2, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port75, port_range2, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port76, port_range2, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port77, port_range2, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port80, port_range2, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port81, port_range2, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port82, port_range2, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port83, port_range2, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port84, port_range2, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port85, port_range2, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port86, port_range2, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port87, port_range2, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port90, port_range2, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port91, port_range2, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port92, port_range2, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port93, port_range2, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port94, port_range2, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port95, port_range2, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port96, port_range2, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port97, port_range2, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port100, port_range2, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port101, port_range2, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port102, port_range2, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port103, port_range2, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port104, port_range2, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port105, port_range2, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port106, port_range2, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port107, port_range2, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port120, port_range3, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port121, port_range3, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port122, port_range3, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port123, port_range3, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port124, port_range3, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port125, port_range3, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port126, port_range3, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port127, port_range3, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port130, port_range3, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port131, port_range3, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port132, port_range3, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port133, port_range3, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port134, port_range3, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port135, port_range3, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port136, port_range3, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port137, port_range3, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port140, port_range3, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port141, port_range3, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port142, port_range3, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port143, port_range3, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port144, port_range3, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port145, port_range3, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port146, port_range3, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port147, port_range3, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port180, port_range4, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port181, port_range4, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port182, port_range4, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port183, port_range4, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port184, port_range4, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port185, port_range4, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port186, port_range4, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port187, port_range4, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port200, port_range5, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port201, port_range5, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port202, port_range5, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port203, port_range5, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port204, port_range5, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port205, port_range5, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port206, port_range5, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port207, port_range5, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port210, port_range5, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port211, port_range5, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port212, port_range5, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port213, port_range5, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port214, port_range5, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port215, port_range5, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port216, port_range5, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port217, port_range5, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port220, port_range5, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port221, port_range5, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port222, port_range5, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port223, port_range5, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port230, port_range6, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port231, port_range6, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port232, port_range6, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port233, port_range6, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port234, port_range6, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port235, port_range6, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port236, port_range6, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port237, port_range6, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port240, port_range6, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port241, port_range6, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port242, port_range6, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port243, port_range6, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port244, port_range6, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port245, port_range6, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port246, port_range6, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port247, port_range6, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0, xirq, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1, xirq, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2, xirq, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3, xirq, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4, xirq, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5, xirq, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6, xirq, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7, xirq, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8, xirq, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9, xirq, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10, xirq, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11, xirq, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq12, xirq, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13, xirq, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14, xirq, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq15, xirq, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16, xirq, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17, xirq, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18, xirq, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19, xirq, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20, xirq, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq21, xirq, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq22, xirq, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq23, xirq, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0b, xirq_alternatives, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1b, xirq_alternatives, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2b, xirq_alternatives, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3b, xirq_alternatives, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4b, xirq_alternatives, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5b, xirq_alternatives, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6b, xirq_alternatives, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7b, xirq_alternatives, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8b, xirq_alternatives, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9b, xirq_alternatives, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10b, xirq_alternatives, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11b, xirq_alternatives, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13b, xirq_alternatives, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14b, xirq_alternatives, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16b, xirq_alternatives, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17b, xirq_alternatives, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18b, xirq_alternatives, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19b, xirq_alternatives, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20b, xirq_alternatives, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq21b, xirq_alternatives, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq22b, xirq_alternatives, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq23b, xirq_alternatives, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4c, xirq_alternatives, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5c, xirq_alternatives, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6c, xirq_alternatives, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7c, xirq_alternatives, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8c, xirq_alternatives, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9c, xirq_alternatives, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10c, xirq_alternatives, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11c, xirq_alternatives, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13c, xirq_alternatives, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14c, xirq_alternatives, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16c, xirq_alternatives, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17c, xirq_alternatives, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18c, xirq_alternatives, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19c, xirq_alternatives, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20c, xirq_alternatives, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq21c, xirq_alternatives, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq22c, xirq_alternatives, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq23c, xirq_alternatives, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17d, xirq_alternatives, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18d, xirq_alternatives, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq21d, xirq_alternatives, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq22d, xirq_alternatives, 43),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range0),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range1),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range2),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range3),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range4),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range5),
 };
 
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
@@ -854,68 +586,6 @@ static const char * const uart3_groups[] = {"uart3"};
 static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
-static const char * const port_groups[] = {
-	"port00",  "port01",  "port02",  "port03",
-	"port04",  "port05",  "port06",  "port07",
-	"port10",  "port11",  "port12",  "port13",
-	"port14",  "port15",  "port16",  "port17",
-	"port20",  "port21",  "port22",  "port23",
-	"port24",  "port25",  "port26",  "port27",
-	"port30",  "port31",  "port32",
-	/* port33-52 missing */          "port53",
-	"port54",  "port55",  "port56",  "port57",
-	"port60", /* port61-62 missing*/ "port63",
-	"port64",  "port65",  "port66",  "port67",
-	"port70",  "port71",  "port72",  "port73",
-	"port74",  "port75",  "port76",  "port77",
-	"port80",  "port81",  "port82",  "port83",
-	"port84",  "port85",  "port86",  "port87",
-	"port90",  "port91",  "port92",  "port93",
-	"port94",  "port95",  "port96",  "port97",
-	"port100", "port101", "port102", "port103",
-	"port104", "port105", "port106", "port107",
-	/* port110-117 missing */
-	"port120", "port121", "port122", "port123",
-	"port124", "port125", "port126", "port127",
-	"port130", "port131", "port132", "port133",
-	"port134", "port135", "port136", "port137",
-	"port140", "port141", "port142", "port143",
-	"port144", "port145", "port146", "port147",
-	/* port150-177 missing */
-	"port180", "port181", "port182", "port183",
-	"port184", "port185", "port186", "port187",
-	/* port190-197 missing */
-	"port200", "port201", "port202", "port203",
-	"port204", "port205", "port206", "port207",
-	"port210", "port211", "port212", "port213",
-	"port214", "port215", "port216", "port217",
-	"port220", "port221", "port222", "port223",
-	/* port224-227 missing */
-	"port230", "port231", "port232", "port233",
-	"port234", "port235", "port236", "port237",
-	"port240", "port241", "port242", "port243",
-	"port244", "port245", "port246", "port247",
-};
-static const char * const xirq_groups[] = {
-	"xirq0",  "xirq1",  "xirq2",  "xirq3",
-	"xirq4",  "xirq5",  "xirq6",  "xirq7",
-	"xirq8",  "xirq9",  "xirq10", "xirq11",
-	"xirq12", "xirq13", "xirq14", "xirq15",
-	"xirq16", "xirq17", "xirq18", "xirq19",
-	"xirq20", "xirq21", "xirq22", "xirq23",
-	"xirq0b",  "xirq1b",  "xirq2b",  "xirq3b",
-	"xirq4b",  "xirq5b",  "xirq6b",  "xirq7b",
-	"xirq8b",  "xirq9b",  "xirq10b", "xirq11b",
-	/* none */ "xirq13b", "xirq14b", /* none */
-	"xirq16b", "xirq17b", "xirq18b", "xirq19b",
-	"xirq20b", "xirq21b", "xirq22b", "xirq23b",
-	"xirq4c",  "xirq5c",  "xirq6c",  "xirq7c",
-	"xirq8c",  "xirq9c",  "xirq10c", "xirq11c",
-	/* none */ "xirq13c", "xirq14c", /* none */
-	"xirq16c", "xirq17c", "xirq18c", "xirq19c",
-	"xirq20c", "xirq21c", "xirq22c", "xirq23c",
-	"xirq17d", "xirq18d", "xirq21d", "xirq22d",
-};
 
 static const struct uniphier_pinmux_function uniphier_ld11_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(emmc),
@@ -933,10 +603,20 @@ static const struct uniphier_pinmux_function uniphier_ld11_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb0),
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
-	UNIPHIER_PINMUX_FUNCTION(port),
-	UNIPHIER_PINMUX_FUNCTION(xirq),
 };
 
+static int uniphier_ld11_get_gpio_muxval(unsigned int pin,
+					 unsigned int gpio_offset)
+{
+	if (gpio_offset == 132 || gpio_offset == 135)	/* XIRQ12, 15 */
+		return 13;
+
+	if (gpio_offset >= 120 && gpio_offset <= 143)	/* XIRQx */
+		return 14;
+
+	return 15;
+}
+
 static struct uniphier_pinctrl_socdata uniphier_ld11_pindata = {
 	.pins = uniphier_ld11_pins,
 	.npins = ARRAY_SIZE(uniphier_ld11_pins),
@@ -944,6 +624,7 @@ static struct uniphier_pinctrl_socdata uniphier_ld11_pindata = {
 	.groups_count = ARRAY_SIZE(uniphier_ld11_groups),
 	.functions = uniphier_ld11_functions,
 	.functions_count = ARRAY_SIZE(uniphier_ld11_functions),
+	.get_gpio_muxval = uniphier_ld11_get_gpio_muxval,
 	.caps = UNIPHIER_PINCTRL_CAPS_PERPIN_IECTRL,
 };
 
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
index 93006626028d..d5ebe2482bda 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld20.c
@@ -597,7 +597,7 @@ static const unsigned usb2_pins[] = {50, 51};
 static const int usb2_muxvals[] = {0, 0};
 static const unsigned usb3_pins[] = {52, 53};
 static const int usb3_muxvals[] = {0, 0};
-static const unsigned port_range0_pins[] = {
+static const unsigned int gpio_range0_pins[] = {
 	168, 169, 170, 171, 172, 173, 174, 175,		/* PORT0x */
 	0, 1, 2, 3, 4, 5, 6, 7,				/* PORT1x */
 	8, 9, 10, 11, 12, 13, 14, 15,			/* PORT2x */
@@ -610,36 +610,16 @@ static const unsigned port_range0_pins[] = {
 	83, 84, 85, 86, 87, 88, 89, 90,			/* PORT9x */
 	91, 92, 93, 94, 95, 96, 97, 98,			/* PORT10x */
 };
-static const int port_range0_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT0x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT1x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT2x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT3x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT4x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT5x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT6x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT7x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT8x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT9x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT10x */
-};
-static const unsigned port_range1_pins[] = {
+static const unsigned int gpio_range1_pins[] = {
 	99, 100, 101, 102, 103, 104, 105, 106,		/* PORT12x */
 	107, 108, 109, 110, 111, 112, 113, 114,		/* PORT13x */
 	115, 116, 117, 118, 119, 120, 121, 122,		/* PORT14x */
-};
-static const int port_range1_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT12x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT13x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT14x */
-};
-static const unsigned port_range2_pins[] = {
+	149, 150, 151, 152, 153, 154, 155, 156,		/* XIRQ0-7 */
+	157, 158, 159, 160, 85, 161, 162, 84,		/* XIRQ8-15 */
+	163, 164, 165, 166, 167, 146, 52, 53,		/* XIRQ16-23 */
 	61, 62, 63, 64, 65, 66, 67, 68,			/* PORT18x */
 };
-static const int port_range2_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT18x */
-};
-static const unsigned port_range3_pins[] = {
+static const unsigned int gpio_range2_pins[] = {
 	123, 124, 125, 126, 127, 128, 129, 130,		/* PORT20x */
 	131, 132, 133, 134, 135, 136, 137, 138,		/* PORT21x */
 	139, 140, 141, 142, 143, 144, 145, 146,		/* PORT22x */
@@ -647,34 +627,6 @@ static const unsigned port_range3_pins[] = {
 	155, 156, 157, 158, 159, 160, 161, 162,		/* PORT24x */
 	163, 164, 165, 166, 167,			/* PORT250-254 */
 };
-static const int port_range3_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT20x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT21x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT22x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT23x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT24x */
-	15, 15, 15, 15, 15,				/* PORT250-254 */
-};
-static const unsigned xirq_pins[] = {
-	149, 150, 151, 152, 153, 154, 155, 156,		/* XIRQ0-7 */
-	157, 158, 159, 160, 85, 161, 162, 84,		/* XIRQ8-15 */
-	163, 164, 165, 166, 167, 146, 52, 53,		/* XIRQ16-23 */
-};
-static const int xirq_muxvals[] = {
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ0-7 */
-	14, 14, 14, 14, 13, 14, 14, 13,			/* XIRQ8-15 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ16-23 */
-};
-static const unsigned xirq_alternatives_pins[] = {
-	94, 95, 96, 97, 98, 99, 100, 101,		/* XIRQ0-7 */
-	102, 103, 104, 105, 106, 107,			/* XIRQ8-11,13,14 */
-	108, 109, 110, 111, 112, 147, 141, 142,		/* XIRQ16-23 */
-};
-static const int xirq_alternatives_muxvals[] = {
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ0-7 */
-	14, 14, 14, 14, 14, 14,				/* XIRQ8-11,13,14 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ16-23 */
-};
 
 static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(emmc),
@@ -697,223 +649,9 @@ static const struct uniphier_pinctrl_group uniphier_ld20_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
 	UNIPHIER_PINCTRL_GROUP(usb3),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range1),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range2),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range3),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq_alternatives),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port00, port_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port01, port_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port02, port_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port03, port_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port04, port_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port05, port_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port06, port_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port07, port_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port10, port_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port11, port_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port12, port_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port13, port_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port14, port_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port15, port_range0, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port16, port_range0, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port17, port_range0, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port20, port_range0, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port21, port_range0, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port22, port_range0, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port23, port_range0, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port24, port_range0, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port25, port_range0, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port26, port_range0, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port27, port_range0, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port30, port_range0, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port31, port_range0, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port32, port_range0, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port33, port_range0, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port34, port_range0, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port35, port_range0, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port36, port_range0, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port37, port_range0, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port40, port_range0, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port41, port_range0, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port42, port_range0, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port43, port_range0, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port44, port_range0, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port45, port_range0, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port46, port_range0, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port47, port_range0, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port50, port_range0, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port51, port_range0, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port52, port_range0, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port53, port_range0, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port54, port_range0, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port55, port_range0, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port56, port_range0, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port57, port_range0, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port60, port_range0, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port61, port_range0, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port62, port_range0, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port63, port_range0, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port64, port_range0, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port65, port_range0, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port66, port_range0, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port67, port_range0, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port70, port_range0, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port71, port_range0, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port72, port_range0, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port73, port_range0, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port74, port_range0, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port75, port_range0, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port76, port_range0, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port77, port_range0, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port80, port_range0, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port81, port_range0, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port82, port_range0, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port83, port_range0, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port84, port_range0, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port85, port_range0, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port86, port_range0, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port87, port_range0, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port90, port_range0, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port91, port_range0, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port92, port_range0, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port93, port_range0, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port94, port_range0, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port95, port_range0, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port96, port_range0, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port97, port_range0, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port100, port_range0, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port101, port_range0, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port102, port_range0, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port103, port_range0, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port104, port_range0, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port105, port_range0, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port106, port_range0, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port107, port_range0, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port120, port_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port121, port_range1, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port122, port_range1, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port123, port_range1, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port124, port_range1, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port125, port_range1, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port126, port_range1, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port127, port_range1, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port130, port_range1, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port131, port_range1, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port132, port_range1, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port133, port_range1, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port134, port_range1, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port135, port_range1, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port136, port_range1, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port137, port_range1, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port140, port_range1, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port141, port_range1, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port142, port_range1, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port143, port_range1, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port144, port_range1, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port145, port_range1, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port146, port_range1, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port147, port_range1, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port180, port_range2, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port181, port_range2, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port182, port_range2, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port183, port_range2, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port184, port_range2, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port185, port_range2, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port186, port_range2, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port187, port_range2, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port200, port_range3, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port201, port_range3, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port202, port_range3, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port203, port_range3, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port204, port_range3, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port205, port_range3, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port206, port_range3, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port207, port_range3, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port210, port_range3, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port211, port_range3, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port212, port_range3, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port213, port_range3, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port214, port_range3, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port215, port_range3, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port216, port_range3, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port217, port_range3, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port220, port_range3, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port221, port_range3, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port222, port_range3, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port223, port_range3, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port224, port_range3, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port225, port_range3, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port226, port_range3, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port227, port_range3, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port230, port_range3, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port231, port_range3, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port232, port_range3, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port233, port_range3, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port234, port_range3, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port235, port_range3, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port236, port_range3, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port237, port_range3, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port240, port_range3, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port241, port_range3, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port242, port_range3, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port243, port_range3, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port244, port_range3, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port245, port_range3, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port246, port_range3, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port247, port_range3, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port250, port_range3, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port251, port_range3, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port252, port_range3, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port253, port_range3, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port254, port_range3, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0, xirq, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1, xirq, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2, xirq, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3, xirq, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4, xirq, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5, xirq, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6, xirq, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7, xirq, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8, xirq, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9, xirq, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10, xirq, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11, xirq, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq12, xirq, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13, xirq, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14, xirq, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq15, xirq, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16, xirq, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17, xirq, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18, xirq, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19, xirq, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20, xirq, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq21, xirq, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq22, xirq, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq23, xirq, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0b, xirq_alternatives, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1b, xirq_alternatives, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2b, xirq_alternatives, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3b, xirq_alternatives, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4b, xirq_alternatives, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5b, xirq_alternatives, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6b, xirq_alternatives, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7b, xirq_alternatives, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8b, xirq_alternatives, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9b, xirq_alternatives, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10b, xirq_alternatives, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11b, xirq_alternatives, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13b, xirq_alternatives, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14b, xirq_alternatives, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16b, xirq_alternatives, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17b, xirq_alternatives, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18b, xirq_alternatives, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19b, xirq_alternatives, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20b, xirq_alternatives, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq21b, xirq_alternatives, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq22b, xirq_alternatives, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq23b, xirq_alternatives, 21),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range0),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range1),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range2),
 };
 
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
@@ -935,67 +673,6 @@ static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
 static const char * const usb3_groups[] = {"usb3"};
-static const char * const port_groups[] = {
-	"port00", "port01", "port02", "port03",
-	"port04", "port05", "port06", "port07",
-	"port10", "port11", "port12", "port13",
-	"port14", "port15", "port16", "port17",
-	"port20", "port21", "port22", "port23",
-	"port24", "port25", "port26", "port27",
-	"port30", "port31", "port32", "port33",
-	"port34", "port35", "port36", "port37",
-	"port40", "port41", "port42", "port43",
-	"port44", "port45", "port46", "port47",
-	"port50", "port51", "port52", "port53",
-	"port54", "port55", "port56", "port57",
-	"port60", "port61", "port62", "port63",
-	"port64", "port65", "port66", "port67",
-	"port70", "port71", "port72", "port73",
-	"port74", "port75", "port76", "port77",
-	"port80", "port81", "port82", "port83",
-	"port84", "port85", "port86", "port87",
-	"port90", "port91", "port92", "port93",
-	"port94", "port95", "port96", "port97",
-	"port100", "port101", "port102", "port103",
-	"port104", "port105", "port106", "port107",
-	/* port110-117 missing */
-	"port120", "port121", "port122", "port123",
-	"port124", "port125", "port126", "port127",
-	"port130", "port131", "port132", "port133",
-	"port134", "port135", "port136", "port137",
-	"port140", "port141", "port142", "port143",
-	"port144", "port145", "port146", "port147",
-	/* port150-177 missing */
-	"port180", "port181", "port182", "port183",
-	"port184", "port185", "port186", "port187",
-	/* port190-197 missing */
-	"port200", "port201", "port202", "port203",
-	"port204", "port205", "port206", "port207",
-	"port210", "port211", "port212", "port213",
-	"port214", "port215", "port216", "port217",
-	"port220", "port221", "port222", "port223",
-	"port224", "port225", "port226", "port227",
-	"port230", "port231", "port232", "port233",
-	"port234", "port235", "port236", "port237",
-	"port240", "port241", "port242", "port243",
-	"port244", "port245", "port246", "port247",
-	"port250", "port251", "port252", "port253",
-	"port254",
-};
-static const char * const xirq_groups[] = {
-	"xirq0",  "xirq1",  "xirq2",  "xirq3",
-	"xirq4",  "xirq5",  "xirq6",  "xirq7",
-	"xirq8",  "xirq9",  "xirq10", "xirq11",
-	"xirq12", "xirq13", "xirq14", "xirq15",
-	"xirq16", "xirq17", "xirq18", "xirq19",
-	"xirq20", "xirq21", "xirq22", "xirq23",
-	"xirq0b",  "xirq1b",  "xirq2b",  "xirq3b",
-	"xirq4b",  "xirq5b",  "xirq6b",  "xirq7b",
-	"xirq8b",  "xirq9b",  "xirq10b", "xirq11b",
-	/* none */ "xirq13b", "xirq14b", /* none */
-	"xirq16b", "xirq17b", "xirq18b", "xirq19b",
-	"xirq20b", "xirq21b", "xirq22b", "xirq23b",
-};
 
 static const struct uniphier_pinmux_function uniphier_ld20_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(emmc),
@@ -1016,10 +693,20 @@ static const struct uniphier_pinmux_function uniphier_ld20_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
 	UNIPHIER_PINMUX_FUNCTION(usb3),
-	UNIPHIER_PINMUX_FUNCTION(port),
-	UNIPHIER_PINMUX_FUNCTION(xirq),
 };
 
+static int uniphier_ld20_get_gpio_muxval(unsigned int pin,
+					 unsigned int gpio_offset)
+{
+	if (gpio_offset == 132 || gpio_offset == 135)	/* XIRQ12, 15 */
+		return 13;
+
+	if (gpio_offset >= 120 && gpio_offset <= 143)	/* XIRQx */
+		return 14;
+
+	return 15;
+}
+
 static struct uniphier_pinctrl_socdata uniphier_ld20_pindata = {
 	.pins = uniphier_ld20_pins,
 	.npins = ARRAY_SIZE(uniphier_ld20_pins),
@@ -1027,6 +714,7 @@ static struct uniphier_pinctrl_socdata uniphier_ld20_pindata = {
 	.groups_count = ARRAY_SIZE(uniphier_ld20_groups),
 	.functions = uniphier_ld20_functions,
 	.functions_count = ARRAY_SIZE(uniphier_ld20_functions),
+	.get_gpio_muxval = uniphier_ld20_get_gpio_muxval,
 	.caps = UNIPHIER_PINCTRL_CAPS_PERPIN_IECTRL,
 };
 
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
index 8f2ad1c4c6f4..7db3fd0f72e5 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld4.c
@@ -606,59 +606,24 @@ static const unsigned usb2_pins[] = {155, 156};
 static const int usb2_muxvals[] = {4, 4};
 static const unsigned usb2b_pins[] = {67, 68};
 static const int usb2b_muxvals[] = {23, 23};
-static const unsigned port_range0_pins[] = {
-	135, 136, 137, 138, 139, 140, 141, 142,		/* PORT0x */
-	143, 144, 145, 146, 147, 148, 149, 150,		/* PORT1x */
-	151, 152, 153, 154, 155, 156, 157, 0,		/* PORT2x */
-	1, 2, 3, 4, 5, 120, 121, 122,			/* PORT3x */
-	24, 25, 26, 27, 28, 29, 30, 31,			/* PORT4x */
-	40, 41, 42, 43, 44, 45, 46, 47,			/* PORT5x */
-	48, 49, 50, 51, 52, 53, 54, 55,			/* PORT6x */
-	56, 85, 84, 59, 82, 61, 64, 65,			/* PORT7x */
-	8, 9, 10, 11, 12, 13, 14, 15,			/* PORT8x */
-	66, 67, 68, 69, 70, 71, 72, 73,			/* PORT9x */
-	74, 75, 89, 86, 78, 79, 80, 81,			/* PORT10x */
-	60, 83, 58, 57, 88, 87, 77, 76,			/* PORT11x */
-	90, 91, 92, 93, 94, 95, 96, 97,			/* PORT12x */
-	98, 99, 100, 6, 101, 114, 115, 116,		/* PORT13x */
-	103, 108, 21, 22, 23, 117, 118, 119,		/* PORT14x */
-};
-static const int port_range0_muxvals[] = {
-	0, 0, 0, 0, 0, 0, 0, 0,				/* PORT0x */
-	0, 0, 0, 0, 0, 0, 0, 0,				/* PORT1x */
-	0, 0, 0, 0, 0, 0, 0, 15,			/* PORT2x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT3x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT4x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT5x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT6x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT7x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT8x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT9x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT10x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT11x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT12x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT13x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT14x */
-};
-static const unsigned port_range1_pins[] = {
-	7,						/* PORT166 */
-};
-static const int port_range1_muxvals[] = {
-	15,						/* PORT166 */
-};
-static const unsigned xirq_range0_pins[] = {
-	151, 123, 124, 125, 126, 127, 128, 129,		/* XIRQ0-7 */
-	130, 131, 132, 133, 62,				/* XIRQ8-12 */
-};
-static const int xirq_range0_muxvals[] = {
-	14, 0, 0, 0, 0, 0, 0, 0,			/* XIRQ0-7 */
-	0, 0, 0, 0, 14,					/* XIRQ8-12 */
-};
-static const unsigned xirq_range1_pins[] = {
-	134, 63,					/* XIRQ14-15 */
-};
-static const int xirq_range1_muxvals[] = {
-	0, 14,						/* XIRQ14-15 */
+static const unsigned int gpio_range_pins[] = {
+	135, 136, 137, 138, 139, 140, 141, 142,	/* PORT0x */
+	143, 144, 145, 146, 147, 148, 149, 150,	/* PORT1x */
+	151, 152, 153, 154, 155, 156, 157, 0,	/* PORT2x */
+	1, 2, 3, 4, 5, 120, 121, 122,		/* PORT3x */
+	24, 25, 26, 27, 28, 29, 30, 31,		/* PORT4x */
+	40, 41, 42, 43, 44, 45, 46, 47,		/* PORT5x */
+	48, 49, 50, 51, 52, 53, 54, 55,		/* PORT6x */
+	56, 85, 84, 59, 82, 61, 64, 65,		/* PORT7x */
+	8, 9, 10, 11, 12, 13, 14, 15,		/* PORT8x */
+	66, 67, 68, 69, 70, 71, 72, 73,		/* PORT9x */
+	74, 75, 89, 86, 78, 79, 80, 81,		/* PORT10x */
+	60, 83, 58, 57, 88, 87, 77, 76,		/* PORT11x */
+	90, 91, 92, 93, 94, 95, 96, 97,		/* PORT12x */
+	98, 99, 100, 6, 101, 114, 115, 116,	/* PORT13x */
+	103, 108, 21, 22, 23, 117, 118, 119,	/* PORT14x */
+	151, 123, 124, 125, 126, 127, 128, 129,	/* XIRQ0-7 */
+	130, 131, 132, 133, 62, 7, 134, 63,   /* XIRQ8-12, PORT165, XIRQ14-15 */
 };
 
 static const struct uniphier_pinctrl_group uniphier_ld4_groups[] = {
@@ -687,146 +652,7 @@ static const struct uniphier_pinctrl_group uniphier_ld4_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
 	UNIPHIER_PINCTRL_GROUP(usb2b),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range1),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq_range1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port00, port_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port01, port_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port02, port_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port03, port_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port04, port_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port05, port_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port06, port_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port07, port_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port10, port_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port11, port_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port12, port_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port13, port_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port14, port_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port15, port_range0, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port16, port_range0, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port17, port_range0, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port20, port_range0, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port21, port_range0, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port22, port_range0, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port23, port_range0, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port24, port_range0, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port25, port_range0, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port26, port_range0, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port27, port_range0, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port30, port_range0, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port31, port_range0, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port32, port_range0, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port33, port_range0, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port34, port_range0, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port35, port_range0, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port36, port_range0, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port37, port_range0, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port40, port_range0, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port41, port_range0, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port42, port_range0, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port43, port_range0, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port44, port_range0, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port45, port_range0, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port46, port_range0, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port47, port_range0, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port50, port_range0, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port51, port_range0, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port52, port_range0, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port53, port_range0, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port54, port_range0, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port55, port_range0, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port56, port_range0, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port57, port_range0, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port60, port_range0, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port61, port_range0, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port62, port_range0, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port63, port_range0, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port64, port_range0, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port65, port_range0, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port66, port_range0, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port67, port_range0, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port70, port_range0, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port71, port_range0, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port72, port_range0, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port73, port_range0, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port74, port_range0, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port75, port_range0, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port76, port_range0, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port77, port_range0, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port80, port_range0, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port81, port_range0, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port82, port_range0, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port83, port_range0, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port84, port_range0, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port85, port_range0, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port86, port_range0, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port87, port_range0, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port90, port_range0, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port91, port_range0, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port92, port_range0, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port93, port_range0, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port94, port_range0, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port95, port_range0, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port96, port_range0, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port97, port_range0, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port100, port_range0, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port101, port_range0, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port102, port_range0, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port103, port_range0, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port104, port_range0, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port105, port_range0, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port106, port_range0, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port107, port_range0, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port110, port_range0, 88),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port111, port_range0, 89),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port112, port_range0, 90),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port113, port_range0, 91),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port114, port_range0, 92),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port115, port_range0, 93),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port116, port_range0, 94),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port117, port_range0, 95),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port120, port_range0, 96),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port121, port_range0, 97),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port122, port_range0, 98),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port123, port_range0, 99),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port124, port_range0, 100),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port125, port_range0, 101),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port126, port_range0, 102),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port127, port_range0, 103),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port130, port_range0, 104),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port131, port_range0, 105),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port132, port_range0, 106),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port133, port_range0, 107),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port134, port_range0, 108),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port135, port_range0, 109),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port136, port_range0, 110),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port137, port_range0, 111),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port140, port_range0, 112),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port141, port_range0, 113),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port142, port_range0, 114),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port143, port_range0, 115),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port144, port_range0, 116),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port145, port_range0, 117),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port146, port_range0, 118),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port147, port_range0, 119),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port165, port_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0, xirq_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1, xirq_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2, xirq_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3, xirq_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4, xirq_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5, xirq_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6, xirq_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7, xirq_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8, xirq_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9, xirq_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10, xirq_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11, xirq_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq12, xirq_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14, xirq_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq15, xirq_range1, 1),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range),
 };
 
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
@@ -850,46 +676,6 @@ static const char * const uart3_groups[] = {"uart3"};
 static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2", "usb2b"};
-static const char * const port_groups[] = {
-	"port00",  "port01",  "port02",  "port03",
-	"port04",  "port05",  "port06",  "port07",
-	"port10",  "port11",  "port12",  "port13",
-	"port14",  "port15",  "port16",  "port17",
-	"port20",  "port21",  "port22",  "port23",
-	"port24",  "port25",  "port26",  "port27",
-	"port30",  "port31",  "port32",  "port33",
-	"port34",  "port35",  "port36",  "port37",
-	"port40",  "port41",  "port42",  "port43",
-	"port44",  "port45",  "port46",  "port47",
-	"port50",  "port51",  "port52",  "port53",
-	"port54",  "port55",  "port56",  "port57",
-	"port60",  "port61",  "port62",  "port63",
-	"port64",  "port65",  "port66",  "port67",
-	"port70",  "port71",  "port72",  "port73",
-	"port74",  "port75",  "port76",  "port77",
-	"port80",  "port81",  "port82",  "port83",
-	"port84",  "port85",  "port86",  "port87",
-	"port90",  "port91",  "port92",  "port93",
-	"port94",  "port95",  "port96",  "port97",
-	"port100", "port101", "port102", "port103",
-	"port104", "port105", "port106", "port107",
-	"port110", "port111", "port112", "port113",
-	"port114", "port115", "port116", "port117",
-	"port120", "port121", "port122", "port123",
-	"port124", "port125", "port126", "port127",
-	"port130", "port131", "port132", "port133",
-	"port134", "port135", "port136", "port137",
-	"port140", "port141", "port142", "port143",
-	"port144", "port145", "port146", "port147",
-	/* port150-164 missing */
-	/* none */ "port165",
-};
-static const char * const xirq_groups[] = {
-	"xirq0",  "xirq1",  "xirq2",  "xirq3",
-	"xirq4",  "xirq5",  "xirq6",  "xirq7",
-	"xirq8",  "xirq9",  "xirq10", "xirq11",
-	"xirq12", /* none*/ "xirq14", "xirq15",
-};
 
 static const struct uniphier_pinmux_function uniphier_ld4_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(emmc),
@@ -909,10 +695,25 @@ static const struct uniphier_pinmux_function uniphier_ld4_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb0),
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
-	UNIPHIER_PINMUX_FUNCTION(port),
-	UNIPHIER_PINMUX_FUNCTION(xirq),
 };
 
+static int uniphier_ld4_get_gpio_muxval(unsigned int pin,
+					unsigned int gpio_offset)
+{
+	switch (gpio_offset) {
+	case 0 ... 22:		/* PORT00-PORT26 */
+	case 121 ... 131:	/* XIRQ1-XIRQ11 */
+	case 134:		/* XIRQ14 */
+		return 0;
+	case 120:		/* XIRQ0 */
+	case 132:		/* XIRQ12 */
+	case 135:		/* XIRQ15 */
+		return 14;
+	default:
+		return 15;
+	}
+}
+
 static struct uniphier_pinctrl_socdata uniphier_ld4_pindata = {
 	.pins = uniphier_ld4_pins,
 	.npins = ARRAY_SIZE(uniphier_ld4_pins),
@@ -920,6 +721,7 @@ static struct uniphier_pinctrl_socdata uniphier_ld4_pindata = {
 	.groups_count = ARRAY_SIZE(uniphier_ld4_groups),
 	.functions = uniphier_ld4_functions,
 	.functions_count = ARRAY_SIZE(uniphier_ld4_functions),
+	.get_gpio_muxval = uniphier_ld4_get_gpio_muxval,
 	.caps = 0,
 };
 
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
index 8a0da937b670..2d8dc0f0b907 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-ld6b.c
@@ -803,7 +803,7 @@ static const unsigned usb2_pins[] = {60, 61};
 static const int usb2_muxvals[] = {0, 0};
 static const unsigned usb3_pins[] = {62, 63};
 static const int usb3_muxvals[] = {0, 0};
-static const unsigned port_range0_pins[] = {
+static const unsigned int gpio_range0_pins[] = {
 	127, 128, 129, 130, 131, 132, 133, 134,		/* PORT0x */
 	135, 136, 137, 138, 139, 140, 141, 142,		/* PORT1x */
 	0, 1, 2, 3, 4, 5, 6, 7,				/* PORT2x */
@@ -816,26 +816,13 @@ static const unsigned port_range0_pins[] = {
 	61, 62, 63, 64, 65, 66, 67, 68,			/* PORT9x */
 	69, 70, 71, 76, 77, 78, 79, 80,			/* PORT10x */
 };
-static const int port_range0_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT0x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT1x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT2x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT3x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT4x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT5x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT6x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT7x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT8x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT9x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT10x */
-};
-static const unsigned port_range1_pins[] = {
+static const unsigned int gpio_range1_pins[] = {
 	81, 82, 83, 84, 85, 86, 87, 88,			/* PORT12x */
 	89, 90, 95, 96, 97, 98, 99, 100,		/* PORT13x */
 	101, 102, 103, 104, 105, 106, 107, 108,		/* PORT14x */
-	118, 119, 120, 121, 122, 123, 124, 125,		/* PORT15x */
-	126, 72, 73, 92, 177, 93, 94, 176,		/* PORT16x */
-	74, 91, 27, 28, 29, 75, 20, 26,			/* PORT17x */
+	118, 119, 120, 121, 122, 123, 124, 125,		/* XIRQ0-7 */
+	126, 72, 73, 92, 177, 93, 94, 176,		/* XIRQ8-15 */
+	74, 91, 27, 28, 29, 75, 20, 26,			/* XIRQ16-23 */
 	109, 110, 111, 112, 113, 114, 115, 116,		/* PORT18x */
 	117, 143, 144, 145, 146, 147, 148, 149,		/* PORT19x */
 	150, 151, 152, 153, 154, 155, 156, 157,		/* PORT20x */
@@ -848,35 +835,6 @@ static const unsigned port_range1_pins[] = {
 	218, 219, 220, 221, 223, 224, 225, 226,		/* PORT27x */
 	227, 228, 229, 230, 231, 232, 233, 234,		/* PORT28x */
 };
-static const int port_range1_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT12x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT13x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT14x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT15x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT16x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT17x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT18x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT19x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT20x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT21x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT22x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT23x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT24x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT25x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT26x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT27x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT28x */
-};
-static const unsigned xirq_pins[] = {
-	118, 119, 120, 121, 122, 123, 124, 125,		/* XIRQ0-7 */
-	126, 72, 73, 92, 177, 93, 94, 176,		/* XIRQ8-15 */
-	74, 91, 27, 28, 29, 75, 20, 26,			/* XIRQ16-23 */
-};
-static const int xirq_muxvals[] = {
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ0-7 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ8-15 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ16-23 */
-};
 
 static const struct uniphier_pinctrl_group uniphier_ld6b_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(adinter),
@@ -907,257 +865,8 @@ static const struct uniphier_pinctrl_group uniphier_ld6b_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
 	UNIPHIER_PINCTRL_GROUP(usb3),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range1),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port00, port_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port01, port_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port02, port_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port03, port_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port04, port_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port05, port_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port06, port_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port07, port_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port10, port_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port11, port_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port12, port_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port13, port_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port14, port_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port15, port_range0, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port16, port_range0, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port17, port_range0, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port20, port_range0, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port21, port_range0, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port22, port_range0, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port23, port_range0, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port24, port_range0, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port25, port_range0, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port26, port_range0, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port27, port_range0, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port30, port_range0, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port31, port_range0, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port32, port_range0, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port33, port_range0, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port34, port_range0, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port35, port_range0, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port36, port_range0, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port37, port_range0, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port40, port_range0, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port41, port_range0, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port42, port_range0, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port43, port_range0, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port44, port_range0, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port45, port_range0, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port46, port_range0, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port47, port_range0, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port50, port_range0, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port51, port_range0, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port52, port_range0, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port53, port_range0, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port54, port_range0, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port55, port_range0, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port56, port_range0, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port57, port_range0, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port60, port_range0, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port61, port_range0, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port62, port_range0, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port63, port_range0, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port64, port_range0, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port65, port_range0, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port66, port_range0, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port67, port_range0, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port70, port_range0, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port71, port_range0, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port72, port_range0, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port73, port_range0, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port74, port_range0, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port75, port_range0, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port76, port_range0, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port77, port_range0, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port80, port_range0, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port81, port_range0, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port82, port_range0, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port83, port_range0, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port84, port_range0, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port85, port_range0, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port86, port_range0, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port87, port_range0, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port90, port_range0, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port91, port_range0, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port92, port_range0, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port93, port_range0, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port94, port_range0, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port95, port_range0, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port96, port_range0, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port97, port_range0, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port100, port_range0, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port101, port_range0, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port102, port_range0, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port103, port_range0, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port104, port_range0, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port105, port_range0, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port106, port_range0, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port107, port_range0, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port120, port_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port121, port_range1, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port122, port_range1, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port123, port_range1, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port124, port_range1, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port125, port_range1, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port126, port_range1, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port127, port_range1, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port130, port_range1, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port131, port_range1, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port132, port_range1, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port133, port_range1, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port134, port_range1, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port135, port_range1, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port136, port_range1, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port137, port_range1, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port140, port_range1, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port141, port_range1, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port142, port_range1, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port143, port_range1, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port144, port_range1, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port145, port_range1, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port146, port_range1, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port147, port_range1, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port150, port_range1, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port151, port_range1, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port152, port_range1, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port153, port_range1, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port154, port_range1, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port155, port_range1, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port156, port_range1, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port157, port_range1, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port160, port_range1, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port161, port_range1, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port162, port_range1, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port163, port_range1, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port164, port_range1, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port165, port_range1, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port166, port_range1, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port167, port_range1, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port170, port_range1, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port171, port_range1, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port172, port_range1, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port173, port_range1, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port174, port_range1, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port175, port_range1, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port176, port_range1, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port177, port_range1, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port180, port_range1, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port181, port_range1, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port182, port_range1, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port183, port_range1, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port184, port_range1, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port185, port_range1, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port186, port_range1, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port187, port_range1, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port190, port_range1, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port191, port_range1, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port192, port_range1, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port193, port_range1, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port194, port_range1, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port195, port_range1, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port196, port_range1, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port197, port_range1, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port200, port_range1, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port201, port_range1, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port202, port_range1, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port203, port_range1, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port204, port_range1, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port205, port_range1, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port206, port_range1, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port207, port_range1, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port210, port_range1, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port211, port_range1, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port212, port_range1, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port213, port_range1, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port214, port_range1, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port215, port_range1, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port216, port_range1, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port217, port_range1, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port220, port_range1, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port221, port_range1, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port222, port_range1, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port223, port_range1, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port224, port_range1, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port225, port_range1, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port226, port_range1, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port227, port_range1, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port230, port_range1, 88),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port231, port_range1, 89),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port232, port_range1, 90),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port233, port_range1, 91),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port234, port_range1, 92),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port235, port_range1, 93),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port236, port_range1, 94),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port237, port_range1, 95),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port240, port_range1, 96),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port241, port_range1, 97),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port242, port_range1, 98),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port243, port_range1, 99),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port244, port_range1, 100),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port245, port_range1, 101),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port246, port_range1, 102),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port247, port_range1, 103),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port250, port_range1, 104),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port251, port_range1, 105),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port252, port_range1, 106),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port253, port_range1, 107),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port254, port_range1, 108),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port255, port_range1, 109),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port256, port_range1, 110),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port257, port_range1, 111),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port260, port_range1, 112),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port261, port_range1, 113),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port262, port_range1, 114),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port263, port_range1, 115),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port264, port_range1, 116),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port265, port_range1, 117),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port266, port_range1, 118),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port267, port_range1, 119),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port270, port_range1, 120),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port271, port_range1, 121),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port272, port_range1, 122),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port273, port_range1, 123),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port274, port_range1, 124),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port275, port_range1, 125),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port276, port_range1, 126),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port277, port_range1, 127),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port280, port_range1, 128),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port281, port_range1, 129),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port282, port_range1, 130),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port283, port_range1, 131),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port284, port_range1, 132),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port285, port_range1, 133),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port286, port_range1, 134),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port287, port_range1, 135),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0, xirq, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1, xirq, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2, xirq, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3, xirq, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4, xirq, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5, xirq, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6, xirq, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7, xirq, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8, xirq, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9, xirq, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10, xirq, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11, xirq, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq12, xirq, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13, xirq, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14, xirq, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq15, xirq, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16, xirq, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17, xirq, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18, xirq, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19, xirq, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20, xirq, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq21, xirq, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq22, xirq, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq23, xirq, 23),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range0),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range1),
 };
 
 static const char * const adinter_groups[] = {"adinter"};
@@ -1183,73 +892,6 @@ static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
 static const char * const usb3_groups[] = {"usb3"};
-static const char * const port_groups[] = {
-	"port00",  "port01",  "port02",  "port03",
-	"port04",  "port05",  "port06",  "port07",
-	"port10",  "port11",  "port12",  "port13",
-	"port14",  "port15",  "port16",  "port17",
-	"port20",  "port21",  "port22",  "port23",
-	"port24",  "port25",  "port26",  "port27",
-	"port30",  "port31",  "port32",  "port33",
-	"port34",  "port35",  "port36",  "port37",
-	"port40",  "port41",  "port42",  "port43",
-	"port44",  "port45",  "port46",  "port47",
-	"port50",  "port51",  "port52",  "port53",
-	"port54",  "port55",  "port56",  "port57",
-	"port60",  "port61",  "port62",  "port63",
-	"port64",  "port65",  "port66",  "port67",
-	"port70",  "port71",  "port72",  "port73",
-	"port74",  "port75",  "port76",  "port77",
-	"port80",  "port81",  "port82",  "port83",
-	"port84",  "port85",  "port86",  "port87",
-	"port90",  "port91",  "port92",  "port93",
-	"port94",  "port95",  "port96",  "port97",
-	"port100", "port101", "port102", "port103",
-	"port104", "port105", "port106", "port107",
-	/* port110-117 missing */
-	"port120", "port121", "port122", "port123",
-	"port124", "port125", "port126", "port127",
-	"port130", "port131", "port132", "port133",
-	"port134", "port135", "port136", "port137",
-	"port140", "port141", "port142", "port143",
-	"port144", "port145", "port146", "port147",
-	"port150", "port151", "port152", "port153",
-	"port154", "port155", "port156", "port157",
-	"port160", "port161", "port162", "port163",
-	"port164", "port165", "port166", "port167",
-	"port170", "port171", "port172", "port173",
-	"port174", "port175", "port176", "port177",
-	"port180", "port181", "port182", "port183",
-	"port184", "port185", "port186", "port187",
-	"port190", "port191", "port192", "port193",
-	"port194", "port195", "port196", "port197",
-	"port200", "port201", "port202", "port203",
-	"port204", "port205", "port206", "port207",
-	"port210", "port211", "port212", "port213",
-	"port214", "port215", "port216", "port217",
-	"port220", "port221", "port222", "port223",
-	"port224", "port225", "port226", "port227",
-	"port230", "port231", "port232", "port233",
-	"port234", "port235", "port236", "port237",
-	"port240", "port241", "port242", "port243",
-	"port244", "port245", "port246", "port247",
-	"port250", "port251", "port252", "port253",
-	"port254", "port255", "port256", "port257",
-	"port260", "port261", "port262", "port263",
-	"port264", "port265", "port266", "port267",
-	"port270", "port271", "port272", "port273",
-	"port274", "port275", "port276", "port277",
-	"port280", "port281", "port282", "port283",
-	"port284", "port285", "port286", "port287",
-};
-static const char * const xirq_groups[] = {
-	"xirq0",  "xirq1",  "xirq2",  "xirq3",
-	"xirq4",  "xirq5",  "xirq6",  "xirq7",
-	"xirq8",  "xirq9",  "xirq10", "xirq11",
-	"xirq12", "xirq13", "xirq14", "xirq15",
-	"xirq16", "xirq17", "xirq18", "xirq19",
-	"xirq20", "xirq21", "xirq22", "xirq23",
-};
 
 static const struct uniphier_pinmux_function uniphier_ld6b_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(adinter), /* Achip-Dchip interconnect */
@@ -1270,10 +912,18 @@ static const struct uniphier_pinmux_function uniphier_ld6b_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
 	UNIPHIER_PINMUX_FUNCTION(usb3),
-	UNIPHIER_PINMUX_FUNCTION(port),
-	UNIPHIER_PINMUX_FUNCTION(xirq),
 };
 
+static int uniphier_ld6b_get_gpio_muxval(unsigned int pin,
+					 unsigned int gpio_offset)
+{
+	if (gpio_offset >= 120 && gpio_offset <= 143)	/* XIRQx */
+		/* 15 will do because XIRQ0-23 are aliases of PORT150-177. */
+		return 14;
+
+	return 15;
+}
+
 static struct uniphier_pinctrl_socdata uniphier_ld6b_pindata = {
 	.pins = uniphier_ld6b_pins,
 	.npins = ARRAY_SIZE(uniphier_ld6b_pins),
@@ -1281,6 +931,7 @@ static struct uniphier_pinctrl_socdata uniphier_ld6b_pindata = {
 	.groups_count = ARRAY_SIZE(uniphier_ld6b_groups),
 	.functions = uniphier_ld6b_functions,
 	.functions_count = ARRAY_SIZE(uniphier_ld6b_functions),
+	.get_gpio_muxval = uniphier_ld6b_get_gpio_muxval,
 	.caps = 0,
 };
 
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
index a433a306a2d0..1c95a4689eda 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro4.c
@@ -1086,87 +1086,38 @@ static const unsigned usb2_pins[] = {184, 185};
 static const int usb2_muxvals[] = {0, 0};
 static const unsigned usb3_pins[] = {186, 187};
 static const int usb3_muxvals[] = {0, 0};
-static const unsigned port_range0_pins[] = {
-	300, 301, 302, 303, 304, 305, 306, 307,		/* PORT0x */
-	308, 309, 310, 311, 312, 313, 314, 315,		/* PORT1x */
-	316, 317, 318, 16, 17, 18, 19, 20,		/* PORT2x */
-	21, 22, 23, 4, 93, 94, 95, 63,			/* PORT3x */
-	123, 122, 124, 125, 126, 141, 202, 203,		/* PORT4x */
-	204, 226, 227, 290, 291, 233, 280, 281,		/* PORT5x */
-	8, 7, 10, 29, 30, 48, 49, 50,			/* PORT6x */
-	40, 41, 42, 43, 44, 45, 46, 47,			/* PORT7x */
-	54, 51, 52, 53, 127, 128, 129, 130,		/* PORT8x */
-	131, 132, 57, 60, 134, 133, 135, 136,		/* PORT9x */
-	138, 137, 140, 139, 64, 65, 66, 67,		/* PORT10x */
-	107, 106, 105, 104, 113, 112, 111, 110,		/* PORT11x */
-	68, 69, 70, 71, 72, 73, 74, 75,			/* PORT12x */
-	76, 77, 78, 79, 80, 81, 82, 83,			/* PORT13x */
-	84, 85, 86, 87, 88, 89, 90, 91,			/* PORT14x */
-};
-static const int port_range0_muxvals[] = {
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT0x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT1x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT2x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT3x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT4x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT5x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT6x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT7x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT8x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT9x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT10x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT11x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT12x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT13x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT14x */
-};
-static const unsigned port_range1_pins[] = {
-	13, 14, 15,					/* PORT175-177 */
-	157, 158, 156, 154, 150, 151, 152, 153,		/* PORT18x */
-	326, 327, 325, 323, 319, 320, 321, 322,		/* PORT19x */
-	160, 161, 162, 163, 164, 165, 166, 167,		/* PORT20x */
-	168, 169, 170, 171, 172, 173, 174, 175,		/* PORT21x */
-	180, 181, 182, 183, 184, 185, 187, 188,		/* PORT22x */
-	193, 194, 195, 196, 197, 198, 199, 200,		/* PORT23x */
-	191, 192, 215, 216, 217, 218, 219, 220,		/* PORT24x */
-	222, 223, 224, 225, 228, 229, 230, 231,		/* PORT25x */
-	282, 283, 284, 285, 286, 287, 288, 289,		/* PORT26x */
-	292, 293, 294, 295, 296, 236, 237, 238,		/* PORT27x */
-	275, 276, 277, 278, 239, 240, 249, 250,		/* PORT28x */
-	251, 252, 261, 262, 263, 264, 273, 274,		/* PORT29x */
-	31, 32, 33, 34, 35, 36, 37, 38,			/* PORT30x */
-};
-static const int port_range1_muxvals[] = {
-	7, 7, 7,					/* PORT175-177 */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT18x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT19x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT20x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT21x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT22x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT23x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT24x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT25x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT26x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT27x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT28x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT29x */
-	7, 7, 7, 7, 7, 7, 7, 7,				/* PORT30x */
-};
-static const unsigned xirq_pins[] = {
-	11, 9, 12, 96, 97, 98, 108, 114,		/* XIRQ0-7 */
-	234, 186, 99, 100, 101, 102, 184, 301,		/* XIRQ8-15 */
-	302, 303, 304, 305, 306,			/* XIRQ16-20 */
-};
-static const int xirq_muxvals[] = {
-	7, 7, 7, 7, 7, 7, 7, 7,				/* XIRQ0-7 */
-	7, 7, 7, 7, 7, 7, 2, 2,				/* XIRQ8-15 */
-	2, 2, 2, 2, 2,					/* XIRQ16-20 */
-};
-static const unsigned xirq_alternatives_pins[] = {
-	184, 310, 316,
-};
-static const int xirq_alternatives_muxvals[] = {
-	2, 2, 2,
+static const unsigned int gpio_range_pins[] = {
+	300, 301, 302, 303, 304, 305, 306, 307,	/* PORT0x */
+	308, 309, 310, 311, 312, 313, 314, 315,	/* PORT1x */
+	316, 317, 318, 16, 17, 18, 19, 20,	/* PORT2x */
+	21, 22, 23, 4, 93, 94, 95, 63,		/* PORT3x */
+	123, 122, 124, 125, 126, 141, 202, 203,	/* PORT4x */
+	204, 226, 227, 290, 291, 233, 280, 281,	/* PORT5x */
+	8, 7, 10, 29, 30, 48, 49, 50,		/* PORT6x */
+	40, 41, 42, 43, 44, 45, 46, 47,		/* PORT7x */
+	54, 51, 52, 53, 127, 128, 129, 130,	/* PORT8x */
+	131, 132, 57, 60, 134, 133, 135, 136,	/* PORT9x */
+	138, 137, 140, 139, 64, 65, 66, 67,	/* PORT10x */
+	107, 106, 105, 104, 113, 112, 111, 110,	/* PORT11x */
+	68, 69, 70, 71, 72, 73, 74, 75,		/* PORT12x */
+	76, 77, 78, 79, 80, 81, 82, 83,		/* PORT13x */
+	84, 85, 86, 87, 88, 89, 90, 91,		/* PORT14x */
+	11, 9, 12, 96, 97, 98, 108, 114,	/* XIRQ0-7 */
+	234, 186, 99, 100, 101, 102, 300, 301,	/* XIRQ8-15 */
+	302, 303, 304, 305, 306, 13, 14, 15,	/* XIRQ16-20, PORT175-177 */
+	157, 158, 156, 154, 150, 151, 152, 153,	/* PORT18x */
+	326, 327, 325, 323, 319, 320, 321, 322,	/* PORT19x */
+	160, 161, 162, 163, 164, 165, 166, 167,	/* PORT20x */
+	168, 169, 170, 171, 172, 173, 174, 175,	/* PORT21x */
+	180, 181, 182, 183, 184, 185, 187, 188,	/* PORT22x */
+	193, 194, 195, 196, 197, 198, 199, 200,	/* PORT23x */
+	191, 192, 215, 216, 217, 218, 219, 220,	/* PORT24x */
+	222, 223, 224, 225, 228, 229, 230, 231,	/* PORT25x */
+	282, 283, 284, 285, 286, 287, 288, 289,	/* PORT26x */
+	292, 293, 294, 295, 296, 236, 237, 238,	/* PORT27x */
+	275, 276, 277, 278, 239, 240, 249, 250,	/* PORT28x */
+	251, 252, 261, 262, 263, 264, 273, 274,	/* PORT29x */
+	31, 32, 33, 34, 35, 36, 37, 38,		/* PORT30x */
 };
 
 static const struct uniphier_pinctrl_group uniphier_pro4_groups[] = {
@@ -1202,261 +1153,7 @@ static const struct uniphier_pinctrl_group uniphier_pro4_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
 	UNIPHIER_PINCTRL_GROUP(usb3),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range1),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq_alternatives),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port00, port_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port01, port_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port02, port_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port03, port_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port04, port_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port05, port_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port06, port_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port07, port_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port10, port_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port11, port_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port12, port_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port13, port_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port14, port_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port15, port_range0, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port16, port_range0, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port17, port_range0, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port20, port_range0, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port21, port_range0, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port22, port_range0, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port23, port_range0, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port24, port_range0, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port25, port_range0, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port26, port_range0, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port27, port_range0, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port30, port_range0, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port31, port_range0, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port32, port_range0, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port33, port_range0, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port34, port_range0, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port35, port_range0, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port36, port_range0, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port37, port_range0, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port40, port_range0, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port41, port_range0, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port42, port_range0, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port43, port_range0, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port44, port_range0, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port45, port_range0, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port46, port_range0, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port47, port_range0, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port50, port_range0, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port51, port_range0, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port52, port_range0, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port53, port_range0, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port54, port_range0, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port55, port_range0, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port56, port_range0, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port57, port_range0, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port60, port_range0, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port61, port_range0, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port62, port_range0, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port63, port_range0, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port64, port_range0, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port65, port_range0, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port66, port_range0, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port67, port_range0, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port70, port_range0, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port71, port_range0, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port72, port_range0, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port73, port_range0, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port74, port_range0, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port75, port_range0, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port76, port_range0, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port77, port_range0, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port80, port_range0, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port81, port_range0, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port82, port_range0, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port83, port_range0, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port84, port_range0, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port85, port_range0, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port86, port_range0, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port87, port_range0, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port90, port_range0, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port91, port_range0, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port92, port_range0, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port93, port_range0, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port94, port_range0, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port95, port_range0, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port96, port_range0, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port97, port_range0, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port100, port_range0, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port101, port_range0, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port102, port_range0, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port103, port_range0, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port104, port_range0, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port105, port_range0, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port106, port_range0, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port107, port_range0, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port110, port_range0, 88),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port111, port_range0, 89),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port112, port_range0, 90),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port113, port_range0, 91),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port114, port_range0, 92),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port115, port_range0, 93),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port116, port_range0, 94),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port117, port_range0, 95),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port120, port_range0, 96),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port121, port_range0, 97),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port122, port_range0, 98),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port123, port_range0, 99),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port124, port_range0, 100),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port125, port_range0, 101),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port126, port_range0, 102),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port127, port_range0, 103),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port130, port_range0, 104),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port131, port_range0, 105),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port132, port_range0, 106),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port133, port_range0, 107),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port134, port_range0, 108),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port135, port_range0, 109),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port136, port_range0, 110),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port137, port_range0, 111),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port140, port_range0, 112),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port141, port_range0, 113),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port142, port_range0, 114),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port143, port_range0, 115),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port144, port_range0, 116),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port145, port_range0, 117),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port146, port_range0, 118),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port147, port_range0, 119),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port175, port_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port176, port_range1, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port177, port_range1, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port180, port_range1, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port181, port_range1, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port182, port_range1, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port183, port_range1, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port184, port_range1, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port185, port_range1, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port186, port_range1, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port187, port_range1, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port190, port_range1, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port191, port_range1, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port192, port_range1, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port193, port_range1, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port194, port_range1, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port195, port_range1, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port196, port_range1, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port197, port_range1, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port200, port_range1, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port201, port_range1, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port202, port_range1, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port203, port_range1, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port204, port_range1, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port205, port_range1, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port206, port_range1, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port207, port_range1, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port210, port_range1, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port211, port_range1, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port212, port_range1, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port213, port_range1, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port214, port_range1, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port215, port_range1, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port216, port_range1, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port217, port_range1, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port220, port_range1, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port221, port_range1, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port222, port_range1, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port223, port_range1, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port224, port_range1, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port225, port_range1, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port226, port_range1, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port227, port_range1, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port230, port_range1, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port231, port_range1, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port232, port_range1, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port233, port_range1, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port234, port_range1, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port235, port_range1, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port236, port_range1, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port237, port_range1, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port240, port_range1, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port241, port_range1, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port242, port_range1, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port243, port_range1, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port244, port_range1, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port245, port_range1, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port246, port_range1, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port247, port_range1, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port250, port_range1, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port251, port_range1, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port252, port_range1, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port253, port_range1, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port254, port_range1, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port255, port_range1, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port256, port_range1, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port257, port_range1, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port260, port_range1, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port261, port_range1, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port262, port_range1, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port263, port_range1, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port264, port_range1, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port265, port_range1, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port266, port_range1, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port267, port_range1, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port270, port_range1, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port271, port_range1, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port272, port_range1, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port273, port_range1, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port274, port_range1, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port275, port_range1, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port276, port_range1, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port277, port_range1, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port280, port_range1, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port281, port_range1, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port282, port_range1, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port283, port_range1, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port284, port_range1, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port285, port_range1, 88),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port286, port_range1, 89),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port287, port_range1, 90),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port290, port_range1, 91),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port291, port_range1, 92),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port292, port_range1, 93),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port293, port_range1, 94),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port294, port_range1, 95),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port295, port_range1, 96),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port296, port_range1, 97),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port297, port_range1, 98),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port300, port_range1, 99),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port301, port_range1, 100),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port302, port_range1, 101),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port303, port_range1, 102),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port304, port_range1, 103),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port305, port_range1, 104),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port306, port_range1, 105),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port307, port_range1, 106),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0, xirq, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1, xirq, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2, xirq, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3, xirq, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4, xirq, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5, xirq, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6, xirq, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7, xirq, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8, xirq, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9, xirq, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10, xirq, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11, xirq, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq12, xirq, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13, xirq, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14, xirq, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq15, xirq, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16, xirq, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17, xirq, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18, xirq, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19, xirq, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20, xirq, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14b, xirq_alternatives, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17b, xirq_alternatives, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18b, xirq_alternatives, 2),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range),
 };
 
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
@@ -1488,75 +1185,6 @@ static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
 static const char * const usb3_groups[] = {"usb3"};
-static const char * const port_groups[] = {
-	"port00",  "port01",  "port02",  "port03",
-	"port04",  "port05",  "port06",  "port07",
-	"port10",  "port11",  "port12",  "port13",
-	"port14",  "port15",  "port16",  "port17",
-	"port20",  "port21",  "port22",  "port23",
-	"port24",  "port25",  "port26",  "port27",
-	"port30",  "port31",  "port32",  "port33",
-	"port34",  "port35",  "port36",  "port37",
-	"port40",  "port41",  "port42",  "port43",
-	"port44",  "port45",  "port46",  "port47",
-	"port50",  "port51",  "port52",  "port53",
-	"port54",  "port55",  "port56",  "port57",
-	"port60",  "port61",  "port62",  "port63",
-	"port64",  "port65",  "port66",  "port67",
-	"port70",  "port71",  "port72",  "port73",
-	"port74",  "port75",  "port76",  "port77",
-	"port80",  "port81",  "port82",  "port83",
-	"port84",  "port85",  "port86",  "port87",
-	"port90",  "port91",  "port92",  "port93",
-	"port94",  "port95",  "port96",  "port97",
-	"port100", "port101", "port102", "port103",
-	"port104", "port105", "port106", "port107",
-	"port110", "port111", "port112", "port113",
-	"port114", "port115", "port116", "port117",
-	"port120", "port121", "port122", "port123",
-	"port124", "port125", "port126", "port127",
-	"port130", "port131", "port132", "port133",
-	"port134", "port135", "port136", "port137",
-	"port140", "port141", "port142", "port143",
-	"port144", "port145", "port146", "port147",
-	/* port150-174 missing */
-	/* none */ "port175", "port176", "port177",
-	"port180", "port181", "port182", "port183",
-	"port184", "port185", "port186", "port187",
-	"port190", "port191", "port192", "port193",
-	"port194", "port195", "port196", "port197",
-	"port200", "port201", "port202", "port203",
-	"port204", "port205", "port206", "port207",
-	"port210", "port211", "port212", "port213",
-	"port214", "port215", "port216", "port217",
-	"port220", "port221", "port222", "port223",
-	"port224", "port225", "port226", "port227",
-	"port230", "port231", "port232", "port233",
-	"port234", "port235", "port236", "port237",
-	"port240", "port241", "port242", "port243",
-	"port244", "port245", "port246", "port247",
-	"port250", "port251", "port252", "port253",
-	"port254", "port255", "port256", "port257",
-	"port260", "port261", "port262", "port263",
-	"port264", "port265", "port266", "port267",
-	"port270", "port271", "port272", "port273",
-	"port274", "port275", "port276", "port277",
-	"port280", "port281", "port282", "port283",
-	"port284", "port285", "port286", "port287",
-	"port290", "port291", "port292", "port293",
-	"port294", "port295", "port296", "port297",
-	"port300", "port301", "port302", "port303",
-	"port304", "port305", "port306", "port307",
-};
-static const char * const xirq_groups[] = {
-	"xirq0",  "xirq1",  "xirq2",  "xirq3",
-	"xirq4",  "xirq5",  "xirq6",  "xirq7",
-	"xirq8",  "xirq9",  "xirq10", "xirq11",
-	"xirq12", "xirq13", "xirq14", "xirq15",
-	"xirq16", "xirq17", "xirq18", "xirq19",
-	"xirq20",
-	"xirq14b", "xirq17b", "xirq18b",
-};
 
 static const struct uniphier_pinmux_function uniphier_pro4_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(emmc),
@@ -1580,10 +1208,17 @@ static const struct uniphier_pinmux_function uniphier_pro4_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
 	UNIPHIER_PINMUX_FUNCTION(usb3),
-	UNIPHIER_PINMUX_FUNCTION(port),
-	UNIPHIER_PINMUX_FUNCTION(xirq),
 };
 
+static int uniphier_pro4_get_gpio_muxval(unsigned int pin,
+					 unsigned int gpio_offset)
+{
+	if (gpio_offset >= 134 && gpio_offset <= 140)	/* XIRQ14-20 */
+		return 2;
+
+	return 7;
+}
+
 static struct uniphier_pinctrl_socdata uniphier_pro4_pindata = {
 	.pins = uniphier_pro4_pins,
 	.npins = ARRAY_SIZE(uniphier_pro4_pins),
@@ -1591,6 +1226,7 @@ static struct uniphier_pinctrl_socdata uniphier_pro4_pindata = {
 	.groups_count = ARRAY_SIZE(uniphier_pro4_groups),
 	.functions = uniphier_pro4_functions,
 	.functions_count = ARRAY_SIZE(uniphier_pro4_functions),
+	.get_gpio_muxval = uniphier_pro4_get_gpio_muxval,
 	.caps = UNIPHIER_PINCTRL_CAPS_DBGMUX_SEPARATE,
 };
 
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
index 04d00c398eaf..d0d730b2e71e 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pro5.c
@@ -854,87 +854,38 @@ static const unsigned usb1_pins[] = {126, 127};
 static const int usb1_muxvals[] = {0, 0};
 static const unsigned usb2_pins[] = {128, 129};
 static const int usb2_muxvals[] = {0, 0};
-static const unsigned port_range0_pins[] = {
-	89, 90, 91, 92, 93, 94, 95, 96,			/* PORT0x */
-	97, 98, 99, 100, 101, 102, 103, 104,		/* PORT1x */
-	251, 252, 253, 254, 255, 247, 248, 249,		/* PORT2x */
-	39, 40, 41, 42, 43, 44, 45, 46,			/* PORT3x */
-	156, 157, 158, 159, 160, 161, 162, 163,		/* PORT4x */
-	164, 165, 166, 167, 168, 169, 170, 171,		/* PORT5x */
-	190, 191, 192, 193, 194, 195, 196, 197,		/* PORT6x */
-	198, 199, 200, 201, 202, 203, 204, 205,		/* PORT7x */
-	120, 121, 122, 123, 55, 56, 57, 58,		/* PORT8x */
-	124, 125, 126, 127, 49, 50, 53, 54,		/* PORT9x */
-	148, 149, 150, 151, 152, 153, 154, 155,		/* PORT10x */
-	133, 134, 131, 130, 138, 139, 136, 135,		/* PORT11x */
-	28, 29, 30, 31, 32, 33, 34, 35,			/* PORT12x */
-	179, 180, 181, 182, 186, 187, 188, 189,		/* PORT13x */
-	4, 5, 6, 7, 8, 9, 10, 11,			/* PORT14x */
-};
-static const int port_range0_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT0x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT1x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT2x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT3x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT4x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT5x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT6x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT7x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT8x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT9x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT10x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT11x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT12x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT13x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT14x */
-};
-static const unsigned port_range1_pins[] = {
-	109, 110, 111,					/* PORT175-177 */
-	206, 207, 208, 209, 210, 211, 212, 213,		/* PORT18x */
-	12, 13, 14, 15, 16, 17, 107, 108,		/* PORT19x */
-	140, 141, 142, 143, 144, 145, 146, 147,		/* PORT20x */
-	59, 60, 61, 62, 63, 64, 65, 66,			/* PORT21x */
-	214, 215, 216, 217, 218, 219, 220, 221,		/* PORT22x */
-	222, 223, 224, 225, 226, 227, 228, 229,		/* PORT23x */
-	19, 20, 21, 22, 23, 24, 25, 26,			/* PORT24x */
-	230, 231, 232, 233, 234, 235, 236, 237,		/* PORT25x */
-	239, 240, 241, 242, 243, 244, 245, 246,		/* PORT26x */
-	172, 173, 174, 175, 176, 177, 178, 129,		/* PORT27x */
-	0, 1, 2, 67, 85, 86, 87, 88,			/* PORT28x */
-	105, 106, 18, 27, 36, 128, 132, 137,		/* PORT29x */
-	183, 184, 185, 84, 47, 48, 51, 52,		/* PORT30x */
-};
-static const int port_range1_muxvals[] = {
-	15, 15, 15,					/* PORT175-177 */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT18x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT19x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT20x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT21x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT22x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT23x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT24x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT25x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT26x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT27x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT28x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT29x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT30x */
-};
-static const unsigned xirq_pins[] = {
-	68, 69, 70, 71, 72, 73, 74, 75,			/* XIRQ0-7 */
-	76, 77, 78, 79, 80, 81, 82, 83,			/* XIRQ8-15 */
-	84, 85, 86, 87, 88,				/* XIRQ16-20 */
-};
-static const int xirq_muxvals[] = {
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ0-7 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ8-15 */
-	14, 14, 14, 14, 14,				/* XIRQ16-20 */
-};
-static const unsigned xirq_alternatives_pins[] = {
-	91, 92, 239, 144, 240, 156, 241, 106, 128,
-};
-static const int xirq_alternatives_muxvals[] = {
-	14, 14, 14, 14, 14, 14, 14, 14, 14,
+static const unsigned int gpio_range_pins[] = {
+	89, 90, 91, 92, 93, 94, 95, 96,		/* PORT0x */
+	97, 98, 99, 100, 101, 102, 103, 104,	/* PORT1x */
+	251, 252, 253, 254, 255, 247, 248, 249,	/* PORT2x */
+	39, 40, 41, 42, 43, 44, 45, 46,		/* PORT3x */
+	156, 157, 158, 159, 160, 161, 162, 163,	/* PORT4x */
+	164, 165, 166, 167, 168, 169, 170, 171,	/* PORT5x */
+	190, 191, 192, 193, 194, 195, 196, 197,	/* PORT6x */
+	198, 199, 200, 201, 202, 203, 204, 205,	/* PORT7x */
+	120, 121, 122, 123, 55, 56, 57, 58,	/* PORT8x */
+	124, 125, 126, 127, 49, 50, 53, 54,	/* PORT9x */
+	148, 149, 150, 151, 152, 153, 154, 155,	/* PORT10x */
+	133, 134, 131, 130, 138, 139, 136, 135,	/* PORT11x */
+	28, 29, 30, 31, 32, 33, 34, 35,		/* PORT12x */
+	179, 180, 181, 182, 186, 187, 188, 189,	/* PORT13x */
+	4, 5, 6, 7, 8, 9, 10, 11,		/* PORT14x */
+	68, 69, 70, 71, 72, 73, 74, 75,		/* XIRQ0-7 */
+	76, 77, 78, 79, 80, 81, 82, 83,		/* XIRQ8-15 */
+	84, 85, 86, 87, 88, 109, 110, 111,	/* XIRQ16-20, PORT175-177 */
+	206, 207, 208, 209, 210, 211, 212, 213,	/* PORT18x */
+	12, 13, 14, 15, 16, 17, 107, 108,	/* PORT19x */
+	140, 141, 142, 143, 144, 145, 146, 147,	/* PORT20x */
+	59, 60, 61, 62, 63, 64, 65, 66,		/* PORT21x */
+	214, 215, 216, 217, 218, 219, 220, 221,	/* PORT22x */
+	222, 223, 224, 225, 226, 227, 228, 229,	/* PORT23x */
+	19, 20, 21, 22, 23, 24, 25, 26,		/* PORT24x */
+	230, 231, 232, 233, 234, 235, 236, 237,	/* PORT25x */
+	239, 240, 241, 242, 243, 244, 245, 246,	/* PORT26x */
+	172, 173, 174, 175, 176, 177, 178, 129,	/* PORT27x */
+	0, 1, 2, 67, 85, 86, 87, 88,		/* PORT28x */
+	105, 106, 18, 27, 36, 128, 132, 137,	/* PORT29x */
+	183, 184, 185, 84, 47, 48, 51, 52,	/* PORT30x */
 };
 
 static const struct uniphier_pinctrl_group uniphier_pro5_groups[] = {
@@ -968,267 +919,7 @@ static const struct uniphier_pinctrl_group uniphier_pro5_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb0),
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range1),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq_alternatives),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port00, port_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port01, port_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port02, port_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port03, port_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port04, port_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port05, port_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port06, port_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port07, port_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port10, port_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port11, port_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port12, port_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port13, port_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port14, port_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port15, port_range0, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port16, port_range0, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port17, port_range0, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port20, port_range0, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port21, port_range0, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port22, port_range0, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port23, port_range0, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port24, port_range0, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port25, port_range0, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port26, port_range0, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port27, port_range0, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port30, port_range0, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port31, port_range0, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port32, port_range0, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port33, port_range0, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port34, port_range0, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port35, port_range0, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port36, port_range0, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port37, port_range0, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port40, port_range0, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port41, port_range0, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port42, port_range0, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port43, port_range0, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port44, port_range0, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port45, port_range0, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port46, port_range0, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port47, port_range0, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port50, port_range0, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port51, port_range0, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port52, port_range0, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port53, port_range0, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port54, port_range0, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port55, port_range0, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port56, port_range0, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port57, port_range0, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port60, port_range0, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port61, port_range0, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port62, port_range0, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port63, port_range0, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port64, port_range0, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port65, port_range0, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port66, port_range0, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port67, port_range0, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port70, port_range0, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port71, port_range0, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port72, port_range0, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port73, port_range0, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port74, port_range0, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port75, port_range0, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port76, port_range0, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port77, port_range0, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port80, port_range0, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port81, port_range0, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port82, port_range0, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port83, port_range0, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port84, port_range0, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port85, port_range0, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port86, port_range0, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port87, port_range0, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port90, port_range0, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port91, port_range0, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port92, port_range0, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port93, port_range0, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port94, port_range0, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port95, port_range0, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port96, port_range0, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port97, port_range0, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port100, port_range0, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port101, port_range0, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port102, port_range0, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port103, port_range0, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port104, port_range0, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port105, port_range0, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port106, port_range0, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port107, port_range0, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port110, port_range0, 88),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port111, port_range0, 89),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port112, port_range0, 90),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port113, port_range0, 91),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port114, port_range0, 92),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port115, port_range0, 93),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port116, port_range0, 94),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port117, port_range0, 95),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port120, port_range0, 96),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port121, port_range0, 97),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port122, port_range0, 98),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port123, port_range0, 99),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port124, port_range0, 100),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port125, port_range0, 101),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port126, port_range0, 102),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port127, port_range0, 103),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port130, port_range0, 104),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port131, port_range0, 105),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port132, port_range0, 106),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port133, port_range0, 107),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port134, port_range0, 108),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port135, port_range0, 109),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port136, port_range0, 110),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port137, port_range0, 111),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port140, port_range0, 112),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port141, port_range0, 113),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port142, port_range0, 114),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port143, port_range0, 115),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port144, port_range0, 116),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port145, port_range0, 117),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port146, port_range0, 118),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port147, port_range0, 119),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port175, port_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port176, port_range1, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port177, port_range1, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port180, port_range1, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port181, port_range1, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port182, port_range1, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port183, port_range1, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port184, port_range1, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port185, port_range1, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port186, port_range1, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port187, port_range1, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port190, port_range1, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port191, port_range1, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port192, port_range1, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port193, port_range1, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port194, port_range1, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port195, port_range1, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port196, port_range1, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port197, port_range1, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port200, port_range1, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port201, port_range1, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port202, port_range1, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port203, port_range1, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port204, port_range1, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port205, port_range1, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port206, port_range1, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port207, port_range1, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port210, port_range1, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port211, port_range1, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port212, port_range1, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port213, port_range1, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port214, port_range1, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port215, port_range1, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port216, port_range1, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port217, port_range1, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port220, port_range1, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port221, port_range1, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port222, port_range1, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port223, port_range1, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port224, port_range1, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port225, port_range1, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port226, port_range1, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port227, port_range1, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port230, port_range1, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port231, port_range1, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port232, port_range1, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port233, port_range1, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port234, port_range1, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port235, port_range1, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port236, port_range1, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port237, port_range1, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port240, port_range1, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port241, port_range1, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port242, port_range1, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port243, port_range1, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port244, port_range1, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port245, port_range1, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port246, port_range1, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port247, port_range1, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port250, port_range1, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port251, port_range1, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port252, port_range1, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port253, port_range1, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port254, port_range1, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port255, port_range1, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port256, port_range1, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port257, port_range1, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port260, port_range1, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port261, port_range1, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port262, port_range1, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port263, port_range1, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port264, port_range1, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port265, port_range1, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port266, port_range1, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port267, port_range1, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port270, port_range1, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port271, port_range1, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port272, port_range1, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port273, port_range1, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port274, port_range1, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port275, port_range1, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port276, port_range1, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port277, port_range1, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port280, port_range1, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port281, port_range1, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port282, port_range1, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port283, port_range1, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port284, port_range1, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port285, port_range1, 88),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port286, port_range1, 89),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port287, port_range1, 90),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port290, port_range1, 91),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port291, port_range1, 92),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port292, port_range1, 93),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port293, port_range1, 94),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port294, port_range1, 95),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port295, port_range1, 96),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port296, port_range1, 97),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port297, port_range1, 98),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port300, port_range1, 99),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port301, port_range1, 100),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port302, port_range1, 101),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port303, port_range1, 102),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port304, port_range1, 103),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port305, port_range1, 104),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port306, port_range1, 105),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port307, port_range1, 106),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0, xirq, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1, xirq, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2, xirq, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3, xirq, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4, xirq, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5, xirq, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6, xirq, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7, xirq, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8, xirq, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9, xirq, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10, xirq, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11, xirq, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq12, xirq, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13, xirq, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14, xirq, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq15, xirq, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16, xirq, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17, xirq, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18, xirq, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19, xirq, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20, xirq, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3b, xirq_alternatives, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4b, xirq_alternatives, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16b, xirq_alternatives, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17b, xirq_alternatives, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17c, xirq_alternatives, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18b, xirq_alternatives, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18c, xirq_alternatives, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19b, xirq_alternatives, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20b, xirq_alternatives, 8),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range),
 };
 
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
@@ -1256,76 +947,6 @@ static const char * const uart3_groups[] = {"uart3"};
 static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
-static const char * const port_groups[] = {
-	"port00",  "port01",  "port02",  "port03",
-	"port04",  "port05",  "port06",  "port07",
-	"port10",  "port11",  "port12",  "port13",
-	"port14",  "port15",  "port16",  "port17",
-	"port20",  "port21",  "port22",  "port23",
-	"port24",  "port25",  "port26",  "port27",
-	"port30",  "port31",  "port32",  "port33",
-	"port34",  "port35",  "port36",  "port37",
-	"port40",  "port41",  "port42",  "port43",
-	"port44",  "port45",  "port46",  "port47",
-	"port50",  "port51",  "port52",  "port53",
-	"port54",  "port55",  "port56",  "port57",
-	"port60",  "port61",  "port62",  "port63",
-	"port64",  "port65",  "port66",  "port67",
-	"port70",  "port71",  "port72",  "port73",
-	"port74",  "port75",  "port76",  "port77",
-	"port80",  "port81",  "port82",  "port83",
-	"port84",  "port85",  "port86",  "port87",
-	"port90",  "port91",  "port92",  "port93",
-	"port94",  "port95",  "port96",  "port97",
-	"port100", "port101", "port102", "port103",
-	"port104", "port105", "port106", "port107",
-	"port110", "port111", "port112", "port113",
-	"port114", "port115", "port116", "port117",
-	"port120", "port121", "port122", "port123",
-	"port124", "port125", "port126", "port127",
-	"port130", "port131", "port132", "port133",
-	"port134", "port135", "port136", "port137",
-	"port140", "port141", "port142", "port143",
-	"port144", "port145", "port146", "port147",
-	/* port150-174 missing */
-	/* none */ "port175", "port176", "port177",
-	"port180", "port181", "port182", "port183",
-	"port184", "port185", "port186", "port187",
-	"port190", "port191", "port192", "port193",
-	"port194", "port195", "port196", "port197",
-	"port200", "port201", "port202", "port203",
-	"port204", "port205", "port206", "port207",
-	"port210", "port211", "port212", "port213",
-	"port214", "port215", "port216", "port217",
-	"port220", "port221", "port222", "port223",
-	"port224", "port225", "port226", "port227",
-	"port230", "port231", "port232", "port233",
-	"port234", "port235", "port236", "port237",
-	"port240", "port241", "port242", "port243",
-	"port244", "port245", "port246", "port247",
-	"port250", "port251", "port252", "port253",
-	"port254", "port255", "port256", "port257",
-	"port260", "port261", "port262", "port263",
-	"port264", "port265", "port266", "port267",
-	"port270", "port271", "port272", "port273",
-	"port274", "port275", "port276", "port277",
-	"port280", "port281", "port282", "port283",
-	"port284", "port285", "port286", "port287",
-	"port290", "port291", "port292", "port293",
-	"port294", "port295", "port296", "port297",
-	"port300", "port301", "port302", "port303",
-	"port304", "port305", "port306", "port307",
-};
-static const char * const xirq_groups[] = {
-	"xirq0",  "xirq1",  "xirq2",  "xirq3",
-	"xirq4",  "xirq5",  "xirq6",  "xirq7",
-	"xirq8",  "xirq9",  "xirq10", "xirq11",
-	"xirq12", "xirq13", "xirq14", "xirq15",
-	"xirq16", "xirq17", "xirq18", "xirq19",
-	"xirq20",
-	"xirq3b", "xirq4b", "xirq16b", "xirq17b", "xirq17c",
-	"xirq18b", "xirq18c", "xirq19b", "xirq20b",
-};
 
 static const struct uniphier_pinmux_function uniphier_pro5_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(emmc),
@@ -1345,10 +966,17 @@ static const struct uniphier_pinmux_function uniphier_pro5_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb0),
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
-	UNIPHIER_PINMUX_FUNCTION(port),
-	UNIPHIER_PINMUX_FUNCTION(xirq),
 };
 
+static int uniphier_pro5_get_gpio_muxval(unsigned int pin,
+					 unsigned int gpio_offset)
+{
+	if (gpio_offset >= 120 && gpio_offset <= 141)	/* XIRQ0-20 */
+		return 14;
+
+	return 15;
+}
+
 static struct uniphier_pinctrl_socdata uniphier_pro5_pindata = {
 	.pins = uniphier_pro5_pins,
 	.npins = ARRAY_SIZE(uniphier_pro5_pins),
@@ -1356,6 +984,7 @@ static struct uniphier_pinctrl_socdata uniphier_pro5_pindata = {
 	.groups_count = ARRAY_SIZE(uniphier_pro5_groups),
 	.functions = uniphier_pro5_functions,
 	.functions_count = ARRAY_SIZE(uniphier_pro5_functions),
+	.get_gpio_muxval = uniphier_pro5_get_gpio_muxval,
 	.caps = UNIPHIER_PINCTRL_CAPS_DBGMUX_SEPARATE,
 };
 
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
index 53b6b774654e..e323c3e19a41 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-pxs2.c
@@ -790,7 +790,7 @@ static const unsigned usb2_pins[] = {60, 61};
 static const int usb2_muxvals[] = {8, 8};
 static const unsigned usb3_pins[] = {62, 63};
 static const int usb3_muxvals[] = {8, 8};
-static const unsigned port_range0_pins[] = {
+static const unsigned int gpio_range0_pins[] = {
 	127, 128, 129, 130, 131, 132, 133, 134,		/* PORT0x */
 	135, 136, 137, 138, 139, 140, 141, 142,		/* PORT1x */
 	0, 1, 2, 3, 4, 5, 6, 7,				/* PORT2x */
@@ -803,26 +803,13 @@ static const unsigned port_range0_pins[] = {
 	61, 62, 63, 64, 65, 66, 67, 68,			/* PORT9x */
 	69, 70, 71, 76, 77, 78, 79, 80,			/* PORT10x */
 };
-static const int port_range0_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT0x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT1x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT2x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT3x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT4x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT5x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT6x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT7x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT8x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT9x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT10x */
-};
-static const unsigned port_range1_pins[] = {
+static const unsigned int gpio_range1_pins[] = {
 	81, 82, 83, 84, 85, 86, 87, 88,			/* PORT12x */
 	89, 90, 95, 96, 97, 98, 99, 100,		/* PORT13x */
 	101, 102, 103, 104, 105, 106, 107, 108,		/* PORT14x */
-	118, 119, 120, 121, 122, 123, 124, 125,		/* PORT15x */
-	126, 72, 73, 92, 177, 93, 94, 176,		/* PORT16x */
-	74, 91, 27, 28, 29, 75, 20, 26,			/* PORT17x */
+	118, 119, 120, 121, 122, 123, 124, 125,		/* XIRQ0-7 */
+	126, 72, 73, 92, 177, 93, 94, 176,		/* XIRQ8-15 */
+	74, 91, 27, 28, 29, 75, 20, 26,			/* XIRQ16-23 */
 	109, 110, 111, 112, 113, 114, 115, 116,		/* PORT18x */
 	117, 143, 144, 145, 146, 147, 148, 149,		/* PORT19x */
 	150, 151, 152, 153, 154, 155, 156, 157,		/* PORT20x */
@@ -835,35 +822,6 @@ static const unsigned port_range1_pins[] = {
 	218, 219, 220, 221, 223, 224, 225, 226,		/* PORT27x */
 	227, 228, 229, 230, 231, 232, 233, 234,		/* PORT28x */
 };
-static const int port_range1_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT12x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT13x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT14x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT15x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT16x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT17x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT18x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT19x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT20x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT21x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT22x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT23x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT24x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT25x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT26x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT27x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT28x */
-};
-static const unsigned xirq_pins[] = {
-	118, 119, 120, 121, 122, 123, 124, 125,		/* XIRQ0-7 */
-	126, 72, 73, 92, 177, 93, 94, 176,		/* XIRQ8-15 */
-	74, 91, 27, 28, 29, 75, 20, 26,			/* XIRQ16-23 */
-};
-static const int xirq_muxvals[] = {
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ0-7 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ8-15 */
-	14, 14, 14, 14, 14, 14, 14, 14,			/* XIRQ16-23 */
-};
 
 static const struct uniphier_pinctrl_group uniphier_pxs2_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(emmc),
@@ -892,257 +850,8 @@ static const struct uniphier_pinctrl_group uniphier_pxs2_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
 	UNIPHIER_PINCTRL_GROUP(usb3),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range1),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port00, port_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port01, port_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port02, port_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port03, port_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port04, port_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port05, port_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port06, port_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port07, port_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port10, port_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port11, port_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port12, port_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port13, port_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port14, port_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port15, port_range0, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port16, port_range0, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port17, port_range0, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port20, port_range0, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port21, port_range0, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port22, port_range0, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port23, port_range0, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port24, port_range0, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port25, port_range0, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port26, port_range0, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port27, port_range0, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port30, port_range0, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port31, port_range0, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port32, port_range0, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port33, port_range0, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port34, port_range0, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port35, port_range0, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port36, port_range0, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port37, port_range0, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port40, port_range0, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port41, port_range0, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port42, port_range0, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port43, port_range0, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port44, port_range0, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port45, port_range0, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port46, port_range0, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port47, port_range0, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port50, port_range0, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port51, port_range0, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port52, port_range0, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port53, port_range0, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port54, port_range0, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port55, port_range0, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port56, port_range0, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port57, port_range0, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port60, port_range0, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port61, port_range0, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port62, port_range0, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port63, port_range0, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port64, port_range0, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port65, port_range0, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port66, port_range0, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port67, port_range0, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port70, port_range0, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port71, port_range0, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port72, port_range0, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port73, port_range0, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port74, port_range0, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port75, port_range0, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port76, port_range0, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port77, port_range0, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port80, port_range0, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port81, port_range0, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port82, port_range0, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port83, port_range0, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port84, port_range0, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port85, port_range0, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port86, port_range0, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port87, port_range0, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port90, port_range0, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port91, port_range0, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port92, port_range0, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port93, port_range0, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port94, port_range0, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port95, port_range0, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port96, port_range0, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port97, port_range0, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port100, port_range0, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port101, port_range0, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port102, port_range0, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port103, port_range0, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port104, port_range0, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port105, port_range0, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port106, port_range0, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port107, port_range0, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port120, port_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port121, port_range1, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port122, port_range1, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port123, port_range1, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port124, port_range1, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port125, port_range1, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port126, port_range1, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port127, port_range1, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port130, port_range1, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port131, port_range1, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port132, port_range1, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port133, port_range1, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port134, port_range1, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port135, port_range1, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port136, port_range1, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port137, port_range1, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port140, port_range1, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port141, port_range1, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port142, port_range1, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port143, port_range1, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port144, port_range1, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port145, port_range1, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port146, port_range1, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port147, port_range1, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port150, port_range1, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port151, port_range1, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port152, port_range1, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port153, port_range1, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port154, port_range1, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port155, port_range1, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port156, port_range1, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port157, port_range1, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port160, port_range1, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port161, port_range1, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port162, port_range1, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port163, port_range1, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port164, port_range1, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port165, port_range1, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port166, port_range1, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port167, port_range1, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port170, port_range1, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port171, port_range1, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port172, port_range1, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port173, port_range1, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port174, port_range1, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port175, port_range1, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port176, port_range1, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port177, port_range1, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port180, port_range1, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port181, port_range1, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port182, port_range1, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port183, port_range1, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port184, port_range1, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port185, port_range1, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port186, port_range1, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port187, port_range1, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port190, port_range1, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port191, port_range1, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port192, port_range1, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port193, port_range1, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port194, port_range1, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port195, port_range1, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port196, port_range1, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port197, port_range1, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port200, port_range1, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port201, port_range1, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port202, port_range1, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port203, port_range1, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port204, port_range1, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port205, port_range1, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port206, port_range1, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port207, port_range1, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port210, port_range1, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port211, port_range1, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port212, port_range1, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port213, port_range1, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port214, port_range1, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port215, port_range1, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port216, port_range1, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port217, port_range1, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port220, port_range1, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port221, port_range1, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port222, port_range1, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port223, port_range1, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port224, port_range1, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port225, port_range1, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port226, port_range1, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port227, port_range1, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port230, port_range1, 88),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port231, port_range1, 89),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port232, port_range1, 90),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port233, port_range1, 91),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port234, port_range1, 92),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port235, port_range1, 93),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port236, port_range1, 94),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port237, port_range1, 95),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port240, port_range1, 96),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port241, port_range1, 97),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port242, port_range1, 98),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port243, port_range1, 99),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port244, port_range1, 100),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port245, port_range1, 101),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port246, port_range1, 102),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port247, port_range1, 103),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port250, port_range1, 104),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port251, port_range1, 105),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port252, port_range1, 106),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port253, port_range1, 107),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port254, port_range1, 108),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port255, port_range1, 109),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port256, port_range1, 110),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port257, port_range1, 111),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port260, port_range1, 112),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port261, port_range1, 113),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port262, port_range1, 114),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port263, port_range1, 115),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port264, port_range1, 116),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port265, port_range1, 117),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port266, port_range1, 118),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port267, port_range1, 119),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port270, port_range1, 120),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port271, port_range1, 121),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port272, port_range1, 122),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port273, port_range1, 123),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port274, port_range1, 124),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port275, port_range1, 125),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port276, port_range1, 126),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port277, port_range1, 127),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port280, port_range1, 128),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port281, port_range1, 129),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port282, port_range1, 130),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port283, port_range1, 131),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port284, port_range1, 132),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port285, port_range1, 133),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port286, port_range1, 134),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port287, port_range1, 135),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0, xirq, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1, xirq, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2, xirq, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3, xirq, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4, xirq, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5, xirq, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6, xirq, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7, xirq, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8, xirq, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9, xirq, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10, xirq, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11, xirq, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq12, xirq, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq13, xirq, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14, xirq, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq15, xirq, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq16, xirq, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq17, xirq, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq18, xirq, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq19, xirq, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq20, xirq, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq21, xirq, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq22, xirq, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq23, xirq, 23),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range0),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range1),
 };
 
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
@@ -1167,73 +876,6 @@ static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
 static const char * const usb3_groups[] = {"usb3"};
-static const char * const port_groups[] = {
-	"port00",  "port01",  "port02",  "port03",
-	"port04",  "port05",  "port06",  "port07",
-	"port10",  "port11",  "port12",  "port13",
-	"port14",  "port15",  "port16",  "port17",
-	"port20",  "port21",  "port22",  "port23",
-	"port24",  "port25",  "port26",  "port27",
-	"port30",  "port31",  "port32",  "port33",
-	"port34",  "port35",  "port36",  "port37",
-	"port40",  "port41",  "port42",  "port43",
-	"port44",  "port45",  "port46",  "port47",
-	"port50",  "port51",  "port52",  "port53",
-	"port54",  "port55",  "port56",  "port57",
-	"port60",  "port61",  "port62",  "port63",
-	"port64",  "port65",  "port66",  "port67",
-	"port70",  "port71",  "port72",  "port73",
-	"port74",  "port75",  "port76",  "port77",
-	"port80",  "port81",  "port82",  "port83",
-	"port84",  "port85",  "port86",  "port87",
-	"port90",  "port91",  "port92",  "port93",
-	"port94",  "port95",  "port96",  "port97",
-	"port100", "port101", "port102", "port103",
-	"port104", "port105", "port106", "port107",
-	/* port110-117 missing */
-	"port120", "port121", "port122", "port123",
-	"port124", "port125", "port126", "port127",
-	"port130", "port131", "port132", "port133",
-	"port134", "port135", "port136", "port137",
-	"port140", "port141", "port142", "port143",
-	"port144", "port145", "port146", "port147",
-	"port150", "port151", "port152", "port153",
-	"port154", "port155", "port156", "port157",
-	"port160", "port161", "port162", "port163",
-	"port164", "port165", "port166", "port167",
-	"port170", "port171", "port172", "port173",
-	"port174", "port175", "port176", "port177",
-	"port180", "port181", "port182", "port183",
-	"port184", "port185", "port186", "port187",
-	"port190", "port191", "port192", "port193",
-	"port194", "port195", "port196", "port197",
-	"port200", "port201", "port202", "port203",
-	"port204", "port205", "port206", "port207",
-	"port210", "port211", "port212", "port213",
-	"port214", "port215", "port216", "port217",
-	"port220", "port221", "port222", "port223",
-	"port224", "port225", "port226", "port227",
-	"port230", "port231", "port232", "port233",
-	"port234", "port235", "port236", "port237",
-	"port240", "port241", "port242", "port243",
-	"port244", "port245", "port246", "port247",
-	"port250", "port251", "port252", "port253",
-	"port254", "port255", "port256", "port257",
-	"port260", "port261", "port262", "port263",
-	"port264", "port265", "port266", "port267",
-	"port270", "port271", "port272", "port273",
-	"port274", "port275", "port276", "port277",
-	"port280", "port281", "port282", "port283",
-	"port284", "port285", "port286", "port287",
-};
-static const char * const xirq_groups[] = {
-	"xirq0",  "xirq1",  "xirq2",  "xirq3",
-	"xirq4",  "xirq5",  "xirq6",  "xirq7",
-	"xirq8",  "xirq9",  "xirq10", "xirq11",
-	"xirq12", "xirq13", "xirq14", "xirq15",
-	"xirq16", "xirq17", "xirq18", "xirq19",
-	"xirq20", "xirq21", "xirq22", "xirq23",
-};
 
 static const struct uniphier_pinmux_function uniphier_pxs2_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(emmc),
@@ -1257,10 +899,18 @@ static const struct uniphier_pinmux_function uniphier_pxs2_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
 	UNIPHIER_PINMUX_FUNCTION(usb3),
-	UNIPHIER_PINMUX_FUNCTION(port),
-	UNIPHIER_PINMUX_FUNCTION(xirq),
 };
 
+static int uniphier_pxs2_get_gpio_muxval(unsigned int pin,
+					 unsigned int gpio_offset)
+{
+	if (gpio_offset >= 120 && gpio_offset <= 143)	/* XIRQx */
+		/* 15 will do because XIRQ0-23 are aliases of PORT150-177. */
+		return 14;
+
+	return 15;
+}
+
 static struct uniphier_pinctrl_socdata uniphier_pxs2_pindata = {
 	.pins = uniphier_pxs2_pins,
 	.npins = ARRAY_SIZE(uniphier_pxs2_pins),
@@ -1268,6 +918,7 @@ static struct uniphier_pinctrl_socdata uniphier_pxs2_pindata = {
 	.groups_count = ARRAY_SIZE(uniphier_pxs2_groups),
 	.functions = uniphier_pxs2_functions,
 	.functions_count = ARRAY_SIZE(uniphier_pxs2_functions),
+	.get_gpio_muxval = uniphier_pxs2_get_gpio_muxval,
 	.caps = 0,
 };
 
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c b/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
index 37deaf615dcf..f0221e93aa25 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier-sld8.c
@@ -532,67 +532,28 @@ static const unsigned usb1_pins[] = {43, 44};
 static const int usb1_muxvals[] = {0, 0};
 static const unsigned usb2_pins[] = {114, 115};
 static const int usb2_muxvals[] = {1, 1};
-static const unsigned port_range0_pins[] = {
-	0, 1, 2, 3, 4, 5, 6, 7,				/* PORT0x */
-	8, 9, 10, 11, 12, 13, 14, 15,			/* PORT1x */
-	32, 33, 34, 35, 36, 37, 38, 39,			/* PORT2x */
-	59, 60, 61, 62, 63, 64, 65, 66,			/* PORT3x */
-	95, 96, 97, 98, 99, 100, 101, 57,		/* PORT4x */
-	70, 71, 72, 73, 74, 75, 76, 77,			/* PORT5x */
-	81, 83, 84, 85, 86, 89, 90, 91,			/* PORT6x */
-	118, 119, 120, 121, 122, 53, 54, 55,		/* PORT7x */
-	41, 42, 43, 44, 79, 80, 18, 19,			/* PORT8x */
-	110, 111, 112, 113, 114, 115, 16, 17,		/* PORT9x */
-	40, 67, 68, 69, 78, 92, 93, 94,			/* PORT10x */
-	48, 49, 46, 45, 123, 124, 125, 126,		/* PORT11x */
-	47, 127, 20, 56, 22,				/* PORT120-124 */
+static const unsigned int gpio_range0_pins[] = {
+	0, 1, 2, 3, 4, 5, 6, 7,			/* PORT0x */
+	8, 9, 10, 11, 12, 13, 14, 15,		/* PORT1x */
+	32, 33, 34, 35, 36, 37, 38, 39,		/* PORT2x */
+	59, 60, 61, 62, 63, 64, 65, 66,		/* PORT3x */
+	95, 96, 97, 98, 99, 100, 101, 57,	/* PORT4x */
+	70, 71, 72, 73, 74, 75, 76, 77,		/* PORT5x */
+	81, 83, 84, 85, 86, 89, 90, 91,		/* PORT6x */
+	118, 119, 120, 121, 122, 53, 54, 55,	/* PORT7x */
+	41, 42, 43, 44, 79, 80, 18, 19,		/* PORT8x */
+	110, 111, 112, 113, 114, 115, 16, 17,	/* PORT9x */
+	40, 67, 68, 69, 78, 92, 93, 94,		/* PORT10x */
+	48, 49, 46, 45, 123, 124, 125, 126,	/* PORT11x */
+	47, 127, 20, 56, 22,			/* PORT120-124 */
 };
-static const int port_range0_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT0x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT1x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT2x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT3x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT4x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT5x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT6x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT7x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT8x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT9x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT10x */
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT11x */
-	15, 15, 15, 15, 15,				/* PORT120-124 */
+static const unsigned int gpio_range1_pins[] = {
+	116, 117,				/* PORT130-131 */
 };
-static const unsigned port_range1_pins[] = {
-	116, 117,					/* PORT130-131 */
-};
-static const int port_range1_muxvals[] = {
-	15, 15,						/* PORT130-131 */
-};
-static const unsigned port_range2_pins[] = {
-	102, 103, 104, 105, 106, 107, 108, 109,		/* PORT14x */
-};
-static const int port_range2_muxvals[] = {
-	15, 15, 15, 15, 15, 15, 15, 15,			/* PORT14x */
-};
-static const unsigned port_range3_pins[] = {
-	23,						/* PORT166 */
-};
-static const int port_range3_muxvals[] = {
-	15,						/* PORT166 */
-};
-static const unsigned xirq_range0_pins[] = {
-	128, 129, 130, 131, 132, 133, 134, 135,		/* XIRQ0-7 */
-	82, 87, 88, 50, 51,				/* XIRQ8-12 */
-};
-static const int xirq_range0_muxvals[] = {
-	0, 0, 0, 0, 0, 0, 0, 0,				/* XIRQ0-7 */
-	14, 14, 14, 14, 14,				/* XIRQ8-12 */
-};
-static const unsigned xirq_range1_pins[] = {
-	52, 58,						/* XIRQ14-15 */
-};
-static const int xirq_range1_muxvals[] = {
-	14, 14,						/* XIRQ14-15 */
+static const unsigned int gpio_range2_pins[] = {
+	102, 103, 104, 105, 106, 107, 108, 109,	/* PORT14x */
+	128, 129, 130, 131, 132, 133, 134, 135,	/* XIRQ0-7 */
+	82, 87, 88, 50, 51, 23, 52, 58,	      /* XIRQ8-12, PORT165, XIRQ14-15 */
 };
 
 static const struct uniphier_pinctrl_group uniphier_sld8_groups[] = {
@@ -620,139 +581,9 @@ static const struct uniphier_pinctrl_group uniphier_sld8_groups[] = {
 	UNIPHIER_PINCTRL_GROUP(usb0),
 	UNIPHIER_PINCTRL_GROUP(usb1),
 	UNIPHIER_PINCTRL_GROUP(usb2),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range1),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range2),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(port_range3),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq_range0),
-	UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(xirq_range1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port00, port_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port01, port_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port02, port_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port03, port_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port04, port_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port05, port_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port06, port_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port07, port_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port10, port_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port11, port_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port12, port_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port13, port_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port14, port_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port15, port_range0, 13),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port16, port_range0, 14),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port17, port_range0, 15),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port20, port_range0, 16),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port21, port_range0, 17),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port22, port_range0, 18),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port23, port_range0, 19),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port24, port_range0, 20),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port25, port_range0, 21),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port26, port_range0, 22),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port27, port_range0, 23),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port30, port_range0, 24),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port31, port_range0, 25),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port32, port_range0, 26),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port33, port_range0, 27),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port34, port_range0, 28),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port35, port_range0, 29),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port36, port_range0, 30),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port37, port_range0, 31),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port40, port_range0, 32),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port41, port_range0, 33),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port42, port_range0, 34),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port43, port_range0, 35),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port44, port_range0, 36),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port45, port_range0, 37),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port46, port_range0, 38),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port47, port_range0, 39),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port50, port_range0, 40),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port51, port_range0, 41),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port52, port_range0, 42),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port53, port_range0, 43),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port54, port_range0, 44),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port55, port_range0, 45),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port56, port_range0, 46),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port57, port_range0, 47),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port60, port_range0, 48),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port61, port_range0, 49),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port62, port_range0, 50),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port63, port_range0, 51),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port64, port_range0, 52),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port65, port_range0, 53),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port66, port_range0, 54),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port67, port_range0, 55),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port70, port_range0, 56),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port71, port_range0, 57),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port72, port_range0, 58),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port73, port_range0, 59),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port74, port_range0, 60),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port75, port_range0, 61),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port76, port_range0, 62),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port77, port_range0, 63),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port80, port_range0, 64),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port81, port_range0, 65),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port82, port_range0, 66),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port83, port_range0, 67),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port84, port_range0, 68),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port85, port_range0, 69),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port86, port_range0, 70),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port87, port_range0, 71),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port90, port_range0, 72),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port91, port_range0, 73),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port92, port_range0, 74),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port93, port_range0, 75),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port94, port_range0, 76),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port95, port_range0, 77),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port96, port_range0, 78),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port97, port_range0, 79),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port100, port_range0, 80),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port101, port_range0, 81),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port102, port_range0, 82),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port103, port_range0, 83),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port104, port_range0, 84),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port105, port_range0, 85),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port106, port_range0, 86),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port107, port_range0, 87),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port110, port_range0, 88),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port111, port_range0, 89),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port112, port_range0, 90),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port113, port_range0, 91),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port114, port_range0, 92),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port115, port_range0, 93),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port116, port_range0, 94),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port117, port_range0, 95),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port120, port_range0, 96),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port121, port_range0, 97),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port122, port_range0, 98),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port123, port_range0, 99),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port124, port_range0, 100),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port130, port_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port131, port_range1, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port140, port_range2, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port141, port_range2, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port142, port_range2, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port143, port_range2, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port144, port_range2, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port145, port_range2, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port146, port_range2, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port147, port_range2, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(port166, port_range3, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq0, xirq_range0, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq1, xirq_range0, 1),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq2, xirq_range0, 2),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq3, xirq_range0, 3),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq4, xirq_range0, 4),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq5, xirq_range0, 5),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq6, xirq_range0, 6),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq7, xirq_range0, 7),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq8, xirq_range0, 8),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq9, xirq_range0, 9),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq10, xirq_range0, 10),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq11, xirq_range0, 11),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq12, xirq_range0, 12),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq14, xirq_range1, 0),
-	UNIPHIER_PINCTRL_GROUP_SINGLE(xirq15, xirq_range1, 1),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range0),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range1),
+	UNIPHIER_PINCTRL_GROUP_GPIO(gpio_range2),
 };
 
 static const char * const emmc_groups[] = {"emmc", "emmc_dat8"};
@@ -777,46 +608,6 @@ static const char * const uart3_groups[] = {"uart3"};
 static const char * const usb0_groups[] = {"usb0"};
 static const char * const usb1_groups[] = {"usb1"};
 static const char * const usb2_groups[] = {"usb2"};
-static const char * const port_groups[] = {
-	"port00",  "port01",  "port02",  "port03",
-	"port04",  "port05",  "port06",  "port07",
-	"port10",  "port11",  "port12",  "port13",
-	"port14",  "port15",  "port16",  "port17",
-	"port20",  "port21",  "port22",  "port23",
-	"port24",  "port25",  "port26",  "port27",
-	"port30",  "port31",  "port32",  "port33",
-	"port34",  "port35",  "port36",  "port37",
-	"port40",  "port41",  "port42",  "port43",
-	"port44",  "port45",  "port46",  "port47",
-	"port50",  "port51",  "port52",  "port53",
-	"port54",  "port55",  "port56",  "port57",
-	"port60",  "port61",  "port62",  "port63",
-	"port64",  "port65",  "port66",  "port67",
-	"port70",  "port71",  "port72",  "port73",
-	"port74",  "port75",  "port76",  "port77",
-	"port80",  "port81",  "port82",  "port83",
-	"port84",  "port85",  "port86",  "port87",
-	"port90",  "port91",  "port92",  "port93",
-	"port94",  "port95",  "port96",  "port97",
-	"port100", "port101", "port102", "port103",
-	"port104", "port105", "port106", "port107",
-	"port110", "port111", "port112", "port113",
-	"port114", "port115", "port116", "port117",
-	"port120", "port121", "port122", "port123",
-	"port124", "port125", "port126", "port127",
-	"port130", "port131", "port132", "port133",
-	"port134", "port135", "port136", "port137",
-	"port140", "port141", "port142", "port143",
-	"port144", "port145", "port146", "port147",
-	/* port150-164 missing */
-	/* none */ "port165",
-};
-static const char * const xirq_groups[] = {
-	"xirq0",  "xirq1",  "xirq2",  "xirq3",
-	"xirq4",  "xirq5",  "xirq6",  "xirq7",
-	"xirq8",  "xirq9",  "xirq10", "xirq11",
-	"xirq12", /* none*/ "xirq14", "xirq15",
-};
 
 static const struct uniphier_pinmux_function uniphier_sld8_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(emmc),
@@ -836,10 +627,22 @@ static const struct uniphier_pinmux_function uniphier_sld8_functions[] = {
 	UNIPHIER_PINMUX_FUNCTION(usb0),
 	UNIPHIER_PINMUX_FUNCTION(usb1),
 	UNIPHIER_PINMUX_FUNCTION(usb2),
-	UNIPHIER_PINMUX_FUNCTION(port),
-	UNIPHIER_PINMUX_FUNCTION(xirq),
 };
 
+static int uniphier_sld8_get_gpio_muxval(unsigned int pin,
+					 unsigned int gpio_offset)
+{
+	switch (gpio_offset) {
+	case 120 ... 127:	/* XIRQ0-XIRQ7 */
+		return 0;
+	case 128 ... 132:	/* XIRQ8-12 */
+	case 134 ... 135:	/* XIRQ14-15 */
+		return 14;
+	default:
+		return 15;
+	}
+}
+
 static struct uniphier_pinctrl_socdata uniphier_sld8_pindata = {
 	.pins = uniphier_sld8_pins,
 	.npins = ARRAY_SIZE(uniphier_sld8_pins),
@@ -847,6 +650,7 @@ static struct uniphier_pinctrl_socdata uniphier_sld8_pindata = {
 	.groups_count = ARRAY_SIZE(uniphier_sld8_groups),
 	.functions = uniphier_sld8_functions,
 	.functions_count = ARRAY_SIZE(uniphier_sld8_functions),
+	.get_gpio_muxval = uniphier_sld8_get_gpio_muxval,
 	.caps = 0,
 };
 
diff --git a/drivers/pinctrl/uniphier/pinctrl-uniphier.h b/drivers/pinctrl/uniphier/pinctrl-uniphier.h
index 6f2f33bf788f..b040a3b56c52 100644
--- a/drivers/pinctrl/uniphier/pinctrl-uniphier.h
+++ b/drivers/pinctrl/uniphier/pinctrl-uniphier.h
@@ -131,18 +131,11 @@ static inline unsigned int uniphier_pin_get_pull_dir(void *drv_data)
 						UNIPHIER_PIN_PULL_DIR_MASK;
 }
 
-enum uniphier_pinmux_gpio_range_type {
-	UNIPHIER_PINMUX_GPIO_RANGE_PORT,
-	UNIPHIER_PINMUX_GPIO_RANGE_IRQ,
-	UNIPHIER_PINMUX_GPIO_RANGE_NONE,
-};
-
 struct uniphier_pinctrl_group {
 	const char *name;
 	const unsigned *pins;
 	unsigned num_pins;
 	const int *muxvals;
-	enum uniphier_pinmux_gpio_range_type range_type;
 };
 
 struct uniphier_pinmux_function {
@@ -158,6 +151,7 @@ struct uniphier_pinctrl_socdata {
 	int groups_count;
 	const struct uniphier_pinmux_function *functions;
 	int functions_count;
+	int (*get_gpio_muxval)(unsigned int pin, unsigned int gpio_offset);
 	unsigned int caps;
 #define UNIPHIER_PINCTRL_CAPS_PERPIN_IECTRL	BIT(1)
 #define UNIPHIER_PINCTRL_CAPS_DBGMUX_SEPARATE	BIT(0)
@@ -170,33 +164,22 @@ struct uniphier_pinctrl_socdata {
 	.drv_data = (void *)UNIPHIER_PIN_ATTR_PACKED(c, d, e, f, g),	\
 }
 
-#define __UNIPHIER_PINCTRL_GROUP(grp, type)				\
+#define __UNIPHIER_PINCTRL_GROUP(grp, mux)				\
 	{								\
 		.name = #grp,						\
 		.pins = grp##_pins,					\
 		.num_pins = ARRAY_SIZE(grp##_pins),			\
-		.muxvals = grp##_muxvals +				\
-			BUILD_BUG_ON_ZERO(ARRAY_SIZE(grp##_pins) !=	\
-					  ARRAY_SIZE(grp##_muxvals)),	\
-		.range_type = type,					\
+		.muxvals = mux,						\
 	}
 
 #define UNIPHIER_PINCTRL_GROUP(grp)					\
-	__UNIPHIER_PINCTRL_GROUP(grp, UNIPHIER_PINMUX_GPIO_RANGE_NONE)
-
-#define UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_PORT(grp)			\
-	__UNIPHIER_PINCTRL_GROUP(grp, UNIPHIER_PINMUX_GPIO_RANGE_PORT)
-
-#define UNIPHIER_PINCTRL_GROUP_GPIO_RANGE_IRQ(grp)			\
-	__UNIPHIER_PINCTRL_GROUP(grp, UNIPHIER_PINMUX_GPIO_RANGE_IRQ)
+	__UNIPHIER_PINCTRL_GROUP(grp,					\
+			grp##_muxvals +					\
+			BUILD_BUG_ON_ZERO(ARRAY_SIZE(grp##_pins) !=	\
+					  ARRAY_SIZE(grp##_muxvals)))
 
-#define UNIPHIER_PINCTRL_GROUP_SINGLE(grp, array, ofst)			\
-	{								\
-		.name = #grp,						\
-		.pins = array##_pins + ofst,				\
-		.num_pins = 1,						\
-		.muxvals = array##_muxvals + ofst,			\
-	}
+#define UNIPHIER_PINCTRL_GROUP_GPIO(grp)				\
+	__UNIPHIER_PINCTRL_GROUP(grp, NULL)
 
 #define UNIPHIER_PINMUX_FUNCTION(func)					\
 	{								\
-- 
2.7.4
