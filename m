From: Axel Lin <axel.lin@ingics.com>
Subject: [RFT][PATCH] gpio: xtensa: Implement .direction_input and
 .direction_output callbacks
Date: Fri, 25 Apr 2014 20:33:08 +0800
Message-ID: <1398429188.1754.1.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f169.google.com ([209.85.220.169]:48999 "EHLO
	mail-vc0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752239AbaDYMdP (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 25 Apr 2014 08:33:15 -0400
Received: by mail-vc0-f169.google.com with SMTP id im17so4621004vcb.14
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2014 05:33:14 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Baruch Siach <baruch@tkos.co.il>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

The implementation of _gpiod_direction_output_raw() checks both .set and
.direction_output callbacks. To make gpio_direction_output() works, both .set
and .direction_output callbacks needs to be implemented in the driver.

Similarly, gpiod_direction_input() checks both .get and .direction_input
callbacks. To make gpio_direction_input() works, both .get and .direction_input
needs to be implemented in the driver.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
Hi Baruch,
I don't have this h/w to test, so this patch needs test.
I think both gpio_direction_output() and gpio_direction_input() do not work
without this patch. Which means gpio_request_one() also does not work.

BTW, I also hit below build error.
  CC      drivers/gpio/gpio-xtensa.o
drivers/gpio/gpio-xtensa.c: Assembler messages:
drivers/gpio/gpio-xtensa.c:87: Error: unknown opcode or format name 'read_impwire'
drivers/gpio/gpio-xtensa.c:116: Error: unknown opcode or format name 'rur.expstate'
drivers/gpio/gpio-xtensa.c:130: Error: unknown opcode or format name 'wrmsk_expstate'
make[2]: *** [drivers/gpio/gpio-xtensa.o] Error 1
make[1]: *** [drivers/gpio] Error 2
make: *** [drivers] Error 2
(I found the same build error is already reported by Geert Uytterhoeven.)

Regards,
Axel

 drivers/gpio/gpio-xtensa.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
index 7081304..ed6d874 100644
--- a/drivers/gpio/gpio-xtensa.c
+++ b/drivers/gpio/gpio-xtensa.c
@@ -96,6 +96,12 @@ static void xtensa_impwire_set_value(struct gpio_chip *gc, unsigned offset,
 	BUG(); /* output only; should never be called */
 }
 
+static int xtensa_impwire_direction_input(struct gpio_chip *gc,
+					  unsigned offset)
+{
+	return 0;
+}
+
 static int xtensa_expstate_get_direction(struct gpio_chip *gc, unsigned offset)
 {
 	return 0; /* output only */
@@ -126,6 +132,13 @@ static void xtensa_expstate_set_value(struct gpio_chip *gc, unsigned offset,
 	disable_cp(flags, saved_cpenable);
 }
 
+static int xtensa_expstate_direction_output(struct gpio_chip *gc,
+					    unsigned offset, int value)
+{
+	xtensa_expstate_set_value(gc, offset, value);
+	return 0;
+}
+
 static struct gpio_chip impwire_chip = {
 	.label		= "impwire",
 	.base		= -1,
@@ -133,6 +146,7 @@ static struct gpio_chip impwire_chip = {
 	.get_direction	= xtensa_impwire_get_direction,
 	.get		= xtensa_impwire_get_value,
 	.set		= xtensa_impwire_set_value,
+	.direction_input = xtensa_impwire_direction_input,
 };
 
 static struct gpio_chip expstate_chip = {
@@ -142,6 +156,7 @@ static struct gpio_chip expstate_chip = {
 	.get_direction	= xtensa_expstate_get_direction,
 	.get		= xtensa_expstate_get_value,
 	.set		= xtensa_expstate_set_value,
+	.direction_output = xtensa_expstate_direction_output,
 };
 
 static int xtensa_gpio_probe(struct platform_device *pdev)
-- 
1.8.3.2



