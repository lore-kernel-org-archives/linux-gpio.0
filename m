From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pintrl: meson: add interrupts to pinctrl data
Date: Thu, 11 May 2017 16:50:17 +0200
Message-ID: <CACRpkdYx0j4Sjv8MhXRSuiF1TyW2Ht47r0+G1ga8mXW5LC7c=g@mail.gmail.com>
References: <a4ca587b-d3e8-a22d-4d25-289871d2d095@gmail.com> <3b4990ef-bfb4-c62c-f823-431adedc17f1@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f52.google.com ([209.85.214.52]:36757 "EHLO
        mail-it0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933088AbdEKOuT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 May 2017 10:50:19 -0400
Received: by mail-it0-f52.google.com with SMTP id o5so45204916ith.1
        for <linux-gpio@vger.kernel.org>; Thu, 11 May 2017 07:50:19 -0700 (PDT)
In-Reply-To: <3b4990ef-bfb4-c62c-f823-431adedc17f1@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, May 7, 2017 at 6:34 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:

> From: Jerome Brunet <jbrunet@baylibre.com>
> Add GPIO interrupt information to pinctrl data. Added to the original
> version from Jerome was data for Meson GXL.
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

So what this does is:

> diff --git a/drivers/pinctrl/meson/pinctrl-meson.h b/drivers/pinctrl/meson/pinctrl-meson.h
> index 1aa871d5..890f296f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.h
> +++ b/drivers/pinctrl/meson/pinctrl-meson.h
> @@ -81,6 +81,7 @@ enum meson_reg_type {
>   * @name:      bank name
>   * @first:     first pin of the bank
>   * @last:      last pin of the bank
> + * @irq:       hwirq base number of the bank
>   * @regs:      array of register descriptors
>   *
>   * A bank represents a set of pins controlled by a contiguous set of
> @@ -92,6 +93,8 @@ struct meson_bank {
>         const char *name;
>         unsigned int first;
>         unsigned int last;
> +       int irq_first;
> +       int irq_last;
>         struct meson_reg_desc regs[NUM_REG];
>  };

... adds a per-bank parent IRQ.

I am just discussing with Thierry that I would like to see some code
in the gpiolib core to deal with this mapping so we don't have to do a
whole lot of custom back mapping between parent IRQs and cascaded
IRQ in every driver that has a multiple-bank concept.

Please contribute to the discission, see thread subject:
"[PATCH v2] gpio: Add Tegra186 support"

Yours,
Linus Walleij
