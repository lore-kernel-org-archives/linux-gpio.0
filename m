From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH] gpio: remove remaining users of gpiochip_remove() retval
Date: Wed, 17 Sep 2014 17:34:57 +0200
Message-ID: <CABxcv==PsDAKkBzCu23YmVM3ywwW48mAhOUWPnrK_0gJiCiJzg@mail.gmail.com>
References: <1410905534-22650-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f50.google.com ([74.125.82.50]:54661 "EHLO
	mail-wg0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755406AbaIQPe7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Sep 2014 11:34:59 -0400
Received: by mail-wg0-f50.google.com with SMTP id x13so1586901wgg.33
        for <linux-gpio@vger.kernel.org>; Wed, 17 Sep 2014 08:34:57 -0700 (PDT)
In-Reply-To: <1410905534-22650-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Linux GPIO List <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>

Hello Linus,

On Wed, Sep 17, 2014 at 12:12 AM, Linus Walleij
<linus.walleij@linaro.org> wrote:
> Some drivers accidentally still use the return value from
> gpiochip_remove(). Get rid of them so we can simplify this function
> and get rid of the return value.
>
> Abdoulaye Berthe <berthe.ab@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpio/gpio-crystalcove.c | 9 +++------
>  drivers/gpio/gpio-omap.c        | 2 +-

For gpio-omap driver:

Acked-by: Javier Martinez Canillas <javier@dowhile0.org>

Best regards,
Javier
