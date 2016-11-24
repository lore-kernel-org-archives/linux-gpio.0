From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] RFC: pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP
Date: Thu, 24 Nov 2016 16:16:13 +0100
Message-ID: <CACRpkdZ39UbUzKebVzRuAg8hxgLiGNzzUMebMVT+mcAOnHRW+w@mail.gmail.com>
References: <1479145925-3578-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f181.google.com ([209.85.216.181]:33425 "EHLO
        mail-qt0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966088AbcKXPQP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Nov 2016 10:16:15 -0500
Received: by mail-qt0-f181.google.com with SMTP id p16so42720082qta.0
        for <linux-gpio@vger.kernel.org>; Thu, 24 Nov 2016 07:16:14 -0800 (PST)
In-Reply-To: <1479145925-3578-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eric Anholt <eric@anholt.net>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Cc: linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Linus Walleij <linus.walleij@linaro.org>, Stefan Wahren <stefan.wahren@i2se.com>

On Mon, Nov 14, 2016 at 6:52 PM, Linus Walleij <linus.walleij@linaro.org> wrote:

> It should be possible to use the GPIOLIB_IRQCHIP helper
> library with the BCM2835 driver since it is a pretty straight
> forward cascaded irqchip.
>
> The only difference from other drivers is that the BCM2835
> has several banks for a single gpiochip, and each bank has
> a separate IRQ line. Instead of creating one gpiochip per
> bank, a single gpiochip covers all banks GPIO lines. This
> makes it necessary to resolve the bank ID in the IRQ
> handler.
>
> The GPIOLIB_IRQCHIP allows several IRQs to be cascaded off
> the same gpiochip by calling gpiochip_set_chained_irqchip()
> repeatedly, but we have been a bit short on examples
> for how this should be handled in practice, so this is intended
> as an example of how this can be achieved.
>
> The old code did not model the chip as a chained interrupt
> handler, but this patch also rectifies that situation.
>
> Cc: Stephen Warren <swarren@wwwdotorg.org>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Eric Anholt <eric@anholt.net>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Rebase on top of the two new patches from the vendor tree.
> ChangeLog v1->v2:
> - Forgot to convert the driver to chained IRQ handler. Now fixed.
>
> Rpi folks: I have no clue if this works or not, but would be happy
> if you could test it to see if IRQs fire as expected and provide
> some feedback.

Any testers?

I'm getting tempted to just apply it to get test coverage, at the
cost of having to revert it if it just explodes...

Yours,
Linus Walleij
