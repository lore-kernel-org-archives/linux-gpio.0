From: Joachim Eastwood <manabian@gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: lpc18xx: support pint setup
Date: Thu, 25 Feb 2016 22:47:45 +0100
Message-ID: <CAGhQ9Vx047NwTaa5s1UX_c-dc4BLmNt6z1q4_rHn+SMr8hZAtQ@mail.gmail.com>
References: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f177.google.com ([209.85.213.177]:37129 "EHLO
	mail-ig0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750780AbcBYVrp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 25 Feb 2016 16:47:45 -0500
Received: by mail-ig0-f177.google.com with SMTP id z8so23266359ige.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Feb 2016 13:47:45 -0800 (PST)
In-Reply-To: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Joachim Eastwood <manabian@gmail.com>, linux-gpio@vger.kernel.org

On 25 February 2016 at 22:44, Joachim Eastwood <manabian@gmail.com> wrote:
> Some background here:
> The LPC1850 has no less than 3 GPIO interrupt blocks. One of these
> blocks is called 'gpio pin interrupt' or just PINT. LPC1850 PINT can
> handle up to 8 interrupts and these have a one-to-one relationship with
> the main interrupt controller (NVIC).
>
> Selecting which GPIOs that are associated with PINT irq lines is done in
> pinctrl hw block (SCU). The pinctrl device usually deals with the pin
> namespace but PINT selecction is done in the GPIO namespace. Fortunatly
> there is a function that can translate from the pin namespace to the
> GPIO namespace.
>
> Selection is done in DT with the "nxp,gpio-pin-interrupt" property.
> Example usage;
> &pinctrl {
>         gpio_joystick_1_cfg {
>                 pins =  "p9_0";
>                 function = "gpio";
>                 nxp,gpio-pin-interrupt = <0>;
>                 input-enable;
>                 bias-disable;
>         };
> };
>
> The reason for not doing this irq line selection on the fly in the
> irqchip driver is that the registers lie in the SCU hw block not in the
> PINT block and DT gives you more control since you can select a specific
> irq lines easily.
>
> The irq chip driver is ready but will posted separately.

oh, I forgot to add the change log. Here it is:

Changes since v1:
 - Add ack from Rob on DT doc
 - rename __pinctrl_find_gpio_range_from_pin to
pinctrl_find_gpio_range_from_pin_nolock


regards,
Joachim Eastwood
