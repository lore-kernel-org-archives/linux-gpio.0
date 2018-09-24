From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] gpio: mockup: use device properties instead of platform_data
Date: Mon, 24 Sep 2018 09:35:38 +0200
Message-ID: <CAMRc=MfZ8jRZHgXBq9TeYm5VpmLzwG7gF-NMYay9Zg-iEgFQDQ@mail.gmail.com>
References: <20180923111727.10378-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180923111727.10378-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bamvor Jian Zhang <bamv2005@gmail.com>, Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

niedz., 23 wrz 2018 o 13:17 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=
=82(a):
>
> Some users want to introduce device tree support to the mockup driver.
> Let's make it easier by switching to using generic device properties.
> The driver stays compatible with previous use cases and after this
> conversion there'll be no need to change the way probing of mockup
> GPIO chips works.
>
> Tested with libgpiod test suite.
>
> Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> ---
>  drivers/gpio/gpio-mockup.c | 82 ++++++++++++++++++++++++--------------
>  1 file changed, 51 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mockup.c b/drivers/gpio/gpio-mockup.c
> index d66b7a768ecd..4e66bd83b76c 100644
> --- a/drivers/gpio/gpio-mockup.c
> +++ b/drivers/gpio/gpio-mockup.c
> @@ -18,6 +18,7 @@
>  #include <linux/irq_sim.h>
>  #include <linux/debugfs.h>
>  #include <linux/uaccess.h>
> +#include <linux/property.h>
>
>  #include "gpiolib.h"
>
> @@ -28,6 +29,8 @@
>   * of GPIO lines.
>   */
>  #define GPIO_MOCKUP_MAX_RANGES (GPIO_MOCKUP_MAX_GC * 2)
> +/* Maximum of three properties + the sentinel. */
> +#define GPIO_MOCKUP_MAX_PROP   4
>
>  #define gpio_mockup_err(...)   pr_err(GPIO_MOCKUP_NAME ": " __VA_ARGS__)
>
> @@ -59,13 +62,6 @@ struct gpio_mockup_dbgfs_private {
>         int offset;
>  };
>
> -struct gpio_mockup_platform_data {
> -       int base;
> -       int ngpio;
> -       int index;
> -       bool named_lines;
> -};
> -
>  static int gpio_mockup_ranges[GPIO_MOCKUP_MAX_RANGES];
>  static int gpio_mockup_num_ranges;
>  module_param_array(gpio_mockup_ranges, int, &gpio_mockup_num_ranges, 040=
0);
> @@ -255,26 +251,37 @@ static int gpio_mockup_name_lines(struct device *de=
v,
>
>  static int gpio_mockup_probe(struct platform_device *pdev)
>  {
> -       struct gpio_mockup_platform_data *pdata;
>         struct gpio_mockup_chip *chip;
>         struct gpio_chip *gc;
> -       int rv, base, ngpio;
>         struct device *dev;
> -       char *name;
> +       const char *name;
> +       int rv, base;
> +       u16 ngpio;
>
>         dev =3D &pdev->dev;
> -       pdata =3D dev_get_platdata(dev);
> -       base =3D pdata->base;
> -       ngpio =3D pdata->ngpio;
> +
> +       rv =3D device_property_read_u32(dev, "gpio-base", &base);
> +       if (rv && rv =3D=3D -ENOENT)

Linus, I just noticed that we either need to drop the check for
-ENOENT or add an else that returns on any other error. I'll need to
send a v2 but I'll let you first tell me if you like the general idea.

Bart

> +               base =3D -1;
> +
> +       rv =3D device_property_read_u16(dev, "nr-gpios", &ngpio);
> +       if (rv)
> +               return rv;
> +
> +       rv =3D device_property_read_string(dev, "chip-name", &name);
> +       if (rv)
> +               name =3D NULL;
>
>         chip =3D devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
>         if (!chip)
>                 return -ENOMEM;
>
> -       name =3D devm_kasprintf(dev, GFP_KERNEL, "%s-%c",
> -                             pdev->name, pdata->index);
> -       if (!name)
> -               return -ENOMEM;
> +       if (!name) {
> +               name =3D devm_kasprintf(dev, GFP_KERNEL,
> +                                     "%s-%c", pdev->name, pdev->id + 'A'=
);
> +               if (!name)
> +                       return -ENOMEM;
> +       }
>
>         gc =3D &chip->gc;
>         gc->base =3D base;
> @@ -295,7 +302,7 @@ static int gpio_mockup_probe(struct platform_device *=
pdev)
>         if (!chip->lines)
>                 return -ENOMEM;
>
> -       if (pdata->named_lines) {
> +       if (device_property_read_bool(dev, "named-gpio-lines")) {
>                 rv =3D gpio_mockup_name_lines(dev, chip);
>                 if (rv)
>                         return rv;
> @@ -339,9 +346,11 @@ static void gpio_mockup_unregister_pdevs(void)
>
>  static int __init gpio_mockup_init(void)
>  {
> -       int i, num_chips, err =3D 0, index =3D 'A';
> -       struct gpio_mockup_platform_data pdata;
> +       struct property_entry properties[GPIO_MOCKUP_MAX_PROP];
> +       int i, prop, num_chips, err =3D 0, base;
> +       struct platform_device_info pdevinfo;
>         struct platform_device *pdev;
> +       u16 ngpio;
>
>         if ((gpio_mockup_num_ranges < 2) ||
>             (gpio_mockup_num_ranges % 2) ||
> @@ -371,17 +380,28 @@ static int __init gpio_mockup_init(void)
>         }
>
>         for (i =3D 0; i < num_chips; i++) {
> -               pdata.index =3D index++;
> -               pdata.base =3D gpio_mockup_range_base(i);
> -               pdata.ngpio =3D pdata.base < 0
> -                               ? gpio_mockup_range_ngpio(i)
> -                               : gpio_mockup_range_ngpio(i) - pdata.base=
;
> -               pdata.named_lines =3D gpio_mockup_named_lines;
> -
> -               pdev =3D platform_device_register_resndata(NULL,
> -                                                        GPIO_MOCKUP_NAME=
,
> -                                                        i, NULL, 0, &pda=
ta,
> -                                                        sizeof(pdata));
> +               memset(properties, 0, sizeof(properties));
> +               memset(&pdevinfo, 0, sizeof(pdevinfo));
> +               prop =3D 0;
> +
> +               base =3D gpio_mockup_range_base(i);
> +               if (base >=3D 0)
> +                       properties[prop++] =3D PROPERTY_ENTRY_U32("gpio-b=
ase",
> +                                                               base);
> +
> +               ngpio =3D base < 0 ? gpio_mockup_range_ngpio(i)
> +                                : gpio_mockup_range_ngpio(i) - base;
> +               properties[prop++] =3D PROPERTY_ENTRY_U16("nr-gpios", ngp=
io);
> +
> +               if (gpio_mockup_named_lines)
> +                       properties[prop++] =3D PROPERTY_ENTRY_BOOL(
> +                                               "named-gpio-lines");
> +
> +               pdevinfo.name =3D GPIO_MOCKUP_NAME;
> +               pdevinfo.id =3D i;
> +               pdevinfo.properties =3D properties;
> +
> +               pdev =3D platform_device_register_full(&pdevinfo);
>                 if (IS_ERR(pdev)) {
>                         gpio_mockup_err("error registering device");
>                         platform_driver_unregister(&gpio_mockup_driver);
> --
> 2.18.0
>
