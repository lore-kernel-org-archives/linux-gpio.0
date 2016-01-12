From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH 2/2] gpio-f7188x: filter non-export gpio for F81866
Date: Tue, 12 Jan 2016 11:33:15 +0200
Message-ID: <CAHp75VctumwyOtLpqyCB3ABUu8ktwhN94POGdtS4Ug7cnuayEg@mail.gmail.com>
References: <1452584499-13939-1-git-send-email-hpeter+linux_kernel@gmail.com>
	<1452584499-13939-3-git-send-email-hpeter+linux_kernel@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1452584499-13939-3-git-send-email-hpeter+linux_kernel@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter Hung <hpeter@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, tom_tsai@fintek.com.tw, Peter H <peter_hong@fintek.com.tw>, Peter Hung <hpeter+linux_kernel@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 12, 2016 at 9:41 AM, Peter Hung <hpeter@gmail.com> wrote:
> Dont export gpios which not enabled by motherboard manufacturer.

'Do not' or 'Don't'.

Perhaps 'GPIOs'.

'which are not enabled'

> +#define F81866_PORT_SEL_REG    0x27
> +#define F81866_MULTI_FUN1_REG  0x28
> +#define F81866_MULTI_FUN3_REG  0x29
> +#define F81866_MULTI_FUN4_REG  0x2B
> +#define F81866_GPIO_EN_REG     0x2C
> +

Move this before IDs block.

Use same prefix SIO_ and drop _REG, e.g.
SIO_F81866_PORT_SEL

=46UN -> FN or FUNC (Personally I prefer shorter)

>  enum chips { f71869, f71869a, f71882fg, f71889f, f81866 };
>
>  static const char * const f7188x_names[] =3D {
> @@ -93,6 +99,15 @@ static inline void superio_outb(int base, int reg,=
 int val)
>         outb(val, base + 1);
>  }
>
> +static inline void superio_mask_outb(int base, int reg, int mask, in=
t val)

Usually we named such as _update or _update_bits.
superio_update()

> +{
> +       u8 tmp;
> +
> +       tmp =3D superio_inb(base, reg);
> +       tmp =3D (tmp & ~mask) | (val & mask);
> +       superio_outb(base, reg, tmp);
> +}
> +
>  static inline int superio_enter(int base)
>  {
>         /* Don't step on other drivers' I/O space by accident. */
> @@ -304,6 +319,125 @@ static void f7188x_gpio_set(struct gpio_chip *c=
hip, unsigned offset, int value)
>         superio_exit(sio->addr);
>  }
>
> +static int f81866_verify_gpioset(int base, int set)

=E2=80=A6_gpio_verify() looks more suitable to the existing scheme.

> +{
> +       int err;
> +       u8 tmp;
> +
> +       err =3D superio_enter(base);
> +       if (err)
> +               return err;
> +
> +       err =3D -ENODEV;
> +
> +       switch (set) {
> +       case 0:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) |=
 BIT(2) |
> +                               BIT(0), 0);
> +               tmp =3D superio_inb(base, F81866_GPIO_EN_REG);
> +               if ((tmp & 0x1f) !=3D 0x1f)

Magic number.

> +                       break; /* one in GPIO00~GPIO04 is not enable =
*/
> +
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +               if ((tmp & 0xc) !=3D 0x0)

Magic and no need to compare to !=3D 0 explicitly.

> +                       break;
> +
> +               err =3D 0; /* GPIO0x set is all enabled */

Maybe you can refactor this in better way.
Assign set of values in switch-case and do check after, only once.

Same comments are applicable to other cases below.

> +               break;
> +       case 1:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) |=
 BIT(2) |
> +                               BIT(0), BIT(2));
> +               tmp =3D superio_inb(base, F81866_GPIO_EN_REG);
> +               if ((tmp & 0xef) !=3D 0xef)
> +                       break; /* one in GPIO10~GPIO17 is not enable =
*/
> +
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN3_REG);
> +               if ((tmp & 0x03) !=3D 0x00)
> +                       break; /* one in GPIO12~GPIO13 is not enable =
*/
> +
> +               err =3D 0; /* GPIO1x set is all enabled */
> +               break;
> +       case 2:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) |=
 BIT(2) |
