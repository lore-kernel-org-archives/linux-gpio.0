From: Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH] pinctrl: sunxi: make sun5i explicitly non-modular
Date: Mon, 6 Feb 2017 11:27:58 +0800
Message-ID: <CAGb2v65S6vPCOFGSghorPJWVY=1hfJCh5iX_zT=GHNpE6EK5nQ@mail.gmail.com>
References: <20170202201740.9134-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp.csie.ntu.edu.tw ([140.112.30.61]:37464 "EHLO
        smtp.csie.ntu.edu.tw" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752294AbdBFD2Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Feb 2017 22:28:24 -0500
In-Reply-To: <20170202201740.9134-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <maxime.ripard@free-electrons.com>, Chen-Yu Tsai <wens@csie.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Feb 3, 2017 at 4:17 AM, Paul Gortmaker
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

Acked-by: Chen-Yu Tsai <wens@csie.org>
