From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: hlwd: Add basic IRQ support
Date: Mon, 14 Jan 2019 11:20:49 +0100
Message-ID: <CACRpkdYyMwu+hFQF4PUSb8N8zo3QEFt5=curhsdTFP1FCtGpNw@mail.gmail.com>
References: <20190113135844.13109-1-j.neuschaefer@gmx.net> <20190113135844.13109-2-j.neuschaefer@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190113135844.13109-2-j.neuschaefer@gmx.net>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

Hi Jonathan,

thanks for the patch! It is looking very good.
Some minor comments:

On Sun, Jan 13, 2019 at 3:00 PM Jonathan Neusch=C3=A4fer
<j.neuschaefer@gmx.net> wrote:

>         select GPIO_GENERIC
> +       select GPIOLIB_IRQCHIP

Nice!

> +static void hlwd_gpio_irqhandler(struct irq_desc *desc)
> +{
> +       struct hlwd_gpio *hlwd =3D
> +               gpiochip_get_data(irq_desc_get_handler_data(desc));
> +       struct irq_chip *chip =3D irq_desc_get_chip(desc);
> +       unsigned long flags;
> +       unsigned long pending;
> +       int hwirq;
> +
> +       spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
> +       pending =3D hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTFLAG);
> +       pending &=3D hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTMASK);

Please just access IO directly instead through the helper.
ioread32be()/iowrite32be() I suppose?

> +static void hlwd_gpio_irq_ack(struct irq_data *data)
> +{
> +       struct hlwd_gpio *hlwd =3D
> +               gpiochip_get_data(irq_data_get_irq_chip_data(data));
> +
> +       hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTFLAG, BIT(data->hw=
irq));

Dito.

> +       spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
> +       mask =3D hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTMASK);
> +       mask &=3D ~BIT(data->hwirq);
> +       hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTMASK, mask);

Dito.

> +       spin_lock_irqsave(&hlwd->gpioc.bgpio_lock, flags);
> +       mask =3D hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTMASK);
> +       mask |=3D BIT(data->hwirq);
> +       hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTMASK, mask);

Dito.

> +       switch (flow_type) {
> +       case IRQ_TYPE_LEVEL_HIGH:
> +               level =3D hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTL=
VL);
> +               level |=3D BIT(data->hwirq);
> +               hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTLVL, level=
);
> +               break;
> +       case IRQ_TYPE_LEVEL_LOW:
> +               level =3D hlwd->gpioc.read_reg(hlwd->regs + HW_GPIOB_INTL=
VL);
> +               level &=3D ~BIT(data->hwirq);
> +               hlwd->gpioc.write_reg(hlwd->regs + HW_GPIOB_INTLVL, level=
);
> +               break;

Dito.

> +       hlwd->irqc.name =3D "GPIO";

What about using something device-unique?

hlwd->irqc.name =3D dev_name(&pdev->dev);

for example?

otherwise it looks fine!

Yours,
Linus Walleij
