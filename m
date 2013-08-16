From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: (gpio-pca953x) move header to linux/platform_data/
Date: Fri, 16 Aug 2013 15:34:45 +0200
Message-ID: <CACRpkdZdeVNtJSmc6Lr6j=oO9FLsAvjyrwhYS0j4OoAEhxCN9g@mail.gmail.com>
References: <1375304231-27281-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:64621 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125Ab3HPNeq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Aug 2013 09:34:46 -0400
Received: by mail-oa0-f44.google.com with SMTP id l20so2245829oag.31
        for <linux-gpio@vger.kernel.org>; Fri, 16 Aug 2013 06:34:45 -0700 (PDT)
In-Reply-To: <1375304231-27281-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, kernel@savoirfairelinux.com

On Wed, Jul 31, 2013 at 10:57 PM, Vivien Didelot
<vivien.didelot@savoirfairelinux.com> wrote:

> This patch moves the pca953x.h header from include/linux/i2c to
> include/linux/platform_data and updates existing support accordingly.
>
> Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>

On the concept:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

But:

>  drivers/gpio/gpio-pca953x.c                 |  2 +-
(...)
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 426c51d..8804aec 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -18,7 +18,7 @@
>  #include <linux/irq.h>
>  #include <linux/irqdomain.h>
>  #include <linux/i2c.h>
> -#include <linux/i2c/pca953x.h>
> +#include <linux/platform_data/pca953x.h>

Why does the GPIO driver need platform data from the
I2C driver???

Can't this just be made to go away?

Yours,
Linus Walleij
