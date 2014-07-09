From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: removes all usage of gpiochip_remove retval
Date: Wed, 9 Jul 2014 09:45:58 +0200
Message-ID: <CACRpkda6mzVdaN0cvOxpbsxWyCv2nGyDXOjZg_5aT8u7SSQeUw@mail.gmail.com>
References: <CACRpkdZz+BZHuMY8pB4Ooq0-L-=fjW=OeUOnnS7D3Adzt=dbhQ@mail.gmail.com>
	<1404592088-26996-1-git-send-email-berthe.ab@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:53126 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751271AbaGIHp7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Jul 2014 03:45:59 -0400
Received: by mail-ob0-f180.google.com with SMTP id vb8so7555244obc.25
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2014 00:45:58 -0700 (PDT)
In-Reply-To: <1404592088-26996-1-git-send-email-berthe.ab@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: abdoulaye berthe <berthe.ab@gmail.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Michael Buesch <m@bues.ch>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, Jul 5, 2014 at 10:28 PM, abdoulaye berthe <berthe.ab@gmail.com> wrote:

> This patch updates users of gpiochip_remove return value.
>
> Signed-off-by: abdoulaye berthe <berthe.ab@gmail.com>

This doesn't apply on my devel branch from the GPIO tree.

Did you really use that branch?

This looks more like it was based on the linux-next tree or
something.

BTW maybe it's better to split this patch in three:

- One that removes all users in drivers/gpio so I can
  apply that to the GPIO tree, patch based on the GPIO
  "devel" branch.
- One that removes all users in drivers/pinctrl based on
  the pinctrl "devel" branch so I can apply that to the
  pinctrl tree.
- One that removes the rest of the users, that I can maybe
  just apply to the GPIO tree. This could use some ACKs
  from the different maintainers, but if I don't get that I can
  just apply it after some timeout.

Then we will apply the second patch actually changing
the gpiolib in the next merge window or late in the merge
cycle.

What do you say?

Yours,
Linus Walleij
