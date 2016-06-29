From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 11/19] pinctrl: imx6q: make it explicitly non-modular
Date: Wed, 29 Jun 2016 09:49:46 +0200
Message-ID: <CACRpkdYMNmAop9BSxRr8gscs5KYZBRQ55w=8k5CUNX78bzOeSA@mail.gmail.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com> <20160626024652.5081-12-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:34143 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbcF2Htr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 03:49:47 -0400
Received: by mail-ob0-f170.google.com with SMTP id ru5so14530790obc.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 00:49:47 -0700 (PDT)
In-Reply-To: <20160626024652.5081-12-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dong Aisheng <dong.aisheng@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Jun 26, 2016 at 4:46 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX6Q
> drivers/pinctrl/freescale/Kconfig:      bool "IMX6Q/DL pinctrl driver"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init translates to device_initcall in the non-modular
> case, the init ordering remains unchanged with this commit.
>
> We don't replace module.h with init.h since the file already has that.
> But we do add export.h since this file uses the global THIS_MODULE.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Dong Aisheng <dong.aisheng@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
