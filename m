From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: pxa: simplify BANK_OFF macro offset calculation
Date: Tue, 3 Mar 2015 16:50:04 +0900
Message-ID: <CAAVeFuLz-7r53YJ5Xqh3bydyyi+0jXhVQOO24FM+AuRfvObnTA@mail.gmail.com>
References: <1425331858-6018-1-git-send-email-robh@kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:36988 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751475AbbCCHuZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Mar 2015 02:50:25 -0500
Received: by igbhn18 with SMTP id hn18so24355120igb.2
        for <linux-gpio@vger.kernel.org>; Mon, 02 Mar 2015 23:50:25 -0800 (PST)
In-Reply-To: <1425331858-6018-1-git-send-email-robh@kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rob Herring <robh@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Mar 3, 2015 at 6:30 AM, Rob Herring <robh@kernel.org> wrote:
> The macro BANK_OFF which calculates the base offset for each GPIO port.
> The macro is needlessly complex and unreadable. Simplify the
> calculation to a simple math operation.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>
> Cc: linux-gpio@vger.kernel.org
> ---
>  drivers/gpio/gpio-pxa.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
> index e45637b..d2324b9 100644
> --- a/drivers/gpio/gpio-pxa.c
> +++ b/drivers/gpio/gpio-pxa.c
> @@ -61,8 +61,7 @@
>  #define GAFR_OFFSET    0x54
>  #define ED_MASK_OFFSET 0x9C    /* GPIO edge detection for AP side */
>
> -#define BANK_OFF(n)    (((n) < 3) ? (n) << 2 : ((n) > 5 ? 0x200 : 0x100)       \
> -                       + (((n) % 3) << 2))
> +#define BANK_OFF(n)    (((n) / 3) << 8) + (((n) % 3) << 2)

Seems to indeed compute the same output as the previous macro in a
more readable way.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
