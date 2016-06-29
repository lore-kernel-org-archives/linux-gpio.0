From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 12/19] pinctrl: imx6sl: make it explicitly non-modular
Date: Wed, 29 Jun 2016 09:50:34 +0200
Message-ID: <CACRpkdY6dQhwsg00Mdze5ruEy0rKeGcY5=ornAgvMNyBBNnpiw@mail.gmail.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com> <20160626024652.5081-13-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f176.google.com ([209.85.214.176]:34941 "EHLO
	mail-ob0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751173AbcF2Huf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 03:50:35 -0400
Received: by mail-ob0-f176.google.com with SMTP id o10so1705426obp.2
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 00:50:35 -0700 (PDT)
In-Reply-To: <20160626024652.5081-13-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Jun 26, 2016 at 4:46 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX6SL
> drivers/pinctrl/freescale/Kconfig:      bool "IMX6SL pinctrl driver"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_init was not in use by this driver, the init ordering
> remains unchanged with this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
