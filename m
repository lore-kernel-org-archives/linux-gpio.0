From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/3] gpio: drop a few unneeded irq_{request,release}_resources
 implementations
Date: Fri, 8 Feb 2019 15:44:11 +0100
Message-ID: <CACRpkdYe2r_HC=sUjW8K0vsLucVe6aVC-SKS++Kw6zryXuuzRg@mail.gmail.com>
References: <20190208115201.7518-1-thomas.petazzoni@bootlin.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190208115201.7518-1-thomas.petazzoni@bootlin.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Feb 8, 2019 at 12:52 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:

> Three GPIO drivers in the tree implement the
> irq_{request,release}_resources hooks with what is in fact the default
> implementation provided by the GPIO core, making this driver-specific
> code redundant.

So you could think!

But the GPIOLIB_IRQCHIP code only kicks in if the GPIO driver
is using the gpiolib irqchip helpers, i.e. calls gpiolib_irqchip_add_*.
And those three are the ones that still have to implement their
own irqchips.

The helpers did come about because all drivers started to
duplicate code like this.

The designware chip should ideally be converted to use
hierarchical irqdomain since that seems to be what it is doing,
but I think the hierarchical irqdomain didn't even exist when that
driver was submitted.

Yours,
Linus Walleij
