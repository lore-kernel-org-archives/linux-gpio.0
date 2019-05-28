From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH 1/2] gpio: max732x: use i2c_new_dummy_device()
Date: Tue, 28 May 2019 17:52:58 +0200
Message-ID: <CAMRc=MdJoO602kLfP_Hw9-0pB25CeUMxfqBUYhC7CB3Aw+5O4A@mail.gmail.com>
References: <20190521090306.28113-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190521090306.28113-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

wt., 21 maj 2019 o 11:03 Bartosz Golaszewski <brgl@bgdev.pl> napisa=C5=82(a=
):
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> We now have a resource managed version of i2c_new_dummy_device() that
> also returns an actual error code instead of a NULL-pointer. Use it
> in the max732x GPIO driver and simplify code in the process.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

If there are no objections I'll apply it by the end of this week.

Bart

>  drivers/gpio/gpio-max732x.c | 37 ++++++++++++++-----------------------
>  1 file changed, 14 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
> index f03cb0ba7726..7fd1bdfe00e5 100644
> --- a/drivers/gpio/gpio-max732x.c
> +++ b/drivers/gpio/gpio-max732x.c
> @@ -652,12 +652,12 @@ static int max732x_probe(struct i2c_client *client,
>         case 0x60:
>                 chip->client_group_a =3D client;
>                 if (nr_port > 8) {
> -                       c =3D i2c_new_dummy(client->adapter, addr_b);
> -                       if (!c) {
> +                       c =3D devm_i2c_new_dummy_device(&client->dev,
> +                                                     client->adapter, ad=
dr_b);
> +                       if (IS_ERR(c)) {
>                                 dev_err(&client->dev,
>                                         "Failed to allocate I2C device\n"=
);
> -                               ret =3D -ENODEV;
> -                               goto out_failed;
> +                               return PTR_ERR(c);
>                         }
>                         chip->client_group_b =3D chip->client_dummy =3D c=
;
>                 }
> @@ -665,12 +665,12 @@ static int max732x_probe(struct i2c_client *client,
>         case 0x50:
>                 chip->client_group_b =3D client;
>                 if (nr_port > 8) {
> -                       c =3D i2c_new_dummy(client->adapter, addr_a);
> -                       if (!c) {
> +                       c =3D devm_i2c_new_dummy_device(&client->dev,
> +                                                     client->adapter, ad=
dr_a);
> +                       if (IS_ERR(c)) {
>                                 dev_err(&client->dev,
>                                         "Failed to allocate I2C device\n"=
);
> -                               ret =3D -ENODEV;
> -                               goto out_failed;
> +                               return PTR_ERR(c);
>                         }
>                         chip->client_group_a =3D chip->client_dummy =3D c=
;
>                 }
> @@ -678,36 +678,34 @@ static int max732x_probe(struct i2c_client *client,
>         default:
>                 dev_err(&client->dev, "invalid I2C address specified %02x=
\n",
>                                 client->addr);
> -               ret =3D -EINVAL;
> -               goto out_failed;
> +               return -EINVAL;
>         }
>
>         if (nr_port > 8 && !chip->client_dummy) {
>                 dev_err(&client->dev,
>                         "Failed to allocate second group I2C device\n");
> -               ret =3D -ENODEV;
> -               goto out_failed;
> +               return -ENODEV;
>         }
>
>         mutex_init(&chip->lock);
>
>         ret =3D max732x_readb(chip, is_group_a(chip, 0), &chip->reg_out[0=
]);
>         if (ret)
> -               goto out_failed;
> +               return ret;
>         if (nr_port > 8) {
>                 ret =3D max732x_readb(chip, is_group_a(chip, 8), &chip->r=
eg_out[1]);
>                 if (ret)
> -                       goto out_failed;
> +                       return ret;
>         }
>
>         ret =3D gpiochip_add_data(&chip->gpio_chip, chip);
>         if (ret)
> -               goto out_failed;
> +               return ret;
>
>         ret =3D max732x_irq_setup(chip, id);
>         if (ret) {
>                 gpiochip_remove(&chip->gpio_chip);
> -               goto out_failed;
> +               return ret;
>         }
>
>         if (pdata && pdata->setup) {
> @@ -719,10 +717,6 @@ static int max732x_probe(struct i2c_client *client,
>
>         i2c_set_clientdata(client, chip);
>         return 0;
> -
> -out_failed:
> -       i2c_unregister_device(chip->client_dummy);
> -       return ret;
>  }
>
>  static int max732x_remove(struct i2c_client *client)
> @@ -744,9 +738,6 @@ static int max732x_remove(struct i2c_client *client)
>
>         gpiochip_remove(&chip->gpio_chip);
>
> -       /* unregister any dummy i2c_client */
> -       i2c_unregister_device(chip->client_dummy);
> -
>         return 0;
>  }
>
> --
> 2.21.0
>
