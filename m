From: Dirk Behme <dirk.behme@gmail.com>
Subject: Re: [PATCH] gpiolib: don't compare an unsigned for >= 0
Date: Sun, 30 Aug 2015 07:13:56 +0200
Message-ID: <55E29114.4050008@gmail.com>
References: <1439913752-26634-1-git-send-email-dirk.behme@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f174.google.com ([209.85.212.174]:35701 "EHLO
	mail-wi0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778AbbH3FOE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 30 Aug 2015 01:14:04 -0400
Received: by wicne3 with SMTP id ne3so47367556wic.0
        for <linux-gpio@vger.kernel.org>; Sat, 29 Aug 2015 22:14:02 -0700 (PDT)
In-Reply-To: <1439913752-26634-1-git-send-email-dirk.behme@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org

On 18.08.2015 18:02, Dirk Behme wrote:
> The parameter offset is an unsigned, so it makes no sense to compare
> it for >= 0. Fix the compiler warning regarding this by removing this
> comparison.
>
> As the macro GPIO_OFFSET_VALID is only used at this single place, simplify
> the code by dropping the macro completely and dropping the invert, too.
>
> No functional change.
>
> Signed-off-by: Dirk Behme <dirk.behme@gmail.com>
> ---
>   drivers/gpio/gpiolib.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index bf4bd1d..9841b05 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -47,8 +47,6 @@
>    */
>   DEFINE_SPINLOCK(gpio_lock);
>
> -#define GPIO_OFFSET_VALID(chip, offset) (offset >= 0 && offset < chip->ngpio)
> -
>   static DEFINE_MUTEX(gpio_lookup_lock);
>   static LIST_HEAD(gpio_lookup_list);
>   LIST_HEAD(gpio_chips);
> @@ -914,7 +912,7 @@ const char *gpiochip_is_requested(struct gpio_chip *chip, unsigned offset)
>   {
>   	struct gpio_desc *desc;
>
> -	if (!GPIO_OFFSET_VALID(chip, offset))
> +	if (offset >= chip->ngpio)
>   		return NULL;
>
>   	desc = &chip->desc[offset];


What do you think about this? Could this be applied?

Best regards

Dirk

