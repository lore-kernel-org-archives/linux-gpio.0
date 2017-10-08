From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Sun, 8 Oct 2017 02:42:21 +0200
Message-ID: <CACRpkda3vBORtJPU=Y88TXukY=XbfmTau7GMSky98p63fhmfpw@mail.gmail.com>
References: <20171003170049.24480-1-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f169.google.com ([209.85.223.169]:55579 "EHLO
        mail-io0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbdJHAmW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2017 20:42:22 -0400
Received: by mail-io0-f169.google.com with SMTP id z187so18760019ioz.12
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2017 17:42:22 -0700 (PDT)
In-Reply-To: <20171003170049.24480-1-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Chris Gorman <chrisjohgorman@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Tue, Oct 3, 2017 at 7:00 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> New GPIO IRQs are allocated and mapped dynamically by default when
> GPIO IRQ infrastructure is used by cherryview-pinctrl driver.
> This causes issues on some Intel platforms [1][2] with broken BIOS which
> hardcodes Linux IRQ numbers in their ACPI tables.
>
> On such platforms cherryview-pinctrl driver should allocate and map all
> GPIO IRQs at probe time.
> Side effect - "Cannot allocate irq_descs @ IRQ%d, assuming pre-allocated\n"
> can be seen at boot log.
>
> NOTE. It still may fail if boot sequence will changed and some interrupt
> controller will be probed before cherryview-pinctrl which will shift Linux IRQ
> numbering (expected with CONFIG_SPARCE_IRQ enabled).
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=194945
> [2] https://lkml.org/lkml/2017/9/28/153
> Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> Cc: Chris Gorman <chrisjohgorman@gmail.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
> Reported-by: Chris Gorman <chrisjohgorman@gmail.com>
> Reported-by: Mika Westerberg <mika.westerberg@linux.intel.com>

OK patch applied for fixes.

But I'mm still very sceptical about this.

Look at the following (just from grep irq_base drivers/gpio/):

drivers/gpio/gpio-ml-ioh.c:

static int ioh_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
{
        struct ioh_gpio *chip = gpiochip_get_data(gpio);
        return chip->irq_base + offset;
}

(...)
        ch = irq - chip->irq_base;
        if (irq <= chip->irq_base + 7) {
                im_reg = &chip->reg->regs[chip->ch].im_0;
                im_pos = ch;
(...)

drivers/gpio/gpio-sta2x11.c:

static int gsta_gpio_to_irq(struct gpio_chip *gpio, unsigned offset)
{
        struct gsta_gpio *chip = gpiochip_get_data(gpio);
        return chip->irq_base + offset;
}

(etc)

The thing is that the lines you deleted from gpiolib were the only
thing ever assigning chip->irq_base. This patch, if performed
properly should have removed the .irq_base field from struct
gpio_chip altogether without regressions.

As it is not, anything using .irq_base is regressing.

Either you need to convince me you can quickfix all of these
users, or we need to simply revert this change.

Yours,
Linus Walleij
