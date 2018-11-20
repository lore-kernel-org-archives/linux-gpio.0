From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] ARM: davinci: fix ethernet support on da850-evm
Date: Tue, 20 Nov 2018 09:40:27 +0100
Message-ID: <CACRpkdaN+SsF+gGPV7KTT_E6k7_KAFhSgUKR=Jg0-fSjrx8V=Q@mail.gmail.com>
References: <20181113135051.15308-1-brgl@bgdev.pl> <CACRpkda4aarCn=PHPSWfMgtOZhcGA2ifcA7_ujYgmj+do2+N+Q@mail.gmail.com>
 <CAMRc=MeAR=aW0FKNyRm0xy075BkF=cpDJyJDiwtWpWcmkdmF2A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAMRc=MeAR=aW0FKNyRm0xy075BkF=cpDJyJDiwtWpWcmkdmF2A@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Keerthy <j-keerthy@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Nov 19, 2018 at 10:11 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> pt., 16 lis 2018 o 22:51 Linus Walleij <linus.walleij@linaro.org> napisa=
=C5=82(a):

> > I have some patches starting to move DaVinci over to using only
> > descriptor tables, but that's not somthing we can pull off overnight
> > so I guess we have to go for this solution.
> >
>
> Nice, would you mind sharing the development branch? I'm interested in
> it as well and may be doing some work on that early 2019 so let's sync
> to avoid duplicating the effort.

Just a stab:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commi=
t/?h=3Dgpio-descriptors-leds&id=3Db4db69c2a066a87c990a6757720284df88f11f57

It will also require this patch (as I realized after talking to the PXA
people):
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commi=
t/?h=3Dgpio-descriptors-mmc-cd-wp&id=3D1911a4fe1ed8805080d8c7e0adc298f74053=
1c3b

I guess I should queue the naming patch in some immutable branch
or something so it can be pulled in all over the place.

Yours,
Linus Walleij
