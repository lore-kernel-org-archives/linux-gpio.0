From: Moritz Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH] gpio: xilinx: Drop architecture dependencies
Date: Mon, 19 Oct 2015 10:52:02 -0700
Message-ID: <CAAtXAHc1XsNU9SQBW0sUj6LmETQpKaLTJoUxLwmLts9NLp=x3w@mail.gmail.com>
References: <1445276534-6948-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:36318 "EHLO
	mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751194AbbJSRwE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Oct 2015 13:52:04 -0400
Received: by lffz202 with SMTP id z202so33642120lff.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2015 10:52:02 -0700 (PDT)
In-Reply-To: <1445276534-6948-1-git-send-email-soren.brinkmann@xilinx.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Soren Brinkmann <soren.brinkmann@xilinx.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>, Lars-Peter Clausen <lars@metafoo.de>

Acked-by: Moritz Fischer <moritz.fischer@ettus.com>

On Mon, Oct 19, 2015 at 10:42 AM, Soren Brinkmann
<soren.brinkmann@xilinx.com> wrote:
> The driver does not have any real architecture dependencies. To avoid
> listing each architecture that might use this driver on some
> FPGA-enabled platform, drop these dependencies.
>
> Signed-off-by: Soren Brinkmann <soren.brinkmann@xilinx.com>
> ---
>  drivers/gpio/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 63000b1f9da8..45dfeef6018f 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -506,7 +506,7 @@ config GPIO_XGENE_SB
>
>  config GPIO_XILINX
>         tristate "Xilinx GPIO support"
> -       depends on OF_GPIO && (PPC || MICROBLAZE || ARCH_ZYNQ || X86)
> +       depends on OF_GPIO
>         help
>           Say yes here to support the Xilinx FPGA GPIO device
>
> --
> 2.6.2.3.ga463a5b
>
