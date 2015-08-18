From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio:Fix incorrect variable assignment in the function __gpiod_request
Date: Tue, 18 Aug 2015 16:34:02 +0900
Message-ID: <CAAVeFu+6dBicWkvws0MdrDDqW+b-rqw=mgm7n3V2ufsNMX6ymQ@mail.gmail.com>
References: <1439831264-11235-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35168 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750867AbbHRHeW (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Aug 2015 03:34:22 -0400
In-Reply-To: <1439831264-11235-1-git-send-email-xerofoify@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Your commit subject is missing a space after "gpio:"

On Tue, Aug 18, 2015 at 2:07 AM, Nicholas Krause <xerofoify@gmail.com> wrote:
> This fixes the incorrect variable assignment in the function
> __gpiod_request of not assigning the variable status to the
> return value of the function gpiod_get_direction before this
> function return's to it's respective caller due to the fact
> that the function gpiod_get_direction can fail and thus callers
> of the function __gpiod_request should be correctly returned
> the error by this call to correctly be alerted of failed calls
> to the function __gpiod_request.

That's a very long commit message for such a simple change. And all in
one sentence!

"Assign the return value of gpiod_get_direction() into the status
variable to propagate errors" would have been both more concise and
informative.

>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  drivers/gpio/gpiolib.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index bf4bd1d..bd848df 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -821,7 +821,7 @@ static int __gpiod_request(struct gpio_desc *desc, const char *label)
>         if (chip->get_direction) {
>                 /* chip->get_direction may sleep */
>                 spin_unlock_irqrestore(&gpio_lock, flags);
> -               gpiod_get_direction(desc);
> +               status = gpiod_get_direction(desc);

This is incorrect. Look at the documentation for gpiod_get_direction():

         Return GPIOF_DIR_IN or GPIOF_DIR_OUT, or an error code in
case of error.

So even in case of success, this function may return non-zero, which
will trigger error handling in some callers, e.g. gpiod_request():

        if (status)
                gpiod_dbg(desc, "%s: status %d\n", __func__, status);

Also, even though you return an error code if gpiod_get_direction()
failed, you omitted to clean the GPIO state (what is done if
chip->request() fails), making that GPIO unusuable forever.

Finally, should errors in gpiod_get_direction() be fatal? We call it
here only to update the kernel state of the GPIO, it is not really
fatal if it failed here.
