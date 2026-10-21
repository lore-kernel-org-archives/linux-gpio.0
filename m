Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577497;
	b=vMsWORq69MxbizVond/6lGQbtgCI1Ta8iui//pI/R1BpyT3gLbGuMhluhm0510k0NiwO
	 sYya3JyiMcrEeyVY0mq70BRvIKdvAofYdzT2QJhzUD2mVRarGNABK4DtltwHFhOkXFBWi
	 02D6ZsO3k/Y97k4FWucxLKnI5zrKp6QTE6zQL1JF3g78JYtqTqdFAvw1OMXky2+aX8nHD
	 e1ZfLkmKiHQBLD7TmzmQUQ1H6rlS9VQeM7LcM5D5e6puXX+hUHCMxrhwj9HtJ0gXbmJiy
	 360+WqnSVh7pqVHVqubutLH7sPBQnnsJLFmCl49MGoA2p8xsGs99D0bhfOIEMDR20Yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577497;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=6ycIBvnT3f/4FFIcqiKcIqKHebJmGEJQ2XddJgSR1ME=;
	b=2n1DZYDApTaKILMiCojHa1RUCP1NeGHtE3i9kc9PBcBerwVEcz03Ggb/8nB73EjM+OF+
	 y8L/PNhXzfRKXh2JK3UzbqUJ5IoCt575umJHsh9mHGUzp5QfoMwIU82PQRBx0vFFUb9lF
	 AY8LSOoEH4XirMGf+GX6hHJGZZgVuVa7GFqVccZCimBtkg2v9OLisKoq8Yeil3NJTbl42
	 IieqavOpGh0eUewW9i3Ncw9aOiVzXELE8NT4coxT4/j0LsewIGujUwnRXE8jYlmqz66xE
	 FddOQxXlkCwKYbJwxvH7SXqzghl/aJTXfzOrup8zCrCXC/j5mtFe9wtGnWmVIFcaj1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DB2hvRAL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5B9606A31B
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DB2hvRAL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C34B1F000CD
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 10:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792577496;
	bh=6ycIBvnT3f/4FFIcqiKcIqKHebJmGEJQ2XddJgSR1ME=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=DB2hvRALuk4T8YpbQWs/aGAfMRjvFbKFfeit/3w9jcV4jj9yfZMGZUKQZ+H0u/v1N
	 C+JkwZujc81zQl9JDF17A+Ur+eUUF641dL8EBaCnsiTxtB2XPxKxgtzZLlEjNuXmCi
	 7wT64gGygmmAa/+OJtGvNFEVF7ZHSNLW5XIHlr2HqIyp5xRzH20G2eP87pwejflctv
	 J51jKPWxaXpICDNWAoe9I8uvW4JRuNNK9QPyZVhdlI4QgXQeXucHkBC15E87OKpVGA
	 MUjRUCwrMQuLmsQt8GsyV545br0GqhluCjgSciclFTDHFvTpMLcRaPRvCyVX+FEMKY
	 FDrcKBkYcsDvw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so4695301fa.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 03:11:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByJpBhKnNO2bb6py+1HyfefbCMiHaBnu41ucXldgSspSwEzUD9XvWfk/OAvXv8yyI0stYDDNmeWQkKT@vger.kernel.org
X-Gm-Message-State: AFq9FYJUwLbpV48nbQArWfaFn3RFpi6M0x8bju7btMsC48lt3ByOnWp7
	fnNPCw345N0HQz53a2SPMqJz3TFyfship40zQM0bv+XQ76t1hHq6/IXhkTsbfid/MYV4M2fnRuh
	xqCS6djuin4Cb1clpN01WjAH1VnmIGwlgposobLA80Q==
X-Received: by 2002:a2e:9fc2:0:b0:3ab:1d89:4981 with SMTP id
 38308e7fff4ca-3ac4420fd63mr4950901fa.22.1792577494779; Wed, 21 Oct 2026
 03:11:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:11:32 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 21 Oct 2026 05:11:32 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261021015004.1537738-3-dmitry.torokhov@gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com> <20261021015004.1537738-3-dmitry.torokhov@gmail.com>
