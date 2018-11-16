From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] ARM: davinci: fix ethernet support on da850-evm
Date: Fri, 16 Nov 2018 22:51:08 +0100
Message-ID: <CACRpkda4aarCn=PHPSWfMgtOZhcGA2ifcA7_ujYgmj+do2+N+Q@mail.gmail.com>
References: <20181113135051.15308-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20181113135051.15308-1-brgl@bgdev.pl>
Sender: linux-kernel-owner@vger.kernel.org
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "Nori, Sekhar" <nsekhar@ti.com>, Kevin Hilman <khilman@kernel.org>, Russell King <linux@armlinux.org.uk>, Keerthy <j-keerthy@ti.com>, Grygorii Strashko <grygorii.strashko@ti.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Nov 13, 2018 at 2:51 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Ethernet doesn't work on da850-evm in legacy boot mode since v4.19. This
> series addresses two problems I've found. I guess with this kind of
> intrusive changes in the GPIO driver, other boards may be broken at the
> moment too.
>
> Bartosz Golaszewski (3):
>   ARM: davinci: define gpio interrupts as separate resources
>   gpio: davinci: restore a way to manually specify the GPIO base
>   ARM: davinci: fix da850-evm boot in legacy mode

I have some patches starting to move DaVinci over to using only
descriptor tables, but that's not somthing we can pull off overnight
so I guess we have to go for this solution.

Can we have ACKs from the DaVinci maintainers so I can merge
all three patches through the GPIO tree fixes? Else I'm fine
with merging through ARM SoC.

Yours,
Linus Walleij
