From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
Subject: RE: [PATCH 2/2] drivers/gpio/gpio-adp5588.c: switch to events system
Date: Tue, 5 Feb 2019 15:57:02 +0000
Message-ID: <BY1PR0301MB0901ED3A4CA9AA2A0E1701FE8E6E0@BY1PR0301MB0901.namprd03.prod.outlook.com>
References: <c1638e5c06be365ad205e4717fd9f226cd1983a2.1549379326.git.nikolaus.voss@loewensteinmedical.de>
 <3230ace6f820fccadb51097ae9ba9f5ee247d79b.1549379326.git.nikolaus.voss@loewensteinmedical.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <3230ace6f820fccadb51097ae9ba9f5ee247d79b.1549379326.git.nikolaus.voss@loewensteinmedical.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolaus Voss <nv@vosn.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
List-Id: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Nikolaus Voss [mailto:nv@vosn.de]
> Sent: Dienstag, 5. Februar 2019 14:31
> To: Hennerich, Michael <Michael.Hennerich@analog.com>; Linus Walleij <lin=
us.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org; Nikolaus Vo=
ss <nikolaus.voss@loewensteinmedical.de>
> Subject: [PATCH 2/2] drivers/gpio/gpio-adp5588.c: switch to events system
>=20
> Interupts were generated using GPIN interrupts of
> ADP5588. These interrupts have two important limitations:
> 1. Interrupts can only be generated for either rising or
>    falling edges but not both.
> 2. Interrupts are reasserted as long as the interrupt condition
>    persists (i.e. high or low level on that GPIN). This generates
>    lots of interrupts unless the event is very short.
>=20
> To overcome this, ADP5588 provides an event system which queues
> up to 10 events in a buffer. GPIN events are queued whenever the
> GPIN is asserted or deasserted. This makes it possible to support
> generating GPIN interrupts for both edges and to generate only one
> interrupt per state change.
> Thus it is possible to chain the gpio-keys driver for some GPIOs.

Looks like a viable and much better solution. This already works pretty wel=
l for the input driver.
I can't test at the moment, but I assume you already did.

Well done and thanks for this patch!

>=20
> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>


> ---
>  drivers/gpio/gpio-adp5588.c | 85 ++++++++++++++-----------------------
>  1 file changed, 32 insertions(+), 53 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
> index 0a8cfccba818..6583a3787035 100644
> --- a/drivers/gpio/gpio-adp5588.c
> +++ b/drivers/gpio/gpio-adp5588.c
> @@ -36,12 +36,11 @@ struct adp5588_gpio {
>         struct mutex irq_lock;
>         uint8_t dat_out[3];
>         uint8_t dir[3];
> -       uint8_t int_lvl[3];
> +       uint8_t int_lvl_low[3];
> +       uint8_t int_lvl_high[3];
>         uint8_t int_en[3];
>         uint8_t irq_mask[3];
> -       uint8_t irq_stat[3];
>         uint8_t int_input_en[3];
> -       uint8_t int_lvl_cached[3];
>  };
>=20
>  static int adp5588_gpio_read(struct i2c_client *client, u8 reg)
> @@ -180,15 +179,9 @@ static void adp5588_irq_bus_sync_unlock(struct irq_d=
ata *d)
>                         mutex_unlock(&dev->lock);
>                 }
>=20
> -               if (dev->int_lvl_cached[i] !=3D dev->int_lvl[i]) {
> -                       dev->int_lvl_cached[i] =3D dev->int_lvl[i];
> -                       adp5588_gpio_write(dev->client, GPIO_INT_LVL1 + i=
,
> -                                          dev->int_lvl[i]);
> -               }
> -
>                 if (dev->int_en[i] ^ dev->irq_mask[i]) {
>                         dev->int_en[i] =3D dev->irq_mask[i];
> -                       adp5588_gpio_write(dev->client, GPIO_INT_EN1 + i,
> +                       adp5588_gpio_write(dev->client, GPI_EM1 + i,
>                                            dev->int_en[i]);
>                 }
>         }
> @@ -219,21 +212,17 @@ static int adp5588_irq_set_type(struct irq_data *d,=
 unsigned int type)
