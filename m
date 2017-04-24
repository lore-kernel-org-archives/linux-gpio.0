From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Right amount of info in the DT
Date: Mon, 24 Apr 2017 10:23:48 +0200
Message-ID: <CACRpkdZ_QmZ=Sjub8DPfHkCkU5m=PYxfWgVPzBCFbYvj-BH4HQ@mail.gmail.com>
References: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:36140 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1166623AbdDXIXu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Apr 2017 04:23:50 -0400
Received: by mail-it0-f51.google.com with SMTP id g66so50061306ite.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Apr 2017 01:23:50 -0700 (PDT)
In-Reply-To: <29e00f75-9f30-8a6f-c2da-43a59cc1f134@sigmadesigns.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yves Lefloch <YvesMarie_Lefloch@sigmadesigns.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Mason <slash.tmp@free.fr>, Thibaud Cornic <thibaud_cornic@sigmadesigns.com>

On Thu, Apr 20, 2017 at 11:54 AM, Yves Lefloch
<YvesMarie_Lefloch@sigmadesigns.com> wrote:

> I have a bunch of GPIO groups all over the place (dedicated pins, UART pins,
> ethernet pins, etc.), and even though they mainly behave similarly (same way of
> handling direction and value), there are some differences between them:
> - IRQs, because some groups can generate interrupts and others can't;
> - Alternate functions (for instance GPIO mode vs UART mode), because obviously
>   dedicated pins don't have an alternate function, and for the others which have
>   it, the mode-changing register is sometimes before, sometimes after the other
>   regs.

The basic problem is that you conceptualize of these things as GPIO
and not the more abstract concept of pins under pin control.
For example, there are not GPIO groups, there are pin control pin
multiplexing groups.

Please read Documentation/pinctrl.txt
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/pinctrl.txt

Also read the generic pin control device tree bindings:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt

Further in the GPIO subsystem you will find references back to how it
interacts with pin control.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/gpio/gpio.txt

Yours,
Linus Walleij
