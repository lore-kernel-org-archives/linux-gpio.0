From: Grygorii Strashko <grygorii.strashko@linaro.org>
Subject: [PATCH v2 1/3] gpiolib: debugfs: display gpios requested as irq only
Date: Wed, 20 May 2015 13:30:21 +0300
Message-ID: <1432117823-1834-2-git-send-email-grygorii.strashko@linaro.org>
References: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@linaro.org>, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

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

Hence, improve GPIO debugfs code to show such kind of GPIOs

After this patch sys/kernel/debug/gpio will produce following output:

 # cat /debug/gpio
...
GPIOs 160-191, platform/4805d000.gpio, gpio:
 gpio-171 ((null)              ) in  hi IRQ

GPIOs 192-223, platform/48051000.gpio, gpio:
 gpio-203 (vtt_fixed           ) out hi

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
---
 drivers/gpio/gpiolib.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 59eaa23..399ce2f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2259,7 +2259,8 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 	int			is_irq;
 
 	for (i = 0; i < chip->ngpio; i++, gpio++, gdesc++) {
-		if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
+		if (!test_bit(FLAG_REQUESTED, &gdesc->flags) &&
+		    !test_bit(FLAG_USED_AS_IRQ, &gdesc->flags))
 			continue;
 
 		gpiod_get_direction(gdesc);
-- 
1.9.1
