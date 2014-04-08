From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 1/2] pinctrl: sirf: rename inlined accessor
Date: Tue,  8 Apr 2014 14:27:43 +0200
Message-ID: <1396960063-30552-1-git-send-email-linus.walleij@linaro.org>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:41284 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756036AbaDHM1v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Apr 2014 08:27:51 -0400
Received: by mail-wi0-f176.google.com with SMTP id r20so6902967wiv.15
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2014 05:27:50 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-kernel@vger.kernel.org, Barry Song <Baohua.Song@csr.com>, Barry Song <baohua@kernel.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>

The sirfsoc_irqchip_to_bank() is obviously misnamed, as it is
not converting an irqchip to a bank but converts a gpiochip
to a bank so rename it sirfsoc_gpiochip_to_bank().

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/pinctrl/sirf/pinctrl-sirf.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/sirf/pinctrl-sirf.c b/drivers/pinctrl/sirf/pinctrl-sirf.c
index 76502aab2cb1..2c3eb207ff87 100644
--- a/drivers/pinctrl/sirf/pinctrl-sirf.c
+++ b/drivers/pinctrl/sirf/pinctrl-sirf.c
@@ -483,7 +483,7 @@ static inline struct sirfsoc_gpio_bank *sirfsoc_gpio_to_bank(unsigned int gpio)
 	return &sgpio_bank[gpio / SIRFSOC_GPIO_BANK_SIZE];
 }
 
-static inline struct sirfsoc_gpio_bank *sirfsoc_irqchip_to_bank(struct gpio_chip *chip)
+static inline struct sirfsoc_gpio_bank *sirfsoc_gpiochip_to_bank(struct gpio_chip *chip)
 {
 	return container_of(to_of_mm_gpio_chip(chip), struct sirfsoc_gpio_bank, chip);
 }
@@ -675,7 +675,7 @@ static inline void sirfsoc_gpio_set_input(struct sirfsoc_gpio_bank *bank, unsign
 
 static int sirfsoc_gpio_request(struct gpio_chip *chip, unsigned offset)
 {
-	struct sirfsoc_gpio_bank *bank = sirfsoc_irqchip_to_bank(chip);
+	struct sirfsoc_gpio_bank *bank = sirfsoc_gpiochip_to_bank(chip);
 	unsigned long flags;
 
 	if (pinctrl_request_gpio(chip->base + offset))
@@ -697,7 +697,7 @@ static int sirfsoc_gpio_request(struct gpio_chip *chip, unsigned offset)
 
 static void sirfsoc_gpio_free(struct gpio_chip *chip, unsigned offset)
 {
-	struct sirfsoc_gpio_bank *bank = sirfsoc_irqchip_to_bank(chip);
+	struct sirfsoc_gpio_bank *bank = sirfsoc_gpiochip_to_bank(chip);
 	unsigned long flags;
 
 	spin_lock_irqsave(&bank->lock, flags);
@@ -712,7 +712,7 @@ static void sirfsoc_gpio_free(struct gpio_chip *chip, unsigned offset)
 
 static int sirfsoc_gpio_direction_input(struct gpio_chip *chip, unsigned gpio)
 {
-	struct sirfsoc_gpio_bank *bank = sirfsoc_irqchip_to_bank(chip);
+	struct sirfsoc_gpio_bank *bank = sirfsoc_gpiochip_to_bank(chip);
 	int idx = sirfsoc_gpio_to_offset(gpio);
 	unsigned long flags;
 	unsigned offset;
@@ -751,7 +751,7 @@ static inline void sirfsoc_gpio_set_output(struct sirfsoc_gpio_bank *bank, unsig
 
 static int sirfsoc_gpio_direction_output(struct gpio_chip *chip, unsigned gpio, int value)
 {
-	struct sirfsoc_gpio_bank *bank = sirfsoc_irqchip_to_bank(chip);
+	struct sirfsoc_gpio_bank *bank = sirfsoc_gpiochip_to_bank(chip);
 	int idx = sirfsoc_gpio_to_offset(gpio);
 	u32 offset;
 	unsigned long flags;
@@ -769,7 +769,7 @@ static int sirfsoc_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 
 static int sirfsoc_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 {
-	struct sirfsoc_gpio_bank *bank = sirfsoc_irqchip_to_bank(chip);
+	struct sirfsoc_gpio_bank *bank = sirfsoc_gpiochip_to_bank(chip);
 	u32 val;
 	unsigned long flags;
 
@@ -785,7 +785,7 @@ static int sirfsoc_gpio_get_value(struct gpio_chip *chip, unsigned offset)
 static void sirfsoc_gpio_set_value(struct gpio_chip *chip, unsigned offset,
 	int value)
 {
-	struct sirfsoc_gpio_bank *bank = sirfsoc_irqchip_to_bank(chip);
+	struct sirfsoc_gpio_bank *bank = sirfsoc_gpiochip_to_bank(chip);
 	u32 ctrl;
 	unsigned long flags;
 
-- 
1.9.0

