From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 9/9] drivers/gpio: make gpio-zx.c explicitly non-modular
Date: Thu, 31 Mar 2016 15:11:01 +0200
Message-ID: <CACRpkdax+PBkNX0FmDSupVrfzjB1r8vJFfqFW-EkUDaU1+Yu_Q@mail.gmail.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
	<1459093489-18314-10-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:36670 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762AbcCaNLB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 09:11:01 -0400
Received: by mail-oi0-f51.google.com with SMTP id r187so59381553oih.3
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 06:11:01 -0700 (PDT)
In-Reply-To: <1459093489-18314-10-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Jun Nie <jun.nie@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Mar 27, 2016 at 5:44 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> config GPIO_ZX
>         bool "ZTE ZX GPIO support"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modularity so that when reading the
> driver there is no doubt it is builtin-only.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
