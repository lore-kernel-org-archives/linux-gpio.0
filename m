From: Nicolas Ferre <nicolas.ferre@atmel.com>
Subject: Re: [PATCH 2/4] ALSA: atmel: remove dependency on <mach/gpio.h>
Date: Tue, 5 Nov 2013 10:48:08 +0100
Message-ID: <5278BED8.8030005@atmel.com>
References: <1383643789-14269-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.242]:43036 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751097Ab3KEJsQ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Nov 2013 04:48:16 -0500
In-Reply-To: <1383643789-14269-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, Andrew Victor <linux@maxim.org.za>, Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, linux-arm-kernel@lists.infradead.org, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>

On 05/11/2013 10:29, Linus Walleij :
> This include is completely unused since the AT91 sound driver
> actually uses gpiolib properly.

Absolutely:

Acked-by: Nicolas Ferre <nicolas.ferre@atmel.com>

Thanks Linus.

> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ALSA SoC folks: please apply this as a fix if you wish, else
> I'd like an ACK so I can merge it in front of the dependent
> patches in the next (v3.14) merge cycle.
> ---
>   sound/atmel/ac97c.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
> index ae63d22c0f88..c5f0ddd729b3 100644
> --- a/sound/atmel/ac97c.c
> +++ b/sound/atmel/ac97c.c
> @@ -34,7 +34,6 @@
>   #include <linux/dw_dmac.h>
>
>   #include <mach/cpu.h>
> -#include <mach/gpio.h>
>
>   #ifdef CONFIG_ARCH_AT91
>   #include <mach/hardware.h>
>


-- 
Nicolas Ferre
