Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2CF4582E6
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 07:17:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789629426; cv=none; b=e1SASwVuyDqAAU6XVVRHzHb3pFqVtB1ShbaLqXxrIN66iipwO3ac1ztERz2min26IDLIdBw6/iQvybmH34tinModvmbue/9WkjRulI82QmS3F0RLzTL6IdgE0vfu+mDlZNfEX7dWNVVd/gu20ECMtX5BmgGX/9T5K33CF8myk4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789629426; c=relaxed/simple;
	bh=+gsryGw/r20fFSejZZzmEhrcFY3p4MApLE+pXLRWKs4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OrzuY7e1W6dCe0UCami+5sYaEK6bsok7R4HfWCjiA0oWM7KPAbmAeitpqnD0jGA/ePrMLu9qzPNC6Vb96LDi3D4zhyIetb7iPFn3eRmHVEyEGxfH9B48qy2jFhJZBMv18feNokLoZoA8a1GEoZARMnv7HPAmh8iZOrE6BHQFfY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=UawBDCAm; arc=none smtp.client-ip=62.149.158.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="UawBDCAm"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 76JnxtAXKGd7876JnxGCzj; Thu, 17 Sep 2026 09:14:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1789629244; bh=+gsryGw/r20fFSejZZzmEhrcFY3p4MApLE+pXLRWKs4=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=UawBDCAmPc7hwNtL0XqelMUd4zhzYZXkFTSaID2ISH1qq0T4YFjzxizw5OangzLpo
	 hLtd2QPjjcr7Khfw55Riog/2o3ZWaK6dTzEqkQ2vfiD514R+s0Mk/kcR+b1IFIde5W
	 2SGn3L4LjaQsNB9K3GQIXZhWV3rIwka3xWsAaThcZSdYTf6+s4wKLE0b+41wGY/EET
	 Sv/rVtBdYwi6b0L7KU4S7jV9gTqN1HC/RN+tjgHGQ3Y3PZeU7gms6/PoxHs+UCs+d/
	 X3DVC1XWi0o06xWp6tOW4FbSeJYVjbfbuUfdXGZOdG5sJ+XwCyEw95ffyq4H2ecsHE
	 GLtMNoXAaJYtQ==
Message-ID: <1b25ba28-c53e-4425-8165-8205eab60e22@enneenne.com>
Date: Thu, 17 Sep 2026 09:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pps: clients: gpio: release pins to an inactive
 state on remove and shutdown
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260916134744.46354-1-farbere@amazon.com>
 <20260916182641.9768-1-farbere@amazon.com>
 <20260916182641.9768-3-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260916182641.9768-3-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfFTSlHHow1unu5ybyCLAoKq1GdSRHESb6WKOb4SkPGFtuX/Tqs5SbXiw3KNOeHsKl1bsPRTEUTIGoh0B0CnltegUoYhrf+xKWjEMC8VhR+nry+XArQsX
 9X01a3VI1uP8enitE2vllHccWE0tRNYD6BQQpd7Bhj0qKda/r36H0161s1nEN/Kz1Jc75TAoDlG1XUVrM/ULYnQUq0yinnj81lti4Tos8Ep+8a5Su5XXmEjW
 j5Clyn6rN0K1euV8MahmtfvumtpYJiBriHynWkQ+ud6Rmfhd6Tyz5p05Q029GZ56AWmlrEwggpRxNUEPhM4tiPtgdHQamX+UPDqWOTNPAvXHWegyGumQMJLV
 F03CSBQLIs4UTVbbxla5DJHEBGGgnKDOG98c+rGL09yZgVYlezl3M/sXYcWpTvpjJILsapF1rJ2EOD4biINMS6CEZaeJXUCySvuQqNLbizIoy6B8cCPMDAbD
 RM2m73Sr3DZLyBSZvT5WW+S/xih8KFNcE2i5rmBuTL8cbAZI9HX5vCfetqvkgV9JZkykC0tywy/F2FDBRxQhA6jpfDOEGiTGPhUHWg==

