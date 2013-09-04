From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [patch] gpiolib: unlock on error in gpiod_set_debounce()
Date: Wed, 4 Sep 2013 07:51:51 +0200
Message-ID: <CACRpkdbHUo27Fkhp2XNAK3GSSKHMZVo_DMbE0FgDecn26Mao6A@mail.gmail.com>
References: <5225c32f.kWadywtP9mkLJ38j%fengguang.wu@intel.com>
	<20130903121500.GA16312@elgon.mountain>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:49354 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755924Ab3IDFvw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Sep 2013 01:51:52 -0400
Received: by mail-ob0-f178.google.com with SMTP id ef5so6849886obb.23
        for <linux-gpio@vger.kernel.org>; Tue, 03 Sep 2013 22:51:51 -0700 (PDT)
In-Reply-To: <20130903121500.GA16312@elgon.mountain>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, kbuild@01.org, Fengguang Wu <fengguang.wu@intel.com>

On Tue, Sep 3, 2013 at 2:15 PM, Dan Carpenter <dan.carpenter@oracle.com> wrote:

> There is a missing unlock on error here.
>
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index 0eb9cba..3c01782 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -1783,7 +1783,8 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>         if (!chip->set || !chip->set_debounce) {
>                 pr_warn("%s: missing set() or set_debounce() operations\n",
>                         __func__);
> -               return -EIO;
> +               status = -EIO;
> +               goto fail;
>         }

Yeah I screwed up. I queued another fix though, moving the locking below
the check instead.

Yours,
Linus Walleij
