From: Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Tue, 17 Dec 2013 18:24:18 +0400
Message-ID: <CAMo8BfJ1ZWdHzt1TfoT_bqrw30QhL-D-HEt+9TZuaQ2=r6adUA@mail.gmail.com>
References: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f46.google.com ([209.85.219.46]:45994 "EHLO
	mail-oa0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751274Ab3LQOYT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Dec 2013 09:24:19 -0500
Received: by mail-oa0-f46.google.com with SMTP id o6so6595201oag.19
        for <linux-gpio@vger.kernel.org>; Tue, 17 Dec 2013 06:24:18 -0800 (PST)
In-Reply-To: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chris Zankel <chris@zankel.net>, linux-gpio@vger.kernel.org, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>

Hi Baruch,

On Mon, Dec 16, 2013 at 11:05 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Prevent build failure when the selected variant does not support GPIO32.
>
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> ---
> Chris, Max,
>
> I assume that the gpio tree is the natural path for this patch as it carries
> the driver already. Please ack the arch/xtensa part.
> ---
>  arch/xtensa/Kconfig  | 3 +++
>  drivers/gpio/Kconfig | 4 ++++
>  2 files changed, 7 insertions(+)
>
> diff --git a/arch/xtensa/Kconfig b/arch/xtensa/Kconfig
> index 65ffc09..6bd4ee3 100644
> --- a/arch/xtensa/Kconfig
> +++ b/arch/xtensa/Kconfig
> @@ -74,16 +74,19 @@ choice
>  config XTENSA_VARIANT_FSF
>         bool "fsf - default (not generic) configuration"
>         select MMU
> +       select HAVE_XTENSA_GPIO32
>
>  config XTENSA_VARIANT_DC232B
>         bool "dc232b - Diamond 232L Standard Core Rev.B (LE)"
>         select MMU
> +       select HAVE_XTENSA_GPIO32
>         help
>           This variant refers to Tensilica's Diamond 232L Standard core Rev.B (LE).
>
>  config XTENSA_VARIANT_DC233C
>         bool "dc233c - Diamond 233L Standard Core Rev.C (LE)"
>         select MMU
> +       select HAVE_XTENSA_GPIO32
>         help
>           This variant refers to Tensilica's Diamond 233L Standard core Rev.C (LE).
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 43c45ea..766accb 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -290,9 +290,13 @@ config GPIO_XILINX
>         help
>           Say yes here to support the Xilinx FPGA GPIO device
>
> +config HAVE_XTENSA_GPIO32
> +       bool
> +

I'm not sure why this symbol should be defined in the drivers/gpio/Kconfig
and not in the arch/xtensa/Kconfig, after all it's a CPU property.
So if you agree please move it there. With that change

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

>  config GPIO_XTENSA
>         bool "Xtensa GPIO32 support"
>         depends on XTENSA
> +       depends on HAVE_XTENSA_GPIO32
>         depends on !SMP
>         help
>           Say yes here to support the Xtensa internal GPIO32 IMPWIRE (input)
> --
> 1.8.5.1
>

-- 
Thanks.
-- Max
