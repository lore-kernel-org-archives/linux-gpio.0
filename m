From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] pinctrl: always include all subdirectories in build
Date: Sun, 11 Oct 2015 22:15:30 +0300
Message-ID: <3122270.FxkLHnE6Ih@avalon>
References: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54083 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752133AbbJKTPU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Oct 2015 15:15:20 -0400
In-Reply-To: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

Hi Jonas,

(Reducing the CC list a bit to avoid spamming people)

Thank you for the patch.

On Sunday 11 October 2015 17:40:44 Jonas Gorski wrote:
> All pinctrl drivers in subdirectories are properly guarded by individual
> configuration symbols, so there is no need to limit the directories to
> the belonging machines.
> 
> This allows wider COMPILE_TEST coverage on "foreign" targets.
> 
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>

For sh-pfc,

Acked-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/pinctrl/Makefile | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index cad077c..2eb25a8 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -39,17 +39,17 @@ obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
>  obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
>  obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
> 
> -obj-$(CONFIG_ARCH_BCM)		+= bcm/
> -obj-$(CONFIG_ARCH_BERLIN)	+= berlin/
> +obj-y				+= bcm/
> +obj-y				+= berlin/
>  obj-y				+= freescale/
> -obj-$(CONFIG_X86)		+= intel/
> -obj-$(CONFIG_PLAT_ORION)        += mvebu/
> +obj-y				+= intel/
> +obj-y				+= mvebu/
>  obj-y				+= nomadik/
> -obj-$(CONFIG_ARCH_QCOM)		+= qcom/
> -obj-$(CONFIG_PINCTRL_SAMSUNG)	+= samsung/
> -obj-$(CONFIG_PINCTRL_SH_PFC)	+= sh-pfc/
> -obj-$(CONFIG_PLAT_SPEAR)	+= spear/
> -obj-$(CONFIG_ARCH_SUNXI)	+= sunxi/
> -obj-$(CONFIG_ARCH_UNIPHIER)	+= uniphier/
> -obj-$(CONFIG_ARCH_VT8500)	+= vt8500/
> -obj-$(CONFIG_ARCH_MEDIATEK)	+= mediatek/
> +obj-y				+= qcom/
> +obj-y				+= samsung/
> +obj-y				+= sh-pfc/
> +obj-y				+= spear/
> +obj-y				+= sunxi/
> +obj-y				+= uniphier/
> +obj-y				+= vt8500/
> +obj-y				+= mediatek/

-- 
Regards,

Laurent Pinchart

