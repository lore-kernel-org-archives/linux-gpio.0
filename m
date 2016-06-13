From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 8/9] pinctrl: digicolor: make it explicitly non-modular
Date: Mon, 13 Jun 2016 08:33:31 +0200
Message-ID: <CACRpkdaZVUH-hDOZYZGeuNToeooTsUVgu-D_eZapCuk2V0uUaA@mail.gmail.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com> <1465267388-17884-9-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:34318 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964843AbcFMGdd (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 02:33:33 -0400
Received: by mail-oi0-f45.google.com with SMTP id d132so90175115oig.1
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2016 23:33:32 -0700 (PDT)
In-Reply-To: <1465267388-17884-9-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Baruch Siach <baruch@tkos.co.il>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Jun 7, 2016 at 4:43 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/Kconfig:config PINCTRL_DIGICOLOR
> drivers/pinctrl/Kconfig:        bool
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Baruch Siach <baruch@tkos.co.il>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied with Baruch's ACK.

Yours,
Linus Walleij
