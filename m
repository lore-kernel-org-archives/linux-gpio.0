From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: dwapb: Add support for next generation of X-Gene SoC
Date: Mon, 6 Feb 2017 11:21:09 +0100
Message-ID: <CACRpkdZw-QLOeiPqSRaEJ+mGGDwi5fh9B1uenPxQGBtTwj+cuw@mail.gmail.com>
References: <1485891838-27093-1-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1485891838-27093-1-git-send-email-hotran@apm.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Hoan Tran <hotran@apm.com>, Jamie Iles <jamie@jamieiles.com>, Weike Chen <alvin.chen@intel.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Loc Ho <lho@apm.com>, Duc Dang <dhdang@apm.com>
List-Id: linux-gpio@vger.kernel.org

On Tue, Jan 31, 2017 at 8:43 PM, Hoan Tran <hotran@apm.com> wrote:

> Next generation of X-Gene SoC's GPIO hardware register map is very
> similar to DW GPIO. It only differs by a few register addresses.
> This patch modifies DW GPIO driver to accommodate the difference
> in a few register addresses.
>
> Signed-off-by: Hoan Tran <hotran@apm.com>

On next iteration please include Jamie Iles, Weike Chen and Sebastian
Andrzej Siewior.
They all provided substantial contributions to this driver.

The dwapb needs a proper maintainer in MAINTAINERS actually, it is one of
those that can't use GPIOLIB_IRQCHIP so it requires special attention.
Jamie, interested in the job? Patches welcome :)

Also I've been thinking about this:

#define GPIO_SWPORTA_DR         0x00
#define GPIO_SWPORTA_DDR        0x04
#define GPIO_SWPORTB_DR         0x0c
#define GPIO_SWPORTB_DDR        0x10
#define GPIO_SWPORTC_DR         0x18
#define GPIO_SWPORTC_DDR        0x1c
#define GPIO_SWPORTD_DR         0x24
#define GPIO_SWPORTD_DDR        0x28
#define GPIO_INTEN              0x30
#define GPIO_INTMASK            0x34
#define GPIO_INTTYPE_LEVEL      0x38
#define GPIO_INT_POLARITY       0x3c
#define GPIO_INTSTATUS          0x40
#define GPIO_PORTA_DEBOUNCE     0x48
#define GPIO_PORTA_EOI          0x4c
#define GPIO_EXT_PORTA          0x50
#define GPIO_EXT_PORTB          0x54
#define GPIO_EXT_PORTC          0x58
#define GPIO_EXT_PORTD          0x5c

I wonder what is at addresses 0x08, 0x14, 0x20, 0x2c, 0x44?

Anything interesting we should know about? I bet they are not just
dead address space.

Is there a public datasheet for this thing that I can look at?

Yours,
Linus Walleij
