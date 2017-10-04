From: Chris Gorman <chrisjohgorman@gmail.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Wed, 4 Oct 2017 13:01:48 -0400
Message-ID: <CAHVeOW-1qm8MdKLa-LApx-sZs45XPNLNi3JeZ=MRKKNjA_yb9Q@mail.gmail.com>
References: <20171003170049.24480-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:54937 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751240AbdJDRBv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Oct 2017 13:01:51 -0400
In-Reply-To: <20171003170049.24480-1-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

Tested on 4.14.0-rc3 and this works for me.

Tested by: Chris Gorman <chrisjohgorman@gmail.com>

On Tue, Oct 3, 2017 at 1:00 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> New GPIO IRQs are allocated and mapped dynamically by default when
> GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
> This causes issues on some Intel platforms [1][2] with broken BIOS which
> hardcodes Linux IRQ numbers in their ACPI tables.
>
> On such platforms cherryview-pinctrl driver should allocate and map all
> GPIO IRQs at probe time.
> Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
> can be seen at boot log.
>
> NOTE. It still may fail if boot sequence will changed and some interrupt
> controller will be probed before cherryview-pinctrl which will shift Linux IRQ
> numbering (expected with CONFIG_SPARCE_IRQ enabled).
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
> [2] https://lkml.org/lkml/2017/9/28/153
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Chris Gorman <chrisjohgorman@gmail.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Reported-by: Chris Gorman <chrisjohgorman@gmail.com>
> Reported-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index 04e929f..fadbca9 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -1577,6 +1577,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>         struct gpio_chip *chip = &pctrl->chip;
>         bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
>         int ret, i, offset;
> +       int irq_base;
>
>         *chip = chv_gpio_chip;
>
> @@ -1622,7 +1623,18 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>         /* Clear all interrupts */
>         chv_writel(0xffff, pctrl->regs + CHV_INTSTAT);
>
> -       ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, 0,
> +       if (!need_valid_mask) {
> +               irq_base = devm_irq_alloc_descs(pctrl->dev, -1, 0,
> +                                               chip->ngpio, NUMA_NO_NODE);
> +               if (irq_base < 0) {
> +                       dev_err(pctrl->dev, "Failed to allocate IRQ numbers\n");
> +                       return irq_base;
> +               }
> +       } else {
> +               irq_base = 0;
> +       }
> +
> +       ret = gpiochip_irqchip_add(chip, &chv_gpio_irqchip, irq_base,
>                                    handle_bad_irq, IRQ_TYPE_NONE);
>         if (ret) {
>                 dev_err(pctrl->dev, "failed to add IRQ chip\n");
> --
> 2.10.1
>
