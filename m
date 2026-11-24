Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795495904;
	b=fMr94cbBbh3bx/sUjDiO0ztjuZRryR6VgCNvaIsOapaDtWJOcWM5YQubT/2oiJnffkMs
	 dlG5gA4kvVOlj2qhtzqY+akmMZ8FVlR99zKP5SdxmXsQp0gGkfUk8tm9J7u+2fVMJ29xS
	 m9s1reiyUj8zSwNno8YteN/8dqEtF5j4eljdqJYXWsM5q5rHbPuNF7rnUuZ7y6nyb5j6B
	 xgp0fBru0HkLOcZvKtxEkuF2/98bhnyC3hlzFsHVtKPRKJFdgKPGxW2WiW/vghtbgL+w/
	 DgdC209c/3z1z9IVImhsjOhNunWJTOeymjkrCMS33GV9THwa1yuGQkaLqil/789uIbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795495904;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=87updmtYvftZjRwxRSeCaX6t2jlzeFVH3Js+FfLSYwQ=;
	b=24AK/HcqoHglXvDMezW6PyZ/aDc+9QOK7rYVNXU3polz5u0nt1lsXRkTVBq9lErhdgBk
	 0/IRRbZQ0JM2kqptGv4569e7klMwHxOabQoAS/XSSRB9DNJ0TfTuWeaWSdkqqg/aVCfta
	 dQH6THPb52C3dYRRQ2ZP8XXWc3aeNkUFfOVliRpqP+C0QYra+0z+Hq8GhpkGadv2wxfE+
	 NRTY1s7r+z0qPpVMCQ7snT0wll+r8EDgN83EeoXKuSe7khRPdT3lAJdaDrsTRVy6/Cazj
	 vavwYLynyQxWIjCIhNhxAHIW0PdDTv4a2zGJVeZAqmwDusuu3V1ZbpYz6mS/pKuT8/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REIf7KcF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3835606A31E;
	Tue, 24 Nov 2026 04:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=REIf7KcF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C40D1F000CA;
	Tue, 24 Nov 2026 04:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795495903;
	bh=87updmtYvftZjRwxRSeCaX6t2jlzeFVH3Js+FfLSYwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=REIf7KcFmjwyQ+c7BaCW8StYPC6Qp9PjJDjMo2TYhekTl8nIN+HokMNKFTJsxjeS+
	 XOujZMDGaBddeLUn4BjyxdR0j6Ds7samofPJHpC+qQ00WTssZ+MrjG4hYQsnVPLWOD
	 3ozeLAIsgoSj+vGaJ6KRD0YW5OuhQjwP6tRs2GPsI+jx355w3bdFJfmq1hbN8ttrek
	 nrO3vY4QT4tDr4x4C+7JNmf0+odn54IOR4k80vL4p8TqY407CWWEd7jeG1lkAzVC28
	 dfUhjKBoT2sbsvBxGiBjmSpBWySs0j5j0tc1HHDlc+7OvmDrx2YIcSF0hN+ZoC8ooj
	 ad/7k36YSfhMw==
Message-ID: <sashiko-outbox-230517@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] pinctrl: Add Siflower SF19A2890 pin controller
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joseph Telaak" <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-sf19a2890-pinctrl-v2-2-a10af32bc844@telaak.dev>
References: <20261123-sf19a2890-pinctrl-v2-0-a10af32bc844@telaak.dev>
 <20261123-sf19a2890-pinctrl-v2-2-a10af32bc844@telaak.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 04:51:43 +0000
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
- [Low] pinctrl: sf19a2890: Kconfig depends on undefined
  MACH_SIFLOWER_MIPS
--

commit c544c0c631777053d6a2e470b5b23a905ec087b3
Author: Joseph Telaak <joseph@telaak.dev>

pinctrl: Add Siflower SF19A2890 pin controller driver

This commit adds a pin controller driver for the Siflower SF19A2890 SoC,
supporting pin muxing, bias, input enable, Schmitt trigger, and drive
strength configuration.

> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index dc7138302c55c..1321eb679fcdd 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -562,6 +562,20 @@ config PINCTRL_SCMI
>  	  It uses SCMI Message Protocol to interact with the
>  	  firmware providing all the pinctrl controls.
> =20
> +config PINCTRL_SF19A2890
> +	tristate "Siflower SF19A2890 pin controller"
> +	depends on MACH_SIFLOWER_MIPS || COMPILE_TEST
> +	depends on OF
> +	default MACH_SIFLOWER_MIPS

[Severity: Low]
Does MACH_SIFLOWER_MIPS exist in the tree?  Because that symbol is not
defined in any Kconfig file, the default always evaluates to n and
PINCTRL_SF19A2890 cannot be enabled unless COMPILE_TEST is set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-sf19a2890-=
pinctrl-v2-0-a10af32bc844@telaak.dev?part=3D2
