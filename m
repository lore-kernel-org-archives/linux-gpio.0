Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 188D8336EC5;
	Wed, 11 Mar 2026 19:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773256265; cv=none; b=c5Ju4HdjwjxC+qS3aPkAdq+1NJ7ERSTdylus7DfhePYb3EI7jill7jef9k4VQPJDALsOLkheCR+ETg8g1rr6/aTRdDfqSZD1NtZc1yq0AZd8/NDbL2R1hsL11WkecmrxuHjnB5bf3QMb79JUYbAXtIVbbLh1sUO76HmZN10JhkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773256265; c=relaxed/simple;
	bh=TQwOXVY3okpMDz/qRr33ckVvqzM5sFn3aQxkMqIQM9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hAsQlMT3XjQZHX9jUtHWvxB8Jp8RsZF/8Cs9SLBsVt6Mbt6mxdp2aFpWuKsACs+AXfP2fqjmckgG5qdHhsY2Mks8ox35199JMNs4EK+RYhzhZ/+veLt+svM6qfxTu7otKlKlWNjI+65MtHY2cis1OIT4etLNhEP0qbLEA1+yngg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=s9aLLEWW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="s9aLLEWW"
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 871FF379;
	Wed, 11 Mar 2026 20:09:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773256194;
	bh=TQwOXVY3okpMDz/qRr33ckVvqzM5sFn3aQxkMqIQM9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=s9aLLEWWxLLoSEQdPI0QgiFvZ3fUsyBEoL77StGbkHgAnZHsYBh/KdU/A6fxlECdX
	 /l1kg5RShuci77ga7z3/M/g+yqddf8OrRn1z95H8MLu67In45cocz63av9/a8Ki/4x
	 UreIzFHXiJ6lrPrAb/b7vG9Z6JmZd32nJ92AuLnA=
Message-ID: <a2a3a79c-c3f8-441c-b3fe-ea86ca4de410@ideasonboard.com>
Date: Wed, 11 Mar 2026 19:10:58 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] media: i2c: ov5675: Wait for endpoint
To: Antti Laakso <antti.laakso@linux.intel.com>, linux-media@vger.kernel.org
Cc: linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org,
 linusw@kernel.org, brgl@kernel.org, sakari.ailus@linux.intel.com,
 mchehab@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
 hverkuil+cisco@kernel.org, sre@kernel.org, hao.yao@intel.com,
 jimmy.su@intel.com, miguel.vadillo@intel.com, kees@kernel.org,
 ribalda@chromium.org
References: <20260311131910.835513-1-antti.laakso@linux.intel.com>
 <20260311131910.835513-2-antti.laakso@linux.intel.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
In-Reply-To: <20260311131910.835513-2-antti.laakso@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Antti, thanks for the v2

On 11/03/2026 13:19, Antti Laakso wrote:
> Defer probe if endpoint is not yet available. And do it before acquiring
> clock, gpio and regulators.
> 
> Signed-off-by: Antti Laakso <antti.laakso@linux.intel.com>
> ---

Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>

>   drivers/media/i2c/ov5675.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov5675.c b/drivers/media/i2c/ov5675.c
> index ea26df328189..508149485248 100644
> --- a/drivers/media/i2c/ov5675.c
> +++ b/drivers/media/i2c/ov5675.c
> @@ -1181,17 +1181,26 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   	if (!fwnode)
>   		return -ENXIO;
>   
> +	ep = fwnode_graph_get_endpoint_by_id(fwnode, 0, 0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> +	fwnode_handle_put(ep);
> +	if (ret)
> +		return ret;
> +
>   	ov5675->xvclk = devm_v4l2_sensor_clk_get(dev, NULL);
> -	if (IS_ERR(ov5675->xvclk))
> -		return dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
> -				     "failed to get xvclk: %pe\n",
> -				     ov5675->xvclk);
> +	if (IS_ERR(ov5675->xvclk)) {
> +		ret = dev_err_probe(dev, PTR_ERR(ov5675->xvclk),
> +				    "failed to get xvclk\n");
> +		goto check_hwcfg_error;
> +	}
>   
>   	xvclk_rate = clk_get_rate(ov5675->xvclk);
>   	if (xvclk_rate != OV5675_XVCLK_19_2) {
>   		dev_err(dev, "external clock rate %u is unsupported",
>   			xvclk_rate);
> -		return -EINVAL;
> +		ret = -EINVAL;
> +		goto check_hwcfg_error;
>   	}
>   
>   	ov5675->reset_gpio = devm_gpiod_get_optional(dev, "reset",
> @@ -1199,7 +1208,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   	if (IS_ERR(ov5675->reset_gpio)) {
>   		ret = PTR_ERR(ov5675->reset_gpio);
>   		dev_err(dev, "failed to get reset-gpios: %d\n", ret);
> -		return ret;
> +		goto check_hwcfg_error;
>   	}
>   
>   	for (i = 0; i < OV5675_NUM_SUPPLIES; i++)
> @@ -1208,16 +1217,7 @@ static int ov5675_get_hwcfg(struct ov5675 *ov5675)
>   	ret = devm_regulator_bulk_get(dev, OV5675_NUM_SUPPLIES,
>   				      ov5675->supplies);
>   	if (ret)
> -		return ret;
> -
> -	ep = fwnode_graph_get_next_endpoint(fwnode, NULL);
> -	if (!ep)
> -		return -ENXIO;
> -
> -	ret = v4l2_fwnode_endpoint_alloc_parse(ep, &bus_cfg);
> -	fwnode_handle_put(ep);
> -	if (ret)
> -		return ret;
> +		goto check_hwcfg_error;
>   
>   	if (bus_cfg.bus.mipi_csi2.num_data_lanes != OV5675_DATA_LANES) {
>   		dev_err(dev, "number of CSI2 data lanes %d is not supported",