Date: Wed, 21 Oct 2026 05:11:32 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfZg36BULXh3n-ce_x_4B_xOn3Jp4Jgo5BN1LsB2FqaTw@mail.gmail.com>
X-Gm-Features: AclHuK93RmiVJez1F5ZBGW1MRL9mn0HKYPC0Sp-pzI0ulqkbzauEM-_z5V5eYqA
Message-ID: <CAMRc=MfZg36BULXh3n-ce_x_4B_xOn3Jp4Jgo5BN1LsB2FqaTw@mail.gmail.com>
Subject: Re: [PATCH 3/3] Input: soc_button_array - convert to software nodes
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 03:50:01 +0200, Dmitry Torokhov
<dmitry.torokhov@gmail.com> said:
> Convert the driver from using legacy platform data to using software
> nodes for registering 'gpio-keys' devices. This allows us to
> transition away from platform data and use generic device properties.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/misc/Kconfig            |   1 -
>  drivers/input/misc/soc_button_array.c | 134 ++++++++++++++++++--------
>  2 files changed, 92 insertions(+), 43 deletions(-)
>
> diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> index 169768e3d5bb..a2984c1048f3 100644
> --- a/drivers/input/misc/Kconfig
> +++ b/drivers/input/misc/Kconfig
> @@ -906,7 +906,6 @@ config INPUT_SOC_BUTTON_ARRAY
>  	depends on KEYBOARD_GPIO && ACPI
>  	depends on X86
>  	depends on GPIOLIB
> -	select GPIOLIB_LEGACY
>  	help
>  	  Say Y here if you have a SoC-based tablet that originally runs
>  	  Windows 8 or a Microsoft Surface Book 2, Pro 5, Laptop 1 or later.
> diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
> index 8d782ef4f78b..aa7838b864c2 100644
> --- a/drivers/input/misc/soc_button_array.c
> +++ b/drivers/input/misc/soc_button_array.c
> @@ -14,9 +14,11 @@
>  #include <linux/acpi.h>
>  #include <linux/dmi.h>
>  #include <linux/gpio/consumer.h>
> -#include <linux/gpio_keys.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
>  #include <linux/platform_data/x86/soc.h>
>  #include <linux/platform_device.h>
> +#include <linux/property.h>
>  #include <linux/slab.h>
>
>  static bool use_low_level_irq;
> @@ -59,10 +61,10 @@ struct soc_button_data {
>   * gets called with the lid open (e.g. on boot and on resume), it sets the
>   * irq-type to IRQ_TYPE_LEVEL_LOW. Where as the gpio-keys driver programs the
>   * type to, and expects it to be, IRQ_TYPE_EDGE_BOTH.
> - * To work around this we don't set gpio_keys_button.gpio on these 2-in-1s,
> + * To work around this we don't set "gpios" property on these 2-in-1s,
>   * instead we get the irq for the GPIO ourselves, configure it as
>   * IRQ_TYPE_LEVEL_LOW (to match how the _LID AML code configures it) and pass
> - * the irq in gpio_keys_button.irq. Below is a list of affected devices.
> + * the irq as a device resource. Below is a list of affected devices.
>   */
>  static const struct dmi_system_id dmi_use_low_level_irq[] = {
>  	{
> @@ -131,18 +133,31 @@ static const struct dmi_system_id dmi_invalid_acpi_index[] = {
>  };
>
>  /*
> - * Get the Nth GPIO number from the ACPI object.
> + * Get the Nth GPIO information from the ACPI object.
>   */
>  static int soc_button_lookup_gpio(struct device *dev, int acpi_index,
> -				  int *gpio_ret, int *irq_ret)
> +				  bool active_low,
> +				  struct software_node_ref_args *gpio_ref,
> +				  int *irq_ret)
>  {
> +	struct gpio_device *gdev;
> +	struct fwnode_handle *fwnode;
>  	struct gpio_desc *desc;
>
>  	desc = gpiod_get_index(dev, NULL, acpi_index, GPIOD_ASIS);
>  	if (IS_ERR(desc))
>  		return PTR_ERR(desc);

This GPIO is requested for a short time and then released. Do we run into
a risk of the actual target user requesting this pin at the same time and
failing? We don't support shared GPIO pins for ACPI yet (though I want to
add that eventually).

I know this has always been like this but I'm wondering how it works exactly.

>
> -	*gpio_ret = desc_to_gpio(desc);
> +	gdev = gpiod_to_gpio_device(desc);
> +	fwnode = dev_fwnode(gpio_device_to_device(gdev));
> +	if (!fwnode) {
> +		gpiod_put(desc);
> +		return -ENODEV;
> +	}
> +
> +	*gpio_ref = SOFTWARE_NODE_REFERENCE(fwnode, gpiod_hwgpio(desc),
> +					    active_low ? GPIO_ACTIVE_LOW :
> +							 GPIO_ACTIVE_HIGH);

Sigh... I hate it and it looks hacky but I also don't have a better idea. :(

Bart
