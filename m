From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH 0/7] VF610 GPIO fixes/improvments
Date: Mon, 11 Mar 2019 10:55:43 +0100
Message-ID: <CAMpxmJXXp9KMNBExV5xQZg-dmS=WeRSD52_CKgXneMw5oA9dSg@mail.gmail.com>
References: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190311062737.6652-1-andrew.smirnov@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: linux-gpio <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Chris Healy <cphealy@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Fabio Estevam <festevam@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-imx@nxp.com
List-Id: linux-gpio@vger.kernel.org

pon., 11 mar 2019 o 07:28 Andrey Smirnov <andrew.smirnov@gmail.com> napisa=
=C5=82(a):
>
> Everyone:
>
> This series contains a number of fixes/improvements I came up with
> while working VF610 GPIO code. Hopefully each commit is
> self-explanatory.
>
> Feedback is welcome!
>
> Thanks,
> Andrey Smirnov
>
> Andrey Smirnov (7):
>   gpio: vf610: Do not share irq_chip
>   gpio: vf610: Simplify vf610_gpio_set()
>   gpio: vf610: Simplify vf610_gpio_get()
>   gpio: vf610: Use devres to disable clk_port
>   gpio: vf610: Use devres to disable clk_gpio
>   gpio: vf610: Use devres to remove gpiochip
>   gpio: vf610: Don't use explicit &pdev->dev in vf610_gpio_probe()
>
>  drivers/gpio/gpio-vf610.c | 85 +++++++++++++++++----------------------
>  1 file changed, 36 insertions(+), 49 deletions(-)
>
> --
> 2.20.1
>

Nice cleanups! Series applied, thanks!

Bart
