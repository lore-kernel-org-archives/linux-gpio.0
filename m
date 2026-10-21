Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792601768;
	b=IhQMl/pmaJfxdHOK1PBOgZW5YYn3IyJyHT3kOKOuIWFHIUSNnjvZ2tRxa/VLsbnwE5h8
	 uG4NgM/UmtYwjt5i6Gf1Hd+GwkzW+6yYR3Jw4BAHvrz17oZnWNJUDpO5Zt9yBRkOiBoAu
	 ASz6+pR39rLvkARlscqvfhjJAWmQ6zb3eY6YR5rXSb05pmcH/VggmcmT61jxpbwXdFyMg
	 MsyThp6cL64xRxnQxeScZFEa6VjepA1Xhhuswq/ybYusKiqMIV46AIYOdzWCAVKiLNaMp
	 3+KZqUoHS0r0qHMYZ7SXi2a/1UKMrPN+r+297Srm6xZ2C9P/ndaCpJVKlAlbnHfA1EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792601768;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BqFxca6gK6ThfbYRhXakalZoTDjV2OaXfqMDjTk93C4=;
	b=vhFgEZgHp/leCrUqr+pFOga1Q5JF2oNY6s9yGVJlq5AOjIEjAGXGp2S38pWKfIUZW+8O
	 54tF/Regs0Q9P5Sd6kQ+ljcYJ6MNcDlHgMEE3sECI/54W8o8S7/GXEww+xvkuXjkQgNNt
	 dkiPLMGy96t36D7XzVwmFL+yAs2xsUG8GgRybW44ZJ992TcvVHeXdzkRW5qwUiejMHe5y
	 1q2jI8NMjhaGu8aYKJc4GvBSC7n5WYY3aOQD5ToMzJjyieqc4G3Mtu+p0wg9/1sqKt3Qv
	 4MdNDpPtKyq+F94SqT5f5EJ3VYSteKG1P2+oJlcVbojkfXvxkCaQjVWAxqpUjZ6Fukg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="b47HAwz/";
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2C760A3803
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 16:56:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F2C760A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=b47HAwz/
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-15354aa70e8so2774401c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 09:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792601767; x=1793206567; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BqFxca6gK6ThfbYRhXakalZoTDjV2OaXfqMDjTk93C4=;
        b=b47HAwz/VVcj8i8Dk6rywlLjp4QPLVE9QU/sIDpiX4l5uicFU6+OyIDhEv6/jeqZc3
         gDnlsX41vd9jS8QBqF5eWd0LEL7ObgKGc+mFe1J17hRYjevyusHa4RG6Bou9yDFMB+7H
         1ZX2qmpzbQuFCAWRa4FS1QfTA4DnlBvO1ZgiAtM3Z5SowmDDqNG29VsiLXZc/XgUQ5O+
         iAp/OmcJB+abmkYlNO2Nkk26Eh1FNrHWcRmxaaCR3H2KFKajAHxrDVISqotylsi7Xs3W
         PysGqH5xjgqIys5FyNfXPc0mTOYqh01SIjH96t/1KQEVQMDj4hztLVadfGy6lOdAAt1j
         XNbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792601767; x=1793206567;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BqFxca6gK6ThfbYRhXakalZoTDjV2OaXfqMDjTk93C4=;
        b=b2KlHuAojob+NKPwrh2w2qM49ZCKSEIlKe1P3FYKdEBgUVGzAq3OS2FwcybSyeBHw6
         vNr3ChauuqSyhMDEfSkvFBsW4tuWbP4RM3QZ47h1Bl/3eI/i1ApZHW7OMhDxpSI7Z9y+
         GHmokMTzJovoLscq9+M++8qvXz6CHum63Eqvg31a68asxuPogqQOpYYonKcnPRu9f27J
         6xTdJDmAEMayLknN0aBhQovQuGSsRcvOkf2U/4pF1rEQRCgj1vOoqKsfAxIGFdAZGmxM
         s1t3tDC91lMLZNy2J7grnhKD7g3o/eCVFKtFCJ/IAJ0OEk8HVpixlyah2aX3dyL9IG7m
         nYwA==
