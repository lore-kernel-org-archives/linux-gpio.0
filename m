Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795777593;
	b=sdJguwIVTDW5Z27YMq+qMELdm9KRUgmw4HLt2rQxdOUqT0xMdsWIuqnd+tNi11EIdJI9
	 O5sPI+8G/7kOO2bH4+FAYZZu7nC03QkhLLV2agz8satrz1/zCCDD0ODSsXpildGBrvuOd
	 Zs64uhYEbjOn5XryyTEFVR9clXjX/qI24njjNhTOLbw1qvRYRbG2vLRNv5tn8eZEXQ1hW
	 Hphk88Oa6HN7wNI/u/abUPmlV3p3oxrtD+1TQCz5B15iPXsd33npdInRfhvEjHVvQC4iK
	 AY9RcVYMkAYJWQiQ4iVcuiSWolQMdcCXHtnpACjw+3yhyRI6U4SMPcMGfp2FHtjnFlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795777593;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iCQJSokeSz1WcFBeIP560Q4iX6NJRTQnVMddmiEjlY0=;
	b=HWTps5MVsuOLb00odxmqZ2S5KSH/Aa9detTdO6HyWSf5G6+kgglE9reOx0V3n6O2dmT5
	 IY/dIRTobbKPQCjGEDEhsjx5lO3/6vizOuPSrHZYSN58QfrcCX37xY2LXpOEeMlHcCEcp
	 MmcIinDZVuNJKb5xinCYhO97x43TvV9Tyvwah7vAIGw13qfW3R/5APTDPn2gcO0oofq6o
	 3sXMd+sTiF0hxlMQ6YcU2M7Ef5P4Bwz2jyFbUUpfkQkNJVChIaxB6z3Y7L7jH9anUdtyv
	 Jg7eVObA/qDfK7Lf9+b2IfMe56UNBSK8EZ5jXUEW0q7EXVBoio/IJs1vgPCpTtAdrTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LETSYPv1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A33C606A321
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LETSYPv1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCAB31F00899;
	Fri, 27 Nov 2026 11:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795777592;
	bh=iCQJSokeSz1WcFBeIP560Q4iX6NJRTQnVMddmiEjlY0=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=LETSYPv1+MA9/4nYD3cWsNXsc88K+LeNIM+k+biePKEeQHbxNqahSUSxrnhj0NtOl
	 hYjVcMbXbalZPDhjeOzb9zmA+VbBP1vbf72SacCP8wN43cNJu5eCew9vZwkwvi7dhQ
	 BV50mdPr24iYCnZoosRKBLS5oXLcZCiU/6fBgC3MxZpwhqAudffZxbIpXRpz7687Eb
	 sAcDwvP8O89ENVExtc16uDtgB4F854yFHINQO38Pt0EHdQST/+UJNDAkiYxIh0DKAL
	 DUL5BcF/+0JBCQHN9GBcnRG5haE9DZguNybWTWrCVITA5Oj+S35wr07NT/Ef/IU5Hl
	 7WZcpik+5cs2A==
Message-ID: <sashiko-outbox-237215@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: mcp23s08: Protect temporary masking from
 concurrent enable/disable
Reply-To: sashiko-reviews@lists.linux.dev
To: "Francesco Lavra" <flavra@baylibre.com>, linux-gpio@vger.kernel.org
In-Reply-To: <20261127105346.729300-1-flavra@baylibre.com>
References: <20261127105346.729300-1-flavra@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 11:06:32 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] pinctrl: mcp23s08: unlocked read of mcp->irq_enable in
  mcp23s08_irq()
--

commit 0d9b07d612ce466ee6965e986ffa3c3137b81336
Author: Francesco Lavra <flavra@baylibre.com>

pinctrl: mcp23s08: Protect temporary masking from concurrent enable/disable

This commit adds an irq_enable field to struct mcp23s08 to track enabled
interrupts under mcp->lock, replacing the local gpinten snapshot in
mcp23s08_irq() so that unmasking after level-interrupt handling does not
overwrite concurrent mask or unmask updates.

> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl=
-mcp23s08.c
> index cc668f84bf8bc..856cba4fa5b9f 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -362,7 +362,7 @@ mcp23s08_direction_output(struct gpio_chip *chip, uns=
igned offset, int value)
>  static irqreturn_t mcp23s08_irq(int irq, void *data)
>  {
>  	struct mcp23s08 *mcp =3D data;
> -	int intcap, intcon, intf, i, gpio, gpio_orig, intcap_mask, defval, gpin=
ten;
> +	int intcap, intcon, intf, i, gpio, gpio_orig, intcap_mask, defval;
>  	bool need_unmask =3D false;
>  	unsigned long int enabled_interrupts;
>  	unsigned int child_irq;
> @@ -381,16 +381,13 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
>  	if (mcp_read(mcp, MCP_INTCON, &intcon))
>  		goto unlock;
> =20
> -	if (mcp_read(mcp, MCP_GPINTEN, &gpinten))
> -		goto unlock;
> -
>  	if (mcp_read(mcp, MCP_DEFVAL, &defval))
>  		goto unlock;
> =20
>  	/* Mask level interrupts to avoid their immediate reactivation after cl=
earing */
>  	if (intcon) {
>  		need_unmask =3D true;
> -		if (mcp_write(mcp, MCP_GPINTEN, gpinten & ~intcon))
> +		if (mcp_write(mcp, MCP_GPINTEN, mcp->irq_enable & ~intcon))
>  			goto unlock;
>  	}
> =20
> @@ -409,7 +406,7 @@ static irqreturn_t mcp23s08_irq(int irq, void *data)
>  		"intcap 0x%04X intf 0x%04X gpio_orig 0x%04X gpio 0x%04X\n",
>  		intcap, intf, gpio_orig, gpio);
> =20
> -	enabled_interrupts =3D gpinten;
> +	enabled_interrupts =3D mcp->irq_enable;
>  	for_each_set_bit(i, &enabled_interrupts, mcp->chip.ngpio) {

[Severity: Medium]
Does reading mcp->irq_enable into enabled_interrupts after releasing
mcp->lock introduce a data race with mcp23s08_irq_mask() and
mcp23s08_irq_unmask()?

Previously, gpinten was read while holding mcp->lock and copied to
enabled_interrupts after unlocking.  Now mcp->irq_enable is read after
mutex_unlock(&mcp->lock):

drivers/pinctrl/pinctrl-mcp23s08.c:mcp23s08_irq() {
    ...
	gpio_orig =3D mcp->cached_gpio;
	mcp->cached_gpio =3D gpio;
	mutex_unlock(&mcp->lock);

	dev_dbg(mcp->chip.parent,
		"intcap 0x%04X intf 0x%04X gpio_orig 0x%04X gpio 0x%04X\n",
		intcap, intf, gpio_orig, gpio);

	enabled_interrupts =3D mcp->irq_enable;
    ...
}

If another CPU unmasks a pin right after mcp23s08_irq() drops mcp->lock,
mcp23s08_irq() can observe the new bit in enabled_interrupts and evaluate
that pin against the intf, intcon, defval, intcap, gpio, and gpio_orig
registers sampled before the pin's interrupt was configured and enabled:

CPU0                              CPU1
mcp23s08_irq()
  mutex_lock(&mcp->lock)
  mcp_read(MCP_INTF / MCP_GPIO / ...)
  mutex_unlock(&mcp->lock)
                                  mcp23s08_irq_bus_lock()
                                    mutex_lock(&mcp->lock)
                                  mcp23s08_irq_unmask()
                                    mcp->irq_enable |=3D BIT(pos)
  enabled_interrupts =3D mcp->irq_enable
  for_each_set_bit(i, &enabled_interrupts, ...)
    handle_nested_irq(child_irq)  <-- spurious IRQ on newly unmasked pin

Assigning enabled_interrupts =3D mcp->irq_enable before
mutex_unlock(&mcp->lock) would keep all accesses under mcp->lock and
preserve a consistent snapshot.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127105346.7293=
00-1-flavra@baylibre.com?part=3D1
