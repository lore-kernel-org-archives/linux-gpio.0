From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: f7188x: set can_sleep attribute
Date: Thu, 2 Jan 2014 14:16:59 +0100
Message-ID: <CACRpkdaTzWNe+4h_hQ0VMrpc+6nabDmJq_2eVKi5vFRSsZ+SKQ@mail.gmail.com>
References: <1387805658-13540-1-git-send-email-simon.guinot@sequanux.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:60547 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733AbaABNRA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 08:17:00 -0500
Received: by mail-ob0-f171.google.com with SMTP id wp18so14400693obc.16
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 05:16:59 -0800 (PST)
In-Reply-To: <1387805658-13540-1-git-send-email-simon.guinot@sequanux.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Simon Guinot <simon.guinot@sequanux.org>
Cc: Grant Likely <grant.likely@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Dec 23, 2013 at 2:34 PM, Simon Guinot <simon.guinot@sequanux.org> wrote:

> Since request_muxed_region() is used to synchronize access on the
> Super-I/O controller, then the can_sleep attribute must be set for
> the f7188x GPIO chips.
>
> Signed-off-by: Simon Guinot <simon.guinot@sequanux.org>
> ---
>  drivers/gpio/gpio-f7188x.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpio/gpio-f7188x.c b/drivers/gpio/gpio-f7188x.c
> index 9cb8320..fc3e98a 100644
> --- a/drivers/gpio/gpio-f7188x.c
> +++ b/drivers/gpio/gpio-f7188x.c
> @@ -135,6 +135,7 @@ static void f7188x_gpio_set(struct gpio_chip *chip, unsigned offset, int value);
>                         .set              = f7188x_gpio_set,            \
>                         .base             = _base,                      \
>                         .ngpio            = _ngpio,                     \
> +                       .can_sleep        = 1,                          \

I just recently changed this member to a bool so please
change this to = true instead and resend.

Yours,
Linus Walleij
