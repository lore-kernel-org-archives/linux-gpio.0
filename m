From: "Hennerich, Michael" <Michael.Hennerich@analog.com>
Subject: RE: [PATCH 1/2] drivers/gpio/gpio-adp5588.c: add device tree support
Date: Tue, 5 Feb 2019 16:00:56 +0000
Message-ID: <BY1PR0301MB090160B978C729C4FB022D918E6E0@BY1PR0301MB0901.namprd03.prod.outlook.com>
References: <c1638e5c06be365ad205e4717fd9f226cd1983a2.1549379326.git.nikolaus.voss@loewensteinmedical.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <c1638e5c06be365ad205e4717fd9f226cd1983a2.1549379326.git.nikolaus.voss@loewensteinmedical.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Nikolaus Voss <nv@vosn.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
List-Id: linux-gpio@vger.kernel.org



> -----Original Message-----
> From: Nikolaus Voss [mailto:nv@vosn.de]
> Sent: Mittwoch, 25. Juli 2018 10:44
> To: Hennerich, Michael <Michael.Hennerich@analog.com>; Linus Walleij <lin=
us.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org; linux-kernel@vger.kernel.org; Nikolaus Vo=
ss <nikolaus.voss@loewensteinmedical.de>
> Subject: [PATCH 1/2] drivers/gpio/gpio-adp5588.c: add device tree support
>=20
> Make platform data optional and add DT id table.
> Switch to dynamically mapped GPIOs and IRQs if not provided
> via platform data.

Long overdue maintenance patch...
Looks good to me.

Thanks for this series!=20

>=20
> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>

Acked-by: Michael Hennerich <michael.hennerich@analog.com>

