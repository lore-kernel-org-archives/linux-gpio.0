From: Andreas Larsson <andreas@gaisler.com>
Subject: Re: [PATCH 1/7] gpio: grgpio: Make of_device_id array const
Date: Wed, 07 May 2014 14:01:56 +0200
Message-ID: <536A20B4.6090707@gaisler.com>
References: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from vsp-authed02.binero.net ([195.74.38.226]:36880 "EHLO
	vsp-authed-03-02.binero.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755610AbaEGMCM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 08:02:12 -0400
In-Reply-To: <022701cf69d3$37a74a00$a6f5de00$%han@samsung.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jingoo Han <jg1.han@samsung.com>, 'Linus Walleij' <linus.walleij@linaro.org>
Cc: 'Alexandre Courbot' <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On 2014-05-07 11:03, Jingoo Han wrote:
> Make of_device_id array const, because all OF functions
> handle it as const.
>
> Signed-off-by: Jingoo Han <jg1.han@samsung.com>

Acked-by: Andreas Larsson <andreas@gaisler.com>

> ---
>   drivers/gpio/gpio-grgpio.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-grgpio.c b/drivers/gpio/gpio-grgpio.c
> index 84d2478..3c3f515 100644
> --- a/drivers/gpio/gpio-grgpio.c
> +++ b/drivers/gpio/gpio-grgpio.c
> @@ -481,7 +481,7 @@ out:
>   	return ret;
>   }
>
> -static struct of_device_id grgpio_match[] = {
> +static const struct of_device_id grgpio_match[] = {
>   	{.name = "GAISLER_GPIO"},
>   	{.name = "01_01a"},
>   	{},
>
