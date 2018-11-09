From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 bus+gpio 3/4] drivers: gpio: Add support for GPIOs over
 Moxtet bus
Date: Fri, 9 Nov 2018 11:12:47 +0100
Message-ID: <CACRpkdbLQX3ZcuJE_CMxtnJ37f2f=BWHuf0wa1PG6if3-4DSow@mail.gmail.com>
References: <20181102103539.6077-1-marek.behun@nic.cz> <20181102103539.6077-3-marek.behun@nic.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181102103539.6077-3-marek.behun@nic.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: marek.behun@nic.cz
Cc: ext Tony Lindgren <tony@atomide.com>, Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Nov 2, 2018 at 11:35 AM Marek Beh=C3=BAn <marek.behun@nic.cz> wrote=
:

> This adds support for interpreting the input and output bits of one
> device on Moxtet bus as GPIOs.
> This is needed for example by the SFP cage module of Turris Mox.
>
> Signed-off-by: Marek Beh=C3=BAn <marek.behun@nic.cz>

Overall looks fine, it's OK like this just adding some nitpicking:

> +static const struct moxtet_gpio_desc descs[] =3D {
> +       [TURRIS_MOX_MODULE_SFP] =3D {
> +               .in_mask =3D 0x7,
> +               .out_mask =3D 0x30,
> +       },
> +};

You can actually use things like:

.in_mask =3D GENMASK(3,0);

ton indicate exactly which bits you hit, but maybe it is overkill.
(No big deal.)

> +       return (ret & BIT(offset)) ? 1 : 0;

I would usually just clamp like this:

return !!(red & BIT(offset));

> +static int moxtet_gpio_get_direction(struct gpio_chip *gc, unsigned int =
offset)
> +{
> +       struct moxtet_gpio_chip *chip =3D gpiochip_get_data(gc);
> +
> +       if (chip->desc->in_mask & BIT(offset))
> +               return 1;
> +       else if (chip->desc->out_mask & BIT(offset))
> +               return 0;
> +       else
> +               return -EINVAL;

Maybe insert a comment here that a line is hard wired
as either input or output.

Anyways:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