> +                               BIT(0), BIT(3));
> +               tmp =3D superio_inb(base, F81866_GPIO_EN_REG);
> +               if ((tmp & 0xff) !=3D 0xff)
> +                       break; /* one in GPIO20~GPIO27 is not enable =
*/
> +
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN3_REG);
> +               if ((tmp & 0x08) !=3D 0x00)
> +                       break; /* GPIO20 is not enable */
> +
> +               err =3D 0; /* GPIO2x set is all enabled */
> +               break;
> +       case 3:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(0), =
0);
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN3_REG);
> +               if ((tmp & 0x30) !=3D 0x00)
> +                       break; /* GPIO3x is not enable */
> +
> +               err =3D 0; /* GPIO3x set is all enabled */
> +               break;
> +       case 4:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(0), =
0);
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN3_REG);
> +               if ((tmp & 0xc0) !=3D 0x00)
> +                       break; /* GPIO4x is not enable */
> +
> +               err =3D 0; /* GPIO4x set is all enabled */
> +               break;
> +       case 5:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) |=
 BIT(2),
> +                               0);
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +               if ((tmp & 0x43) !=3D 0x40)
> +                       break; /* GPIO5x is not enable */
> +
> +               err =3D 0; /* GPIO5x set is all enabled */
> +               break;
> +       case 6:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) |=
 BIT(2) |
> +                               BIT(0), 0);
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +               if ((tmp & 0x4c) !=3D 0x40)
> +                       break; /* GPIO60~64 is not enable */
> +
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN4_REG);
> +               if ((tmp & 0xe0) !=3D 0xe0)
> +                       break; /* GPIO65~67 is not enable */
> +
> +               err =3D 0; /* GPIO6x set is all enabled */
> +               break;
> +       case 7:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) |=
 BIT(2) |
> +                               BIT(0), 0);
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +               if ((tmp & 0x20) !=3D 0x20)
> +                       break; /* GPIO7x is not enable */
> +
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN4_REG);
> +               if ((tmp & 0x01) !=3D 0x00)
> +                       break; /* GPIO70 is not enable */
> +
> +               err =3D 0; /* GPIO7x set is all enabled */
> +               break;
> +       case 8:
> +               superio_mask_outb(base, F81866_PORT_SEL_REG, BIT(3) |=
 BIT(2),
> +                               0);
> +               tmp =3D superio_inb(base, F81866_MULTI_FUN1_REG);
> +               if ((tmp & 0x20) !=3D 0x20)
> +                       break; /* GPIO8x is not enable */
> +
> +               err =3D 0; /* GPIO8x set is all enabled */
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       superio_exit(base);
> +       return err;
> +}
> +
>  /*
>   * Platform device and driver.
>   */
> @@ -351,6 +485,15 @@ static int f7188x_gpio_probe(struct platform_dev=
ice *pdev)
>         for (i =3D 0; i < data->nr_bank; i++) {
>                 struct f7188x_gpio_bank *bank =3D &data->bank[i];
>
> +               /*
> +                * Dont export GPIO sysfs if pin set is not enable by=
 MB

Don't

> +                * manufacturer.
> +                */
> +               if (sio->type =3D=3D f81866 && f81866_verify_gpioset(=
sio->addr, i))
> +                       continue;
> +
> +               dev_dbg(&pdev->dev, "%s: register GPIO%xx set\n", __f=
unc__,

%x ?

> +                               bank->chip.base >> 4);
>                 bank->chip.dev =3D &pdev->dev;
>                 bank->data =3D data;
>
> @@ -368,6 +511,11 @@ static int f7188x_gpio_probe(struct platform_dev=
ice *pdev)
>  err_gpiochip:
>         for (i =3D i - 1; i >=3D 0; i--) {
>                 struct f7188x_gpio_bank *bank =3D &data->bank[i];
> +
> +               /* Some GPIO is not export, not need to remove */
> +               if (!bank->data || !bank->chip.dev)
> +                       continue;
> +
>                 gpiochip_remove(&bank->chip);
>         }
>
> @@ -381,6 +529,11 @@ static int f7188x_gpio_remove(struct platform_de=
vice *pdev)
>
>         for (i =3D 0; i < data->nr_bank; i++) {
>                 struct f7188x_gpio_bank *bank =3D &data->bank[i];
> +
> +               /* Some GPIO is not export, not need to remove */
> +               if (!bank->data || !bank->chip.dev)
> +                       continue;
> +
>                 gpiochip_remove(&bank->chip);



--=20
With Best Regards,
Andy Shevchenko
