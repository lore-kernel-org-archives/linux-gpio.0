Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701781;
	b=ax5zbSdml+o94GRvnVxmlf1zNeYMUZjwHG8nKGYVIEd/XgbaVMl8TC/eMPpgZIZh5Ace
	 FFJmWlcrod3dFXkfyCLXEWCuz8cW3Aoo8ArKSxLAq1WGMmGCijILmMBXNX32KW7iZi3SQ
	 nlh47qZI77JetQ/0C00+ErjolyPnohCppi9+BoduMNMoI0vW2Hk/RJXhsb4JevyYG5O+n
	 Tr0m24Z5F6wEKQf49Zp6h39nyxJCXncKpaVMO4KN7PocewnwCbC1Uyif+ISPCOj+183pS
	 LP3PB4EZ1vd75c0RTqnZuiCVtLrfMUu6fp6X7QN1O4o/KFQVIPByErmQ2vk27bvqsWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701781;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=/56EG2svL5jLewnaDgcht19g0SMZfzMbPzK9/rj5pqM=;
	b=A3ZTN0kJ3BSgTtP6ee5bf4kzu5nLo4/8Qg2hHmDEeAm07pr0BN/wg4pNR7iIOaNfKJdv
	 4qHh3l8J/C/QCeAZH0TDpTPm3BVSOGgzbz91GOL6BNcv/OIWmxAyK417XonrUWmwCW+6s
	 sT/PnBPINZyKXtNSMtgXaCuEtzz5X4al0LDIvdof1vDqrFHJ3JpiOAegFZ1QScHHWvWwO
	 IuVd4Ltab7jjzcrDiF2NkXhuwOEUzkW+E4l5pkoEZwUjrYCKhr3hUPQQi/3sOL55BmOXY
	 w5MTnc1iyK9RiNsdss3ljw5iaOKQUIHNYttg3jp3f/qk1HaTXjjrwX8EWT26YyEF2ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqkrdLAi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E24606B127;
	Tue,  3 Nov 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LqkrdLAi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0AF1F000C1;
	Tue,  3 Nov 2026 10:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701780;
	bh=/56EG2svL5jLewnaDgcht19g0SMZfzMbPzK9/rj5pqM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LqkrdLAiDcS27vHd9yOzLJUjE4i0sxjFP4iIl+ZGnGwnmpPXlDUnxysk/cKvQBzAi
	 +ruUNYm5j/0r9fXRi7Lm31j2uNrqq4XgeF2fyol8tcnI2E4rRk0nwVBvIIFokZrv8c
	 HyK5ChHhgzOSHr9M0esKj70VbfouLIlE+efpnWeMavym4dsOBsbJ6UEf80DyHHZPpb
	 ELVI/za3hdKskC+NM3e96WZNEb9hsrQRY8VgMAuniU694VhOgVndx2heDEEXfirRx2
	 VWlJIBKS/QdOZNJ/mrboY97C7X93wptF8Lhdc5l4h76Nhm7RkvvI8Cp7+48udSklxW
	 KwNJaVauqDaSw==
Message-ID: <sashiko-outbox-195052@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 RESEND 1/8] dt-bindings: pinctrl: Add
 starfive,jhb100-adc0-pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103102236.96872-2-changhuang.liang@starfivetech.com>
References: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
 <20261103102236.96872-2-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:29:39 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: pinctrl: jhb100-adc0: inverted resets item order vs ex=
ample
--

commit 9d39373a8467ea55e837444aa5a8e524ca666cc8
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

dt-bindings: pinctrl: Add starfive,jhb100-adc0-pinctrl

This commit adds the Device Tree binding schema for the StarFive JHB100
SoC ADC-0 pin controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-ad=
c0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100=
-adc0-pinctrl.yaml
> new file mode 100644
> index 0000000000000..5b4b44c5776c1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc0-pinc=
trl.yaml
> @@ -0,0 +1,168 @@

[ ... ]

> +  resets:
> +    items:
> +      - description: ADC0 IOMUX
> +      - description: ADC0 core

[ ... ]

> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        pinctrl_adc0: pinctrl@11bc2800 {
> +            compatible =3D "starfive,jhb100-adc0-pinctrl";
> +            reg =3D <0x0 0x11bc2800 0x0 0x400>;
> +            clocks =3D <&per2crg 67>;
> +            resets =3D <&per2crg 10>,
> +                     <&per2crg 11>;

[Severity: Low]
Is the order of items in properties.resets inverted relative to the example?

In properties.resets, the first positional reset is documented as ADC0 IOMUX
and the second as ADC0 core. However, the example passes reset 10 followed =
by
reset 11 from per2crg, and include/dt-bindings/reset/starfive,jhb100-crg.h
defines them in the opposite order:

#define JHB100_PER2RST_ADC0_PRESETN				10
#define JHB100_PER2RST_ADC0_IOMUX_PRESETN			11

While jhb100_pinctrl_probe() currently requests all resets together via
devm_reset_control_array_get_optional_shared(), any consumer indexing the
resets property by position according to the schema would target the wrong
reset line. Should the descriptions in properties.resets or the example be
swapped so they match?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103102236.9687=
2-1-changhuang.liang@starfivetech.com?part=3D1
