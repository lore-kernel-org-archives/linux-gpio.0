From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 00/10] serial/gpio: exar: Fixes and support for IOT2000
Date: Mon, 29 May 2017 14:39:02 +0200
Message-ID: <CACRpkdZzDmigd8X-VsJqHTQSMK6k+w+qbPH+N9qNY05pX8eifQ@mail.gmail.com>
References: <cover.1495814557.git.jan.kiszka@siemens.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f179.google.com ([209.85.223.179]:34613 "EHLO
        mail-io0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750947AbdE2MjE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 May 2017 08:39:04 -0400
Received: by mail-io0-f179.google.com with SMTP id k91so40474999ioi.1
        for <linux-gpio@vger.kernel.org>; Mon, 29 May 2017 05:39:04 -0700 (PDT)
In-Reply-To: <cover.1495814557.git.jan.kiszka@siemens.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alexandre Courbot <gnurou@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-serial@vger.kernel.org" <linux-serial@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Sudip Mukherjee <sudip.mukherjee@codethink.co.uk>, Andy Shevchenko <andy.shevchenko@gmail.com>, Sascha Weisenberger <sascha.weisenberger@siemens.com>

On Fri, May 26, 2017 at 6:02 PM, Jan Kiszka <jan.kiszka@siemens.com> wrote:

> This makes the gpio-exar driver usable, which was prevented by a number
> of fatal bugs, and adds support for the SIMATIC IOT2040 to the 8250-exar
> driver and, indirectly, to gpio-exar as well. It's a cross-subsystem
> series, so I'm also cross-posting to the serial and gpio lists.
>
> Changes in v3:
>  - fix MPIO state for Commtech adapters (regression of merged patch from
>    previous round)
>  - do not create gpio device for Commtech adapters
>  - switch back to device properties
>  - pass parent reference via device.parent instead of platform data
>  - use dmi_system_id table instead of open-coded matching
>  - address some smaller review remarks
>  - fix reading back of rs485 state
>  - adjust parenthood of exar gpiochip

I ACKed some patches if Greg need to merge them.

Can you suggest a merge strategy for this patch set?

It appears Greg will have to merge at least the first one.

Will it work to merge the GPIO patches orthogonally to the GPIO
tree or are they all dependent on the serial changes?

Should I merge them all? Should Greg merge them all?
Should one of us produce an immutable branch?

Yours,
Linus Walleij
