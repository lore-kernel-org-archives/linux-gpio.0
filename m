From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio/mxc: mask gpio interrupts in suspend
Date: Thu, 13 Aug 2015 14:47:54 +0200
Message-ID: <CACRpkdavXPrFpGmva1Fp9KqDbGzsGd9r8qg2MyLnTBAy24KRZQ@mail.gmail.com>
References: <1438795388-22743-1-git-send-email-edubezval@gmail.com>
	<1438795388-22743-2-git-send-email-edubezval@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438795388-22743-2-git-send-email-edubezval@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Eduardo Valentin <edubezval@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, ubrindis56@gmail.com, Fabio Estevam <fabio.estevam@freescale.com>, Fabio Estevam <festevam@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Wed, Aug 5, 2015 at 7:23 PM, Eduardo Valentin <edubezval@gmail.com> wrote:

> From: Ulises Brindis <ubrindis56@gmail.com>
>
> Currently in the FSL platform all GPIO interrupts in a bank are muxed
> into two GPIO lines to the GPC interrupt controller. In each GPIO bank
> GPIOs 0-15 are OR'ed into one GPC interrupt controller interrupt and 16-31
> are OR'ed into another. With the current code, if any of the 0-15 or
> 16-31 interrupts are marked as wakeup capable, all interrupts belonging
> to that sub-bank (either 0-15 or 16-31) will wake up the device. This is
> because interrupts are only being masked at the interrupt controller
> and not at the GPIO controller.
>
> This patch allows masking of GPIO interrupts at the GPIO controller during
> suspend if they have not been labeled wakeup capable. This patch uses
> preexisting IRQCHIP_MASK_ON_SUSPEND flag while initializing the GPIO
> interrupts to get the desired behavior.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Eduardo Valentin <edubezval@gmail.com>
> Signed-off-by: Ulises Brindis <ubrindis56@gmail.com>

Patch applied.

Yours,
Linus Walleij
