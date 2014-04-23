From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] gpio: rdc321x: Fix off-by-one for ngpio setting
Date: Wed, 23 Apr 2014 15:25:50 +0200
Message-ID: <CACRpkdYU7QjQz76c7N07LSowEcXak6dT0G0VpuCTWPzGdAgPqA@mail.gmail.com>
References: <1397196885.12922.2.camel@phoenix>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:56737 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753600AbaDWNZv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Apr 2014 09:25:51 -0400
Received: by mail-ob0-f177.google.com with SMTP id wp18so973268obc.22
        for <linux-gpio@vger.kernel.org>; Wed, 23 Apr 2014 06:25:50 -0700 (PDT)
In-Reply-To: <1397196885.12922.2.camel@phoenix>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Florian Fainelli <florian@openwrt.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Apr 11, 2014 at 8:14 AM, Axel Lin <axel.lin@ingics.com> wrote:

> The valid gpio is GPIO0 ~ GPIO58, so ngpio should be RDC321X_MAX_GPIO + 1.
>
> Signed-off-by: Axel Lin <axel.lin@ingics.com>
(...)
> -       rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios;
> +       rdc321x_gpio_dev->chip.ngpio = pdata->max_gpios + 1;

This is counter-intuitive. "max_gpios" should be a name for the
maximum number of gpios right? Not the maximum number of
GPIOs minus one!

It is better to patch include/linux/mfd/rdc321x.h:

-#define RDC321X_MAX_GPIO    58
+#define RDC321X_MAX_GPIO    59

Which establishes the true character of this device.

Yours,
Linus Walleij
