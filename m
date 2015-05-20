From: Grygorii Strashko <grygorii.strashko@linaro.org>
Subject: [PATCH v2 2/3] gpiolib: debugfs: show linux irq number for gpios requested as irq
Date: Wed, 20 May 2015 13:30:22 +0300
Message-ID: <1432117823-1834-3-git-send-email-grygorii.strashko@linaro.org>
References: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@linaro.org>, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

This patch updates GPIO debugfs code to show Linux IRQ number
for GPIOs requested as irq.

After this patch sys/kernel/debug/gpio will produce following output:
    ...
    GPIOs 160-191, platform/4805d000.gpio, gpio:
     gpio-171 ((null)              ) in  hi IRQ-209

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
---
 drivers/gpio/gpiolib.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 399ce2f..f1dcb5b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2266,13 +2266,14 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
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
+			seq_printf(s, " IRQ-%d", gpiod_to_irq(gdesc));
 		seq_printf(s, "\n");
 	}
 }
-- 
1.9.1
