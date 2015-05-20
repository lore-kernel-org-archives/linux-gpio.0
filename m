From: Grygorii Strashko <grygorii.strashko@linaro.org>
Subject: [PATCH v2 3/3] gpiolib: debugfs: identify gpios requested as irq only
Date: Wed, 20 May 2015 13:30:23 +0300
Message-ID: <1432117823-1834-4-git-send-email-grygorii.strashko@linaro.org>
References: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@linaro.org>, Johan Hovold <johan@kernel.org>
List-Id: linux-gpio@vger.kernel.org

Now many of GPIO drivers implement two interfaces gpiolib and irqchip
which are essentially orthogonal. So, now GPIO line can be requested
in three ways:
1) As pure GPIO (gpioX_request())
2) As pure GPIO IRQ, especially in DT boot case.
  DT:
	interrupt-parent = <&gpio6>;
	interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
  Code:
	platform_get_irq() or of_irq_get()
        request_irq()
3) combination of (1) and (2).

And from GPIO debugfs it could be identified when GPIO is
requested/used or used as IRQ, but there is no way to determine
when GPIO is requested/used as IRQ only.

Such information is useful for debugging, so update GPIO debugfs code
to show marker '<irq-only>' for GPIO lines which are requested/used as
GPIO IRQ only.

After this patch sys/kernel/debug/gpio will produce following output:
  ...
 GPIOs 160-191, platform/4805d000.gpio, gpio:
  gpio-171 ((null)              ) in  hi IRQ-209 <irq-only>

 GPIOs 192-223, platform/48051000.gpio, gpio:
  gpio-203 (vtt_fixed           ) out hi

Cc: Johan Hovold <johan@kernel.org>
Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>
---
 drivers/gpio/gpiolib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f1dcb5b..d69fc58 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2272,8 +2272,11 @@ static void gpiolib_dbg_show(struct seq_file *s, struct gpio_chip *chip)
 			chip->get
 				? (chip->get(chip, i) ? "hi" : "lo")
 				: "?  ");
-		if (is_irq)
+		if (is_irq) {
 			seq_printf(s, " IRQ-%d", gpiod_to_irq(gdesc));
+			if (!test_bit(FLAG_REQUESTED, &gdesc->flags))
+				seq_puts(s, " <irq-only>");
+		}
 		seq_printf(s, "\n");
 	}
 }
-- 
1.9.1
