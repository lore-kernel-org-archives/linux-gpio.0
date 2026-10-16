Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B1737F002;
	Fri, 16 Oct 2026 14:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792162466; cv=none; b=SxxIRBYULASZA1+CNkAzRbZy7QSFVYn9RssEjmhQ3PPuXMnms1Ykki91TL9rj6I8NWbKu8EXc7ktBFpMNvc1NUpcaUpnA3rv2CAqLTdKcl8A/rG8DSeCnJ2ES0uXyfKoO1wT4EjxVBz/d9KWcWMqLcJEQ1g6kkGySxV1obBFzQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792162466; c=relaxed/simple;
	bh=ojozOjoC4ba7aaMhTHLN6qGyELjDz/CJ9bWkHhIfEpY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=KlfnIGdtlvhjhX3D6BKzeChfk3iBZSov8NaKDJkF0iNZY9APYQJxeTHhMi/Wtm6m7rWr8hCQH236fvWbb6E0Mv0DwFHRph6MCtZJgo9hms3vQBYq4k2PyM9K5P6hslgdUaxIMFfqeJUbn9+1Qm5fP2lsXGrA3RAndbnwebhsuHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtcFXmPP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtcFXmPP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC651F000C4;
	Fri, 16 Oct 2026 14:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792162464;
	bh=HX3yVBC66uqPn4uoXcUle3IJzRW8eMsa1i8HyqMDfHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mtcFXmPPzy7XWFeixA0+ZotICw7CJSwf40g91TUn6mjojmFzC42tpsqHjXQRKEfam
	 zwSNfs0JRB3QTWdoyp27eZyDuh26bF6YU4tTgjFETI1IVBKF7F0HtdH4Y+3DSZFiiM
	 PxTOkLe+x7p9vQT430l2uzkHLWbISZkfzGW6hrSKFKgIb4PE99hNPSNc/WTLMDsSNG
	 N+Oe9quGKi3QPqLiV1aBYJ+zRq+Y7gw7YWKxd+YG7G54GvwUnvLVXKnJeNrtF8cUhA
	 O4DJjPqjSbvRzSMqio4vCN0TD4iqnmbBqtB4schZ7giixLq97w82Sc8K5B5d79/Wf9
	 jf6ZV6BU3ep/A==
Message-ID: <sashiko-outbox-174501@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/10] ARM: dts: omap: dm816x: Update USB node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-6-b4ce30217028@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 14:54:23 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unit-address does not match the first address in the reg prope=
rty
--

commit dbd2586a39796c2f0baed5e3349e527c7000f5a0
Author: Andrew Goodbody <andrew.goodbody@linaro.org>

ARM: dts: omap: dm816x: Update USB node

USB node was not working correctly with DMA enabled as the supporting
code had been updated without updating this SoC's device tree. Bring the
device tree more up to date so that it works with DMA enabled.

> diff --git a/arch/arm/boot/dts/ti/omap/dm816x.dtsi b/arch/arm/boot/dts/ti=
/omap/dm816x.dtsi
> index 7f3ef3a00ab86..5be9efc607855 100644
> --- a/arch/arm/boot/dts/ti/omap/dm816x.dtsi
> +++ b/arch/arm/boot/dts/ti/omap/dm816x.dtsi
[ ... ]
> @@ -574,18 +574,27 @@ uart3: serial@48024000 {
[ ... ]
> -			usb0: usb@47401000 {
> +			usb0: usb@1000 {
>  				compatible =3D "ti,musb-dm816";
> -				reg =3D <0x47401400 0x400
> -				       0x47401000 0x200>;
> +				reg =3D <0x1400 0x400>,
> +				      <0x1000 0x200>;

[Severity: Low]
Should the unit address match the first address in the reg property? The un=
it
address is @1000 but the first reg starts at 0x1400. Should this be usb@140=
0?

[ ... ]
> @@ -622,10 +631,10 @@ &cppi41dma 11 1 &cppi41dma 12 1
>  					"tx14", "tx15";
>  			};
> =20
> -			usb1: usb@47401800 {
> +			usb1: usb@1800 {
>  				compatible =3D "ti,musb-dm816";
> -				reg =3D <0x47401c00 0x400
> -				       0x47401800 0x200>;
> +				reg =3D <0x1c00 0x400>,
> +				      <0x1800 0x200>;

[Severity: Low]
Does this node have a similar mismatch? The unit address is @1800 but the
first reg starts at 0x1c00. Should it be usb@1c00?

[ ... ]
> @@ -662,12 +671,12 @@ &cppi41dma 26 1 &cppi41dma 27 1
>  					"tx14", "tx15";
>  			};
> =20
> -			cppi41dma: dma-controller@47402000 {
> +			cppi41dma: dma-controller@2000 {
>  				compatible =3D "ti,am3359-cppi41";
> -				reg =3D <0x47400000 0x1000>,
> -				      <0x47402000 0x1000>,
> -				      <0x47403000 0x1000>,
> -				      <0x47404000 0x4000>;
> +				reg =3D  <0x0000 0x1000>,
> +				       <0x2000 0x1000>,
> +				       <0x3000 0x1000>,
> +				       <0x4000 0x4000>;

[Severity: Low]
Is it expected for the unit address to be @2000 when the first reg starts at
0x0000? Should this be dma-controller@0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-patch-ekto=
r5-dm8168-dts-v1-0-b4ce30217028@linaro.org?part=3D6
