Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA4936492D;
	Wed, 11 Mar 2026 14:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773239613; cv=none; b=gjy6Vzsl/k0ah+LJp5Upq40LTQ05J2afPA9DZo7dUiDOJOAYyje9F3ZQfFOQqQ0Zt9V9IWINxj+3zvcPDbaVNNI3blwEf4ZD/5AZVFwC8vim3XRMLpVdS2CwkOmBD7G3jtzTfbx7kJMrYJCTSf0sh5YTzMu/IYhRL2e7sMlSjS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773239613; c=relaxed/simple;
	bh=6nFbmz3LKUx38aNoTlmxcHw4u+pGhY/zgtGRLAC+aUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9qJu9qvqUw+/HI0g/1uE6CG3tqC/TCPsvSudGY2JdfSXKY1hs1s6jpMsN80FGtJErOXkhDizPGvsjMuBD39vyf/jFM7eIBn+a28TPzwBnq3KrJkvY6BAyOp6XbulYC3+aylG1FG/btAM3KQTSAdWU1E5uh7n126EWe3y8FZyI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rDRwiuSD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rDRwiuSD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73873C4CEF7;
	Wed, 11 Mar 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773239612;
	bh=6nFbmz3LKUx38aNoTlmxcHw4u+pGhY/zgtGRLAC+aUc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rDRwiuSDn51kyRQ/buRlSEs6bnmnFCZPadfRGixMsuFycpEco0pd6vnEP+63OLSTH
	 l3WRnMEfEut9zUxiAScSYGLzrFqVALncIOtO5hVcr8jaqbmw3KGz3RkT++anVNBqhy
	 K5/sthPzJOLi8XIgPTJo58ii3+QQwyOF3i8s/FHLLzOvO0J5aKK4g59y5liNWPmWxF
	 PlZrgYWLXYR3M1a4uuLSc459lvzljdPZVV7KfJyhy6Vk7yZUNUjORjh0U1Dj1wZH0t
	 DDFrqWs8m0GcLuso9Ag0r0ysVGuxaUQur5xKDk1vO+46aNrjUVRK8OV1JX48Y6yK4q
	 doQ27vYsHE3jA==
Message-ID: <225a23b9-8289-4015-abf0-695edab9fdf2@kernel.org>
Date: Wed, 11 Mar 2026 15:33:27 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] gpio: tps68470: Add i2c daisy chain support
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, dan.scally@ideasonboard.com,
 ilpo.jarvinen@linux.intel.com, hverkuil+cisco@kernel.org, sre@kernel.org,
 hao.yao@intel.com, jimmy.su@intel.com, miguel.vadillo@intel.com,
 kees@kernel.org, ribalda@chromium.org
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
 <20260311131910.835513-5-antti.laakso@linux.intel.com>
From: Hans de Goede <hansg@kernel.org>
Content-Language: en-US, nl
In-Reply-To: <20260311131910.835513-5-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 11-Mar-26 14:19, Antti Laakso wrote:
> The tps68470 daisy chain make use of gpio 1 and 2. When in use, these
> gpios must be configured as inputs without pull-up.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/gpio/gpio-tps68470.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpio/gpio-tps68470.c b/drivers/gpio/gpio-tps68470.c
> index d4fbdf90e190..8541acecfbbe 100644
> --- a/drivers/gpio/gpio-tps68470.c
> +++ b/drivers/gpio/gpio-tps68470.c
> @@ -120,6 +120,17 @@ static int tps68470_gpio_input(struct gpio_chip *gc, unsigned int offset)
>  				   TPS68470_GPIO_MODE_MASK, 0x00);
>  }
>  
> +static int tps68470_enable_i2c_daisy_chain(struct gpio_chip *gc)
> +{
> +	int ret;
> +
> +	ret = tps68470_gpio_input(gc, 1);
> +	if (ret)
> +		return ret;
> +
> +	return tps68470_gpio_input(gc, 2);
> +}
> +
>  static const char *tps68470_names[TPS68470_N_GPIO] = {
>  	"gpio.0", "gpio.1", "gpio.2", "gpio.3",
>  	"gpio.4", "gpio.5", "gpio.6",
> @@ -129,6 +140,7 @@ static const char *tps68470_names[TPS68470_N_GPIO] = {
>  static int tps68470_gpio_probe(struct platform_device *pdev)
>  {
>  	struct tps68470_gpio_data *tps68470_gpio;
> +	int ret;
>  
>  	tps68470_gpio = devm_kzalloc(&pdev->dev, sizeof(*tps68470_gpio),
>  				     GFP_KERNEL);
> @@ -149,7 +161,14 @@ static int tps68470_gpio_probe(struct platform_device *pdev)
>  	tps68470_gpio->gc.base = -1;
>  	tps68470_gpio->gc.parent = &pdev->dev;
>  
> -	return devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
> +	ret = devm_gpiochip_add_data(&pdev->dev, &tps68470_gpio->gc, tps68470_gpio);
> +	if (ret)
> +		return ret;
> +
> +	if (device_property_present(&pdev->dev, "daisy-chain-enable"))
> +		ret = tps68470_enable_i2c_daisy_chain(&tps68470_gpio->gc);
> +
> +	return ret;
>  }
>  
>  static struct platform_driver tps68470_gpio_driver = {

