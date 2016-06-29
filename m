From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 19/19] pinctrl: remove orphaned exported ".remove" function
Date: Wed, 29 Jun 2016 09:56:53 +0200
Message-ID: <CACRpkda0bnEV+L+PH5vX5upJP2OCL5q9UQ=7GBMNmDkDKuLXXA@mail.gmail.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com> <20160626024652.5081-20-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f174.google.com ([209.85.214.174]:36312 "EHLO
	mail-ob0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752614AbcF2H4y (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 03:56:54 -0400
Received: by mail-ob0-f174.google.com with SMTP id mu6so14760468obc.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jun 2016 00:56:54 -0700 (PDT)
In-Reply-To: <20160626024652.5081-20-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sun, Jun 26, 2016 at 4:46 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/freescale/Kconfig:config PINCTRL_MXS
> drivers/pinctrl/freescale/Kconfig:      bool
>
> ...meaning that it currently is not being built as a module by anyone.
>
> It also doesn't have any modular functionality, so it doesn't need
> module.h included at all.
>
> What it does have is an exported function that was used as a shared
> ".remove" by other drivers, but those use cases (imx23 and imx28)
> are now gone, and hence this can disappear as well.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
