Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529036;
	b=oKheHemO/uA6zz9ArdH2h5uBS8GGzn6+7sFkYC88VWzt49VePMlEUrAlMFcG+fgxkmHI
	 +H5D/iaqWhOEJgwUz3AH2YA7fcBvc92ZUPjFFLNL2UJBVgQ9wVSQ6t9tOu1MQwB4fgPz1
	 tC08RmVwDbi7w8S1/ijcD8RmyKUAyglJND616Bq9XYdcd3HJCj2yyavgXzK33emQFZuaO
	 vQ7liJOkjEs/rlHKuE6ACGuJQybn7sP5yYidzIwX4660O4vwd5soof8dIW9LZDwV/1Bk5
	 5HqdoDPGfJW2bL/ZMlfiHLYEICSsufUVUJ5QlcNmvI5KWxwMgTgznqO4Nc+KgKK+Nbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529036;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bkLudn8EEzSHMhO0F01BZTmQZgjW7v0oOiCRElBg6Iw=;
	b=Ki/34guw79BAWRWz/LAUHhFtMQV9gnbCHlwDpN9w2Z/+R8AKQSl2yk/TxMTUR+84k0Re
	 QD1NUyT+ShSkepUK/QnzalIdKHf9mO72hLAUQvzO3lUlfpqHehEjm8DKcfKRgnOTSoSUC
	 RcYwcoKPa+thrlEKMsQ0pmvLUSWFYKwL5bYngTe3l4tpqvIpEeRr6CcFLr0KHQbPzig0a
	 6xM4tvTgJ/B2crzLOxKYuGaKguWXcfS/scUAm6cnTIYT3ql7FvCrnaNm6EEDxOftVXVIu
	 84g0nk+1yDc9TuQTj5brDIeVLmzTZRQm7xYrctfp5fZOMqz/hoI+Bi6KXSf7L5GEIuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpJqzqJY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 80F2060A260B;
	Tue, 24 Nov 2026 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZpJqzqJY
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 69FEC1F01574;
	Tue, 24 Nov 2026 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795529036;
	bh=bkLudn8EEzSHMhO0F01BZTmQZgjW7v0oOiCRElBg6Iw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZpJqzqJYrizluRKYd/hddZP+5v/ndgracb5FJtSgJVzFcMp7KVd1N7/Jvq1ufUpbw
	 ld8DegojXpRpEfg5TxlfKdzptlcbJJIVlsEHa6L9Bo3vSQ2qdIZlJHJT73okpJPGXH
	 fMcKu3dV2PqrD4oIsi3D95o8zNwIw3AdCiOLhHY8/9gIF6HSnKsiINS5WLJJmlliXk
	 AEcKHitTy6aQt+/i4b/QIuFDHokbZX7CwSTsnOgK2+2+nhb4PnX0XuqceKPJwrq9x5
	 oe6XKzFWT3zOVORWK2mh+bTyvhOtOn9HdpmYycL3eKDZoiKqqMqhkj2t9A9TgoF6wh
	 U5FaIjtkePoRw==
Date: Tue, 24 Nov 2026 15:03:52 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: CL Wang <cl634@andestech.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, tim609@andestech.com
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
Message-ID: <ejqigbfjg4kkm7nsp2xuji2u33ccbfxl6na2e6y2n645cub72a@ibivk5sb2dt7>
References: <20261116040914.368298-3-cl634@andestech.com>
 <22ifazqg6afr6rcybqg6foah3v554xu4px2c4et35y5xzpg74h@kesthgcvnlgk>
 <20261124094127.1988037-1-cl634@andestech.com>
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
In-Reply-To: <20261124094127.1988037-1-cl634@andestech.com>

On Tue, Nov 24, 2026 at 05:41:27PM +0800, CL Wang wrote:
> Hi Bartosz,
> 
> Thanks for the review.
> 
> On Tue, Nov 17, 2026 at 02:54:06PM +0100, Bartosz Golaszewski wrote:
> > > +#include <linux/mod_devicetable.h>
> >
> > Uwe would probably say you should only pull in the individual headers
> > that you require from include/linux/device-id/.
> 
> As Uwe pointed out, <linux/platform_device.h> already provides
> of_device_id, so I will drop <linux/mod_devicetable.h> in v2.
> 
> > > +	config = (struct gpio_generic_chip_config) {
> > > +		.dev = &priv->pdev->dev,
> > > +		.sz = 4,
> > > +		.dat = priv->base + REG_DATA_IN,
> > > +		.set = priv->base + REG_DATA_OUT,
> > > +		.dirout = priv->base + REG_CHAN_DIR,
> > > +		.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET,
> > > +	};
> >
> > I think you could save even more code by using the gpio-regmap helper
> > here instead. Could you see if that's possible here?
> 
> I tried it. The conversion is doable, but the driver grows from 641 to
> 721 lines. The extra code comes from:

Why do I feel like this paragraph is LLM-made? No human ever provides
the number of lines a driver *potentially* grows in a response...

> 
>  - IRQ handling: gpio-regmap only accepts an external irq_domain, so the
>    driver has to create the domain and duplicate what GPIOLIB_IRQCHIP
>    provides today (map/xlate ops, lockdep classes, resource
>    request/release callbacks, and removing the chained handler and
>    disposing of the mappings on unbind). This accounts for most of the
>    growth. Using regmap-irq instead would turn the chained hardirq
>    handler into a threaded one, and the 3-bit trigger mode fields (one
>    per line, spread across four registers) would still need a custom
>    set_type_config() callback.
> 
>  - Output readback: the datasheet documents DATA_IN for input lines
>    only, so output lines are read back from DATA_OUT. With gpio-mmio
>    this is handled by GPIO_GENERIC_READ_OUTPUT_REG_SET; with gpio-regmap
>    it requires a reg_mask_xlate() callback that reads the direction
>    register on every get.
> 
>  - Shared debounce cleanup: the debounce period is shared by all lines,
>    and the driver clears a line's debounce enable bit in .free() so that
>    a released line does not block a different period on another line.
>    gpio-regmap does not let the driver provide .free(), so the enable
>    bit stays set after release and the conflict check has to skip lines
>    that are no longer requested.
> 
> Given that, I would prefer to keep gpio-mmio for v2. If you still
> prefer gpio-regmap, I can send that version instead.
> 
Ok, let's keep it gpio-mmio.

> > > +	if (priv->chan_num > ATCGPIO_CHAN_NUM_MAX || !priv->chan_num) {
> > > +		dev_warn(&priv->pdev->dev,
> >
> > Use a local variable to store the adress of dev for better readability.
> 
> Will do in v2, both here in atcgpio_init_controller() and in
> atcgpio_init_resources().
> 
> > > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> >
> > Use devm_kzalloc_obj(). Same elsewhere.
> 
> Will do in v2. I will also convert the parents array to
> devm_kzalloc_objs().
> 
> Thanks,
> CL

Bart
