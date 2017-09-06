From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] pinctrl: sprd: Restrict PINCTRL_SPRD to ARCH_SPRD or
 COMPILE_TEST
Date: Wed, 6 Sep 2017 09:18:15 -0700
Message-ID: <811f2034-0bba-d8a8-eb50-d1a5c974a863@infradead.org>
References: <1504714085-17731-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([65.50.211.133]:47581 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752462AbdIFQSS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Sep 2017 12:18:18 -0400
In-Reply-To: <1504714085-17731-1-git-send-email-geert+renesas@glider.be>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Baolin Wang <baolin.wang@spreadtrum.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On 09/06/17 09:08, Geert Uytterhoeven wrote:
> The Spreadtrum pinctrl drivers are only useful when building for a
> Spreadtrum platform.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> On top of Arnd's:
>   - pinctrl: sprd: add missing Kconfig dependency
>   - pinctrl: sprd: add CONFIG_OF dependency

or (probably with fuzz) on top of my previous patch:
https://lkml.org/lkml/2017/9/4/336

>  drivers/pinctrl/sprd/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pinctrl/sprd/Kconfig b/drivers/pinctrl/sprd/Kconfig
> index e75cde2e1b460d66..bc7f3fab22f1c431 100644
> --- a/drivers/pinctrl/sprd/Kconfig
> +++ b/drivers/pinctrl/sprd/Kconfig
> @@ -5,6 +5,7 @@
>  config PINCTRL_SPRD
>  	bool "Spreadtrum pinctrl driver"
>  	depends on OF
> +	depends on ARCH_SPRD || COMPILE_TEST
>  	select PINMUX
>  	select PINCONF
>  	select GENERIC_PINCONF
> 


-- 
~Randy
