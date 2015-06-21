From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH 2/2] gpio: altera: fix return value of altera_gpio_remove()
Date: Sun, 21 Jun 2015 16:25:26 +0900
Message-ID: <CAAVeFuJoeN4O6Cc1Wsm+Ev+K6sT0PqNq1QtX-ZQp1ePGVUbiPA@mail.gmail.com>
References: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com> <1434542383-21314-2-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:35814 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751394AbbFUHZq (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 21 Jun 2015 03:25:46 -0400
In-Reply-To: <1434542383-21314-2-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Tien Hock Loh <thloh@altera.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jun 17, 2015 at 8:59 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The remove callback never succeeds, which seems odd.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> I wonder why nobody has pointed this out before me.
> I am suspecting -EIO might be intentional.
> I hope some Altera guys will give me comments.
>
>
>  drivers/gpio/gpio-altera.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-altera.c b/drivers/gpio/gpio-altera.c
> index c653c83..5861550 100644
> --- a/drivers/gpio/gpio-altera.c
> +++ b/drivers/gpio/gpio-altera.c
> @@ -339,7 +339,7 @@ static int altera_gpio_remove(struct platform_device *pdev)
>
>         of_mm_gpiochip_remove(&altera_gc->mmchip);
>
> -       return -EIO;
> +       return 0;

That looks weird indeed. Tien, can you comment on this?
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
