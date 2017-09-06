From: David Daney <ddaney@caviumnetworks.com>
Subject: Re: [PATCH] gpio: thunderx: select IRQ_DOMAIN_HIERARCHY instead of
 depends on
Date: Tue, 5 Sep 2017 19:09:31 -0700
Message-ID: <32679e9c-7ad7-a632-4842-6e8e8b820d26@caviumnetworks.com>
References: <1504662052-12478-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-bn3nam01on0074.outbound.protection.outlook.com ([104.47.33.74]:35328
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753841AbdIFCJn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 5 Sep 2017 22:09:43 -0400
In-Reply-To: <1504662052-12478-1-git-send-email-yamada.masahiro@socionext.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org
Cc: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org

On 09/05/2017 06:40 PM, Masahiro Yamada wrote:
> IRQ_DOMAIN_HIERARCHY is not user-configurable, but supposed to be
> selected by drivers that need IRQ domain hierarchy support.
> 
> GPIO_THUNDERX is the only user of "depends on IRQ_DOMAIN_HIERARCHY".
> This means, we can not enable GPIO_THUNDERX unless other drivers
> select IRQ_DOMAIN_HIERARCHY elsewhere.  This is odd.  Flip the logic.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

IRQ_DOMAIN_HIERARCHY is set as a result of ARCH_THUNDER (this SoC 
hardware), so it actually works as-is.  That said, this looks like a 
reasonable improvement, and will allow the COMPILE_TEST to enable it, so...

Acked-by: David Daney <david.daney@cavium.com>


> ---
> 
>   drivers/gpio/Kconfig | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 3388d54..3f80f16 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -453,7 +453,8 @@ config GPIO_TS4800
>   config GPIO_THUNDERX
>   	tristate "Cavium ThunderX/OCTEON-TX GPIO"
>   	depends on ARCH_THUNDER || (64BIT && COMPILE_TEST)
> -	depends on PCI_MSI && IRQ_DOMAIN_HIERARCHY
> +	depends on PCI_MSI
> +	select IRQ_DOMAIN_HIERARCHY
>   	select IRQ_FASTEOI_HIERARCHY_HANDLERS
>   	help
>   	  Say yes here to support the on-chip GPIO lines on the ThunderX
> 

