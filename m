From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 1/6] backlight: pwm_bl: Handle gpio that can sleep
Date: Wed, 31 Aug 2016 13:25:14 +0100
Message-ID: <20160831122514.GE9415@dell>
References: <20160831081817.5191-1-maxime.ripard@free-electrons.com>
 <20160831081817.5191-2-maxime.ripard@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f46.google.com ([74.125.82.46]:37946 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759680AbcHaMX3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2016 08:23:29 -0400
Received: by mail-wm0-f46.google.com with SMTP id 1so37538606wmz.1
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2016 05:23:28 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <20160831081817.5191-2-maxime.ripard@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Chen-Yu Tsai <wens@csie.org>, Jingoo Han <jingoohan1@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>, Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, Mylene Josserand <mylene.josserand@free-electrons.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Alexander Kaplan <alex@nextthing.co>

On Wed, 31 Aug 2016, Maxime Ripard wrote:

> Some backlight GPIOs might be connected to some i2c based expanders whose
> access might sleep.
> 
> Since it's not in any critical path, use the cansleep variant of the GPIO
> API.
> 
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> ---
>  drivers/video/backlight/pwm_bl.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index b2b366bb0f97..12614006211e 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -55,7 +55,7 @@ static void pwm_backlight_power_on(struct pwm_bl_data *pb, int brightness)
>  		dev_err(pb->dev, "failed to enable power supply\n");
>  
>  	if (pb->enable_gpio)
> -		gpiod_set_value(pb->enable_gpio, 1);
> +		gpiod_set_value_cansleep(pb->enable_gpio, 1);
>  
>  	pwm_enable(pb->pwm);
>  	pb->enabled = true;
> @@ -70,7 +70,7 @@ static void pwm_backlight_power_off(struct pwm_bl_data *pb)
>  	pwm_disable(pb->pwm);
>  
>  	if (pb->enable_gpio)
> -		gpiod_set_value(pb->enable_gpio, 0);
> +		gpiod_set_value_cansleep(pb->enable_gpio, 0);
>  
>  	regulator_disable(pb->power_supply);
>  	pb->enabled = false;

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