On 16/09/2026 20:26, Eliav Farber wrote:
> diff --git a/drivers/pps/clients/pps-gpio.c b/drivers/pps/clients/pps-gpio.c
> index 73ec2c7335e5..e619c7bb2f78 100644
> --- a/drivers/pps/clients/pps-gpio.c
> +++ b/drivers/pps/clients/pps-gpio.c
> @@ -17,6 +17,7 @@
>  #include <linux/slab.h>
>  #include <linux/pps_kernel.h>
>  #include <linux/gpio/consumer.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/list.h>
>  #include <linux/property.h>
>  #include <linux/timer.h>
> @@ -30,6 +31,8 @@ struct pps_gpio_device_data {
>  	struct gpio_desc *gpio_pin;	/* GPIO port descriptors */
>  	struct gpio_desc *echo_pin;
>  	struct timer_list echo_timer;	/* timer to reset echo active state */
> +	struct pinctrl *pinctrl;	/* pin control handle */
> +	struct pinctrl_state *pins_inactive;	/* pins released when unbound */
>  	bool assert_falling_edge;
>  	unsigned int echo_active_ms;	/* PPS echo active duration */
>  	unsigned long echo_timeout;	/* timer timeout value in jiffies */
> @@ -96,6 +99,51 @@ static void pps_gpio_echo_timer_callback(struct timer_list *t)
>  	gpiod_set_value(info->echo_pin, 0);
>  }
>  
> +/*
> + * Look up the optional "inactive" pinctrl state: the mux to restore when
> + * pps-gpio is unbound or the system is shut down. It is only meaningful
> + * paired with a "default" state, which the driver core applies before probe
> + * to mux the pins for PPS use. A board that describes neither is unaffected;
> + * one that describes "inactive" without "default" is rejected, since
> + * releasing pins that were never put into a defined PPS state is incoherent.
> + */
> +static int pps_gpio_get_pins(struct device *dev)
> +{
> +	struct pps_gpio_device_data *data = dev_get_drvdata(dev);
> +	struct pinctrl_state *pins_default;
> +
> +	data->pinctrl = devm_pinctrl_get(dev);
> +	if (IS_ERR(data->pinctrl))
> +		return dev_err_probe(dev, PTR_ERR(data->pinctrl),
> +				     "failed to get pinctrl\n");
> +
> +	/* The "inactive" state is optional; without it there is nothing to do. */
> +	data->pins_inactive = pinctrl_lookup_state(data->pinctrl, "inactive");
> +	if (IS_ERR(data->pins_inactive)) {
> +		data->pins_inactive = NULL;
> +		return 0;
> +	}
> +
> +	/* "inactive" requires a "default" state to release back from. */
> +	pins_default = pinctrl_lookup_state(data->pinctrl, "default");
> +	if (IS_ERR(pins_default))
> +		return dev_err_probe(dev, PTR_ERR(pins_default),
> +				     "\"inactive\" pinctrl state requires a \"default\" state\n");
> +
> +	return 0;
> +}

pinctrl_dt_to_map() returns -ENODEV when the node has no pinctrl-0 and
create_pinctrl() forwards it. So this fails the probe on every pps-gpio
board that describes no pinctrl at all, which is most of them; your
setup has one, so the test does not show it. Shouldn't -ENODEV simply
mean "no pinctrl here, nothing to do"?

> +
> +/*
> + * Release the pins to their "inactive" state, if the board describes one, so
> + * they are handed back to whatever function uses them while pps-gpio is not
> + * driving PPS. Boards without an "inactive" state are unaffected.
> + */
> +static void pps_gpio_release_pins(struct pps_gpio_device_data *data)
> +{
> +	if (data->pins_inactive)
> +		pinctrl_select_state(data->pinctrl, data->pins_inactive);
> +}

The return value is the only sign that the mux was not restored, which
is what the whole series is for. Why drop it?

> +
>  static int pps_gpio_setup(struct device *dev)
>  {
>  	struct pps_gpio_device_data *data = dev_get_drvdata(dev);
> @@ -161,6 +209,11 @@ static int pps_gpio_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	/* pinctrl setup (optional states) */
> +	ret = pps_gpio_get_pins(dev);
> +	if (ret)
> +		return ret;
> +
>  	/* IRQ setup */
>  	ret = gpiod_to_irq(data->gpio_pin);
>  	if (ret < 0) {
> @@ -216,9 +269,30 @@ static void pps_gpio_remove(struct platform_device *pdev)
>  	timer_delete_sync(&data->echo_timer);
>  	/* reset echo pin in any case */
>  	gpiod_set_value(data->echo_pin, 0);
> +	/* release the pins last, once nothing can drive them anymore */
> +	pps_gpio_release_pins(data);
>  	dev_info(&pdev->dev, "removed IRQ %d as PPS source\n", data->irq);
>  }
>  
> +static void pps_gpio_shutdown(struct platform_device *pdev)
> +{
> +	struct pps_gpio_device_data *data = platform_get_drvdata(pdev);
> +
> +	/*
> +	 * Quiesce the hardware before touching the mux: stop the IRQ and the
> +	 * echo timer first so nothing can drive the pins, then hand them back
> +	 * to their "inactive" function. The kernel keeps running after
> +	 * device_shutdown() (for example to load and start a kexec image), so
> +	 * the pins must not be released while an IRQ or timer callback can
> +	 * still reach them. The PPS source is left registered; unregistering
> +	 * it is a remove-time concern and is unnecessary on shutdown.
> +	 */
> +	free_irq(data->irq, data);
> +	timer_delete_sync(&data->echo_timer);
> +	gpiod_set_value(data->echo_pin, 0);
> +	pps_gpio_release_pins(data);
> +}
> +
>  static const struct of_device_id pps_gpio_dt_ids[] = {
>  	{ .compatible = "pps-gpio", },
>  	{ /* sentinel */ }
> @@ -228,6 +302,7 @@ MODULE_DEVICE_TABLE(of, pps_gpio_dt_ids);
>  static struct platform_driver pps_gpio_driver = {
>  	.probe		= pps_gpio_probe,
>  	.remove		= pps_gpio_remove,
> +	.shutdown	= pps_gpio_shutdown,
>  	.driver		= {
>  		.name	= PPS_GPIO_NAME,
>  		.of_match_table	= pps_gpio_dt_ids,

Ciao,

Rodolfo
