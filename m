Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793701822;
	b=tuWFuXfP8I/k4tNzThL58ZAIfNlu3i4Z82l2Gjt+z0Ue5cQSkgx8OOYd34hj5i3KjP0q
	 7gqw7oTnVUXWcCg1X0TjyDqW32PIDLv3nR7CmlgPK//bTE1pON295LjZLzsH47aWRed18
	 vZMADVs0vss7lNHeLvUUM2dnrbQBQrrmrjR/A0sCKWtfNXtGa0KQtEbmnffia4azjjnYt
	 t2OM23XCIlUobUoI2DR01RwYw76rOHOvxzX/jvqegzD6FD6rQ4AY/BVaREKMXUk7WOuzF
	 ww03LP664Ltl3aYBWn3308YJP3RqwzCt1bAAbSwShoMwpp+tQQ5hZreQXJQ5munxptA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701822;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=cS9be5BNblTcpaFLs7pFkLhSzIti9qF+o9j0kW9uoVk=;
	b=prDKSL3uMkwMVK4FUpO/8IRATtd34FCP+PPGx4Dk6CF2blmEM8k7Rf9ij4ATL9hQFUsE
	 zZlD7PnTaSaNZGhkOB9Lwx4ly9U4XeCcYboZByaVB08gmAgTiBvUZLjeCCyzC1cOGJXs0
	 q/UMoHKbY8eNpcgGnQ2FQYKRSjMz57dCZX3GHoOKPvGhR2zp/30ZiV5P1dVwJTBM7MEIX
	 eE8riwDKdIXX4Lqony9l+CXGF9ZQS1iCpmQGGz2+o1+RShhWcoZAj8sQ/khWV7uRhD2ia
	 V3N2Fw8o8E/fZnZPOIfY1hUaFaS+Fd0aTFWOHej2GYTZjb4v7AHDwMvAVh+RFtrLDDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICKHSy2y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57A4606A802;
	Tue,  3 Nov 2026 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ICKHSy2y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DFBD1F0093A;
	Tue,  3 Nov 2026 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793701821;
	bh=cS9be5BNblTcpaFLs7pFkLhSzIti9qF+o9j0kW9uoVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ICKHSy2yZpwKGnO5I3FAHYazCgrvmea7ZVrKynVTIaR8Z8hunL6I5ZZdMUVuCOXQJ
	 +sZuG60cHBDKhmOtPJ0LkDXc5oGJM8ERboFwhMoBricXP0KxatwdAFD1zPFix6jfy4
	 W8kouw8GNqgTQqKrzzTm4K7Nch954GwrWcGA1f8oy0bVB/sqfEnlajWod8XOAwvjgi
	 nrF0OLL11LPBmabS0lTKwWDZ/jebQbzwzFVGiSC2zVJYv9P13ig7xJC0MYo38Io9Y0
	 l4V8dsGGtXdJQExWF3yb1DVe94SQAjrZ5tZPoYXrDtd/WMvg09b7tRYEa2WJxZD8jh
	 IcwtflQI7bnsg==
Message-ID: <sashiko-outbox-195053@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 RESEND 3/8] dt-bindings: pinctrl: Add
 starfive,jhb100-adc1-pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261103102236.96872-4-changhuang.liang@starfivetech.com>
References: <20261103102236.96872-1-changhuang.liang@starfivetech.com>
 <20261103102236.96872-4-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 03 Nov 2026 10:30:20 +0000
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
- [Low] dt-bindings: pinctrl: starfive,jhb100-adc1: reset order mismatch
--

commit 4c932bf5e112630c79796db81f0b0cecf418f57b
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

dt-bindings: pinctrl: Add starfive,jhb100-adc1-pinctrl

This commit adds the Device Tree binding schema for the StarFive JHB100
SoC ADC-1 pin controller.

> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-ad=
c1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100=
-adc1-pinctrl.yaml
> new file mode 100644
> index 0000000000000..6f1486b4a8bdf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinc=
trl.yaml

[ ... ]

> +  resets:
> +    items:
> +      - description: ADC1 IOMUX
> +      - description: ADC1 core

[ ... ]

> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        pinctrl_adc1: pinctrl@11bc2c00 {
> +            compatible =3D "starfive,jhb100-adc1-pinctrl";
> +            reg =3D <0x0 0x11bc2c00 0x0 0x400>;
> +            clocks =3D <&per2crg 68>;
> +            resets =3D <&per2crg 12>,
> +                     <&per2crg 13>;

[Severity: Low]
In Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc1-pinctrl.y=
aml,
properties.resets defines the first entry as ADC1 IOMUX and the second entry
as ADC1 core, whereas the example lists <&per2crg 12> followed by
<&per2crg 13>.

In include/dt-bindings/reset/starfive,jhb100-crg.h, those reset indices are
defined in the opposite order:

    #define JHB100_PER2RST_ADC1_PRESETN			12
    #define JHB100_PER2RST_ADC1_IOMUX_PRESETN		13

Are the reset descriptions in properties.resets.items or the reset indices =
in
the example reversed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261103102236.9687=
2-1-changhuang.liang@starfivetech.com?part=3D3
