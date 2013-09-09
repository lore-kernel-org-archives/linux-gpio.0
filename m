From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/3] gpiolib: Downgrade set_debounce() missing operation warning
Date: Mon, 9 Sep 2013 09:47:17 +0200
Message-ID: <CACRpkdYCj-UDhekZ7tZ9kbusrJArvegfaGtJq7ULhNKz5o1Euw@mail.gmail.com>
References: <1378471128-3330-1-git-send-email-broonie@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:34477 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750934Ab3IIHrS (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Sep 2013 03:47:18 -0400
Received: by mail-ob0-f180.google.com with SMTP id va7so691086obc.25
        for <linux-gpio@vger.kernel.org>; Mon, 09 Sep 2013 00:47:17 -0700 (PDT)
In-Reply-To: <1378471128-3330-1-git-send-email-broonie@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linaro-kernel <linaro-kernel@lists.linaro.org>, Mark Brown <broonie@linaro.org>

On Fri, Sep 6, 2013 at 2:38 PM, Mark Brown <broonie@kernel.org> wrote:

> +++ b/drivers/gpio/gpiolib.c
> @@ -1779,8 +1779,8 @@ static int gpiod_set_debounce(struct gpio_desc *desc, unsigned debounce)
>
>         chip = desc->chip;
>         if (!chip->set || !chip->set_debounce) {
> -               pr_warn("%s: missing set() or set_debounce() operations\n",
> -                       __func__);
> +               pr_debug("%s: missing set() or set_debounce() operations\n",
> +                        __func__);

A patch like this is already upstream, but thanks anyway!

Yours,
Linus Walleij
