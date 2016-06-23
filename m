From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 0/5] gpio: refactor of_parse_own_gpio() and of_get_named_gpiod_flags()
Date: Thu, 23 Jun 2016 09:44:14 +0200
Message-ID: <CACRpkdYDM9bGPn9PFUxC2JeN_BivFpQvehK=FBALzvkoD6KSGA@mail.gmail.com>
References: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:36597 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbcFWHoQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2016 03:44:16 -0400
Received: by mail-oi0-f48.google.com with SMTP id f189so58306372oig.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2016 00:44:15 -0700 (PDT)
In-Reply-To: <1465898827-2229-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jun 14, 2016 at 12:07 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> But, after reading this code around, I thought it was more complex
> than needed.  So, I decided to clean-up it instead of fix the bug.
>
> Talking about of_parse_own_gpio(), does it need to call gpiochip_find()
> in the first place?
>
> The caller of this function, of_gpiochip_scan_gpios() already knows the
> gpio_chip.  I want to make the implementation more straight-forward.

Thanks a lot for this patch series, it eases maintenance of the gpiolib
OF core a lot, and makes the code size smaller too. I bet it also
gives better speed.

This is a very valuable contribution from you and Socionext to anyone
using GPIO with DT.

Yours,
Linus Walleij
