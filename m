Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.128.198.184
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513331;
	b=O4yoIJ1n+5BVkM4b5aGrlqYzVLzBdQOfdKxm74MAv2fEnq/q6qafQ/1AaiPgbCiaWFP5
	 ylvdoDik8Ag9wY7sLj/JSJNRsG0nkhtRhLCS3KCdOiiYNx0zseRCbcxBoytu9lG/QqwFo
	 pUCQpW7tPn/qO73Vk915kpNSjvuk34siENdIKUmnAjqDaPyrUn1dlosU/CN27xAxR/Z2u
	 ZYk0GBA3WaH5i9D8ELN7U24tuZ0gOzpQPnvJIfkXq5GkkIOcCSeJ70NiJ/zzzFC6OHlUG
	 i6yKplXt5HoTwY6Bvct3JxUORZcN1B9/1xMlG7VzEHmaNrhWyfFkZkLZG73R10AUqgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513331;
	h=DMARC-Filter:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-DKIM-Results:X-DNSRBL:X-SPAM-SOURCE-CHECK:X-MAIL;
	bh=VMBd4xkuw3NSAtFhnVutsYxwqi+FzOy6A3ghZIUQyqw=;
	b=1W8f+u1cXU7U9JULY5vPhI+iOAgzXmTM8UubcMy6LpF2BQxfjCKswIrGDZR6UQbpJmZC
	 rNqYUhH0SwjlzfkFpdAD6K/BZswebRKm1R1Uj7BqcvWJdLJ1R/qgOGxBDKPjBGO5clPY6
	 JZoo/l5ET2UFUK0Ra+OeK8Zb/6EPmuat7BPlCgMql9i9Zdo6bf5zYw0dHUg9W5eXsVZsu
	 AU+tuoS0IfLznTIlRQKgSA/d2gfLYQUGWzcv05mfvwgi2R8vqTL1H5iPTvfiyei2Pchjp
	 iFuPY1AeZ7tLvcQP+5yJebD2yD8SXj7Qnh6BGBlXSCtMcy0WKzR5DLaE5jbBS512hFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=andestech.com;
	spf=pass smtp.mailfrom=andestech.com;
	arc=none smtp.remote-ip=220.128.198.184
Received: from Atcsqr.andestech.com (atcsqr.andestech.com [220.128.198.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566BC606A69D;
	Tue, 24 Nov 2026 09:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 566BC606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andestech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andestech.com
Received: from mail.andestech.com (atcpcs54.andestech.com [10.0.1.154])
	by Atcsqr.andestech.com with ESMTPS id 6AO9fYVB049395
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 17:41:34 +0800 (+08)
	(envelope-from cl634@andestech.com)
Received: from ATCPCS34.andestech.com (10.0.1.134) by atcpcs54.andestech.com
 (10.0.1.154) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Tue, 24 Nov
 2026 17:41:34 +0800
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS34.andestech.com
 (10.0.1.134) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Nov
 2026 17:41:34 +0800
From: CL Wang <cl634@andestech.com>
To: Bartosz Golaszewski <brgl@kernel.org>
CC: CL Wang <cl634@andestech.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>,
        Linus Walleij <linusw@kernel.org>, "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <tim609@andestech.com>
Subject: Re: [PATCH 2/3] gpio: atcgpio100: Add ATCGPIO100 GPIO driver
Date: Tue, 24 Nov 2026 17:41:27 +0800
Message-ID: <20261124094127.1988037-1-cl634@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <22ifazqg6afr6rcybqg6foah3v554xu4px2c4et35y5xzpg74h@kesthgcvnlgk>
References: <20261116040914.368298-3-cl634@andestech.com> <22ifazqg6afr6rcybqg6foah3v554xu4px2c4et35y5xzpg74h@kesthgcvnlgk>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ATCPCS33.andestech.com (10.0.1.100) To
 ATCPCS34.andestech.com (10.0.1.134)
X-DKIM-Results: atcpcs54.andestech.com; dkim=none;
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:Atcsqr.andestech.com 6AO9fYVB049395

Hi Bartosz,

Thanks for the review.

On Tue, Nov 17, 2026 at 02:54:06PM +0100, Bartosz Golaszewski wrote:
> > +#include <linux/mod_devicetable.h>
>
> Uwe would probably say you should only pull in the individual headers
> that you require from include/linux/device-id/.

As Uwe pointed out, <linux/platform_device.h> already provides
of_device_id, so I will drop <linux/mod_devicetable.h> in v2.

> > +	config = (struct gpio_generic_chip_config) {
> > +		.dev = &priv->pdev->dev,
> > +		.sz = 4,
> > +		.dat = priv->base + REG_DATA_IN,
> > +		.set = priv->base + REG_DATA_OUT,
> > +		.dirout = priv->base + REG_CHAN_DIR,
> > +		.flags = GPIO_GENERIC_READ_OUTPUT_REG_SET,
> > +	};
>
> I think you could save even more code by using the gpio-regmap helper
> here instead. Could you see if that's possible here?

I tried it. The conversion is doable, but the driver grows from 641 to
721 lines. The extra code comes from:

 - IRQ handling: gpio-regmap only accepts an external irq_domain, so the
   driver has to create the domain and duplicate what GPIOLIB_IRQCHIP
   provides today (map/xlate ops, lockdep classes, resource
   request/release callbacks, and removing the chained handler and
   disposing of the mappings on unbind). This accounts for most of the
   growth. Using regmap-irq instead would turn the chained hardirq
   handler into a threaded one, and the 3-bit trigger mode fields (one
   per line, spread across four registers) would still need a custom
   set_type_config() callback.

 - Output readback: the datasheet documents DATA_IN for input lines
   only, so output lines are read back from DATA_OUT. With gpio-mmio
   this is handled by GPIO_GENERIC_READ_OUTPUT_REG_SET; with gpio-regmap
   it requires a reg_mask_xlate() callback that reads the direction
   register on every get.

 - Shared debounce cleanup: the debounce period is shared by all lines,
   and the driver clears a line's debounce enable bit in .free() so that
   a released line does not block a different period on another line.
   gpio-regmap does not let the driver provide .free(), so the enable
   bit stays set after release and the conflict check has to skip lines
   that are no longer requested.

Given that, I would prefer to keep gpio-mmio for v2. If you still
prefer gpio-regmap, I can send that version instead.

> > +	if (priv->chan_num > ATCGPIO_CHAN_NUM_MAX || !priv->chan_num) {
> > +		dev_warn(&priv->pdev->dev,
>
> Use a local variable to store the adress of dev for better readability.

Will do in v2, both here in atcgpio_init_controller() and in
atcgpio_init_resources().

> > +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
>
> Use devm_kzalloc_obj(). Same elsewhere.

Will do in v2. I will also convert the parents array to
devm_kzalloc_objs().

Thanks,
CL
