Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794305764;
	b=0haipNF2de5pxEIxDzaqxUwqNoRKsUCQuy1v7U60GrSTz0t7OgA7CF+wd7Iqlscgc6tm
	 53fFlV+ebi/W4f9UsCzGcFDeYsnInBiMrHAvFIfIt4c5v/PhBSDw956hE/orojPSgS7UL
	 i4sM3miZyUMF82QadzstBqu+5nuJaTkIqUpGHj2OVgV5i8JhPEyrQ368Nxlc/jhX/0IFt
	 ZYB4JBIkfByCgcvfoQDSjqIIOvSFy9r1wUeaMFzzn5OJvqZUPGTOhX4gh+TqHLzPwYe8F
	 h22wGouEraxuCp9M20f5+s6W9BAiliKOS7l4ylPIBkwIF1QmdPc25rGIx0qr7Tnn4tQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794305764;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=2EHUBQhOogjc/02t4gEgHM9jJNgzIisR9UqyijrkvwE=;
	b=R7Q+QJokXobp/nNxo/l8r7oZBVcHh2DY0KHn9QBC86cjej/gCoQ0XmiL2WEBuLUT8TO6
	 RaOkCylSF3ks8DpM9nahLOX0d3XUFoGRWj4KItiGLqa5uTqYK4mekYOIjn+dvY1dW3JiI
	 EZaOw5jlIWXwYdkzFC1a9adJD2vGdGbmp9fPnW4gbIB5o+ateBkIDjWj2ImqM/+6SqvIj
	 389xZnTgeFVh2LcdW+Qn9FfpzOeXardHHfRydcpiEtJQBBko4Sh1MwDDJ2wVnEs1+ERdc
	 CNJ3ct1DFOttpZRY1e3/q9Xc0jl0pvhd3K++KDJ9I0sWtYwwMMXt6TZyXRGaNx7kDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQSSh2+b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE76606A321;
	Tue, 10 Nov 2026 10:16:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DQSSh2+b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D1251F0089F;
	Tue, 10 Nov 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794305763;
	bh=2EHUBQhOogjc/02t4gEgHM9jJNgzIisR9UqyijrkvwE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DQSSh2+bEV88AnjEVZBYt9X+c9hQLhURx9X0Mrnu1neMtVP173o/8lw2vyCUpJH1H
	 ccfW2zyeGRfJX2iWFU94E7qPL3swg+g0n9RzQzj64Pf2vJ9qM0VgU/nbJkB8DUFqHu
	 ObK7zDe8JcSOJlUuum2b91IpJZZBwJ4Vf0dQORMrTn8Nu+EF6mVBiY9bpPFBZSyAEX
	 gS0wb30VoPifys7N69pjmZddHF2GOPw6sCD32QEVR7gtEK589H/mh51tzQpOkfLTFm
	 /+t/JK3bPGyFhW5Zua6RY2+xJko8AHTTOSF4LVJMwVLvzSQ1s/1ffIF2ueWJwpnODN
	 COLl9GFGQJtTg==
Message-ID: <sashiko-outbox-206848@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: nomadik: Convert to DT schema
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261110-ux500-pinctrl-bindings-v1-2-a9f0e9d12d19@kernel.org>
References: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
 <20261110-ux500-pinctrl-bindings-v1-2-a9f0e9d12d19@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 10:16:02 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] dt-bindings: pinctrl: nomadik: inverted description for
  ste,sleep-wakeup
- [Low] dt-bindings: pinctrl: nomadik: ste,sleep-gpio is not supported
  by driver
--

commit 42613122aac31a7796978d757c2d840b0d6ab5f2
Author: Linus Walleij <linusw@kernel.org>

dt-bindings: pinctrl: nomadik: Convert to DT schema

This commit converts the ST-Ericsson Nomadik pin controller device tree
binding from plain text to YAML schema.

> diff --git a/Documentation/devicetree/bindings/pinctrl/stericsson,nomadik=
.yaml b/Documentation/devicetree/bindings/pinctrl/stericsson,nomadik.yaml
> new file mode 100644
> index 0000000000000..48b2b5773946c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/stericsson,nomadik.yaml
> @@ -0,0 +1,113 @@

[ ... ]

> +      ste,sleep-gpio:
> +        description: Sleep GPIO mode enable.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 1

[Severity: Low]
Should ste,sleep-gpio be dropped or marked deprecated here?  When commit
e32af8894588 ("pinctrl/nomadik: add device tree support") added DT
support, the driver implemented ste,gpio in nmk_cfg_params[] while
ste,nomadik.txt mistakenly documented it as ste,sleep-gpio.  Because
nmk_cfg_params[] does not parse ste,sleep-gpio, any device tree using this
property will have it silently ignored at runtime.

> +      ste,sleep-wakeup:
> +        description: Sleep wakeup disable.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 1

[Severity: Low]
Should the description for ste,sleep-wakeup say "Sleep wakeup enable."
to match the sibling boolean-like properties?  Both
include/dt-bindings/pinctrl/nomadik.h (SLPM_WAKEUP_DISABLE =3D 0,
SLPM_WAKEUP_ENABLE =3D 1) and nmk_pin_sleep_wakeup_modes[] in
drivers/pinctrl/nomadik/pinctrl-nomadik.c treat 0 as disable and 1 as
enable:

drivers/pinctrl/nomadik/pinctrl-nomadik.c:
static const unsigned long nmk_pin_sleep_wakeup_modes[] =3D {
	PIN_SLPM_WAKEUP_DISABLE,
	PIN_SLPM_WAKEUP_ENABLE,
};

Describing the property as "Sleep wakeup disable." could mislead device
tree authors into inverting the value.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-ux500-pinc=
trl-bindings-v1-0-a9f0e9d12d19@kernel.org?part=3D2
