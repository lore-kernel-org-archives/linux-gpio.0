From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] davinci:Fix possible NULL pointer deference in the
 function davinci_gpio_probe
Date: Wed, 3 Feb 2016 09:28:48 +0900
Message-ID: <CAAVeFuKS-68h-GVP7hkyoPWo3oavTGJ40=b8w8FxD+7Pwh_rLw@mail.gmail.com>
References: <1454458679-11165-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f180.google.com ([209.85.213.180]:38641 "EHLO
	mail-ig0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753449AbcBCA3I (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Feb 2016 19:29:08 -0500
In-Reply-To: <1454458679-11165-1-git-send-email-xerofoify@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 3, 2016 at 9:17 AM, Nicholas Krause <xerofoify@gmail.com> wrote:
> This fixes a possible NULL pointer deference in the function,
> davinci_gpio_probe due to the function, gpio2regs being able
> to return a NULL pointer if it rans to get the registers for
> the gpio devices on a davinci board. Furthermore if this does
> arise return -ENXIO to signal callers that this case has arisen
> and avoiding setting the regs or other pointer values on the
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  drivers/gpio/gpio-davinci.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
> index ec58f42..1cc527d 100644
> --- a/drivers/gpio/gpio-davinci.c
> +++ b/drivers/gpio/gpio-davinci.c
> @@ -257,6 +257,8 @@ static int davinci_gpio_probe(struct platform_device *pdev)
>                 spin_lock_init(&chips[i].lock);
>
>                 regs = gpio2regs(base);
> +               if (!regs)
> +                       return -ENXIO;

Ok, a bit futile maybe but this *may* happen in theory...

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
