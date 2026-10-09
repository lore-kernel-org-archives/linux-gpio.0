Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C7D7376BF7;
	Fri,  9 Oct 2026 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791579137; cv=none; b=mU/Ctk/A9qBZldDx3BsfpHbLnWOrmns/+f5Sapu7hEoJDyVBapBcXuKWFyF6AWQS2WteqZqdLsmSvQzZ0qpaYd1/MHKxwbDtaKxLM4ANw7a9l0Umcm48q5I7qjc0j527xqhYEjdTmrnFbKZhEnnKxwMs1eQlBBqVv/kVZ8NG6yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791579137; c=relaxed/simple;
	bh=tFAcM9pwBLsZx+0hPctjfOn4qkn71MK/uKDJJPQfSKw=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=WFkbnyFZ/meTGMAa2ekdawJ+I9hy2vs4IP4iXhYwyzKR1T84Bpi1U8RSktSVfWhAtXzkfdgRNx2bGRNULASmJqolBIutyQIlkzk124SRrnZSyc+KGa72V5jejwRJNAgBO8mevDSyvv/GcGLq+nRAXU1yt2x63ejmYgz63YhCoBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcAfyisP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcAfyisP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9225F1F000FF;
	Fri,  9 Oct 2026 20:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791579135;
	bh=u/yflDokCIfrGsrSSSBn3TxJ7nj008VrRH9fkKo6NUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CcAfyisPybvzZqTelbcg8n17jJovHz9v8T8ZR6707k3Pwzj9TiWJ3ekM94triooZQ
	 9Pe2NzEGSadgJDur1M2v8ed39Zno1atmUNnxcdNaq4rLrGj+ZkfYUnrzPAGjBke3hD
	 1Ku3yJQYgfneR+xQzdt7meFKuYJVz0D7QZRdzgI4yX93NSuIvIBwcdThG30EzOOpJl
	 PY8J68iqu8d4eGtjDCE8+t80qLYuorGM4spJeL77YSzhj323Mh54CmzNTf5/BU7Zsg
	 cKvoOpTZL54ugfZPVjqEjESQscI2s3hgO772ePxehh6cOk33msDfaeCxrz6+RVg/HX
	 i4h0aDnCJWjXQ==
Message-ID: <sashiko-outbox-166062@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add the GPIO expander to
 Kobol Helios64
Reply-To: sashiko-reviews@lists.linux.dev
To: "Igor Velkov" <iav@iav.lv>
Cc: linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009-helios64-pca9655-v1-2-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
 <20261009-helios64-pca9655-v1-2-673ee4432650@iav.lv>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 20:52:14 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt-bindings: gpio: undocumented compatible string 'onnn,pca9655' br=
eaks schema validation
--

commit 668c971a564e2ffdacc4bbee425f902a28c78be0
Author: Igor Velkov <iav@iav.lv>

arm64: dts: rockchip: Add the GPIO expander to Kobol Helios64

This commit adds the ON Semiconductor PCA9655E 16-bit GPIO expander at 0x20
on I2C2 for the Kobol Helios64 board.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arc=
h/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> index d146e5075b4f8..a860bd2b3afc0 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
> @@ -453,6 +453,20 @@ &i2c2 {
>  	i2c-scl-falling-time-ns =3D <30>;
>  	status =3D "okay";
> =20
> +	gpio@20 {
> +		compatible =3D "onnn,pca9655", "nxp,pca9555";

[Severity: Low]
Will this compatible string array in the gpio@20 node cause a dt-bindings
schema validation warning?

The "onnn,pca9655" string does not appear to be documented in the dt-bindin=
gs
for PCA95xx.

Additionally, schema files typically restrict "nxp,pca9555" to be a standal=
one
string via a single-item enum. Using an array of two strings could violate =
the
length and content restrictions when running make dtbs_check.

> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-controller;
> +		#interrupt-cells =3D <2>;
> +		interrupt-parent =3D <&gpio0>;
> +		interrupts =3D <RK_PB1 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&exp16_int_l>;
> +		vcc-supply =3D <&vcc3v3_sys_s3>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009-helios64-p=
ca9655-v1-0-673ee4432650@iav.lv?part=3D2
