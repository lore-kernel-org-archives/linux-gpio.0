From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/3] pinctrl: lpc18xx: add nxp,gpio-pin-interrupt property
Date: Mon, 7 Mar 2016 10:46:50 +0700
Message-ID: <CACRpkdbOFsdv7G9zwDjnwUnjr_dfPoS6sZSQwJn1=mR+neY_ZA@mail.gmail.com>
References: <1456436679-22077-1-git-send-email-manabian@gmail.com>
	<1456436679-22077-3-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:35262 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751938AbcCGDqv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2016 22:46:51 -0500
Received: by mail-ob0-f177.google.com with SMTP id xx9so94878800obc.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 19:46:51 -0800 (PST)
In-Reply-To: <1456436679-22077-3-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 26, 2016 at 4:44 AM, Joachim Eastwood <manabian@gmail.com> wrote:

> Add support for setting up GPIO pin interrupts in the lpc18xx pinctrl
> driver. The LPC18xx SCU contain two registers that sets up the signal
> routing to the GPIO pin interrupt (PINT) block. The routing uses the
> GPIO namespace and not the pin namespace so a lookup is preformed on
> the pin.
>
> Routing configuration is done in the device tree by using the new
> nxp,gpio-pin-interrupt property. This property takes single parameter
> which sets the PINT hwirq for the GPIO.
>
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>

Patch applied. Best way to solve this as of now.

> +static int lpc18xx_pin_to_gpio(struct pinctrl_dev *pctldev, unsigned pin)
> +{
> +       struct pinctrl_gpio_range *range;
> +
> +       range = pinctrl_find_gpio_range_from_pin_nolock(pctldev, pin);
> +       if (!range)
> +               return -EINVAL;
> +
> +       return pin - range->pin_base + range->base;
> +}

It seems this pattern is appearing in a few drivers now, what do you
think about factoring this into the core or as a static inline in
core.h (so we can avoid EXPORTing)?

Yours,
Linus Walleij
