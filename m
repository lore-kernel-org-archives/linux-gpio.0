From: John Crispin <blogic@openwrt.org>
Subject: Re: [PATCH 1/2] gpio-stp-xway: Fix enabling the highest bit of the
 PHY LEDs
Date: Tue, 26 May 2015 08:54:01 +0200
Message-ID: <55641889.4010705@openwrt.org>
References: <1432586391-27634-1-git-send-email-martin.blumenstingl@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from arrakis.dune.hu ([78.24.191.176]:33850 "EHLO arrakis.dune.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751154AbbEZGyF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 26 May 2015 02:54:05 -0400
In-Reply-To: <1432586391-27634-1-git-send-email-martin.blumenstingl@googlemail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Grant Likely <grant.likely@linaro.org>



On 25/05/2015 22:39, Martin Blumenstingl wrote:
> 0x3 only masks two bits, but three bits have to be allowed. This fixes
> GPHY0 LED2 (which is the highest bit of phy2) on my board.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Acked-by: John Crispin <blogic@openwrt.org>

> ---
>  drivers/gpio/gpio-stp-xway.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-stp-xway.c b/drivers/gpio/gpio-stp-xway.c
> index 202361e..6d4148f 100644
> --- a/drivers/gpio/gpio-stp-xway.c
> +++ b/drivers/gpio/gpio-stp-xway.c
> @@ -58,7 +58,7 @@
>  #define XWAY_STP_ADSL_MASK	0x3
>  
>  /* 2 groups of 3 bits can be driven by the phys */
> -#define XWAY_STP_PHY_MASK	0x3
> +#define XWAY_STP_PHY_MASK	0x7
>  #define XWAY_STP_PHY1_SHIFT	27
>  #define XWAY_STP_PHY2_SHIFT	15
>  
> 
