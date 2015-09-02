From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio:Fix error checking in the function device_pca957x_init
Date: Wed, 2 Sep 2015 21:43:13 +0900
Message-ID: <CAAVeFuKQviWg0wXpQ0PRTTueVRV7eHbyVrFCwaZ0gQZV1y0AJA@mail.gmail.com>
References: <1440625939-18667-1-git-send-email-xerofoify@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f43.google.com ([209.85.215.43]:33269 "EHLO
	mail-la0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754062AbbIBMne (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Sep 2015 08:43:34 -0400
In-Reply-To: <1440625939-18667-1-git-send-email-xerofoify@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicholas Krause <xerofoify@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Nit: please don't forget a space after "gpio:" in your subject line.

On Thu, Aug 27, 2015 at 6:52 AM, Nicholas Krause <xerofoify@gmail.com> wrote:
> This fixes error checking in the function device_pca957x_init
> to properly check and return error code values from the calls
> to the function pca953x_write_regs if they fail as to properly
> signal callers when a error occurs due a failure when writing
> registers for this gpio based device.
>
> Signed-off-by: Nicholas Krause <xerofoify@gmail.com>
> ---
>  drivers/gpio/gpio-pca953x.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 50caeb1..4e5745d 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -635,11 +635,15 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
>                 memset(val, 0xFF, NBANK(chip));
>         else
>                 memset(val, 0, NBANK(chip));
> -       pca953x_write_regs(chip, PCA957X_INVRT, val);
> +       ret = pca953x_write_regs(chip, PCA957X_INVRT, val);
> +       if (ret)
> +               goto out;
>
>         /* To enable register 6, 7 to control pull up and pull down */
>         memset(val, 0x02, NBANK(chip));
> -       pca953x_write_regs(chip, PCA957X_BKEN, val);
> +       ret = pca953x_write_regs(chip, PCA957X_BKEN, val);
> +       if (ret)
> +               goto out;

Ok, cannot hurt.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
