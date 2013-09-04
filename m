From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: Commit "gpio: improve error path in gpiolib" causes hang on mx6
Date: Wed, 4 Sep 2013 07:44:35 +0200
Message-ID: <CACRpkdYt6KomA5t7fmqQEUwXCR74QaPtpdOPiUjRYowj_cCV4Q@mail.gmail.com>
References: <CAOMZO5DnS--2Cxw+M8S8QcA_2eN+QKTpvWYyCWiH6KkLsRm8HA@mail.gmail.com>
	<CAOMZO5DuWM6Mu1vQwr=0p9Vx7RqOmt+WC81gEUsaoRThR1fL_w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f51.google.com ([209.85.219.51]:57632 "EHLO
	mail-oa0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755930Ab3IDFof (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2013 01:44:35 -0400
Received: by mail-oa0-f51.google.com with SMTP id h1so7930814oag.10
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2013 22:44:35 -0700 (PDT)
In-Reply-To: <CAOMZO5DuWM6Mu1vQwr=0p9Vx7RqOmt+WC81gEUsaoRThR1fL_w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Fabio Estevam <festevam@gmail.com>
Cc: Sascha Hauer <kernel@pengutronix.de>, Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Sep 3, 2013 at 10:34 PM, Fabio Estevam <festevam@gmail.com> wrote:
>>
>> If I revert this commit, then I am able to boot correctly.
>
> I think I found a fix:
>
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1783,7 +1783,7 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsi
>         if (!chip->set || !chip->set_debounce) {
>                 pr_warn("%s: missing set() or set_debounce() operations\n",
>                         __func__);
> -               return -EIO;
> +               goto fail;
>         }
>
> will submit it shortly.

A commit like this is already in linux-next, however I screwed up the
locking so the final fix arrives today.

Yours,
Linus Walleij
