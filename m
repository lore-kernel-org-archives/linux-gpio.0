From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Add new compatible for K3 AM654 SoCs
Date: Thu, 6 Jun 2019 09:49:07 +0200
Message-ID: <CAMRc=Mfe+K=s4OZp7VWRik7JtSU6Fpufx0yDZtYCMNh5+LSJuQ@mail.gmail.com>
References: <20190605080259.2462-1-j-keerthy@ti.com> <20190605080259.2462-3-j-keerthy@ti.com>
 <CAMpxmJXjMX20TAEsfEa7pqZx5-aW_rMKwS+6g9NTvRNEfuAyeA@mail.gmail.com> <96dbfd50-2a45-e3dc-3928-47fbc52f9269@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <96dbfd50-2a45-e3dc-3928-47fbc52f9269@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, lokeshvutla@ti.com, linux-gpio <linux-gpio@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

=C5=9Br., 5 cze 2019 o 17:12 Keerthy <j-keerthy@ti.com> napisa=C5=82(a):
>
>
>
> On 05/06/19 7:56 PM, Bartosz Golaszewski wrote:
> > =C5=9Br., 5 cze 2019 o 10:02 Keerthy <j-keerthy@ti.com> napisa=C5=82(a)=
:
> >>
> >> Add new compatible for K3 AM654 SoCs.
> >>
> >> Signed-off-by: Keerthy <j-keerthy@ti.com>
> >> ---
> >>   drivers/gpio/gpio-davinci.c | 1 +
> >>   1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> >> index 0977590eb996..fc494a84a29d 100644
> >> --- a/drivers/gpio/gpio-davinci.c
> >> +++ b/drivers/gpio/gpio-davinci.c
> >> @@ -632,6 +632,7 @@ static int davinci_gpio_irq_setup(struct platform_=
device *pdev)
> >>
> >>   static const struct of_device_id davinci_gpio_ids[] =3D {
> >>          { .compatible =3D "ti,keystone-gpio", keystone_gpio_get_irq_c=
hip},
> >> +       { .compatible =3D "ti,am654-gpio", keystone_gpio_get_irq_chip}=
,
> >
> > Please add a patch adding this compatible to the binding document as we=
ll.
>
> https://patchwork.kernel.org/patch/10976445/
>
> Posted but did not add you in Cc. Sorry about that.
>

I don't see it on GPIO patchwork either. Please resend it as part of
this series.

Bart
