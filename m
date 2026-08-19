Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FC440643
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 20:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787169862; cv=none; b=thob7TDRZ6Z1CuOuP78XZD6KtvOMTUKCJ1clrT90uPoqxiRSnW0hkz60iqJ3JUSpxqcFQEPteZyvWbTDtfaL+uEoO/nBfMeiXIjQV5IMm8/c+RGVh8U2enWJaP5BkIZXsMvoW3Wv/VDepqmcGE+L+xoFpWczPjCpy63Nj9PnHyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787169862; c=relaxed/simple;
	bh=QH9KibQ4kJhiOhG7ED7r8G/302yMIifoYN0D/1NHG9U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vg+A9niCJWxvywbet/dWRDObbOqBTMjU1mOLDmPdqnBD96aYW3ICfkBkIT4jhrf7zO0iWIqOjiB1dVzz/r1zpS0Pgrzf5Vf44/x/FjDmRqyWYHN8abanGtiuYRb5JUzi+v6yAqxlpK8hqzY5xTbQ4RzMmWedxPDnDqoiIrTGU58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=ThiYfojo; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="ThiYfojo"
Received: from [IPv6:2a02:1812:162d:3d00:649f:659d:f6c1:d42] (2a02-1812-162d-3d00-649f-659d-f6c1-d42.ip6.access.telenet.be [IPv6:2a02:1812:162d:3d00:649f:659d:f6c1:d42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id C8AAD8E2A2D;
	Wed, 19 Aug 2026 21:58:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1787169515;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j757YKNMx7WHXjJg4FAnMr9hyPswAmOdPq7SgVtTYpc=;
	b=ThiYfojo8VpwNiOlyHO4hHonvQh5u6Ux2RShEFp5fjk9dVSipmF3qsKunKbZDqTAH3FCqa
	NqUOCiFBUuGAjUpGOf3sPgawH37ZaeegrHy68NOlj/xz9VZW9LvUmPKkE7of6MJ201y+7Z
	1kJ9c68aKgjXicgdthszVpcClM2DOX86nIg19FuR5PDKGpyAwNOeh0qxTGEhStxIiyLlVa
	ilfQeFDPSaXxcTnsEPulA94HzLV2KuNdr7GERGwgTt8NNEvS3WkSjmu9a401AwZwfgsgof
	F7SFrM5itxHtYj+yWKzWRSehT7Xur3Bjs5oksjyOr5xr3VOj4Bq2TZqgmzrqBA==
Message-ID: <d7b4bebc172d94c3760211608963ceafb72d3c0c.camel@svanheule.net>
Subject: Re: [PATCH v2 2/2] gpio: realtek-otto: add pinctrl support
From: Sander Vanheule <sander@svanheule.net>
To: misha.zavertkin@mail.ru, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Bert Vermeulen	
 <bert@biot.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 19 Aug 2026 21:58:32 +0200
In-Reply-To: <060486bd7671ce058b96378c7b02316ebbe6d92c.1787130560.git.misha.zavertkin@mail.ru>
References: <cover.1787130560.git.misha.zavertkin@mail.ru>
	 <060486bd7671ce058b96378c7b02316ebbe6d92c.1787130560.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Wed, 2026-08-19 at 22:51 +0700, misha.zavertkin@mail.ru wrote:
> RTL9607C relies on pinctrl to mux SoC pins. Use pinctrl to request pins
> for GPIO
>=20
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> ---
> =C2=A0drivers/gpio/gpio-realtek-otto.c | 10 +++++++++-
> =C2=A01 file changed, 9 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpio/gpio-realtek-otto.c b/drivers/gpio/gpio-realtek=
-
> otto.c
> index 4a606bad5848..86948da8adec 100644
> --- a/drivers/gpio/gpio-realtek-otto.c
> +++ b/drivers/gpio/gpio-realtek-otto.c
> @@ -97,6 +97,11 @@ enum realtek_gpio_flags {
> =C2=A0	 * range, where the per-cpu enable masks are located.
> =C2=A0	 */
> =C2=A0	GPIO_INTERRUPTS_PER_CPU =3D BIT(2),
> +	/*
> +	 * Request GPIOs from pinctrl using gpiochip_generic_request()
> +	 * and gpiochip_generic_free().
> +	 */
> +	GPIO_PINCTRL =3D BIT(3),
> =C2=A0};
> =C2=A0
> =C2=A0static struct realtek_gpio_ctrl *irq_data_to_ctrl(struct irq_data *=
data)
> @@ -354,7 +359,7 @@ static const struct of_device_id realtek_gpio_of_matc=
h[] =3D
> {
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "realtek,rtl9607-gpio",
> -		.data =3D (void *)GPIO_PORTS_REVERSED,
> +		.data =3D (void *)(GPIO_PORTS_REVERSED | GPIO_PINCTRL),
> =C2=A0	},
> =C2=A0	{}
> =C2=A0};
> @@ -405,6 +410,9 @@ static int realtek_gpio_probe(struct platform_device
> *pdev)
> =C2=A0		ctrl->line_imr_pos =3D realtek_gpio_line_imr_pos_swapped;
> =C2=A0	}
> =C2=A0
> +	if (dev_flags & GPIO_PINCTRL)
> +		gen_gc_flags |=3D GPIO_GENERIC_PINCTRL_BACKEND;
> +
> =C2=A0	config =3D (struct gpio_generic_chip_config) {
> =C2=A0		.dev =3D dev,
> =C2=A0		.sz =3D 4,

Any reason to not just always add GPI_GENERIC_PINCTRL_BACKEND, regardless o=
f the
compatible? If there are no gpio_ranges, gpio_generic_request() is a no-op,=
 so
there's no harm in enabling this without having that property defined.

The other SoCs use explicit pinctrl properties on the GPIO consumers in the=
ir
devicetrees for now. If you enable this feature for all instances of this G=
PIO
driver, then only the devicetree needs to be updated later to enable gpio_r=
anges
for them.

Best,
Sander
