From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/2] gpio: davinci: Remove gpio2regs function to
 accommodate multi instances
Date: Wed, 11 Jan 2017 12:04:51 +0100
Message-ID: <CACRpkdaWA0+kqeWvHDMwiVGGc0Ucywbx62OnKisuTKsShMbgnw@mail.gmail.com>
References: <1483518389-6200-1-git-send-email-j-keerthy@ti.com> <1483518389-6200-2-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:36427 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S937322AbdAKLEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 06:04:52 -0500
Received: by mail-qt0-f175.google.com with SMTP id k15so421496403qtg.3
        for <linux-gpio@vger.kernel.org>; Wed, 11 Jan 2017 03:04:52 -0800 (PST)
In-Reply-To: <1483518389-6200-2-git-send-email-j-keerthy@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Keerthy <j-keerthy@ti.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Tero Kristo <t-kristo@ti.com>

On Wed, Jan 4, 2017 at 9:26 AM, Keerthy <j-keerthy@ti.com> wrote:

> gpio2regs is written making an assumption that driver supports only
> one instance of gpio controller. Removing this and adding a generic
> array so as to support multiple instances of gpio controllers.
>
> Signed-off-by: Keerthy <j-keerthy@ti.com>

> -               regs = gpio2regs(base);
> +               regs = gpio_base + offset_array[i];

I understand this.

> -       struct davinci_gpio_regs __iomem *g = gpio2regs(hw);
> +       struct davinci_gpio_controller *chips =
> +                               (struct davinci_gpio_controller *)d->host_data;
> +       struct davinci_gpio_regs __iomem *g = chips[hw / 32].regs;

And this, if each instans has 32 GPIOs.

> -               g = gpio2regs(0);
> +               g = chips[0].regs;

Also makes sense.

> -               g = gpio2regs(gpio);
> +               g = chips[bank / 2].regs;

But what is this? I don't understand that /2 at all. Please insert a
comment explaining it so I can figure it out. Are there two banks
per instance?

Yours,
Linus Walleij
