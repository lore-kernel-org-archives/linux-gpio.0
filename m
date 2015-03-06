From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 1/2] arm64: mediatek: Select PINCTRL for Mediatek platform
Date: Fri, 6 Mar 2015 14:18:43 +0100
Message-ID: <CABuKBeKBDQ0uqH2ssuRFHV=77_cVYddZMzJR-SsN44U245imvA@mail.gmail.com>
References: <1425623091-30478-1-git-send-email-yingjoe.chen@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1425623091-30478-1-git-send-email-yingjoe.chen@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Hongzhou Yang <hongzhou.yang@mediatek.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, srv_heupstream <srv_heupstream@mediatek.com>, linux-mediatek@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>
List-Id: linux-gpio@vger.kernel.org

2015-03-06 7:24 GMT+01:00 Yingjoe Chen <yingjoe.chen@mediatek.com>:
> These 2 patches are fixup for MT8173 pinctrl driver:
> http://lists.infradead.org/pipermail/linux-arm-kernel/2015-January/320066.html
>
> Arm64 maintainers doesn't want to add MACH_* in Kconfig, this patch
> is used to replace the first one in that series.
>
> Matthias,
> Can you take this one?
>
> ----------------------------------
> MediaTek SoC expect to work with a pinctrl driver.
> Select PINCTRL if ARCH_MEDIATEK is selected.
>
> Signed-off-by: Yingjoe Chen <yingjoe.chen@mediatek.com>

applied to v4.0-next/arm64

> ---
>  arch/arm64/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index e627ead..a2ddd3f 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -151,6 +151,7 @@ menu "Platform selection"
>  config ARCH_MEDIATEK
>         bool "Mediatek MT65xx & MT81xx ARMv8 SoC"
>         select ARM_GIC
> +       select PINCTRL
>         help
>           Support for Mediatek MT65xx & MT81xx ARMv8 SoCs
>
> --
> 1.8.1.1.dirty
>



-- 
motzblog.wordpress.com
