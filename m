From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 2/7] pinctrl: UniPhier: add UniPhier PH1-LD4 pinctrl driver
Date: Thu, 16 Jul 2015 09:22:48 +0200
Message-ID: <CACRpkdYb+f1OnH5Tdy62gw=0g_3+S0Un0NTTGj1Jodv+wE5jKA@mail.gmail.com>
References: <1436841607-7556-1-git-send-email-yamada.masahiro@socionext.com>
	<1436841607-7556-3-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:35494 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752161AbbGPHWt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jul 2015 03:22:49 -0400
Received: by oihq81 with SMTP id q81so44873858oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2015 00:22:48 -0700 (PDT)
In-Reply-To: <1436841607-7556-3-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, Jul 14, 2015 at 4:40 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:

> Add pin configuration and pinmux support for UniPhier PH1-LD4 SoC.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Changes in v2:
>   - sort groups and funcs alphabetically
>   - add missing "emmc_dat8" group
>   - add i2c pin-mux settings
>   - sort members of platform_driver
>   - change to tristate
>   - add THIS_MODULE to pinctrl_desc
>   - use module_platform_driver

Patch applied.

> +static const struct of_device_id ph1_ld4_pinctrl_match[] = {
> +       { .compatible = "socionext,ph1-ld4-pinctrl" },
> +       { /* sentinel */ }
> +};

I didn't see any device tree bindings in this patch series.

That is OK, send them separate, I see only compatible strings
and standard bindings.

Yours,
Linus Walleij
