Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795087272;
	b=SHSsQOJOnVXbqmESzCClEDVqPcokOI8Qm25pzf8q3kJI87LuMes/SgjwGfhS10v3XRiy
	 CFmlhZ1W1VpSIP3R7SS+/HIk6R4ZVimo+l/Cg73fzmLRQq+lvO6jYA/aEC5iJD3SDcQby
	 qtej8hcF+LCeP2EOieL6ZMNgq9XFn2QXS/6gu1teDphJI6P2pg+Plco3pwRv64lhdzGcR
	 F6zwZXpSWwpLuvw82vPWtdLkLD8RiW9VHMFAI6ilTgVWbu04tyRWAQOK9uRp1tUkEYjZM
	 5CNqPez1jwSDfGoqTDbWy2gRmfisUtYrcxrciSqqIUp2a22z12vdha+tadP3zVKm0HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795087272;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y/KlDWzykcozEgD4sraH/Aiv61IoWSrwNv+eaRRWVkM=;
	b=XPt6P7p3yYNmkodLxNm7lXzByP5PLKZ54EWd4792u7iSrk7i8R6IgkDfjzMTXw9q9hJg
	 9v6+u0g+gRHRa/5BqlnlRK4oM5kaP05q5+7dXBQHv2oTgAzW/ilgQPSjaoIKRTn/henG1
	 SVLDs4oCwie54eb8DQOwHAtp5CuNuN99dw0UHuflM7mkZjLzpDYbZScF39ujwVsF5SqND
	 FAoGVamyP7M4GEk5dUc+o1oBOG9+SHRlr5fOVvgsruVEPXmbvEwoQ9gjzKHSjyWJRx4ZN
	 tgu0MRjiqNtPFyiv/WhTqNuYxytqv+dtGnq+SbsCvmg80/fjVwTTfIXr1UmFMfLYE/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4XsodsV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F67606A320;
	Thu, 19 Nov 2026 11:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=g4XsodsV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D51C11F000C4;
	Thu, 19 Nov 2026 11:21:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795087272;
	bh=Y/KlDWzykcozEgD4sraH/Aiv61IoWSrwNv+eaRRWVkM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g4XsodsVPN+5rLCSnEHo/84bsiKaoaPIrRlNhPMsaLaf11Ge2sMj5w8BC6b7y6R/Y
	 dI9OYFetK5lQefWgrvNpsUz42ww2hfWOJG2D/sMThdGRWW4E5yAtSsnRsi0npI9GtU
	 N3zNa9ftdfyKskZYVlxTj1/i1pSFhnhUUVK7vmvr91kVINa+4gHfhOyC+tDPABa5+B
	 WzwwlC6Vm0bmqMC3wcWxmOgBAbGNSNnMFOnAyKhwRXvsYTmHM3Tjkp33thfU+1uVve
	 j7hDhpdKTugQ2Lkba5Owq7+nk/HlyV4d42BCMt6XCq/fY8MBz27y82CZrvNSVtRiCv
	 Gh4vTmrQnPs5g==
Message-ID: <sashiko-outbox-223020@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-cs75xx-gpio-v5-2-8d14f2bb614b@gmail.com>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
 <20261119-cs75xx-gpio-v5-2-8d14f2bb614b@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 11:21:11 +0000
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
- [Low] gpio: cs75xx: Kconfig depends on undefined symbol
  ARCH_CORTINA_ACCESS
--

commit 7ff70214d7eee77eeaf70112de74f2b1043247c0
Author: Fil Dunsky <filipp.dunsky@gmail.com>

gpio: Add Cortina Systems CS75xx GPIO driver

This commit adds a GPIO and interrupt controller driver for the Cortina
Systems CS75xx SoCs using gpio-mmio.

> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 55e4280029d86..cc00cfe48d941 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -300,6 +300,18 @@ config GPIO_CLPS711X
>  	help
>  	  Say yes here to support GPIO on CLPS711X SoCs.
> =20
> +config GPIO_CS75XX
> +	tristate "Cortina Systems CS75xx GPIO support"
> +	depends on ARCH_CORTINA_ACCESS || COMPILE_TEST

[Severity: Low]
Is ARCH_CORTINA_ACCESS defined in Kconfig?  Without a Kconfig definition
for it, GPIO_CS75XX can only be enabled when COMPILE_TEST is set, and
scripts/checkkconfigsymbols.py flags ARCH_CORTINA_ACCESS as an undefined
symbol.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-cs75xx-gpi=
o-v5-0-8d14f2bb614b@gmail.com?part=3D2
