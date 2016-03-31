From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 6/9] drivers/gpio: make gpio-pl061.c explicitly non-modular
Date: Thu, 31 Mar 2016 15:06:50 +0200
Message-ID: <CACRpkdZTprvDPiM_dUiEtNOGzyLaieQQagJ2ztkEtMHyEcXuNQ@mail.gmail.com>
References: <1459093489-18314-1-git-send-email-paul.gortmaker@windriver.com>
	<1459093489-18314-7-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:35555 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750762AbcCaNGv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 31 Mar 2016 09:06:51 -0400
Received: by mail-oi0-f51.google.com with SMTP id p188so26597675oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 31 Mar 2016 06:06:50 -0700 (PDT)
In-Reply-To: <1459093489-18314-7-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Baruch Siach <baruch@tkos.co.il>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Mar 27, 2016 at 5:44 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig for this driver is currently:
>
> config GPIO_PL061
>         bool "PrimeCell PL061 GPIO support"
>
> ...meaning that it currently is not being built as a module by anyone.
> Lets remove the couple traces of modularity, so that when reading the
> driver there is no doubt it is builtin-only.
>
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied with Baruch's ACK.

Yours,
Linus Walleij