X-Forwarded-Encrypted: i=1; AKwUvBzcY3f3xXJgymOFK62Elnx1LCnVVjm/9URw/gG1rHXgJDusPVQ6F6tA3rtGBp7dO2rSHxDvCNDcjO8O@vger.kernel.org
X-Gm-Message-State: AFq9FYIp2hcfismUvGTrDN2x/eOPJtQ/dAhkh8nHFMOhl2MnGygKB1vd
	7j4VJURqrqcFWaGl8gq2sWltILyGHChb3LV/CrwbX4CA+5SU8q1OVUjZ
X-Gm-Gg: AYBFou19qWkcKh27YBVZUEGkh/B4YeVGEHZ7pSiutewtDAIx8cli01WISOnTlvyAzgg
	pTmFsfv/YSLd7Ij2YmFQuDZS8XAfE8KM70zCcDHtpFluJW88FJIWH6SBUCAhcipKHn0k/zldL1k
	bRp/LXjfpV4UiDLicQts6IyMW7vMfhZ5aN958Yks6z+XsvWB/nn1eTFkjPT2azxvIN6MqHs/7LX
	hCiP0Kj8vabYqxxmqFWFEp9XcTCHsA8ncooCeRAgwOLc89v0S4bFl07kuVFD1SGGx3xDn/4Z7oY
	rh7TTyQNiD9oKH6PsJbASsyHFeEaMimnCfF9QHCmYuFxoFGWnauj3XgbDP0SzDLuwMPS4RpbwEM
	zpelJfXWFkgWhaE2u0yfGdDlZLUUWJWpIKnX+/IZ9oatEFbRqZPCkpKM/Hpxt8ndaZirdnGk6rD
	K64Bf2dTGo4HWibCFsov8cRZ9l8fdrYrTtAIg/3zjd1XS6kRXAXX73P0fI0MNuN6irzH6y8oNbT
	eemLCLn4c84fsVfDDskOuMm46t7vc/mlStJEHW1c1EoUJZMeBFF5rA07f4eXmd8i3e+on/2kJUg
	Eawm0dQudrwfySOc+MLlYA==
X-Received: by 2002:a05:7022:1709:b0:13b:4ab5:41d7 with SMTP id a92af1059eb24-190a051ddf3mr2928490c88.3.1792601767120;
        Wed, 21 Oct 2026 09:56:07 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:92d1:8038:c4e7:1f0c])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903b3d0530sm7935669c88.11.2026.10.21.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 09:56:06 -0700 (PDT)
Date: Wed, 21 Oct 2026 09:56:03 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, linux-input@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Hans de Goede <hansg@kernel.org>
Subject: Re: [PATCH 3/3] Input: soc_button_array - convert to software nodes
Message-ID: <atjuDNi0_SXs4y2d@google.com>
References: <20261021015004.1537738-1-dmitry.torokhov@gmail.com>
 <20261021015004.1537738-3-dmitry.torokhov@gmail.com>
 <CAMRc=MfZg36BULXh3n-ce_x_4B_xOn3Jp4Jgo5BN1LsB2FqaTw@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfZg36BULXh3n-ce_x_4B_xOn3Jp4Jgo5BN1LsB2FqaTw@mail.gmail.com>

