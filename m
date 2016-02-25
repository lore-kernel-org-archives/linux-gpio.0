From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] pinctrl: core: create unlocked version of pinctrl_find_gpio_range_from_pin
Date: Thu, 25 Feb 2016 10:21:57 +0100
Message-ID: <CACRpkdbrS98Bd7Wx8k6GVp27We1nNNtyqEwiR1SxGp1T5myVVw@mail.gmail.com>
References: <1456008716-6236-1-git-send-email-manabian@gmail.com>
	<1456008716-6236-2-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:32823 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758745AbcBYJV6 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 04:21:58 -0500
Received: by mail-oi0-f51.google.com with SMTP id j125so36338199oih.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 01:21:58 -0800 (PST)
In-Reply-To: <1456008716-6236-2-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Feb 20, 2016 at 11:51 PM, Joachim Eastwood <manabian@gmail.com> wrote:

> pinctrl_find_gpio_range_from_pin takes the pctldev->mutex but so
> does pinconf_pins_show and this will cause a deadlock if
> pinctrl_find_gpio_range_from_pin is used in .pin_config_get
> callback.
>
> Create an unlocked version of pinctrl_find_gpio_range_from_pin to
> allow pin to gpio lookup to be used from pinconf_pins_show.
>
> Signed-off-by: Joachim Eastwood <manabian@gmail.com>

I understand that the function is needed and it's semantically
OK.

> +EXPORT_SYMBOL_GPL(__pinctrl_find_gpio_range_from_pin);
(...)
> +extern struct pinctrl_gpio_range *
> +__pinctrl_find_gpio_range_from_pin(struct pinctrl_dev *pctldev,
> +                                  unsigned int pin);
> +

This function name is NOT OK.

Rename it pinctrl_fund_gpio_range_from_pin_unlocked(),
The arbitrary uses of the __-prefix is one of my biggest confusions
when trying to understand code.

Yours,
Linus Walleij
