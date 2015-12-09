From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/4] gpio: pxa: integrate with pincontrol
Date: Wed, 9 Dec 2015 23:58:22 +0100
Message-ID: <CACRpkdZ0JZOsU7VuFyeM8akWTKHjksEC3-wB4zrx0NJBRD+agQ@mail.gmail.com>
References: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1448746665-13422-1-git-send-email-robert.jarzmik@free.fr>
Sender: linux-kernel-owner@vger.kernel.org
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Alexandre Courbot <gnurou@gmail.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Daniel Mack <zonque@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Sat, Nov 28, 2015 at 10:37 PM, Robert Jarzmik <robert.jarzmik@free.fr> wrote:

> Hi Linus, Alexandre and Haojian,
>
> This serie aims at several cleanups and improvements in the pxa gpio driver, to

I have concerns about this series.

I am worried that joining the banks into one gpio_chip makes it
impossible for you GPIOLIB_IRQCHIP. Usually that is possible and
preferrable when using a chained handler if e.g. one bank has
one IRQ line.

But overall that depends on how the IRQs map on this hardware.
Can you describe how the GPIO IRQs work on the PXA27x?

Yours,
Linus Walleij
