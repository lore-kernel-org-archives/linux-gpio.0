From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: Re: [PATCH] gpio: gpio-pca953x: no interrupts with 4-bit devices
Date: Wed, 09 Mar 2016 14:05:32 +0100
Message-ID: <2550700.ucYhgAiWGF@ws-stein>
References: <emac54c752-04e5-4445-a05e-e6d24a098066@t410-5a>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:59209 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753582AbcCINFs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Mar 2016 08:05:48 -0500
In-Reply-To: <emac54c752-04e5-4445-a05e-e6d24a098066@t410-5a>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: mrpace2@gmail.com
Cc: linux-gpio@vger.kernel.org

On Wednesday 09 March 2016 12:37:09, mrpace2@gmail.com wrote:
> I/O expanders with less than 8 I/O (PCA9536 and PCA9537, currently) fail 
> to invoke interrupt handlers because the NBANK macro
> 
>      #define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
> incorrectly calculates no banks for these devices. As a result, 
> pca953x_irq_pending() never sets the trigger_seen flag.
> 
> The patch below fixed the issue by changing the NBANK() macro.
> 
> Signed-off-by: Frank Edelhaeuser <mrpace2 <at> gmail.com>
> ---
> diff -Nur a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> --- a/drivers/gpio/gpio-pca953x.c 2016-03-08 00:00:00.000000000 +0000
> +++ b/drivers/gpio/gpio-pca953x.c 2016-03-08 00:00:00.000000000 +0000
> @@ -86,7 +86,7 @@
>   #define MAX_BANK 5
>   #define BANK_SZ 8
> 
> -#define NBANK(chip) (chip->gpio_chip.ngpio / BANK_SZ)
> +#define NBANK(chip) (((chip->gpio_chip.ngpio - 1) / BANK_SZ) + 1)

If ngpio is 0 (e.g. wrong platform device) this underflows and gets a completly wrong result. But I see more of those "ngpio - 1" all over the place.
What about?
> #define NBANK(chip) (((chip->gpio_chip.ngpio + (BANK_SZ - 1)) / BANK_SZ))

Best regards,
Alexander

