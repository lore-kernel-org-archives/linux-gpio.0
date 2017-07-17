From: Hans Ulli Kroll <ulli.kroll@googlemail.com>
Subject: Re: [PATCH 3/5] MAINTAINERS: Update the Gemini maintainer list
Date: Mon, 17 Jul 2017 17:14:22 +0200 (CEST)
Message-ID: <alpine.LNX.2.00.1707171710460.3934@T420s>
References: <20170715175056.13040-1-linus.walleij@linaro.org> <20170715175056.13040-3-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:33342 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751278AbdGQPPz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jul 2017 11:15:55 -0400
Received: by mail-wr0-f195.google.com with SMTP id 40so2930946wrw.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jul 2017 08:15:55 -0700 (PDT)
In-Reply-To: <20170715175056.13040-3-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Hans Ulli Kroll <ulli.kroll@googlemail.com>, Florian Fainelli <f.fainelli@gmail.com>, Janos Laube <janos.dev@gmail.com>, Paulius Zaleckas <paulius.zaleckas@gmail.com>, linux-arm-kernel@lists.infradead.org

Hi Linus

On Sat, 15 Jul 2017, Linus Walleij wrote:

> This patch:
> - Adds myself as comaintainer for the Gemini.
> - Adds the Gemini main bindings to the file list.
> - Adds the pin controller plus bindings to the Gemini
>   file list.
> - Fixes up the path of the RTC binding and driver.
> 
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> Hans: please ACK this if you're OK with it and I'll merge this
> fixup along with the new pin control driver into my pin control
> tree.
> ---
>  MAINTAINERS | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7ad8107b47db..27c56bbba3a7 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1239,11 +1239,16 @@ S:	Maintained
>  
>  ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
>  M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
> +M:	Linus Walleij <linus.walleij@linaro.org>
>  L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  T:	git git://github.com/ulli-kroll/linux.git
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/arm/gemini.txt
> +F:	Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
> +F:	Documentation/devicetree/bindings/rtc/faraday,ftrtc010.txt
>  F:	arch/arm/mach-gemini/
> -F:	drivers/rtc/rtc-gemini.c
> +F:	drivers/pinctrl/pinctrl-gemini.c
> +F:	drivers/rtc/rtc-ftrtc010.c
>  
>  ARM/CSR SIRFPRIMA2 MACHINE SUPPORT
>  M:	Barry Song <baohua@kernel.org>
> -- 
> 2.9.4
> 
> 

Acked-by: Hans Ulli Kroll <ulli.kroll@googlemail.com>



