From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 2/8] gpio: zynq: Wakeup gpio controller when it is used
 as IRQ controller
Date: Mon, 7 Jan 2019 16:42:10 +0100
Message-ID: <20190107164210.3ecf37e8@windsurf>
References: <cover.1502103715.git.michal.simek@xilinx.com>
        <72d3cd83bed792a23ab60cf9b6d51b618f5aa084.1502103715.git.michal.simek@xilinx.com>
        <CACRpkdZE-Edr7fWZY5VQM1_65iw7MYGP-iDa2ExZsPxpM0rurQ@mail.gmail.com>
        <6da5fd79-fbc8-b613-954f-dcbe2ef8d6c5@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6da5fd79-fbc8-b613-954f-dcbe2ef8d6c5@xilinx.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Michal Simek <michal.simek@xilinx.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Nava kishore Manne <navam@xilinx.com>, Josh Cartwright <josh.cartwright@ni.com>, "monstr@monstr.eu" <monstr@monstr.eu>, Peter Crosthwaite <peter.crosthwaite@xilinx.com>, Borsodi Petr <Petr.Borsodi@i.cz>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Rob Herring <robherring2@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Steffen Trumtrar <s.trumtrar@pengutronix.de>, =?UTF-8?B?U8O2cmVu?= Brinkmann <soren.brinkmann@xilinx.com>, Shubhrajyoti Datta <shubhraj@xilinx.com>
List-Id: linux-gpio@vger.kernel.org

Hello,

I am reviving this old thread, because the proposed patch (almost)
solves the problem I recently reported with the bad interaction of
runtime PM with the Zynq GPIO driver (see
https://www.spinics.net/lists/linux-gpio/msg35437.html).

On Mon, 14 Aug 2017 16:33:09 +0200, Michal Simek wrote:

> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 9568708a550b..a08a044fa4aa 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1647,14 +1647,22 @@ static void gpiochip_irq_unmap(struct irq_domain
> *d, unsigned int irq)
>  static int gpiochip_irq_reqres(struct irq_data *d)
>  {
>         struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> +       int ret;
> 
>         if (!try_module_get(chip->gpiodev->owner))
>                 return -ENODEV;
> 
> +       ret = pm_runtime_get_sync(chip->parent);
> +       if (ret < 0) {
> +               module_put(chip->gpiodev->owner);
> +               return ret;
> +       }
> +
>         if (gpiochip_lock_as_irq(chip, d->hwirq)) {
>                 chip_err(chip,
>                         "unable to lock HW IRQ %lu for IRQ\n",
>                         d->hwirq);
> +               pm_runtime_put(chip->parent);
>                 module_put(chip->gpiodev->owner);
>                 return -EINVAL;
>         }
> @@ -1666,6 +1674,7 @@ static void gpiochip_irq_relres(struct irq_data *d)
>         struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
> 
>         gpiochip_unlock_as_irq(chip, d->hwirq);
> +       pm_runtime_put(chip->parent);
>         module_put(chip->gpiodev->owner);
>  }

This patch almost solves the problem. It doesn't work as-is, because it
assumes that runtime PM is used by all GPIO controllers, which is not
the case. When runtime PM is not enabled, pm_runtime_get_sync() fails
with -EACCES, and the whole gpiochip_irq_reqres() function aborts.

The following patch works fine in my case (a MMC card detect signal is
connected to a pin of a PCA GPIO expander over I2C, whose INT# pin is
itself connected to a GPIO pin of the Zynq SoC).

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 20887c62fbb3..bd9a81fc8d56 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -27,6 +27,7 @@
 #include <linux/kfifo.h>
 #include <linux/poll.h>
 #include <linux/timekeeping.h>
+#include <linux/pm_runtime.h>
 #include <uapi/linux/gpio.h>
 
 #include "gpiolib.h"
@@ -3540,12 +3541,23 @@ int gpiochip_reqres_irq(struct gpio_chip *chip, unsigned int offset)
        if (!try_module_get(chip->gpiodev->owner))
                return -ENODEV;
 
+       if (pm_runtime_enabled(chip->parent)) {
+               ret = pm_runtime_get_sync(chip->parent);
+               if (ret < 0) {
+                       module_put(chip->gpiodev->owner);
+                       return ret;
+               }
+       }
+
        ret = gpiochip_lock_as_irq(chip, offset);
        if (ret) {
                chip_err(chip, "unable to lock HW IRQ %u for IRQ\n", offset);
+               if (pm_runtime_enabled(chip->parent))
+                       pm_runtime_put(chip->parent);
                module_put(chip->gpiodev->owner);
                return ret;
        }
+
        return 0;
 }
 EXPORT_SYMBOL_GPL(gpiochip_reqres_irq);
@@ -3553,6 +3565,8 @@ EXPORT_SYMBOL_GPL(gpiochip_reqres_irq);
 void gpiochip_relres_irq(struct gpio_chip *chip, unsigned int offset)
 {
        gpiochip_unlock_as_irq(chip, offset);
+       if (pm_runtime_enabled(chip->parent))
+               pm_runtime_put(chip->parent);
        module_put(chip->gpiodev->owner);
 }
 EXPORT_SYMBOL_GPL(gpiochip_relres_irq);

However, I must say that from a design perspective, I am not a big fan
of this solution. Indeed for the normal GPIO ->request() and ->free()
hooks, it is currently the GPIO driver itself that is responsible for
runtime PM get/put, so it would be weird to have the runtime PM get/put
for the IRQ request/free be done by the GPIO core.

I believe that either the GPIO core should be in charge of the entire
runtime PM interaction, or it should entirely be the responsibility of
each GPIO controller driver. Having a mixed solution seems very
confusing.

Let me know which direction should be taken so that I can submit a
proper patch to hopefully resolve this issue.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
