From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2] gpio: convince line to become input in irq helper
Date: Tue, 5 Jul 2016 12:07:37 +0200
Message-ID: <CAMuHMdXVEjyctU88-u=FJcY0AwLKvFxdizkPTTjt_X=xM_H6UQ@mail.gmail.com>
References: <1466630758-26231-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33156 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932729AbcGEKHj convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2016 06:07:39 -0400
In-Reply-To: <1466630758-26231-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Bj=C3=B6rn_Andersson?= <bjorn.andersson@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>

Hi Linus,

On Wed, Jun 22, 2016 at 11:25 PM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> The generic IRQ helper library just checks if the IRQ line is
> set as input before activating it for interrupts. As we
> recently started to check things better with .get_dir() it
> turns out that it's good to try to convince the line to become
> an input before attempting to lock it as IRQ.
>
> Cc: Bj=C3=B6rn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Propagate the error from .direction_input() so we can rely on
>   it being used.

This patch (commit 7e7c059cb50c7c72 in gpio/for-next) breaks Ethernet o=
n
r8a7795/salvator-x:

    libphy: ravb_mii: probed
[1] gpio_rcar e6052000.gpio: sense irq =3D 11, type =3D 8
    ravb e6800000.ethernet eth0: Base address at 0xe6800000,
2e:09:0a:00:83:1e, IRQ 131.
    ...
[2] gpiochip_irq_reqres: gpiochip e6052000.gpio
[3] gpio_rcar e6052000.gpio: gpio_rcar_direction_input: 11
[4] gpiochip_irq_reqres: desc->flags =3D 0x0
    ravb e6800000.ethernet eth0: limited PHY to 100Mbit/s
    Micrel KSZ9031 Gigabit PHY e6800000.etherne:00: attached PHY
driver [Micrel KSZ9031 Gigabit PHY]
(mii_bus:phy_addr=3De6800000.etherne:00, irq=3D206)
    Waiting up to 110 more seconds for network.
    Waiting up to 100 more seconds for network.
    ...

Reverting it fixes the issue.

phy0 in arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts

        phy0: ethernet-phy@0 {
                ...
                interrupt-parent =3D <&gpio2>;
                interrupts =3D <11 IRQ_TYPE_LEVEL_LOW>;
        };

sets up the GPIO for interrupt mode, cfr. [1] in the kernel output abov=
e.

> ---
>  drivers/gpio/gpiolib.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 5a21a6acf8af..b195ec406ff4 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1505,6 +1505,25 @@ static int gpiochip_irq_reqres(struct irq_data=
 *d)
>         if (!try_module_get(chip->gpiodev->owner))
>                 return -ENODEV;
>
> +       /*
> +        * If it is possible to switch this GPIO to an input
> +        * this is a good time to do it.
> +        */
> +       if (chip->direction_input) {
> +               struct gpio_desc *desc;
> +               int ret;
> +
> +               desc =3D gpiochip_get_desc(chip, d->hwirq);
> +               if (IS_ERR(desc))
> +                       return PTR_ERR(desc);
> +
> +               ret =3D chip->direction_input(chip, d->hwirq);

This configures the GPIO for plain input mode, cfr. [3] above, basicall=
y
undoing the configuration from [1]. Hence interrupts no longer come thr=
ough,
and Ethernet fails.

> +               if (ret)
> +                       return ret;
> +
> +               clear_bit(FLAG_IS_OUT, &desc->flags);

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-=
m68k.org

In personal conversations with technical people, I call myself a hacker=
=2E But
when I'm talking to journalists I just say "programmer" or something li=
ke that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
