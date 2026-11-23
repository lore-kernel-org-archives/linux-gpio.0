Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434476;
	b=3OjLq1qboJ7L3A2uwZNXzDXzfZiwBiOfrANs0n8P++g+sowYyDOzxJSyZ0Nn9flupGM2
	 h0BEXFtv7jihXFAaFN5KRexn1EuQlWE575bqT5Hklwcshdp29V6h9Vjv7c0rnzBQTnmb/
	 hNuqMDny3jL03i1IhNkwnNcdJFTGtNvRLjKjIxdaGPmTuEFQURbcxfWAsk702L0puhV5E
	 rJ5+eEwQ5PS4SOKXc8cIr51NeZqoIHhcIYeWh7hmnSk2PGpGO9U+ViT63WBlWyDOIejrA
	 C2hO4DkgWxcojN6JKrDc5EbizlbvM+wREQIq63d26brEtcuq0j9gc0Z7o5xv/i8W1Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434476;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ue+NTiLrRaDWarDR3G7NHOftAHIYf/UacY07OYcKWro=;
	b=qjs9kjZk/AeDAamcC3NcUOVWbnKlezzDOCVP4gbi85YWoKexEORjz14tmb2ys4EFhwJB
	 s/25gHDjpU7n8uH7Sxx0z4Asi7qXiQUNNWrYQrsV5C43tAXL7aQk9OGey6wB/hCVaIq9a
	 auTs/BRzGaNQ3LoffTAJ7srwQwf7NTgZ45jm2jtj2evJwsnQGgcT3OaxJR366v53FjRTn
	 qCM6d7SVPzuI149O81zxFY7c4GF42mkhjh5dRpGMn0+MKJI2hhmgUfNhgdOdLeKL6DcqW
	 ghwMAOPuswS7x2k4TIT9aybgGoZJSGF8tUoUrA5KmFR30XEsoX62oPLz2lwvqiio75w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m92QDc+7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93128606A31E
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 11:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m92QDc+7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 971B31F000C6;
	Mon, 23 Nov 2026 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795434475;
	bh=Ue+NTiLrRaDWarDR3G7NHOftAHIYf/UacY07OYcKWro=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=m92QDc+7VY0E2XUL186GuAYCcIlLMuSPAhoZI2aevxhqQKq68mDxfvI1LB40Pw5dd
	 Cm6+vfLAsRP+tNCK/HYbIKBGcIM+Dwh/rES/SWhEfHnc8mvdrxp3OcL5uAOGDaq71h
	 XhTB/grOj0tbfDnPtMpIaGdwLfU2stKtGvV6dNxF5O2aLX/1i3bixH7p+AZ1E3x7ue
	 YTIPZJJpvc+Iqa37VjMReqUfcodkNztcrKyDEu5/IazKeC+H6qzQQMYLe4wa7ndFIc
	 d27MH64yfBFcvLG2covOGTklJTXplyNEXZze79U/68+olEB6jYV4WlTcjwf2fvBdBL
	 TUt3Qlf9U2CaA==
Message-ID: <sashiko-outbox-229168@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] gpio: pca953x: Fix TCA6418 interrupt handling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maria Garcia" <mariagarcia7293@gmail.com>, linux-gpio@vger.kernel.org
In-Reply-To: <20261123113234.197852-3-mariagarcia7293@gmail.com>
References: <20261123113234.197852-1-mariagarcia7293@gmail.com>
 <20261123113234.197852-3-mariagarcia7293@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:47:55 +0000
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
- [Medium] gpio: pca953x: wrong TCA6418 direction check in
  pca953x_irq_bus_sync_unlock()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [High] gpio: pca953x: broken TCA6418 volatility in
  tca6418_check_register() and IRQs [1]
--

commit 5ed3e002b749b9b8aa9dbd3081f6ed840b5b291d
Author: Maria Garcia <mariagarcia7293@gmail.com>

gpio: pca953x: Fix TCA6418 interrupt handling

This commit adds TCA6418-specific interrupt register programming and status
handling to pca953x_irq_bus_sync_unlock(), pca953x_irq_pending(), and
pca953x_irq_setup(), and restricts TCA6418 to rising or falling edge trigge=
rs.

> diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
> index 8d9f5563e222a..5a39c5a5c8a36 100644
> --- a/drivers/gpio/gpio-pca953x.c
> +++ b/drivers/gpio/gpio-pca953x.c
> @@ -910,6 +910,12 @@ static void pca953x_irq_bus_sync_unlock(struct irq_d=
ata *d)
> =20
>  		/* Unmask enabled interrupts */
>  		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
> +	} else if (PCA_CHIP_TYPE(chip->driver_data) =3D=3D TCA6418_TYPE) {
> +		/* 0 =3D falling edge, 1 =3D rising edge */
> +		pca953x_write_regs(chip, TCA6418_GPIO_INT_LVL, chip->irq_trig_raise);
> +
> +		/* Unmask enabled interrupts */
> +		pca953x_write_regs(chip, TCA6418_GPIO_INT_EN, chip->irq_mask);
>  	}
> =20
>  	/* Switch direction to input if needed */

[Severity: Medium]
Does the direction switch below work on TCA6418?

pca953x_irq_bus_sync_unlock() falls through to:

drivers/gpio/gpio-pca953x.c:pca953x_irq_bus_sync_unlock() {
	...
	/* Look for any newly setup interrupt */
	for_each_andnot_bit(level, irq_mask, reg_direction, gc->ngpio)
		pca953x_gpio_direction_input_unlocked(&chip->gpio_chip, level);
}

On TCA6418, a bit in TCA6418_DIRECTION is 0 for input and 1 for output
(unlike standard PCA953x where 1 is input and 0 is output).  Because
for_each_andnot_bit() iterates over pins where reg_direction is 0, any
interrupt pin that was previously configured as an output (reg_direction
bit 1) is skipped and remains driving as an output, while pins already in
input mode (bit 0) are reconfigured on every IRQ bus unlock.

[Severity: High]
This problem wasn't introduced by this patch, but as part of [1],
pca953x_irq_bus_sync_unlock() still treats set bits in reg_direction as
inputs on TCA6418 instead of outputs, leaving newly requested interrupt
pins configured as outputs when switching direction to input.

[1] https://sashiko.dev/#/bug/linux-a8794f43-5e5f-405d-ba31-cf360dc2e1af

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123113234.1978=
52-1-mariagarcia7293@gmail.com?part=3D2
