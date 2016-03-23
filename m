From: Michael Hennerich <michael.hennerich@analog.com>
Subject: Re: [PATCH] gpio: support native single-ended hardware drivers
Date: Wed, 23 Mar 2016 11:10:04 +0100
Message-ID: <56F26B7C.8000302@analog.com>
References: <1458640626-2669-1-git-send-email-linus.walleij@linaro.org>
Reply-To: <michael.hennerich@analog.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-by2on0068.outbound.protection.outlook.com ([207.46.100.68]:8576
	"EHLO na01-by2-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1754827AbcCWKRz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Mar 2016 06:17:55 -0400
In-Reply-To: <1458640626-2669-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On 03/22/2016 10:57 AM, Linus Walleij wrote:
> Some GPIO controllers has a special hardware bit we can flip
> to support open drain / source. This means that on these hardwares
> we do not need to emulate OD/OS by setting the line to input
> instead of actively driving it high/low. Add an optional vtable
> callback to the driver set_single_ended() so that driver can
> implement this in hardware if they have it.
>
> We may need a pinctrl_gpio_set_config() call at some point to
> propagate this down to a backing pin control device on systems
> with split GPIO/pin control.
>
> Reported-by: Michael Hennerich <michael.hennerich@analog.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Michael, please have a look at this and consider testing it with
> your hardware and adding a .set_single_ended() callback in your
> driver to see if it does what you want. I'm ready to merge this
> if at least one driver make use of it.


Hi Linus,

I think the patch looks good.

Unfortunately it only applies against your gpio/for-next branch.

for some reason on that 4.5 kernel the SDHCI interface on my test board 
doesn't work any more.

So I can't really fully test it at the moment.


diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 4019e44..efb7442 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -127,6 +127,38 @@ static int ad5592r_gpio_request(struct gpio_chip 
*chip, unsigned offset)
         return 0;
  }

+static int ad5592r_gpio_set_single_ended(struct gpio_chip *chip,
+                                        unsigned offset,
+                                        enum single_ended_mode mode)
+{
+       struct ad5592r_state *st = gpiochip_get_data(chip);
+       int ret = 0;
+
+       mutex_lock(&st->gpio_lock);
+
+       switch (mode) {
+       case LINE_MODE_PUSH_PULL:
+               st->gpio_opendrain &= ~BIT(offset);
+               break;
+
+       case LINE_MODE_OPEN_DRAIN:
+               st->gpio_opendrain |= BIT(offset);
+               break;
+
+       case LINE_MODE_OPEN_SOURCE:
+       default:
+               ret = -ENOTSUPP;
+       }
+
+       mutex_unlock(&st->gpio_lock);
+
+       if (ret)
+               return ret;
+
+       return st->ops->reg_write(st, AD5592R_REG_OPEN_DRAIN,
+                                 st->gpio_opendrain);
+}
+
  static int ad5592r_gpio_init(struct ad5592r_state *st)
  {
         if (!st->gpio_map)
@@ -139,6 +171,7 @@ static int ad5592r_gpio_init(struct ad5592r_state *st)
         st->gpiochip.can_sleep = true;
         st->gpiochip.direction_input = ad5592r_gpio_direction_input;
         st->gpiochip.direction_output = ad5592r_gpio_direction_output;
+       st->gpiochip.set_single_ended = ad5592r_gpio_set_single_ended;
         st->gpiochip.get = ad5592r_gpio_get;
         st->gpiochip.set = ad5592r_gpio_set;
         st->gpiochip.request = ad5592r_gpio_request;
diff --git a/drivers/iio/dac/ad5592r-base.h b/drivers/iio/dac/ad5592r-base.h
index 2753385..09d545b 100644
--- a/drivers/iio/dac/ad5592r-base.h
+++ b/drivers/iio/dac/ad5592r-base.h
@@ -66,6 +66,7 @@ struct ad5592r_state {
         u8 gpio_out;
         u8 gpio_in;
         u8 gpio_val;
+       u8 gpio_opendrain;

         __be16 spi_msg ____cacheline_aligned;
         __be16 spi_msg_nop;





-- 
Greetings,
Michael

--
Analog Devices GmbH      Wilhelm-Wagenfeld-Str. 6      80807 Muenchen
Sitz der Gesellschaft: Muenchen; Registergericht: Muenchen HRB 40368;
Geschaeftsfuehrer:Dr.Carsten Suckrow, Thomas Wessel, William A. Martin,
Margaret Seif
