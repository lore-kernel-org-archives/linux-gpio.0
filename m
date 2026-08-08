Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED8A3A0E86
	for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2026 18:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214428; cv=none; b=uJ4r+1IeuOF3qwTzILeOg9iXCEORq/8VOyCdoOoB437j36hDnNpRMwiXhVbtsxETIZKQFXmAcOSdfwpCw3AWMGgCYlZBxS9D0UKmhxMIej6+001YSBWbxyWh/H8hvysCjKJbbMAcqBj2Almklj2GzLIRZk+O5FzHnB485iFRUxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214428; c=relaxed/simple;
	bh=IIFe7bFRq+4UKCl3vboqsbuiZv4yCbFW4Bvz2uR8Qqo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZVbpaq9UuWMg8cGVUVx4GFHOK/cnG7HmQul9+OwHI2kD8cQ5BfIjnzSo1gF6gUi+I1hYLJFvKGWI7dtft3YRgUemWLpggLrEeqRB79tjub81MtkqeZ2jf1B26dNdWQqgE76zbwsQPR+lVxJmqbHa7DD1ve/jhWnGQ7K8T1WYiEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=dJG9mc4B; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="dJG9mc4B"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-6aaf2f9ce3dso304125eaf.1
        for <linux-gpio@vger.kernel.org>; Sat, 08 Aug 2026 11:40:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786214425; x=1786819225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wh+ES5WjVdfgnexRKrd9UDx4ZM3APQo1mhLySAOnnf4=;
        b=dJG9mc4BDCIdgVdeDYGqpLAhc1bAYUY4tO+UsXIulo99db2T27EIfxr23l1WFUVO9h
         micmA0raFkhq64Zy+cAMw+BNGw8z5n1CJGdqOKSMYmDYO+Vm5xaUPu2HjOWnVCZ+T+zb
         rbyv09CGANntA+8Xk7YJ5J9nRgiwI/JgANf65zOphSCcn1wggv/pazQRaZ95el85dC70
         ueO1w+QcV9FB8MJKnE8EihA2eJl2SliYCJrfqNCtvJwSW1AfvWadrIMiEBeqZZfv9DNn
         9+e1b4/DwA1b1NqdCU3JlQdNqbQ/XuzIsWugs9zHs4ua45qXadgkC51eq7RfA1L+R52S
         QAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786214425; x=1786819225;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wh+ES5WjVdfgnexRKrd9UDx4ZM3APQo1mhLySAOnnf4=;
        b=FHgcWP++/O2JesqrcZ7wTtRvhp+zjTffvP+FUvNP8wuYbj8mcKIpSCg1QUA/+cj6WZ
         J3hOaPprDGv3zNrylUBFo1GjmGgHWgiZGol8OkrogSHga20oDMenhRKU3h6LWlvZsUCj
         vtqz2isdFUMYv6ucbIEkKKcC3dQGS7cTc1EqqvE4/nMSGSeIO3EnVgj8bDCTGvFLA5zF
         LRJ2JdivgaK3dgOt56TSGwlafrRWg53ikgrQD+bviSABXG0vb5f6njiPjGI8LJDm2wqO
         mslX/vFLlYFX6ulOES8XngI8zNBjs3PJUclcyvmoUWpP15TBxSEoE5NyduKU9LgPDicK
         IWwQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPU2YhOhp4L8QQH5/i+AOUFFqQdiPQjf8fDdFcpOteQ0H5urrOmY/iy2Ih//iovSzNGU73oWNOViaI@vger.kernel.org
X-Gm-Message-State: AOJu0YxY+TiSTXuZBWOaNqRlKrt619X3YY8VoSvPam1mdyFBnQ/LnGeK
	usSRvL8037HGwnevd9fzKmMGS7v6WGABiWz3R+iN+rlnYcN4lq/apRFRgl9GmmDToKw=
X-Gm-Gg: AR+sD13yf8L2WyTS8IDstEshjvHu1GMqqE2FFPOERt+A4GvznDGSSf9wWEYxwvCECoj
	YCsGWwaunn+4C5rgAXdkwxsDOiuSdy6uyqtncZDn9OdOhAOYb8j3uuDul3dF5cV2VnFVXbxuOpL
	rIrD5AlTJxZZzAo+k6IaFa+zVc7C6kmMVjBkOP3ngjao3HZJ0AcnypOjK322meEDrgKcNSOy//Y
	SMZyMvwAhWTq2aRzc0Qn2PmGEp64VdpAXlzLsDZ5WgDAn0b/KiW/kpO/oNKcjZTdFylBKtewreG
	a9q0+qLDsx1hJ6G2iRivll064w0Y3PIbq5Va2hUnRJYtABskloXR2GoIPwPARXeJkST0czgPOIn
	DJqfLjb4uMzlvqCmGcFON9xsMcrJKJNl4efCq94Ps3lrjZDyXDOrlRXGI/Ps+Q8wYYbWX+HjOVo
	6+d3p36u7iE7msbmRfEgN9SUGntxHs/dusAWpyWwYs3HWSr5qIsCYh3NJaLfYNDPhQGVVcvGt7u
	/7TijEYAwvqLrswr2lpoT57X138YWptlKnIqOA=
X-Received: by 2002:a05:6820:16a9:b0:6a6:8f31:5a50 with SMTP id 006d021491bc7-6ae96c3c3dfmr14712000eaf.5.1786214425664;
        Sat, 08 Aug 2026 11:40:25 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:99c2:f16e:201c:3bb5? ([2600:8803:e7e4:500:99c2:f16e:201c:3bb5])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b02be47604sm4955355eaf.10.2026.08.08.11.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:40:24 -0700 (PDT)
