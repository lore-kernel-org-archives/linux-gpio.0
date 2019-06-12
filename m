From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/1] gpio: of: prepare for switching stmmac to GPIO descriptors
Date: Wed, 12 Jun 2019 09:49:54 +0200
Message-ID: <CACRpkdboUO1iEipXTvhy2x6bxuVJuwxd5FduMdk-KtK3f8FeaA@mail.gmail.com>
References: <20190610170523.26554-1-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190610170523.26554-1-martin.blumenstingl@googlemail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Andrew Lunn <andrew@lunn.ch>, netdev <netdev@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, Jun 10, 2019 at 7:05 PM Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:

> This is a preparation patch which is needed before we can switch stmmac
> to GPIO descriptors. stmmac has a custom "snps,reset-active-low"
> property because it has ignored the GPIO flags including the polarity.
>
> Add the parsing to gpiolib-of so we can port stmmac over to GPIO
> descriptors.
>
> This patch is split from my series at [0].
>
> Linus W.: please create an immutable branch as discussed so I can send
> the stmmac patches to the net-next tree (which will then have to pull
> in your immutable branch).

Thanks Martin!
I have applied the patch and created an immutable branch:
git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git
ib-snps-reset-gpio

https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=ib-snps-reset-gpio

Please refer to this so the network maintainer can pull it in.

It is based on v5.2-rc1

Yours,
Linus Walleij
