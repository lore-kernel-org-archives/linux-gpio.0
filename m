From: Yingjoe Chen <yingjoe.chen@mediatek.com>
Subject: Re: [PATCH 2/2] pinctrl: mediatek: Add pinctrl files for MT7623
Date: Wed, 20 Jan 2016 17:41:23 +0800
Message-ID: <1453282883.16515.14.camel@mtksdaap41>
References: <1452441608-24176-1-git-send-email-blogic@openwrt.org>
	 <1452441608-24176-2-git-send-email-blogic@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mailgw01.mediatek.com ([210.61.82.183]:39319 "EHLO
	mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751311AbcATJl1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2016 04:41:27 -0500
In-Reply-To: <1452441608-24176-2-git-send-email-blogic@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: John Crispin <blogic@openwrt.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org

On Sun, 2016-01-10 at 17:00 +0100, John Crispin wrote:
> Add the driver and header files required to make pinctrl work on MediaTek
> MT7623.
> 
> Signed-off-by: John Crispin <blogic@openwrt.org>
> ---
>  drivers/pinctrl/mediatek/Kconfig              |    5 +
>  drivers/pinctrl/mediatek/Makefile             |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mt7623.c     |  380 +++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h | 1936 +++++++++++++++++++++++++
>  include/dt-bindings/pinctrl/mt7623-pinfunc.h  |  520 +++++++
>  5 files changed, 2842 insertions(+)
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7623.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt7623.h
>  create mode 100644 include/dt-bindings/pinctrl/mt7623-pinfunc.h
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 13e9939..8cc6b8a 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -13,6 +13,11 @@ config PINCTRL_MT2701
>  	bool "Mediatek MT2701 pin control" if COMPILE_TEST && !MACH_MT2701
>  	depends on OF
>  	default MACH_MT2701
> +
> +config PINCTRL_MT7623
> +	bool "Mediatek MT7623 pin control" if COMPILE_TEST && !MACH_MT7623
> +	depends on OF
> +	default MACH_MT7623
>  	select PINCTRL_MTK_COMMON


Hi John,

You removed 'select PINCTRL_MTK_COMMON' form PINCTRL_MT2701. Please add
it back.

<...>


> diff --git a/include/dt-bindings/pinctrl/mt7623-pinfunc.h b/include/dt-bindings/pinctrl/mt7623-pinfunc.h
> new file mode 100644
> index 0000000..d8a0f2e
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt7623-pinfunc.h
> @@ -0,0 +1,520 @@
> +#ifndef __DTS_MT7623_PINFUNC_H
> +#define __DTS_MT7623_PINFUNC_H
> +
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +

<...>

This is part of dt-binding. I think it should be a separate patch or go
with the dt-binding patch.

Joe.C


