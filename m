From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpiolib: Export gpiochip_request_own_desc and gpiochip_free_own_desc
Date: Thu, 24 Jul 2014 10:26:06 +0200
Message-ID: <CACRpkdZP377kmVYAMWaEg2wJy_P4S67xs857v3pNhTZwvp3ThA@mail.gmail.com>
References: <1406041261-5716-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f42.google.com ([209.85.219.42]:32826 "EHLO
	mail-oa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934322AbaGXI0H (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Jul 2014 04:26:07 -0400
Received: by mail-oa0-f42.google.com with SMTP id n16so3205188oag.15
        for <linux-gpio@vger.kernel.org>; Thu, 24 Jul 2014 01:26:06 -0700 (PDT)
In-Reply-To: <1406041261-5716-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Mika Westerberg <mika.westerberg@linux.intel.com>

On Tue, Jul 22, 2014 at 5:01 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> Both functions were introduced to let gpio drivers request their own
> gpio pins. Without exporting the functions, this can however only be
> used by gpio drivers built into the kernel.
>
> Secondary impact is that the functions can not currently be used by
> platform initialization code associated with the gpio-pca953x driver.
> This code permits auto-export of gpio pins through platform data, but
> if this functionality is used, the module can no longer be unloaded due
> to the problem solved with the introduction of gpiochip_request_own_desc
> and gpiochip_free_own_desc.
>
> Export both function so they can be used from modules and from
> platform initialization code.
>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v3: Add API documentation.
>     Use EXPORT_SYMBOL_GPL.

Patch applied with the nice review tags.

Yours,
Linus Walleij
