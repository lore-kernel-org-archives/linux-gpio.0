From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sunxi: make sun5i explicitly non-modular
Date: Mon, 6 Feb 2017 11:29:07 +0100
Message-ID: <CACRpkda-3MbF1025sCku5XkUF7ebmwrWYk+sS12eidpi0=4nZQ@mail.gmail.com>
References: <20170202201740.9134-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f178.google.com ([209.85.223.178]:33540 "EHLO
        mail-io0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750953AbdBFK3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Feb 2017 05:29:09 -0500
Received: by mail-io0-f178.google.com with SMTP id v96so62344091ioi.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Feb 2017 02:29:09 -0800 (PST)
In-Reply-To: <20170202201740.9134-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Feb 2, 2017 at 9:17 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> We had all these corrected in commit 0c8c6ba00cbf ("pinctrl: sunxi:
> make bool drivers explicitly non-modular") but this new one recently
> crept in.
>
> The Kconfig currently controlling compilation of this code is:
>
>    drivers/pinctrl/sunxi/Kconfig:config PINCTRL_SUN5I
>    drivers/pinctrl/sunxi/Kconfig:  def_bool MACH_SUN5I
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the couple traces of modular infrastructure use, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
