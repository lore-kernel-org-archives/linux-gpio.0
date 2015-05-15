From: <grygorii.strashko@linaro.org>
Subject: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Fri, 15 May 2015 16:25:21 +0300
Message-ID: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@linaro.org>
List-Id: linux-gpio@vger.kernel.org

From: Grygorii Strashko <grygorii.strashko@linaro.org>

Now GPIOs, wich are requested as IRQ only, will not be displayed
through GPIO debugfs. For example:
 # cat /proc/interrupts
            CPU0       CPU1
...
209:          0          0  4805d000.gpio  11 Edge      0-0021

 # cat /debug/gpio
...
GPIOs 160-191, platform/4805d000.gpio, gpio:
<--- no info about gpio used as IRQ only here

GPIOs 192-223, platform/48051000.gpio, gpio:
 gpio-203 (vtt_fixed           ) out hi
...

Hence, improve GPIO debugfs code to show such kind of gpio and print
IRQ number also. In addition, add marker "requested" for GPIOs wich
were requested by using gpioX_request().

After this patch sys/kernel/debug/gpio will produce following output:

 # cat /debug/gpio
...
GPIOs 160-191, platform/4805d000.gpio, gpio:
 gpio-171 ((null)              ) in  hi IRQ209

GPIOs 192-223, platform/48051000.gpio, gpio:
 gpio-203 (vtt_fixed           ) out hi requested

Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
---
 drivers/gpio/gpiolib.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59eaa23..ea11706 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2259,19 +2259,23 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int			is_irq;
 
 	for (i = 0; i < chip->ngpio; i++, gpio++, gdesc++) {
-		if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
+		if (!test_bit(FLAG_REQUESTED, &gdesc->flags) &&
+		    !test_bit(FLAG_USED_AS_IRQ, &gdesc->flags))
 			continue;
 
 		gpiod_get_direction(gdesc);
 		is_out = test_bit(FLAG_IS_OUT, &gdesc->flags);
 		is_irq = test_bit(FLAG_USED_AS_IRQ, &gdesc->flags);
-		seq_printf(s, " gpio-%-3d (%-20.20s) %s %s %s",
+		seq_printf(s, " gpio-%-3d (%-20.20s) %s %s",
 			gpio, gdesc->label,
 			is_out ? "out" : "in ",
 			chip->get
 				? (chip->get(chip, i) ? "hi" : "lo")
-				: "?  ",
-			is_irq ? "IRQ" : "   ");
+				: "?  ");
+		if (is_irq)
+			seq_printf(s, " IRQ%d", gpiod_to_irq(gdesc));
+		if (test_bit(FLAG_REQUESTED, &gdesc->flags))
+			seq_puts(s, " requested");
 		seq_printf(s, "\n");
 	}
 }
-- 
1.9.1
