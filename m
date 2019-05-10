From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] Documentation: gpio: remove duplicated lines
Date: Fri, 10 May 2019 12:15:38 +0200
Message-ID: <CAMpxmJVL3KLqgu9oRQOFmdAHq1jDbCCXxxq=cE1XyxX83zNgzg@mail.gmail.com>
References: <20190510090339.17211-1-luca@lucaceresoli.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190510090339.17211-1-luca@lucaceresoli.net>
Sender: linux-kernel-owner@vger.kernel.org
To: Luca Ceresoli <luca@lucaceresoli.net>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, LKML <linux-kernel@vger.kernel.org>, linux-doc <linux-doc@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pt., 10 maj 2019 o 11:03 Luca Ceresoli <luca@lucaceresoli.net> napisa=C5=82=
(a):
>
> The 'default (active high)' lines are repeated twice. Avoid people stare =
at
> their screens looking for differences.
>
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> ---
>  Documentation/driver-api/gpio/consumer.rst | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Documentation/driver-api/gpio/consumer.rst b/Documentation/d=
river-api/gpio/consumer.rst
> index 5e4d8aa68913..23d68c321c5c 100644
> --- a/Documentation/driver-api/gpio/consumer.rst
> +++ b/Documentation/driver-api/gpio/consumer.rst
> @@ -283,8 +283,6 @@ To summarize::
>    gpiod_set_value(desc, 1);          default (active high)  high
>    gpiod_set_value(desc, 0);          active low             high
>    gpiod_set_value(desc, 1);          active low             low
> -  gpiod_set_value(desc, 0);          default (active high)  low
> -  gpiod_set_value(desc, 1);          default (active high)  high
>    gpiod_set_value(desc, 0);          open drain             low
>    gpiod_set_value(desc, 1);          open drain             high impedan=
ce
>    gpiod_set_value(desc, 0);          open source            high impedan=
ce
> --
> 2.21.0
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
