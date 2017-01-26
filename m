From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 2/5] pinctrl: rz-pfc: Add Renesas RZ/A1 pinctrl driver
Date: Thu, 26 Jan 2017 20:49:09 +0100
Message-ID: <CAMuHMdVShqXeZU+g1jz4adBqEoGvJRY2TUMrefm7KK+VUAgRfA@mail.gmail.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-3-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <1485367787-8109-3-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jacopo,

On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add pin controller driver for Renesas RZ/A1 SoC.
> The SoC driver registers to rz-pfc core module and provides pin
> description array and SoC specific pin mux operation.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

> --- a/drivers/pinctrl/rz-pfc/Makefile
> +++ b/drivers/pinctrl/rz-pfc/Makefile
> @@ -1 +1,2 @@
>  obj-$(CONFIG_PINCTRL_RZ_PINCTRL)               += pinctrl-rz.o
> +obj-$(CONFIG_PINCTRL_RZA1_PINCTRL)             += pinctrl-rza1.o
> diff --git a/drivers/pinctrl/rz-pfc/pinctrl-rza1.c b/drivers/pinctrl/rz-pfc/pinctrl-rza1.c
> new file mode 100644
> index 0000000..221f048
> --- /dev/null
> +++ b/drivers/pinctrl/rz-pfc/pinctrl-rza1.c

> +
> +/* ----------------------------------------------------------------------------
> + * SoC operations
> + */
> +
> +static inline void rza1_set_bit(struct rz_pinctrl_res *res, int reg,
> +                               int bank, int pin, int set)
> +{
> +       void __iomem *mem = RZA1_ADDR(res->base, reg, bank);
> +       u16 val = set ? ioread16(mem) | 1 << pin :
> +                       ioread16(mem) & ~(1 << pin);
> +#ifdef RZA1_REG_DBG
> +       u16 temp = ioread16(mem);
> +
> +       pr_err("%p %p %p - %4x %4x\n",
> +              (void *)res->start, res->base, mem, temp, val);

Please drop the cast, take the address, and use %pa to format a
resource_size_t, cfr. Documentation/printk-formats.txt.

> + static struct rz_pinctrl_ops rza1_pinctrl_ops = {

const

> +       .set_mux = rza1_set_mux,
> +};
> +
> +static struct rz_pinctrl_info rza1_info = {

const

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