> ---
>  drivers/gpio/gpio-adp5588.c | 151 ++++++++++++++++--------------------
>  1 file changed, 68 insertions(+), 83 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
> index da9781a2ef4a..0a8cfccba818 100644
> --- a/drivers/gpio/gpio-adp5588.c
> +++ b/drivers/gpio/gpio-adp5588.c
> @@ -15,6 +15,7 @@
>  #include <linux/gpio/driver.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> +#include <linux/of_device.h>
>=20
>  #include <linux/platform_data/adp5588.h>
>=20
> @@ -33,8 +34,6 @@ struct adp5588_gpio {
>         struct mutex lock;      /* protect cached dir, dat_out */
>         /* protect serialized access to the interrupt controller bus */
>         struct mutex irq_lock;
> -       unsigned gpio_start;
> -       unsigned irq_base;
>         uint8_t dat_out[3];
>         uint8_t dir[3];
>         uint8_t int_lvl[3];
> @@ -148,16 +147,11 @@ static int adp5588_gpio_direction_output(struct gpi=
o_chip *chip,
>  }
>=20
>  #ifdef CONFIG_GPIO_ADP5588_IRQ
> -static int adp5588_gpio_to_irq(struct gpio_chip *chip, unsigned off)
> -{
> -       struct adp5588_gpio *dev =3D gpiochip_get_data(chip);
> -
> -       return dev->irq_base + off;
> -}
>=20
>  static void adp5588_irq_bus_lock(struct irq_data *d)
>  {
> -       struct adp5588_gpio *dev =3D irq_data_get_irq_chip_data(d);
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_gpio *dev =3D gpiochip_get_data(gc);
>=20
>         mutex_lock(&dev->irq_lock);
>  }
> @@ -172,7 +166,8 @@ static void adp5588_irq_bus_lock(struct irq_data *d)
>=20
>  static void adp5588_irq_bus_sync_unlock(struct irq_data *d)
>  {
> -       struct adp5588_gpio *dev =3D irq_data_get_irq_chip_data(d);
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_gpio *dev =3D gpiochip_get_data(gc);
>         int i;
>=20
>         for (i =3D 0; i <=3D ADP5588_BANK(ADP5588_MAXGPIO); i++) {
> @@ -203,24 +198,25 @@ static void adp5588_irq_bus_sync_unlock(struct irq_=
data *d)
>=20
>  static void adp5588_irq_mask(struct irq_data *d)
>  {
> -       struct adp5588_gpio *dev =3D irq_data_get_irq_chip_data(d);
> -       unsigned gpio =3D d->irq - dev->irq_base;
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_gpio *dev =3D gpiochip_get_data(gc);
>=20
> -       dev->irq_mask[ADP5588_BANK(gpio)] &=3D ~ADP5588_BIT(gpio);
> +       dev->irq_mask[ADP5588_BANK(d->hwirq)] &=3D ~ADP5588_BIT(d->hwirq)=
;
>  }
>=20
>  static void adp5588_irq_unmask(struct irq_data *d)
>  {
> -       struct adp5588_gpio *dev =3D irq_data_get_irq_chip_data(d);
> -       unsigned gpio =3D d->irq - dev->irq_base;
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_gpio *dev =3D gpiochip_get_data(gc);
>=20
> -       dev->irq_mask[ADP5588_BANK(gpio)] |=3D ADP5588_BIT(gpio);
> +       dev->irq_mask[ADP5588_BANK(d->hwirq)] |=3D ADP5588_BIT(d->hwirq);
>  }
>=20
>  static int adp5588_irq_set_type(struct irq_data *d, unsigned int type)
>  {
> -       struct adp5588_gpio *dev =3D irq_data_get_irq_chip_data(d);
> -       uint16_t gpio =3D d->irq - dev->irq_base;
> +       struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> +       struct adp5588_gpio *dev =3D gpiochip_get_data(gc);
> +       uint16_t gpio =3D d->hwirq;
>         unsigned bank, bit;
>=20
>         if ((type & IRQ_TYPE_EDGE_BOTH)) {
> @@ -281,10 +277,11 @@ static irqreturn_t adp5588_irq_handler(int irq, voi=
d *devid)
>=20
>                         while (pending) {
>                                 if (pending & (1 << bit)) {
> -                                       handle_nested_irq(dev->irq_base +
> -                                                         (bank << 3) + b=
it);
> +                                       handle_nested_irq(
> +                                               irq_find_mapping(
> +                                                  dev->gpio_chip.irq.dom=
ain,
> +                                                  (bank << 3) + bit));
>                                         pending &=3D ~(1 << bit);
> -
>                                 }
>                                 bit++;
>                         }
> @@ -299,53 +296,43 @@ static irqreturn_t adp5588_irq_handler(int irq, voi=
d *devid)
>  static int adp5588_irq_setup(struct adp5588_gpio *dev)
>  {
>         struct i2c_client *client =3D dev->client;
> +       int ret;
>         struct adp5588_gpio_platform_data *pdata =3D
>                         dev_get_platdata(&client->dev);
> -       unsigned gpio;
> -       int ret;
> +       int irq_base =3D pdata ? pdata->irq_base : 0;
>=20
>         adp5588_gpio_write(client, CFG, ADP5588_AUTO_INC);
>         adp5588_gpio_write(client, INT_STAT, -1); /* status is W1C */
>         adp5588_gpio_read_intstat(client, dev->irq_stat); /* read to clea=
r */
>=20
> -       dev->irq_base =3D pdata->irq_base;
>         mutex_init(&dev->irq_lock);
>=20
> -       for (gpio =3D 0; gpio < dev->gpio_chip.ngpio; gpio++) {
> -               int irq =3D gpio + dev->irq_base;
> -               irq_set_chip_data(irq, dev);
> -               irq_set_chip_and_handler(irq, &adp5588_irq_chip,
> -                                        handle_level_irq);
> -               irq_set_nested_thread(irq, 1);
> -               irq_modify_status(irq, IRQ_NOREQUEST, IRQ_NOPROBE);
> -       }
> -
> -       ret =3D request_threaded_irq(client->irq,
> -                                  NULL,
> -                                  adp5588_irq_handler,
> -                                  IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
> -                                  dev_name(&client->dev), dev);
> +       ret =3D devm_request_threaded_irq(&client->dev, client->irq,
> +                                       NULL, adp5588_irq_handler, IRQF_O=
NESHOT
> +                                       | IRQF_TRIGGER_FALLING | IRQF_SHA=
RED,
> +                                       dev_name(&client->dev), dev);
>         if (ret) {
>                 dev_err(&client->dev, "failed to request irq %d\n",
>                         client->irq);
> -               goto out;
> +               return ret;
>         }
> +       ret =3D gpiochip_irqchip_add_nested(&dev->gpio_chip,
> +                                         &adp5588_irq_chip, irq_base,
> +                                         handle_simple_irq,
> +                                         IRQ_TYPE_NONE);
> +       if (ret) {
> +               dev_err(&client->dev,
> +                       "could not connect irqchip to gpiochip\n");
> +               return ret;
> +       }
> +       gpiochip_set_nested_irqchip(&dev->gpio_chip,
> +                                   &adp5588_irq_chip,
> +                                   client->irq);
>=20
> -       dev->gpio_chip.to_irq =3D adp5588_gpio_to_irq;
>         adp5588_gpio_write(client, CFG,
>                 ADP5588_AUTO_INC | ADP5588_INT_CFG | ADP5588_GPI_INT);
>=20
>         return 0;
> -
> -out:
> -       dev->irq_base =3D 0;
> -       return ret;
> -}
> -
> -static void adp5588_irq_teardown(struct adp5588_gpio *dev)
> -{
> -       if (dev->irq_base)
> -               free_irq(dev->client->irq, dev);
>  }
>=20
>  #else
> @@ -357,24 +344,16 @@ static int adp5588_irq_setup(struct adp5588_gpio *d=
ev)
>         return 0;
>  }
>=20
> -static void adp5588_irq_teardown(struct adp5588_gpio *dev)
> -{
> -}
>  #endif /* CONFIG_GPIO_ADP5588_IRQ */
>=20
> -static int adp5588_gpio_probe(struct i2c_client *client,
> -                                       const struct i2c_device_id *id)
> +static int adp5588_gpio_probe(struct i2c_client *client)
>  {
>         struct adp5588_gpio_platform_data *pdata =3D
>                         dev_get_platdata(&client->dev);
>         struct adp5588_gpio *dev;
>         struct gpio_chip *gc;
>         int ret, i, revid;
> -
> -       if (!pdata) {
> -               dev_err(&client->dev, "missing platform data\n");
> -               return -ENODEV;
> -       }
> +       unsigned int pullup_dis_mask =3D 0;
>=20
>         if (!i2c_check_functionality(client->adapter,
>                                         I2C_FUNC_SMBUS_BYTE_DATA)) {
> @@ -394,18 +373,24 @@ static int adp5588_gpio_probe(struct i2c_client *cl=
ient,
>         gc->get =3D adp5588_gpio_get_value;
>         gc->set =3D adp5588_gpio_set_value;
>         gc->can_sleep =3D true;
> +       gc->base =3D -1;
> +       gc->parent =3D &client->dev;
> +
> +       if (pdata) {
> +               gc->base =3D pdata->gpio_start;
> +               gc->names =3D pdata->names;
> +               pullup_dis_mask =3D pdata->pullup_dis_mask;
> +       }
>=20
> -       gc->base =3D pdata->gpio_start;
>         gc->ngpio =3D ADP5588_MAXGPIO;
>         gc->label =3D client->name;
>         gc->owner =3D THIS_MODULE;
> -       gc->names =3D pdata->names;
>=20
>         mutex_init(&dev->lock);
>=20
>         ret =3D adp5588_gpio_read(dev->client, DEV_ID);
>         if (ret < 0)
> -               goto err;
> +               return ret;
>=20
>         revid =3D ret & ADP5588_DEVICE_ID_MASK;
>=20
> @@ -414,30 +399,27 @@ static int adp5588_gpio_probe(struct i2c_client *cl=
ient,
>                 dev->dir[i] =3D adp5588_gpio_read(client, GPIO_DIR1 + i);
>                 ret |=3D adp5588_gpio_write(client, KP_GPIO1 + i, 0);
>                 ret |=3D adp5588_gpio_write(client, GPIO_PULL1 + i,
> -                               (pdata->pullup_dis_mask >> (8 * i)) & 0xF=
F);
> +                               (pullup_dis_mask >> (8 * i)) & 0xFF);
>                 ret |=3D adp5588_gpio_write(client, GPIO_INT_EN1 + i, 0);
>                 if (ret)
> -                       goto err;
> +                       return ret;
>         }
>=20
> -       if (pdata->irq_base) {
> +       if (client->irq) {
>                 if (WA_DELAYED_READOUT_REVID(revid)) {
>                         dev_warn(&client->dev, "GPIO int not supported\n"=
);
>                 } else {
>                         ret =3D adp5588_irq_setup(dev);
>                         if (ret)
> -                               goto err;
> +                               return ret;
>                 }
>         }
>=20
>         ret =3D devm_gpiochip_add_data(&client->dev, &dev->gpio_chip, dev=
);
>         if (ret)
> -               goto err_irq;
> +               return ret;
>=20
> -       dev_info(&client->dev, "IRQ Base: %d Rev.: %d\n",
> -                       pdata->irq_base, revid);
> -
> -       if (pdata->setup) {
> +       if (pdata && pdata->setup) {
>                 ret =3D pdata->setup(client, gc->base, gc->ngpio, pdata->=
context);
>                 if (ret < 0)
>                         dev_warn(&client->dev, "setup failed, %d\n", ret)=
;
> @@ -446,11 +428,6 @@ static int adp5588_gpio_probe(struct i2c_client *cli=
ent,
>         i2c_set_clientdata(client, dev);
>=20
>         return 0;
> -
> -err_irq:
> -       adp5588_irq_teardown(dev);
> -err:
> -       return ret;
>  }
>=20
>  static int adp5588_gpio_remove(struct i2c_client *client)
> @@ -460,7 +437,7 @@ static int adp5588_gpio_remove(struct i2c_client *cli=
ent)
>         struct adp5588_gpio *dev =3D i2c_get_clientdata(client);
>         int ret;
>=20
> -       if (pdata->teardown) {
> +       if (pdata && pdata->teardown) {
>                 ret =3D pdata->teardown(client,
>                                       dev->gpio_chip.base, dev->gpio_chip=
.ngpio,
>                                       pdata->context);
> @@ -470,7 +447,7 @@ static int adp5588_gpio_remove(struct i2c_client *cli=
ent)
>                 }
>         }
>=20
> -       if (dev->irq_base)
> +       if (dev->client->irq)
>                 free_irq(dev->client->irq, dev);
>=20
>         return 0;
> @@ -480,14 +457,22 @@ static const struct i2c_device_id adp5588_gpio_id[]=
 =3D {
>         {DRV_NAME, 0},
>         {}
>  };
> -
>  MODULE_DEVICE_TABLE(i2c, adp5588_gpio_id);
>=20
> +#ifdef CONFIG_OF
> +static const struct of_device_id adp5588_gpio_of_id[] =3D {
> +       { .compatible =3D "adi," DRV_NAME, },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, adp5588_gpio_of_id);
> +#endif
> +
>  static struct i2c_driver adp5588_gpio_driver =3D {
>         .driver =3D {
> -                  .name =3D DRV_NAME,
> -                  },
> -       .probe =3D adp5588_gpio_probe,
> +               .name =3D DRV_NAME,
> +               .of_match_table =3D of_match_ptr(adp5588_gpio_of_id),
> +       },
> +       .probe_new =3D adp5588_gpio_probe,
>         .remove =3D adp5588_gpio_remove,
>         .id_table =3D adp5588_gpio_id,
>  };
> --
> 2.17.1
