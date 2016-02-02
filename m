From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] davinci:Fix possible NULL pointer deference in the
 function davinci_gpio_probe
Date: Wed, 3 Feb 2016 08:30:39 +0900
Message-ID: <CAAVeFuKwZ7r_8weyMWY4NrjREWaefzUWhVbh_V75FiJsWs5QMA@mail.gmail.com>
References: <1454015092-11416-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:35739 "EHLO
	mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754559AbcBBXa7 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2016 18:30:59 -0500
In-Reply-To: <1454015092-11416-1-git-send-email-xerofoify@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Jan 29, 2016 at 6:04 AM, Nicholas Krause <xerofoify@gmail.com> wrote:
> This fixes a possible NULL pointer deference in the function,
> davinci_gpio_probe due to the function, gpio2regs being able
> to return a NULL pointer if it rans to get the registers for
> the gpio devices on a davinci board. Furthermore if this does
> arise return -ENXIO to signal callers that this case has arisen
> and avoiding setting the regs or other pointer values on the
> chips to avoid rather deferences to a NULL pointer by other
> functions in this gpio driver.
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  drivers/gpio/gpio-davinci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index ec58f42..800227e 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -257,6 +257,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>                 spin_lock_init(&chips[i].lock);
>
>                 regs = gpio2regs(base);
> +               if (!ret)
> +                       return -ENXIO;

You haven't even tried to compile this one, have you?
