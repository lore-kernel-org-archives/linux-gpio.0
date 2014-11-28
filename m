From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv4 3/3] gpio: sch: Enable IRQ support for Quark X1000
Date: Fri, 28 Nov 2014 15:02:42 +0100
Message-ID: <CACRpkdba0XparJCKrV9XrU3dxTnuWhEYGQQMKzi+SDEiOAsapQ@mail.gmail.com>
References: <1416977280-27319-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<1416977280-27319-4-git-send-email-rebecca.swee.fun.chang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1416977280-27319-4-git-send-email-rebecca.swee.fun.chang@intel.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, GPIO Subsystem Mailing List <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@intel.com>, Denis Turischev <denis.turischev@compulab.co.il>, Alexandre Courbot <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Nov 26, 2014 at 5:48 AM, Chang Rebecca Swee Fun
<rebecca.swee.fun.chang@intel.com> wrote:

> ntel Quark X1000 GPIO controller supports interrupt handling for
> both core power well and resume power well. This patch is to enable
> the IRQ support and provide IRQ handling for Intel Quark X1000
> GPIO-SCH device driver.
>
> This piece of work is derived from Dan O'Donovan's initial work for
> Quark X1000 enabling.
>
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

This is just adding handling of cascading interrupts from a
GPIO chip as far as I can tell. We don't do that with local
per-driver hacks anymore if there is no special reason, we have
helpers on gpiolib to handle this.

Make your Kconfig select GPIOLIB_IRQCHIP and take it from
there, look at how other drivers using GPIOLIB_IRQCHIP are
done. Read the documentation for chained irqchips in
Documentation/gpio/driver.txt

Yours,
Linus Walleij
