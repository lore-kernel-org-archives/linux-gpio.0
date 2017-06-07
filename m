From: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH] pinctrl: meson-gxbb: remove non-existing pin GPIOX_22
Date: Wed, 7 Jun 2017 13:27:19 +0200
Message-ID: <daec14ca-a004-7ebe-5a68-5dc8564819cd@baylibre.com>
References: <77ac1caf-f2b1-efe8-70ea-5a358908cc87@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:34847 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751257AbdFGL1Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Jun 2017 07:27:24 -0400
Received: by mail-wr0-f177.google.com with SMTP id q97so4781620wrb.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Jun 2017 04:27:23 -0700 (PDT)
In-Reply-To: <77ac1caf-f2b1-efe8-70ea-5a358908cc87@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heiner Kallweit <hkallweit1@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 06/07/2017 07:44 AM, Heiner Kallweit wrote:
> After commit 34e61801a3b9 "pinctrl: meson-gxbb: Add missing GPIODV_18
> pin entry" I started to get the following warning:
> 
> "meson-pinctrl c8834000.periphs:pinctrl@4b0: names 119 do not match
> number of GPIOs 120"
> 
> It turned out that not the mentioned commit has a problem, it just
> revealed another problem which had existed before.
> 
> There is no PIN GPIOX_22 on Meson GXBB.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/pinctrl/meson/pinctrl-meson-gxbb.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> index 8b716b93..a879cf07 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -138,7 +138,6 @@ static const struct pinctrl_pin_desc meson_gxbb_periphs_pins[] = {
>  	MESON_PIN(GPIOX_19, EE_OFF),
>  	MESON_PIN(GPIOX_20, EE_OFF),
>  	MESON_PIN(GPIOX_21, EE_OFF),
> -	MESON_PIN(GPIOX_22, EE_OFF),
>  
>  	MESON_PIN(GPIOCLK_0, EE_OFF),
>  	MESON_PIN(GPIOCLK_1, EE_OFF),
> 

Fixes: 468c234f9ed7 ("pinctrl: amlogic: Add support for Amlogic Meson GXBB SoC")
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Thanks for the patch !

Neil
