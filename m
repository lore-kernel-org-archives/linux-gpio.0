From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/9] drivers/gpio: make gpio-moxart.c explicitly non-modular
Date: Thu, 31 Mar 2016 15:03:53 +0200
Message-ID: <CACRpkdYpbe+7Y6_aZ1EXbi0UXk477iCSpHvhW+w--s1aT=z2Pg@mail.gmail.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
	<1459093489-18314-5-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f42.google.com ([209.85.218.42]:36723 "EHLO
	mail-oi0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756815AbcCaNDy (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 09:03:54 -0400
Received: by mail-oi0-f42.google.com with SMTP id r187so59098021oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 06:03:54 -0700 (PDT)
In-Reply-To: <1459093489-18314-5-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jonas Jensen <jonas.jensen@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Mar 27, 2016 at 5:44 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_MOXART
> drivers/gpio/Kconfig:   bool "MOXART GPIO support"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular references so that when reading
> the driver there is no doubt it is builtin-only.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> We don't replace module.h with init.h since the file already has that.
>
> Cc: Jonas Jensen <jonas.jensen@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