On Wed, Oct 21, 2026 at 05:11:32AM -0500, Bartosz Golaszewski wrote:
> On Wed, 21 Oct 2026 03:50:01 +0200, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > Convert the driver from using legacy platform data to using software
> > nodes for registering 'gpio-keys' devices. This allows us to
> > transition away from platform data and use generic device properties.
> >
> > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > ---
> >  drivers/input/misc/Kconfig            |   1 -
> >  drivers/input/misc/soc_button_array.c | 134 ++++++++++++++++++--------
> >  2 files changed, 92 insertions(+), 43 deletions(-)
> >
> > diff --git a/drivers/input/misc/Kconfig b/drivers/input/misc/Kconfig
> > index 169768e3d5bb..a2984c1048f3 100644
> > --- a/drivers/input/misc/Kconfig
> > +++ b/drivers/input/misc/Kconfig
> > @@ -906,7 +906,6 @@ config INPUT_SOC_BUTTON_ARRAY
> >  	depends on KEYBOARD_GPIO && ACPI
> >  	depends on X86
> >  	depends on GPIOLIB
> > -	select GPIOLIB_LEGACY
> >  	help
> >  	  Say Y here if you have a SoC-based tablet that originally runs
> >  	  Windows 8 or a Microsoft Surface Book 2, Pro 5, Laptop 1 or later.
> > diff --git a/drivers/input/misc/soc_button_array.c b/drivers/input/misc/soc_button_array.c
> > index 8d782ef4f78b..aa7838b864c2 100644
> > --- a/drivers/input/misc/soc_button_array.c
> > +++ b/drivers/input/misc/soc_button_array.c
> > @@ -14,9 +14,11 @@
> >  #include <linux/acpi.h>
> >  #include <linux/dmi.h>
> >  #include <linux/gpio/consumer.h>
> > -#include <linux/gpio_keys.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/gpio/machine.h>
> >  #include <linux/platform_data/x86/soc.h>
> >  #include <linux/platform_device.h>
> > +#include <linux/property.h>
> >  #include <linux/slab.h>
> >
> >  static bool use_low_level_irq;
> > @@ -59,10 +61,10 @@ struct soc_button_data {
> >   * gets called with the lid open (e.g. on boot and on resume), it sets the
> >   * irq-type to IRQ_TYPE_LEVEL_LOW. Where as the gpio-keys driver programs the
> >   * type to, and expects it to be, IRQ_TYPE_EDGE_BOTH.
> > - * To work around this we don't set gpio_keys_button.gpio on these 2-in-1s,
> > + * To work around this we don't set "gpios" property on these 2-in-1s,
> >   * instead we get the irq for the GPIO ourselves, configure it as
> >   * IRQ_TYPE_LEVEL_LOW (to match how the _LID AML code configures it) and pass
> > - * the irq in gpio_keys_button.irq. Below is a list of affected devices.
> > + * the irq as a device resource. Below is a list of affected devices.
> >   */
> >  static const struct dmi_system_id dmi_use_low_level_irq[] = {
> >  	{
> > @@ -131,18 +133,31 @@ static const struct dmi_system_id dmi_invalid_acpi_index[] = {
> >  };
> >
> >  /*
> > - * Get the Nth GPIO number from the ACPI object.
> > + * Get the Nth GPIO information from the ACPI object.
> >   */
> >  static int soc_button_lookup_gpio(struct device *dev, int acpi_index,
> > -				  int *gpio_ret, int *irq_ret)
> > +				  bool active_low,
> > +				  struct software_node_ref_args *gpio_ref,
> > +				  int *irq_ret)
> >  {
> > +	struct gpio_device *gdev;
> > +	struct fwnode_handle *fwnode;
> >  	struct gpio_desc *desc;
> >
> >  	desc = gpiod_get_index(dev, NULL, acpi_index, GPIOD_ASIS);
> >  	if (IS_ERR(desc))
> >  		return PTR_ERR(desc);
> 
> This GPIO is requested for a short time and then released. Do we run into
> a risk of the actual target user requesting this pin at the same time and
> failing? We don't support shared GPIO pins for ACPI yet (though I want to
> add that eventually).
> 
> I know this has always been like this but I'm wondering how it works exactly.

The soc_button_array driver controls instantiation of devices that
consume these GPIOs, so there is no concern of them being consumed too
early.

> 
> >
> > -	*gpio_ret = desc_to_gpio(desc);
> > +	gdev = gpiod_to_gpio_device(desc);
> > +	fwnode = dev_fwnode(gpio_device_to_device(gdev));
> > +	if (!fwnode) {
> > +		gpiod_put(desc);
> > +		return -ENODEV;
> > +	}
> > +
> > +	*gpio_ref = SOFTWARE_NODE_REFERENCE(fwnode, gpiod_hwgpio(desc),
> > +					    active_low ? GPIO_ACTIVE_LOW :
> > +							 GPIO_ACTIVE_HIGH);
> 
> Sigh... I hate it and it looks hacky but I also don't have a better idea. :(

Thanks, that is quite common reaction to the code I write ;)

-- 
Dmitry
