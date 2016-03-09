From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/8] drivers/pinctrl: make meson/pinctrl-meson.c
 explicitly non-modular
Date: Wed, 9 Mar 2016 10:04:01 +0700
Message-ID: <CACRpkdacB=41Wg_KjuART4D_RykH2Vy7p5qYua74TjoSCp6eTA@mail.gmail.com>
References: <1456778924-20730-1-git-send-email-paul.gortmaker@windriver.com>
	<1456778924-20730-4-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34980 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750766AbcCIDEC (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Mar 2016 22:04:02 -0500
Received: by mail-ob0-f176.google.com with SMTP id fp4so34165599obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Mar 2016 19:04:02 -0800 (PST)
In-Reply-To: <1456778924-20730-4-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Beniamino Galvani <b.galvani@gmail.com>, Carlo Caione <carlo@endlessm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Antoine Tenart <antoine.tenart@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 1, 2016 at 3:48 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/Kconfig:config PINCTRL_MESON
> drivers/pinctrl/Kconfig:        bool
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
> We don't replace module.h with init.h since the file already has that.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Beniamino Galvani <b.galvani@gmail.com>
> Cc: Carlo Caione <carlo@endlessm.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: Antoine Tenart <antoine.tenart@free-electrons.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
