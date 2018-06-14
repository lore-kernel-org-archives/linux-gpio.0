From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: davinci: Do not assume continuous IRQ numbering
Date: Thu, 14 Jun 2018 10:29:09 +0200
Message-ID: <CACRpkdbFyZwG4S9t3ts3wmVWioadd7NjpdMUkq-wujH=g68zvw@mail.gmail.com>
References: <1528276734-1483-1-git-send-email-j-keerthy@ti.com> <1528276734-1483-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1528276734-1483-2-git-send-email-j-keerthy@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Tero Kristo <t-kristo@ti.com>
List-Id: linux-gpio@vger.kernel.org

On Wed, Jun 6, 2018 at 11:18 AM, Keerthy <j-keerthy@ti.com> wrote:

> Currently the driver assumes that the interrupts are continuous
> and does platform_get_irq only once and assumes the rest are continuous,
> instead call platform_get_irq for all the interrupts and store them
> in an array for later use.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

Hm! Thierry has recently submitted patches to make it easier for chips with
banked IRQs to use the GPIOLIB_IRQCHIP.

Please look at the code in gpio/gpio-tegra186.c and see if you can use
his approach.

As you can see this chip is using gpiochip_irq_map/unmap in its
domain, and manipulates struct gpio_irq_chip directly.

I think the idea is to make it possible to use GPIOLIB_IRQCHIP
for banked IRQs but the infrastructure is not yet inside the gpiolib
so it is a bit taped on the side right now.

Yours,
Linus Walleij
