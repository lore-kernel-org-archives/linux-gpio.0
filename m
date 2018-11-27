From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH 1/2] gpio: mt7621: report failure of devm_kasprintf()
Date: Mon, 26 Nov 2018 23:20:53 -0800
Message-ID: <CAGp9LzqF7odHdOk85Z=iVG2ecuDcKXwod=9r0Kh2CDeZWZiK=g@mail.gmail.com>
References: <1542823573-20228-1-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542823573-20228-1-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: hofrat@osadl.org
Cc: Linus Walleij <linus.walleij@linaro.org>, sergio.paracuellos@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Nicholas Mc Guire <hofrat@osadl.org> =E6=96=BC 2018=E5=B9=B411=E6=9C=8821=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> kasprintf() may return NULL on failure of internal allocation thus the
> assigned  label  is not safe if not explicitly checked. On error
> mediatek_gpio_bank_probe() returns negative values so -ENOMEM in the
> (unlikely) failure case should be fine here.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Acked-by: Sean Wang <sean.wang@kernel.org>

> Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> ---
>
> V2: The dev_err() for the unlikely case of the devm_kasprintf()
>     failing was removed on request from Bartosz Golaszewski
>     <bgolaszewski@baylibre.com>
>
> Problem located with experimental coccinelle script
>
> Patch was compile tested with: omega2p_defconfig, SOC_MT7621=3Dy,
> GPIOLIB=3Dy, GPIO_MT7621=3Dy
>
> Patch is against 4.20-rc3 (localversion-next is next-20181121)
>
>  drivers/gpio/gpio-mt7621.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index d72af6f..1ec95bc 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -244,6 +244,8 @@ mediatek_gpio_bank_probe(struct device *dev,
>         rg->chip.of_xlate =3D mediatek_gpio_xlate;
>         rg->chip.label =3D devm_kasprintf(dev, GFP_KERNEL, "%s-bank%d",
>                                         dev_name(dev), bank);
> +       if (!rg->chip.label)
> +               return -ENOMEM;
>
>         ret =3D devm_gpiochip_add_data(dev, &rg->chip, mtk);
>         if (ret < 0) {
> --
> 2.1.4
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
