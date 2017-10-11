From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl/amd: fix masking of GPIO interrupts
Date: Wed, 11 Oct 2017 09:33:55 +0200
Message-ID: <CACRpkdZL7vTAYix8G9EoPwt6NerbqQ_vtFx8b4BNu2mCH7JQvA@mail.gmail.com>
References: <20171002040054.2604-1-drake@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:53736 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932145AbdJKHd4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Oct 2017 03:33:56 -0400
Received: by mail-it0-f53.google.com with SMTP id n195so1728376itg.2
        for <linux-gpio@vger.kernel.org>; Wed, 11 Oct 2017 00:33:56 -0700 (PDT)
In-Reply-To: <20171002040054.2604-1-drake@endlessm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Daniel Drake <drake@endlessm.com>
Cc: Ken Xue <ken.xue@amd.com>, "S-k, Shyam-sundar" <shyam-sundar.s-k@amd.com>, "Shah, Nehal-bakulchandra" <nehal-bakulchandra.shah@amd.com>, linux@endlessm.com, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 2, 2017 at 6:00 AM, Daniel Drake <drake@endlessm.com> wrote:

> On Asus laptop models X505BA, X505BP, X542BA and X542BP, the i2c-hid
> touchpad (using a GPIO for interrupts) becomes unresponsive after a
> few minutes of usage, or after placing two fingers on the touchpad,
> which seems to have the effect of queuing up a large amount of input
> data to be transferred.
>
> When the touchpad is in unresponsive state, we observed that the GPIO
> level-triggered interrupt is still at it's active level, however the
> pinctrl-amd driver is not receiving/dispatching more interrupts at this
> point.
>
> After the initial interrupt arrives, amd_gpio_irq_mask() is called
> however we then see amd_gpio_irq_handler() being called repeatedly for
> the same irq; the interrupt mask is not taking effect because of the
> following sequence of events:
>  - amd_gpio_irq_handler fires, reads and caches pin reg
>  - amd_gpio_irq_handler calls generic_handle_irq()
>  - During IRQ handling, amd_gpio_irq_mask() is called and modifies pin reg
>  - amd_gpio_irq_handler clears interrupt by writing cached value
>
> The stale cached value written at the final stage undoes the masking.
> Fix this by re-reading the register before clearing the interrupt.
>
> I also spotted that the interrupt-clearing code can race against
> amd_gpio_irq_mask() / amd_gpio_irq_unmask(), so add locking there.
> Presumably this race was leading to the loss of interrupts.
>
> After these changes, the touchpad appears to be working fine.
>
> Signed-off-by: Daniel Drake <drake@endlessm.com>

Patch applied for fixes with Nehal-bakulchandra's ACK.

Yours,
Linus Walleij