Message-ID: <9f0779e5-3139-4c49-96b7-330f70b523a9@baylibre.com>
Date: Sat, 8 Aug 2026 13:40:23 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 8/9] iio: adc: ti-ads1262: support REFOUT and VBIAS
 regulators
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-8-f89925d72792@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260807-ads126x-v3-8-f89925d72792@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/26 10:58 PM, Kurt Borja wrote:
> Register the "refout" and "vbias" regulators to be able to use them as
> common mode supplies.
> 
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  drivers/iio/adc/Kconfig      |  1 +
>  drivers/iio/adc/ti-ads1262.c | 90 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
> 
> diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
> index b9b561be8347..e5206438ac90 100644
> --- a/drivers/iio/adc/Kconfig
> +++ b/drivers/iio/adc/Kconfig
> @@ -1845,6 +1845,7 @@ config TI_ADS1262
>  	tristate "Texas Instruments ADS1262"
>  	depends on SPI
>  	select REGMAP
> +	select REGULATOR
>  	select IIO_BUFFER
>  	select IIO_TRIGGERED_BUFFER
>  	help
> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> index 24a7ecb9fbd4..533574169b04 100644
> --- a/drivers/iio/adc/ti-ads1262.c
> +++ b/drivers/iio/adc/ti-ads1262.c
> @@ -26,6 +26,7 @@
>  #include <linux/property.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
> +#include <linux/regulator/driver.h>
>  #include <linux/spi/spi.h>
>  #include <linux/string.h>
>  #include <linux/types.h>
> @@ -961,6 +962,91 @@ static irqreturn_t ads1262_irq_handler(int irq, void *dev_id)
>  	return IRQ_HANDLED;
>  }
>  
> +static int ads1262_regulator_enable(struct regulator_dev *rdev)
> +{
> +	struct ads1262 *st = rdev_get_drvdata(rdev);
> +
> +	guard(mutex)(&st->xfer_lock);
> +
> +	return regmap_set_bits(st->regmap, ADS1262_POWER_REG,
> +			       ADS1262_POWER_VBIAS_MASK);
> +}
> +
> +static int ads1262_regulator_disable(struct regulator_dev *rdev)
> +{
> +	struct ads1262 *st = rdev_get_drvdata(rdev);
> +
> +	guard(mutex)(&st->xfer_lock);
> +
> +	return regmap_clear_bits(st->regmap, ADS1262_POWER_REG,
> +				 ADS1262_POWER_VBIAS_MASK);
> +}
> +
> +static int ads1262_regulator_is_enabled(struct regulator_dev *rdev)
> +{
> +	struct ads1262 *st = rdev_get_drvdata(rdev);
> +	unsigned int val;
> +	int ret;
> +
> +	guard(mutex)(&st->xfer_lock);
> +
> +	ret = regmap_read(st->regmap, ADS1262_POWER_REG, &val);

Can be a bit simpler with regmap_test_bits().

> +	if (ret)
> +		return ret;
> +
> +	return field_get(ADS1262_POWER_VBIAS_MASK, val);
> +}
> +
> +static const struct regulator_ops ads1262_vbias_regulator_ops = {
> +	.enable = ads1262_regulator_enable,
> +	.disable = ads1262_regulator_disable,
> +	.is_enabled = ads1262_regulator_is_enabled,

This should also have a get_voltage() op that returns
(VAVDD + VAVSS) / 2. Otherwise it won't be usable as a
common mode voltage.

> +};
> +
> +static const struct regulator_ops ads1262_refout_regulator_ops = { };
> +
> +static const struct regulator_desc ads1262_vbias_regulator_desc = {
> +	.name = "vbias",
> +	.of_match = "vbias",
> +	.regulators_node = "regulators",
> +	.supply_name = "avdd",

What does supply_name do? Make "avdd-supply" the parent supply?

> +	.ops = &ads1262_vbias_regulator_ops,
> +	.type = REGULATOR_VOLTAGE,
> +	.owner = THIS_MODULE,
> +};
> +
> +static const struct regulator_desc ads1262_refout_regulator_desc = {
> +	.name = "refout",
> +	.of_match = "refout",
> +	.regulators_node = "regulators",
> +	.supply_name = "avdd",
> +	.n_voltages = 1,
> +	.fixed_uV = 2500000,
> +	.ops = &ads1262_refout_regulator_ops,
> +	.type = REGULATOR_VOLTAGE,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int ads1262_register_regulators(struct ads1262 *st)
> +{
> +	struct device *dev = &st->spi->dev;
> +	struct regulator_config config = {
> +		.dev = dev,
> +		.driver_data = st,
> +	};
> +	struct regulator_dev *rdev;

Should we do...

	if (!device_property_present(dev, "regulators"))
		return 0;

here since regulators is not a required property?

> +
> +	rdev = devm_regulator_register(dev, &ads1262_refout_regulator_desc,
> +				       &config);
> +	if (IS_ERR(rdev))
> +		return PTR_ERR(rdev);
> +
> +	rdev = devm_regulator_register(dev, &ads1262_vbias_regulator_desc,
> +				       &config);
> +
> +	return PTR_ERR_OR_ZERO(rdev);
> +}
> +
>  static int ads1262_dev_configure(struct ads1262 *st)
>  {
>  	struct device *dev = &st->spi->dev;
> @@ -1707,6 +1793,10 @@ static int ads1262_spi_probe(struct spi_device *spi)
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to configure device\n");
>  
> +	ret = ads1262_register_regulators(st);
> +	if (ret)
> +		return ret;
> +
>  	ret = devm_iio_triggered_buffer_setup(dev, indio_dev,
>  					      iio_pollfunc_store_time,
>  					      ads1262_trigger_handler,
> 

