From: Axel Lin <axel.lin@ingics.com>
Subject: [PATCH RFT] gpio: exar: Set proper output level in exar_direction_output
Date: Sun, 26 Feb 2017 22:36:58 +0800
Message-ID: <20170226143658.24036-1-axel.lin@ingics.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35337 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752145AbdBZOry (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Feb 2017 09:47:54 -0500
Received: by mail-pf0-f195.google.com with SMTP id y23so491099pfk.2
        for <linux-gpio@vger.kernel.org>; Sun, 26 Feb 2017 06:46:41 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, Axel Lin <axel.lin@ingics.com>

Current code does not set output level in exar_direction_output, fix it.
Also move the direction_output/direction_input code block to avoid forward
declaration for exar_set_value().

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Sudip,
I don't have this h/w, so please review and test if this patch works.
thanks,
Axel
 drivers/gpio/gpio-exar.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 05c8946..0810767 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -59,17 +59,6 @@ static int exar_set_direction(struct gpio_chip *chip, int direction,
 	return 0;
 }
 
-static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
-				 int value)
-{
-	return exar_set_direction(chip, 0, offset);
-}
-
-static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
-{
-	return exar_set_direction(chip, 1, offset);
-}
-
 static int exar_get(struct gpio_chip *chip, unsigned int reg)
 {
 	struct exar_gpio_chip *exar_gpio = gpiochip_get_data(chip);
@@ -116,6 +105,18 @@ static void exar_set_value(struct gpio_chip *chip, unsigned int offset,
 	exar_update(chip, addr, value, offset % 8);
 }
 
+static int exar_direction_output(struct gpio_chip *chip, unsigned int offset,
+				 int value)
+{
+	exar_set_value(chip, offset, value);
+	return exar_set_direction(chip, 0, offset);
+}
+
+static int exar_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	return exar_set_direction(chip, 1, offset);
+}
+
 static int gpio_exar_probe(struct platform_device *pdev)
 {
 	struct pci_dev *pcidev = platform_get_drvdata(pdev);
-- 
2.9.3

