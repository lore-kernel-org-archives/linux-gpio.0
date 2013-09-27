From: Haojian Zhuang <haojian.zhuang@gmail.com>
Subject: Re: [PATCH 1/2] ARM: mmp: delete the custom GPIO header
Date: Fri, 27 Sep 2013 13:37:32 +0800
Message-ID: <CAN1soZzNNPckXZVEE_iz8XYUOtmuLd39zebgGN2GTv+iZZWFBw@mail.gmail.com>
References: <1380183060-27366-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ea0-f171.google.com ([209.85.215.171]:45425 "EHLO
	mail-ea0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751187Ab3I0Fhe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Sep 2013 01:37:34 -0400
Received: by mail-ea0-f171.google.com with SMTP id n15so970906ead.16
        for <linux-gpio@vger.kernel.org>; Thu, 26 Sep 2013 22:37:32 -0700 (PDT)
In-Reply-To: <1380183060-27366-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Haojian Zhuang <haojian.zhuang@marvell.com>, Eric Miao <eric.y.miao@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org

On Thu, Sep 26, 2013 at 4:11 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> The MMP sub-architecture appears to have a custom <mach/gpio.h>
> for no reason whatsoever. The file became completely empty
> after Haojian removed the remaining content in
> commit 157d2644cb0c1e71a18baaffca56d2b1d0ebf10f
> "ARM: pxa: change gpio to platform device".
>
> Cc: Haojian Zhuang <haojian.zhuang@marvell.com>
> Cc: Eric Miao <eric.y.miao@gmail.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Haojian, I'm seeking an ACK for this patch so I can take it
> through the GPIO tree.
> ---
>  arch/arm/Kconfig                      | 1 -
>  arch/arm/mach-mmp/include/mach/gpio.h | 8 --------
>  2 files changed, 9 deletions(-)
>  delete mode 100644 arch/arm/mach-mmp/include/mach/gpio.h
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 3f7714d..3950a12 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -559,7 +559,6 @@ config ARCH_MMP
>         select GPIO_PXA
>         select IRQ_DOMAIN
>         select MULTI_IRQ_HANDLER
> -       select NEED_MACH_GPIO_H
>         select PINCTRL
>         select PLAT_PXA
>         select SPARSE_IRQ
> diff --git a/arch/arm/mach-mmp/include/mach/gpio.h b/arch/arm/mach-mmp/include/mach/gpio.h
> deleted file mode 100644
> index 13219eb..0000000
> --- a/arch/arm/mach-mmp/include/mach/gpio.h
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -#ifndef __ASM_MACH_GPIO_H
> -#define __ASM_MACH_GPIO_H
> -
> -#include <asm-generic/gpio.h>
> -
> -#include <mach/cputype.h>
> -
> -#endif /* __ASM_MACH_GPIO_H */
> --
> 1.8.3.1
>

Acked on all patches.

Regards
Haojian
