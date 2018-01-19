From: Kevin Hilman <khilman@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson-axg: adjust uart_ao_b pin group naming
Date: Fri, 19 Jan 2018 11:17:35 -0800
Message-ID: <7hzi59wtdc.fsf@baylibre.com>
References: <20180118141757.41290-1-yixun.lan@amlogic.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36519 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755985AbeASTRj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Jan 2018 14:17:39 -0500
Received: by mail-pf0-f195.google.com with SMTP id 23so2058118pfp.3
        for <linux-gpio@vger.kernel.org>; Fri, 19 Jan 2018 11:17:38 -0800 (PST)
In-Reply-To: <20180118141757.41290-1-yixun.lan@amlogic.com> (Yixun Lan's
        message of "Thu, 18 Jan 2018 22:17:57 +0800")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Yixun Lan <yixun.lan@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Neil Armstrong <narmstrong@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Carlo Caione <carlo@caione.org>, Xingyu Chen <xingyu.chen@amlogic.com>, linux-gpio@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org

Yixun Lan <yixun.lan@amlogic.com> writes:

> Simply adjust the pin group to _x _y _z style, as to
> keep the consistency in DT with previous naming scheme.
>
> Fixes: 83c566806a68 ("pinctrl: meson-axg: Add new pinctrl driver for Meson AXG SoC")
> Signed-off-by: Yixun Lan <yixun.lan@amlogic.com>

Reviewed-by: Kevin Hilman <khilman@baylibre.com>

Thanks for cleaning this up before we have any DT users.

Kevin

> ---
> Hi Linus,
>
>  Please also consider merging this patch into 'for-next', since it
> fixes issue added in the same cycle.
>  This patch will also obsolete previous one patches [1]
>
> [1] pinctrl: meson: use one uniform 'function' name
> http://lkml.kernel.org/r/20180108073328.205769-1-yixun.lan@amlogic.com
> ---
>  drivers/pinctrl/meson/pinctrl-meson-axg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> index 1fda9d6c7ea3..4b91ff74779b 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -716,7 +716,7 @@ static const char * const uart_b_groups[] = {
>  	"uart_tx_b_x", "uart_rx_b_x", "uart_cts_b_x", "uart_rts_b_x",
>  };
>  
> -static const char * const uart_ao_b_gpioz_groups[] = {
> +static const char * const uart_ao_b_z_groups[] = {
>  	"uart_ao_tx_b_z", "uart_ao_rx_b_z",
>  	"uart_ao_cts_b_z", "uart_ao_rts_b_z",
>  };
> @@ -855,7 +855,7 @@ static struct meson_pmx_func meson_axg_periphs_functions[] = {
>  	FUNCTION(nand),
>  	FUNCTION(uart_a),
>  	FUNCTION(uart_b),
> -	FUNCTION(uart_ao_b_gpioz),
> +	FUNCTION(uart_ao_b_z),
>  	FUNCTION(i2c0),
>  	FUNCTION(i2c1),
>  	FUNCTION(i2c2),
