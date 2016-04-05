From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/6] drivers/gpio: make gpio-sx150x.c explicitly non-modular
Date: Tue, 5 Apr 2016 15:24:52 +0200
Message-ID: <CACRpkdaCyNbiWYayMipjGSZ_GKcbV80jwroZx689+S9A77zHzw@mail.gmail.com>
References: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
	<1459536578-3017-4-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36029 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752321AbcDENYx (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 09:24:53 -0400
Received: by mail-oi0-f54.google.com with SMTP id y204so16892438oie.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 06:24:53 -0700 (PDT)
In-Reply-To: <1459536578-3017-4-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Gregory Bean <gbean@codeaurora.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 1, 2016 at 8:49 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_SX150X
> drivers/gpio/Kconfig:   bool "Semtech SX150x I2C GPIO expander"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init was not in use by this code, the init ordering
> remains unchanged with this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Gregory Bean <gbean@codeaurora.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
