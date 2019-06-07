From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] gpio: davinci: Add new compatible for K3 AM654 SoCs
Date: Sat, 8 Jun 2019 00:38:12 +0200
Message-ID: <CACRpkda_YmWoatVEt6OO+enYVfbZ6wvP5gmRG5+h5k=DVbPi+A@mail.gmail.com>
References: <20190605080259.2462-1-j-keerthy@ti.com> <20190605080259.2462-3-j-keerthy@ti.com>
 <CAMpxmJXjMX20TAEsfEa7pqZx5-aW_rMKwS+6g9NTvRNEfuAyeA@mail.gmail.com>
 <96dbfd50-2a45-e3dc-3928-47fbc52f9269@ti.com> <CAMRc=Mfe+K=s4OZp7VWRik7JtSU6Fpufx0yDZtYCMNh5+LSJuQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=Mfe+K=s4OZp7VWRik7JtSU6Fpufx0yDZtYCMNh5+LSJuQ@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Keerthy <j-keerthy@ti.com>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, Lokesh Vutla <lokeshvutla@ti.com>, linux-gpio <linux-gpio@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>, LKML <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jun 6, 2019 at 9:49 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> =C5=9Br., 5 cze 2019 o 17:12 Keerthy <j-keerthy@ti.com> napisa=C5=82(a):

> > >>   static const struct of_device_id davinci_gpio_ids[] =3D {
> > >>          { .compatible =3D "ti,keystone-gpio", keystone_gpio_get_irq=
_chip},
> > >> +       { .compatible =3D "ti,am654-gpio", keystone_gpio_get_irq_chi=
p},
> > >
> > > Please add a patch adding this compatible to the binding document as =
well.
> >
> > https://patchwork.kernel.org/patch/10976445/
> >
> > Posted but did not add you in Cc. Sorry about that.
>
> I don't see it on GPIO patchwork either. Please resend it as part of
> this series.

I see the whole other series got resent as RFC, I'll just apply these
three and the binding patch so we don't have to pingpong these
patches too much around :)

Yours,
Linus Walleij
