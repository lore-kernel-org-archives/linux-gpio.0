From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 2/6] drivers/gpio: make gpio-tc3589x.c explicitly non-modular
Date: Tue, 5 Apr 2016 15:23:40 +0200
Message-ID: <CACRpkdZc7x6ggDtKoqiDDwYq0XP7kZySE7jtJoht46AcKKp7Lw@mail.gmail.com>
References: <1459536578-3017-1-git-send-email-paul.gortmaker@windriver.com>
	<1459536578-3017-3-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34048 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752321AbcDENXl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Apr 2016 09:23:41 -0400
Received: by mail-ob0-f176.google.com with SMTP id bg3so9070132obb.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Apr 2016 06:23:41 -0700 (PDT)
In-Reply-To: <1459536578-3017-3-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Rabin Vincent <rabin.vincent@stericsson.com>, Hanumath Prasad <hanumath.prasad@stericsson.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 1, 2016 at 8:49 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/gpio/Kconfig:config GPIO_TC3589X
> drivers/gpio/Kconfig:   bool "TC3589X GPIOs"
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
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: Rabin Vincent <rabin.vincent@stericsson.com>
> Cc: Hanumath Prasad <hanumath.prasad@stericsson.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
