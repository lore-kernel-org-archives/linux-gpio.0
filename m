From: Ray Jui <ray.jui@broadcom.com>
Subject: Re: [PATCH -next] pinctrl: fix build, PINCTRL_CYGNUS_MUX depends on
 OF
Date: Fri, 22 Jul 2016 11:09:19 -0700
Message-ID: <e8bd2919-53f1-6fe9-0188-c52d44fdc54b@broadcom.com>
References: <fbda11e7-273c-c91a-777d-5eaa61c86b82@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f171.google.com ([209.85.192.171]:33875 "EHLO
	mail-pf0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751772AbcGVSJ2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jul 2016 14:09:28 -0400
Received: by mail-pf0-f171.google.com with SMTP id p64so43577832pfb.1
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jul 2016 11:09:28 -0700 (PDT)
In-Reply-To: <fbda11e7-273c-c91a-777d-5eaa61c86b82@infradead.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>, "linux-next@vger.kernel.org" <linux-next@vger.kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, linux-arm-kernel@lists.infradead.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

Hi Randy,

On 7/22/2016 11:06 AM, Randy Dunlap wrote:
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Fix pinctrl-cygnus-mux.c build when ARCH_BCM_CYGNUS is not enabled
> but COMPILE_TEST is enabled by making the driver depend on OF.
>
> ../drivers/pinctrl/bcm/pinctrl-cygnus-mux.c:739:20: error: 'pinconf_generic_dt_node_to_map_group' undeclared here (not in a function)
>   .dt_node_to_map = pinconf_generic_dt_node_to_map_group,
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> ---
>  drivers/pinctrl/bcm/Kconfig |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20160722.orig/drivers/pinctrl/bcm/Kconfig
> +++ linux-next-20160722/drivers/pinctrl/bcm/Kconfig
> @@ -60,6 +60,7 @@ config PINCTRL_IPROC_GPIO
>  config PINCTRL_CYGNUS_MUX
>  	bool "Broadcom Cygnus IOMUX driver"
>  	depends on (ARCH_BCM_CYGNUS || COMPILE_TEST)
> +	depends on OF
>  	select PINMUX
>  	select GENERIC_PINCONF
>  	default ARCH_BCM_CYGNUS
>

Thanks, but a fix was already submitted by Arnd and picked up by Linus: 
https://lkml.org/lkml/2016/7/15/649

Ray
