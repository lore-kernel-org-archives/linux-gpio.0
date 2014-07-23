From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH RESEND] gpio: Add support for GPIOF_ACTIVE_LOW to
 gpio_request_one functions
Date: Wed, 23 Jul 2014 17:32:42 +0200
Message-ID: <CACRpkdbn+nNJ4L71ZkLzNWWvmAq=bTYTBg1AJWe7TAtGq+3pKw@mail.gmail.com>
References: <1405966336-6605-1-git-send-email-linux@roeck-us.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:41721 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756440AbaGWPcm (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Jul 2014 11:32:42 -0400
Received: by mail-oa0-f44.google.com with SMTP id eb12so1857050oac.31
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2014 08:32:42 -0700 (PDT)
In-Reply-To: <1405966336-6605-1-git-send-email-linux@roeck-us.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Guenter Roeck <linux@roeck-us.net>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Mon, Jul 21, 2014 at 8:12 PM, Guenter Roeck <linux@roeck-us.net> wrote:

> The gpio include file and the gpio documentation declare and document
> GPIOF_ACTIVE_LOW as one of the flags to be passed to gpio_request_one
> and related functions. However, the flag is not evaluated or used.
>
> This can cause problems in at least two areas: First, the same API can
> be used to auto-export pins to user space. The missing support for
> GPIOF_ACTIVE_LOW results in unexpected behavior for such auto-exported
> pins. Second, the requested gpio pin can be convered for use by
> gpiod functions with gpio_to_desc(). While gpio API functions do not
> support GPIOF_ACTIVE_LOW, gpiod functions do, which again results in
> unexpected behavior.
>
> Check the flag in gpio_request_one and set the gpio internal flag
> FLAG_ACTIVE_LOW if it is set to address those problems.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Patch applied after manually rebasing so it hits gpiolib-legacy.c.

Yours,
Linus Walleij
