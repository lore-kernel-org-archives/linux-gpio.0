From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [BUG] LPC32xx gpio driver broken by commit 762c2e46 in 4.9-rc1
Date: Mon, 24 Oct 2016 02:46:05 +0200
Message-ID: <CACRpkdZiG8B4K2Hf0mEcuOcq45=Q4n1yD4TDVJgJ+T7K1PMKAg@mail.gmail.com>
References: <1476807799.10214.25.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:35802 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756701AbcJXAqG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 23 Oct 2016 20:46:06 -0400
Received: by mail-qk0-f180.google.com with SMTP id z190so215805755qkc.2
        for <linux-gpio@vger.kernel.org>; Sun, 23 Oct 2016 17:46:06 -0700 (PDT)
In-Reply-To: <1476807799.10214.25.camel@localhost>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sylvain Lemieux <slemieux.tyco@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Vladimir Zapolskiy <vz@mleia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, slemieux@tycoint.com

On Tue, Oct 18, 2016 at 6:23 PM, Sylvain Lemieux
<slemieux.tyco@gmail.com> wrote:

> the current LPC32xx GPIO driver is broken by commit 762c2e46
> (gpio: of: remove of_gpiochip_and_xlate() and struct gg_data).
>
> A call to "of_get_named_gpio" to retrieve the GPIO will
> always return -EINVAL, except for the first GPIO bank.
>
> Prior to this commit, the driver was working properly
> because of the side-effect of the match function called by
> "gpiochip_find" inside "of_get_named_gpiod_flags" function.
(...)
> Is there any short-term solution that can be done with
> the existing driver to keep the LPC32xx platform working
> properly in the 4.9 mainline kernel?

Masahiro, what do you think is the best course to proceed here?
Can we
- Restore the behaviour prior to the patches or
- Fix up all users or
- Do we have to revert these two patches?

I would prefer not to revert, because I liked the cleanup a lot ...

Yours,
Linus Walleij
