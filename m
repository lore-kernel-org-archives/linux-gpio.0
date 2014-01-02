From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Thu, 2 Jan 2014 13:07:24 +0100
Message-ID: <CACRpkdZ7+=KDskPWDWsS--74DRyW+7_gzX7gpPu1EvkiWXkNMA@mail.gmail.com>
References: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:49162 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750822AbaABMHZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 07:07:25 -0500
Received: by mail-oa0-f44.google.com with SMTP id m1so14776817oag.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 04:07:25 -0800 (PST)
In-Reply-To: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

On Mon, Dec 16, 2013 at 8:05 AM, Baruch Siach <baruch@tkos.co.il> wrote:

> Prevent build failure when the selected variant does not support GPIO32.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
(...)

>  config XTENSA_VARIANT_FSF
>         bool "fsf - default (not generic) configuration"
>         select MMU
> +       select HAVE_XTENSA_GPIO32

(...)
> +config HAVE_XTENSA_GPIO32
> +       bool
> +
>  config GPIO_XTENSA
>         bool "Xtensa GPIO32 support"
>         depends on XTENSA
> +       depends on HAVE_XTENSA_GPIO32

This is just a tautology, you don't need a helper bool
for this.

Instead just select GPIO_XTENSA from your affected
platforms.

The patch only needs to hit arch/arm/mach-xtensa/Kconfig.

Yours,
Linus Walleij
