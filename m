From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: gpiolib: set gpiochip_remove retval to void
Date: Tue, 27 May 2014 15:33:45 +0200
Message-ID: <CACRpkdZg559ogf5koyxA_urM949ee-+upauYWQmo-sPUQn-g2w@mail.gmail.com>
References: <1400864617-27909-1-git-send-email-berthe.ab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:63920 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752078AbaE0Ndq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 09:33:46 -0400
Received: by mail-ob0-f177.google.com with SMTP id wp4so9025070obc.36
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 06:33:46 -0700 (PDT)
In-Reply-To: <1400864617-27909-1-git-send-email-berthe.ab@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: abdoulaye berthe <berthe.ab@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, May 23, 2014 at 7:03 PM, abdoulaye berthe <berthe.ab@gmail.com> wrote:

> This avoids handling gpiochip remove error in device
> remove handler.
>
> Signed-off-by: abdoulaye berthe <berthe.ab@gmail.com>

In general this is the right thing to do.

>         for (id = 0; id < chip->ngpio; id++) {
> -               if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags)) {
> -                       status = -EBUSY;
> -                       break;
> -               }
> -       }
> -       if (status == 0) {
> -               for (id = 0; id < chip->ngpio; id++)
> -                       chip->desc[id].chip = NULL;
> -
> -               list_del(&chip->list);
> +               if (test_bit(FLAG_REQUESTED, &chip->desc[id].flags))
> +                       panic("gpiolib.c: gpiochip is still requested\n");

panic("gpio: removing gpiochip with gpios still requested\");
is more helpful.

But I want a patch that also removes *ALL* users of the return value
from this function in the *same* patch to avoid bisectability issues.

$ git grep gpiochip_remove

Then fix all of them or use coccinelle.

Yours,
Linus Walleij
