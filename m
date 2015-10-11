From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] pinctrl: always include all subdirectories in build
Date: Sun, 11 Oct 2015 20:36:51 +0200
Message-ID: <561AAC43.8050908@gmail.com>
References: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f175.google.com ([209.85.212.175]:37607 "EHLO
	mail-wi0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751589AbbJKSg5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Oct 2015 14:36:57 -0400
Received: by wijq8 with SMTP id q8so29262369wij.0
        for <linux-gpio@vger.kernel.org>; Sun, 11 Oct 2015 11:36:55 -0700 (PDT)
In-Reply-To: <1444578044-17804-1-git-send-email-jogo@openwrt.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jonas Gorski <jogo@openwrt.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Maxime Coquelin <maxime.coquelin@st.com>, Kumar Gala <galak@codeaurora.org>, Andy Gross <agross@codeaurora.org>, David Brown <davidb@codeaurora.org>, Viresh Kumar <vireshk@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>, Tony Prisk <linux@prisktech.co.nz>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Masahiro Yamada <yamada.masahiro@socionext.com>



On 11/10/15 17:40, Jonas Gorski wrote:
> All pinctrl drivers in subdirectories are properly guarded by individual
> configuration symbols, so there is no need to limit the directories to
> the belonging machines.
>
> This allows wider COMPILE_TEST coverage on "foreign" targets.
>
> Signed-off-by: Jonas Gorski <jogo@openwrt.org>
> ---
>   drivers/pinctrl/Makefile | 24 ++++++++++++------------
>   1 file changed, 12 insertions(+), 12 deletions(-)

For Mediatek:

Acked-by: Matthias Brugger <matthias.bgg@gmail.com>

>
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index cad077c..2eb25a8 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -39,17 +39,17 @@ obj-$(CONFIG_PINCTRL_TB10X)	+= pinctrl-tb10x.o
>   obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
>   obj-$(CONFIG_PINCTRL_ZYNQ)	+= pinctrl-zynq.o
>
> -obj-$(CONFIG_ARCH_BCM)		+= bcm/
> -obj-$(CONFIG_ARCH_BERLIN)	+= berlin/
> +obj-y				+= bcm/
> +obj-y				+= berlin/
>   obj-y				+= freescale/
> -obj-$(CONFIG_X86)		+= intel/
> -obj-$(CONFIG_PLAT_ORION)        += mvebu/
> +obj-y				+= intel/
> +obj-y				+= mvebu/
>   obj-y				+= nomadik/
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
>