>         uint16_t gpio =3D d->hwirq;
>         unsigned bank, bit;
>=20
> -       if ((type & IRQ_TYPE_EDGE_BOTH)) {
> -               dev_err(&dev->client->dev, "irq %d: unsupported type %d\n=
",
> -                       d->irq, type);
> -               return -EINVAL;
> -       }
> -
>         bank =3D ADP5588_BANK(gpio);
>         bit =3D ADP5588_BIT(gpio);
>=20
> -       if (type & IRQ_TYPE_LEVEL_HIGH)
> -               dev->int_lvl[bank] |=3D bit;
> -       else if (type & IRQ_TYPE_LEVEL_LOW)
> -               dev->int_lvl[bank] &=3D ~bit;
> -       else
> -               return -EINVAL;
> +       dev->int_lvl_low[bank] &=3D ~bit;
> +       dev->int_lvl_high[bank] &=3D ~bit;
> +
> +       if (type & IRQ_TYPE_EDGE_BOTH || type & IRQ_TYPE_LEVEL_HIGH)
> +               dev->int_lvl_high[bank] |=3D bit;
> +
> +       if (type & IRQ_TYPE_EDGE_BOTH || type & IRQ_TYPE_LEVEL_LOW)
> +               dev->int_lvl_low[bank] |=3D bit;
>=20
>         dev->int_input_en[bank] |=3D bit;
>=20
> @@ -249,41 +238,32 @@ static struct irq_chip adp5588_irq_chip =3D {
>         .irq_set_type           =3D adp5588_irq_set_type,
>  };
>=20
> -static int adp5588_gpio_read_intstat(struct i2c_client *client, u8 *buf)
> -{
> -       int ret =3D i2c_smbus_read_i2c_block_data(client, GPIO_INT_STAT1,=
 3, buf);
> -
> -       if (ret < 0)
> -               dev_err(&client->dev, "Read INT_STAT Error\n");
> -
> -       return ret;
> -}
> -
>  static irqreturn_t adp5588_irq_handler(int irq, void *devid)
>  {
>         struct adp5588_gpio *dev =3D devid;
> -       unsigned status, bank, bit, pending;
> -       int ret;
> -       status =3D adp5588_gpio_read(dev->client, INT_STAT);
> +       int status =3D adp5588_gpio_read(dev->client, INT_STAT);
>=20
> -       if (status & ADP5588_GPI_INT) {
> -               ret =3D adp5588_gpio_read_intstat(dev->client, dev->irq_s=
tat);
> -               if (ret < 0)
> -                       memset(dev->irq_stat, 0, ARRAY_SIZE(dev->irq_stat=
));
> +       if (status & ADP5588_KE_INT) {
> +               int ev_cnt =3D adp5588_gpio_read(dev->client, KEY_LCK_EC_=
STAT);
>=20
> -               for (bank =3D 0, bit =3D 0; bank <=3D ADP5588_BANK(ADP558=
8_MAXGPIO);
> -                       bank++, bit =3D 0) {
> -                       pending =3D dev->irq_stat[bank] & dev->irq_mask[b=
ank];
> +               if (ev_cnt > 0) {
> +                       int i;
>=20
> -                       while (pending) {
> -                               if (pending & (1 << bit)) {
> -                                       handle_nested_irq(
> -                                               irq_find_mapping(
> -                                                  dev->gpio_chip.irq.dom=
ain,
> -                                                  (bank << 3) + bit));
> -                                       pending &=3D ~(1 << bit);
> -                               }
> -                               bit++;
> +                       for (i =3D 0; i < (ev_cnt & ADP5588_KEC); i++) {
> +                               int key =3D adp5588_gpio_read(dev->client=
,
> +                                                           Key_EVENTA + =
i);
> +                               /* GPIN events begin at 97,
> +                                * bit 7 indicates logic level
> +                                */
> +                               int gpio =3D (key & 0x7f) - 97;
> +                               int lvl =3D key & (1 << 7);
> +                               int bank =3D ADP5588_BANK(gpio);
> +                               int bit =3D ADP5588_BIT(gpio);
> +
> +                               if ((lvl && dev->int_lvl_high[bank] & bit=
) ||
> +                                   (!lvl && dev->int_lvl_low[bank] & bit=
))
> +                                       handle_nested_irq(irq_find_mappin=
g(
> +                                             dev->gpio_chip.irq.domain, =
gpio));
>                         }
>                 }
>         }
> @@ -303,7 +283,6 @@ static int adp5588_irq_setup(struct adp5588_gpio *dev=
)
>=20
>         adp5588_gpio_write(client, CFG, ADP5588_AUTO_INC);
>         adp5588_gpio_write(client, INT_STAT, -1); /* status is W1C */
> -       adp5588_gpio_read_intstat(client, dev->irq_stat); /* read to clea=
r */
>=20
>         mutex_init(&dev->irq_lock);
>=20
> @@ -330,7 +309,7 @@ static int adp5588_irq_setup(struct adp5588_gpio *dev=
)
>                                     client->irq);
>=20
>         adp5588_gpio_write(client, CFG,
> -               ADP5588_AUTO_INC | ADP5588_INT_CFG | ADP5588_GPI_INT);
> +               ADP5588_AUTO_INC | ADP5588_INT_CFG | ADP5588_KE_IEN);
>=20
>         return 0;
>  }
> --
> 2.17.1
