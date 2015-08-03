From: Josh Wu <josh.wu@atmel.com>
Subject: Re: [RFC PATCH 2/3] ARM: at91/dt: add sama5d2 pinmux
Date: Mon, 3 Aug 2015 14:40:18 +0800
Message-ID: <55BF0CD2.5030204@atmel.com>
References: <1438355290-28255-1-git-send-email-ludovic.desroches@atmel.com> <1438355290-28255-3-git-send-email-ludovic.desroches@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from eusmtp01.atmel.com ([212.144.249.243]:43749 "EHLO
	eusmtp01.atmel.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752341AbbHCGkY (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Aug 2015 02:40:24 -0400
In-Reply-To: <1438355290-28255-3-git-send-email-ludovic.desroches@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ludovic Desroches <ludovic.desroches@atmel.com>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: s.hauer@pengutronix.de, nicolas.ferre@atmel.com, linus.walleij@linaro.org

Hi, Ludovic

On 7/31/2015 11:08 PM, Ludovic Desroches wrote:
> Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
> ---
>   arch/arm/boot/dts/sama5d2-pinfunc.h | 760 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 760 insertions(+)
>   create mode 100644 arch/arm/boot/dts/sama5d2-pinfunc.h
>
> diff --git a/arch/arm/boot/dts/sama5d2-pinfunc.h b/arch/arm/boot/dts/sama5d2-pinfunc.h
> new file mode 100644
> index 0000000..046d1d5
> --- /dev/null
> +++ b/arch/arm/boot/dts/sama5d2-pinfunc.h
>

[snip...]

> +#define PIN_PB24__FLEXCOM3_IO3		PINMUX_PIN(PIN_PB24, 5, 3)
> +#define PIN_PB24__ISI_D10		PINMUX_PIN(PIN_PB24, 6, 3)

As sama5d2 use ISC, so It's better to run  s/ISI_/ISC_/ in this file, 
which is consistent with the datasheet.

Best Regards,
Josh Wu

