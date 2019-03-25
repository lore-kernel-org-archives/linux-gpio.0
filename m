From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH] gpio: fix a potential NULL pointer dereference
Date: Mon, 25 Mar 2019 09:28:43 +0100
Message-ID: <CAMpxmJU+Uh_oBqmCWmdpVQv52Duu6A3c+RGiL=tOYkqFUoX0ag@mail.gmail.com>
References: <20190324231002.2106-1-kjlu@umn.edu> <f4d27985-376a-42bb-b781-bdc96c0cef21@www.fastmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f4d27985-376a-42bb-b781-bdc96c0cef21@www.fastmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andrew Jeffery <andrew@aj.id.au>
Cc: Kangjie Lu <kjlu@umn.edu>, pakki001@umn.edu, Linus Walleij <linus.walleij@linaro.org>, Joel Stanley <joel@jms.id.au>, linux-gpio <linux-gpio@vger.kernel.org>, arm-soc <linux-arm-kernel@lists.infradead.org>, linux-aspeed@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

pon., 25 mar 2019 o 00:12 Andrew Jeffery <andrew@aj.id.au> napisa=C5=82(a):
>
>
>
> On Mon, 25 Mar 2019, at 09:40, Kangjie Lu wrote:
> > In case devm_kzalloc, the patch returns ENOMEM to avoid potential
> > NULL pointer dereference.
> >
> > Signed-off-by: Kangjie Lu <kjlu@umn.edu>
>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
>
> > ---
> >  drivers/gpio/gpio-aspeed.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> > index 854bce4fb9e7..217507002dbc 100644
> > --- a/drivers/gpio/gpio-aspeed.c
> > +++ b/drivers/gpio/gpio-aspeed.c
> > @@ -1224,6 +1224,8 @@ static int __init aspeed_gpio_probe(struct
> > platform_device *pdev)
> >
> >       gpio->offset_timer =3D
> >               devm_kzalloc(&pdev->dev, gpio->chip.ngpio, GFP_KERNEL);
> > +     if (!gpio->offset_timer)
> > +             return -ENOMEM;
> >
> >       return aspeed_gpio_setup_irqs(gpio, pdev);
> >  }
> > --
> > 2.17.1
> >
> >

Applied to fixes.

Bart
