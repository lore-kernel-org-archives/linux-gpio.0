From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] gpio: dwapb: Add support for next generation of X-Gene SoC
Date: Thu, 2 Feb 2017 21:47:18 +0200
Message-ID: <CAHp75VfA6rzobgyBWkuzzh0YVB29R=oid6AVMgt8h1seO_dLAQ@mail.gmail.com>
References: <1485891838-27093-1-git-send-email-hotran@apm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:35477 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751201AbdBBTrT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Feb 2017 14:47:19 -0500
In-Reply-To: <1485891838-27093-1-git-send-email-hotran@apm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Hoan Tran <hotran@apm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, lho@apm.com, Duc Dang <dhdang@apm.com>

On Tue, Jan 31, 2017 at 9:43 PM, Hoan Tran <hotran@apm.com> wrote:
> Next generation of X-Gene SoC's GPIO hardware register map is very
> similar to DW GPIO. It only differs by a few register addresses.
> This patch modifies DW GPIO driver to accommodate the difference
> in a few register addresses.

> +#define GPIO_REG_OFFSET_V2     1
> +#define GPIO_INTMASK_V2                0x44
> +#define GPIO_INTTYPE_LEVEL_V2  0x34
> +#define GPIO_INT_POLARITY_V2   0x38
> +#define GPIO_INTSTATUS_V2      0x3c
> +#define GPIO_PORTA_EOI_V2      0x40
> +

>  static inline u32 dwapb_read(struct dwapb_gpio *gpio, unsigned int offset)
>  {
>         struct gpio_chip *gc    = &gpio->ports[0].gc;
>         void __iomem *reg_base  = gpio->regs;
>
> -       return gc->read_reg(reg_base + offset);
> +       return gc->read_reg(reg_base + gpio_reg_convert(gpio, offset));

And what prevents us to introduce special read_reg for that registers?
Also what about to convert to regmap API?

-- 
With Best Regards,
Andy Shevchenko
