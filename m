From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/9] drivers/gpio: make gpio-mb86s7x.c driver explicitly non-modular
Date: Thu, 31 Mar 2016 15:01:06 +0200
Message-ID: <CACRpkdY5eNvp8crgksu5PraFR0vwzS5SsrBqUWiKaKS12n_qtQ@mail.gmail.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
	<1459093489-18314-3-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:32946 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756572AbcCaNBH (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 09:01:07 -0400
Received: by mail-oi0-f48.google.com with SMTP id d205so59127122oia.0
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 06:01:07 -0700 (PDT)
In-Reply-To: <1459093489-18314-3-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Mar 27, 2016 at 5:44 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for this driver is currently:
>
> config GPIO_MB86S7X
>         bool "GPIO support for Fujitsu MB86S7x Platforms"
>
> ...meaning that it currently is not being built as a module by anyone.
> Lets remove the couple traces of modularity, so that when reading the
> driver there is no doubt it is builtin-only.
>
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
