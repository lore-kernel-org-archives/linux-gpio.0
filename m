From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [RFC 1/5] pinctrl: rz-pfc: Add Renesas RZ pinctrl core module
Date: Thu, 26 Jan 2017 20:43:06 +0100
Message-ID: <CAMuHMdUmOAW5kPacMskVT_7R+T4qMmbPiaZV2z51sn1EELG4SQ@mail.gmail.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:35956 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753407AbdAZTzn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2017 14:55:43 -0500
In-Reply-To: <1485367787-8109-2-git-send-email-jacopo+renesas@jmondi.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hi Jacopo,

On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
> Add core module for per-pin Renesas RZ series pin controller.
> The core module allows SoC driver to register their pins and SoC
> specific operations and interfaces with pinctrl and pinmux core on their
> behalf.
>
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

I believe nothing besides the DT property "renesas-rz,pins" and the value
of the RZ_PIN_ARGS_COUNT macro is really specific to Renesas or RZ(A)?
So this could become something really generic, and part of core pinctrl?

> --- /dev/null
> +++ b/drivers/pinctrl/rz-pfc/pinctrl-rz.c
> @@ -0,0 +1,447 @@

> +#define RZ_PIN_ARGS_COUNT      3

This should be a parameter in the SoC-specific subdriver.

> +/**
> + * rz_pinctrl_pos_to_index() - Retrieve the index of pin at position [bank:pin]
> + *
> + * This can be improved, as it walks all the pins reported by the SoC driver
> + *
> + * @return: pin number between [0 - npins]; -1 if not found
> + */
> +static int rz_pinctrl_pos_to_index(struct rz_pinctrl_dev *rz_pinctrl,
> +                                  unsigned int bank, unsigned int pin)
> +{
> +       struct rz_pinctrl_info *info;
> +       struct rz_pin_desc *rz_pin;

const

> +       int i, npins;

unsigned int

> +/* ----------------------------------------------------------------------------
> + * pinctrl operations
> + */
> +static void rz_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,

const ... pctldev

> +                           unsigned int pin)
> +{
> +       struct rz_pinctrl_dev *rz_pinctrl;
> +       struct rz_pinctrl_info *info;

const

> +static int rz_dt_node_to_map(struct pinctrl_dev *pctldev,
> +                            struct device_node *np_config,
> +                            struct pinctrl_map **map, unsigned int *num_maps)
> +{

> +       fngrps = devm_kzalloc(rz_pinctrl->dev, sizeof(*fngrps), GFP_KERNEL);
> +       if (unlikely(!fngrps)) {

Please don't use unlikely.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
