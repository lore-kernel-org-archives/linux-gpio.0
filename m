From: Adam Levy <theadamlevy@gmail.com>
Subject: Re: [PATCH v2] pinctrl: cherryview: Add a quirk to make Acer
 Chromebook keyboard work again
Date: Mon, 10 Apr 2017 21:47:57 -0800
Message-ID: <CAO_eOSguid+1F1NEwwoioQENyTmOOYy-w_PXOPCNsD7KXZW76Q@mail.gmail.com>
References: <20170410101633.53161-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:34210 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752236AbdDKFr7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Apr 2017 01:47:59 -0400
Received: by mail-vk0-f68.google.com with SMTP id y16so14280940vky.1
        for <linux-gpio@vger.kernel.org>; Mon, 10 Apr 2017 22:47:58 -0700 (PDT)
In-Reply-To: <20170410101633.53161-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Marc Zyngier <marc.zyngier@arm.com>, Grant Likely <grant.likely@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, thierry.reding@gmail.com, linux-gpio@vger.kernel.org

Mika,

Your patch v2 still works on my Edgar CYAN Acer Chromebook 14 (CB3-431).

Tested on latest upstream kernel 4.11rc6.r4.gc08e611b7d01.

Let me know if you need anything else.

Thank you,
Adam Levy

On Mon, Apr 10, 2017 at 2:16 AM, Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
> After commit 47c950d10202 ("pinctrl: cherryview: Do not add all
> southwest and north GPIOs to IRQ domain") the driver does not add all
> GPIOs to the irqdomain. The reason for that is that those GPIOs cannot
> generate IRQs at all, only GPEs (General Purpose Events). This causes
> Linux virtual IRQ numbering to change.
>
> However, it seems some CYAN Chromebooks, including Acer Chromebook
> hardcodes these Linux IRQ numbers in the ACPI tables of the machine.
> Since the numbering is different now, the IRQ meant for keyboard does
> not match the Linux virtual IRQ number anymore making the keyboard
> non-functional.
>
> Work this around by adding special quirk just for these machines where
> we add back all GPIOs to the irqdomain. Rest of the Cherryview/Braswell
> based machines will not be affected by the change.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=194945
> Fixes: 47c950d10202 ("pinctrl: cherryview: Do not add all southwest and north GPIOs to IRQ domain")
> Reported-by: Adam S Levy <theadamlevy@gmail.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Changes from v1:
>  - Add BIOS date to DMI match string to keep this quirk from affecting
>    future BIOS versions where the issue might be fixed already.
>
> Marc, Linus,
>
> I went for adding the quirk here instead of quirking it in i8042 keyboard
> driver because there might be other devices hard-coding the Linux IRQ
> number. This way we only need to touch one driver.
>
> Adam,
>
> Can you please try if this patch still fixes the problem for you? Thanks.
>
>  drivers/pinctrl/intel/pinctrl-cherryview.c | 26 ++++++++++++++++++++++++--
>  1 file changed, 24 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
> index f80134e3e0b6..9ff790174906 100644
> --- a/drivers/pinctrl/intel/pinctrl-cherryview.c
> +++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
> @@ -13,6 +13,7 @@
>   * published by the Free Software Foundation.
>   */
>
> +#include <linux/dmi.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/init.h>
> @@ -1524,10 +1525,31 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
>         chained_irq_exit(chip, desc);
>  }
>
> +/*
> + * Certain machines seem to hardcode Linux IRQ numbers in their ACPI
> + * tables. Since we leave GPIOs that are not capable of generating
> + * interrupts out of the irqdomain the numbering will be different and
> + * cause devices using the hardcoded IRQ numbers fail. In order not to
> + * break such machines we will only mask pins from irqdomain if the machine
> + * is not listed below.
> + */
> +static const struct dmi_system_id chv_no_valid_mask[] = {
> +       {
> +               /* See https://bugzilla.kernel.org/show_bug.cgi?id=194945 */
> +               .ident = "Acer Chromebook (CYAN)",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "GOOGLE"),
> +                       DMI_MATCH(DMI_PRODUCT_NAME, "Edgar"),
> +                       DMI_MATCH(DMI_BIOS_DATE, "05/21/2016"),
> +               },
> +       }
> +};
> +
>  static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>  {
>         const struct chv_gpio_pinrange *range;
>         struct gpio_chip *chip = &pctrl->chip;
> +       bool need_valid_mask = !dmi_check_system(chv_no_valid_mask);
>         int ret, i, offset;
>
>         *chip = chv_gpio_chip;
> @@ -1536,7 +1558,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>         chip->label = dev_name(pctrl->dev);
>         chip->parent = pctrl->dev;
>         chip->base = -1;
> -       chip->irq_need_valid_mask = true;
> +       chip->irq_need_valid_mask = need_valid_mask;
>
>         ret = devm_gpiochip_add_data(pctrl->dev, chip, pctrl);
>         if (ret) {
> @@ -1567,7 +1589,7 @@ static int chv_gpio_probe(struct chv_pinctrl *pctrl, int irq)
>                 intsel &= CHV_PADCTRL0_INTSEL_MASK;
>                 intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
>
> -               if (intsel >= pctrl->community->nirqs)
> +               if (need_valid_mask && intsel >= pctrl->community->nirqs)
>                         clear_bit(i, chip->irq_valid_mask);
>         }
>
> --
> 2.11.0
>
