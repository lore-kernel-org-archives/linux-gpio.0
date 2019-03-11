From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: add a check for the return value of ida_simple_get fails
Date: Mon, 11 Mar 2019 10:31:43 +0100
Message-ID: <CAMpxmJUjUJSfQuFYqHmwvcBwdt7e6g1crGfkMdKR6wObePptdQ@mail.gmail.com>
References: <20190309040757.924-1-kjlu@umn.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190309040757.924-1-kjlu@umn.edu>
Sender: linux-kernel-owner@vger.kernel.org
To: Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Linus Walleij <linus.walleij@linaro.org>, linux-gpio <linux-gpio@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

sob., 9 mar 2019 o 05:08 Kangjie Lu <kjlu@umn.edu> napisa=C5=82(a):
>
> ida_simple_get may fail and return a negative error number.
> The fix checks its return value; if it fails, go to err_destroy.
>
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> ---
>  drivers/gpio/gpio-exar.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
> index 0ecd2369c2ca..a09d2f9ebacc 100644
> --- a/drivers/gpio/gpio-exar.c
> +++ b/drivers/gpio/gpio-exar.c
> @@ -148,6 +148,8 @@ static int gpio_exar_probe(struct platform_device *pd=
ev)
>         mutex_init(&exar_gpio->lock);
>
>         index =3D ida_simple_get(&ida_index, 0, 0, GFP_KERNEL);
> +       if (index < 0)
> +               goto err_destroy;
>
>         sprintf(exar_gpio->name, "exar_gpio%d", index);
>         exar_gpio->gpio_chip.label =3D exar_gpio->name;
> --
> 2.17.1
>

Applied, I Cc'ed stable and will send it to Linus Walleij once
v5.1-rc1 is tagged.

Bart
