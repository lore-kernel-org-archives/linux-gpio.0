From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 0/3] pinctrl: lpc18xx: support pint setup
Date: Mon, 7 Mar 2016 10:52:41 +0700
Message-ID: <CACRpkdY=sAaXEHXFZeNPZnfLCn-DUmedkhYvAW0isd=FDK9e=A@mail.gmail.com>
References: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:33541 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751341AbcCGDwm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Mar 2016 22:52:42 -0500
Received: by mail-ob0-f170.google.com with SMTP id fz5so95467010obc.0
        for <linux-gpio@vger.kernel.org>; Sun, 06 Mar 2016 19:52:41 -0800 (PST)
In-Reply-To: <1456436679-22077-1-git-send-email-manabian@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Joachim Eastwood <manabian@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 26, 2016 at 4:44 AM, Joachim Eastwood <manabian@gmail.com> wrote:

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

I am a bit split but I assume that you as maintainer of this hardware
is in a better position to assign the routing of the IRQs in a convenient
way for this platform.

So, patches applied as you can see.

Yours,
Linus Walleij
