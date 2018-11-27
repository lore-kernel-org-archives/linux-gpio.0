From: Sean Wang <sean.wang@kernel.org>
Subject: Re: [PATCH 2/2] gpio: mt7621: pass mediatek_gpio_bank_probe() failure
 up the stack
Date: Mon, 26 Nov 2018 23:49:26 -0800
Message-ID: <CAGp9LzoT7ueXyyVSYQdWOU0JkQDWMVcwCuSE3gJnEn0fLLjCBA@mail.gmail.com>
References: <1542823573-20228-1-git-send-email-hofrat@osadl.org> <1542823573-20228-2-git-send-email-hofrat@osadl.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1542823573-20228-2-git-send-email-hofrat@osadl.org>
Sender: linux-kernel-owner@vger.kernel.org
To: hofrat@osadl.org
Cc: Linus Walleij <linus.walleij@linaro.org>, sergio.paracuellos@gmail.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, bgolaszewski@baylibre.com, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-gpio@vger.kernel.org

Nicholas Mc Guire <hofrat@osadl.org> =E6=96=BC 2018=E5=B9=B411=E6=9C=8821=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=8810:13=E5=AF=AB=E9=81=93=EF=
=BC=9A
>
> The error cases of mediatek_gpio_bank_probe() would go unnoticed (except
> for the dev_err() messages). The probe function should return an error
> if one of the banks failed to initialize properly.
>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> Fixes: 4ba9c3afda41 ("gpio: mt7621: Add a driver for MT7621")
> ---
>
> Patch was compile tested with: omega2p_defconfig, SOC_MT7621=3Dy,
> GPIOLIB=3Dy, GPIO_MT7621=3Dy
>
> Patch is against 4.20-rc3 (localversion-next is next-20181121)
>
>  drivers/gpio/gpio-mt7621.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-mt7621.c b/drivers/gpio/gpio-mt7621.c
> index 1ec95bc..68fca8b 100644
> --- a/drivers/gpio/gpio-mt7621.c
> +++ b/drivers/gpio/gpio-mt7621.c
> @@ -297,6 +297,7 @@ mediatek_gpio_probe(struct platform_device *pdev)
>         struct device_node *np =3D dev->of_node;
>         struct mtk *mtk;
>         int i;
> +       int ret;
>
>         mtk =3D devm_kzalloc(dev, sizeof(*mtk), GFP_KERNEL);
>         if (!mtk)
> @@ -311,8 +312,11 @@ mediatek_gpio_probe(struct platform_device *pdev)
>         platform_set_drvdata(pdev, mtk);
>         mediatek_gpio_irq_chip.name =3D dev_name(dev);
>
> -       for (i =3D 0; i < MTK_BANK_CNT; i++)
> -               mediatek_gpio_bank_probe(dev, np, i);
> +       for (i =3D 0; i < MTK_BANK_CNT; i++) {
> +               ret =3D mediatek_gpio_bank_probe(dev, np, i);
> +               if (!ret)

it should be if (ret < 0) ?

> +                       return ret;
> +       }
>
>         return 0;
>  }
> --
> 2.1.4
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
