Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518275;
	b=0Sd0lUK62aa4vaWVpJcr1gCAnDEtqKE5Yhjzp/4KkFXmHPJPsgg2dwhPy7rDcQ77e+q2
	 XZL7zk1pyWeZCPgPWeN10Lkf+dhSaL0r5A/8wih1+UPrOKkKWTGclGDUtVy7DmxxYAQnF
	 cu2rUVsPRbdCLznvxdBupwfOxcIGb+eQ8xu9swNJWHlMq+uHjxdzisIId/TO4GfNfjuzQ
	 iQ5ElAzd0Im9eDDDYyOY7lXMte2jou+HL58QAQobBemERNjoefkl2KqCXUadqGGN6+dtz
	 okQj7zxBT7C4Yp8BpV9C04lO10DtQgsZvDk0mgvawc+uMTs+Z00g01h4kveSgtE2+Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518275;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pJW/ZxB/F36nehPLNkwdKOyLRHVIwDbj3KvDBKsCeA4=;
	b=1tSETHQ9/eZtogTmEhAsmyDvIGS7UPmvss+sB4eqrumY1hXTHTan73Rx26YuG2TxBBBZ
	 0VBrrGbwbdNuDmK+CvQrqtRRCBFUrOQMMFJG99QFJ6AgRN2Ddo0iQ0WVCTREDltO+A7fq
	 22/mlQ7W+YnQxo7u9/uAcTIfIAzmZCgvW8CD2vWWER41EGm1/dSSOTVGx9bp7x4ExcVi/
	 wZ0xCaq4SOOVakt+1E2HVB/HRZ6Qg/O6wdbof5kbsb7xbAqR1g8XWDTB+GRVMuTsdWdaG
	 anMDbRXigiAEF4DqjVaTqNKqSJNJs30UOWH8Ni6xztZakCCwUY/BcEUQHPyJK2xlXtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcnE6eco;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48FC606A33B;
	Tue, 24 Nov 2026 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XcnE6eco
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CA81F000E1;
	Tue, 24 Nov 2026 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795518275;
	bh=pJW/ZxB/F36nehPLNkwdKOyLRHVIwDbj3KvDBKsCeA4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XcnE6ecoNn074Iy7tWreb44ZXBZPWk3q2+5ioDoHJ32LKHUE5tYvP+2b9fRPGQcmp
	 Dn/swmALUzJ9MMdHc+4qii2y3mpCYSLVVMUZQnSZDgJAT5c+ZIDs+43yS35cbRKwIJ
	 NxEv074NrgvwbybolztWakwjEz+ucUtzwYXnj3L5UvIB0oqkIuyFwAN8g1ofmrc7sn
	 nY4klsqbHpvVgjNk+jdDf7Q4vLgBvCFI3xuTZtRpyBRVU/jC4x5a+KzySNrqsFLObD
	 SFxp1rWBDi8+bIp7zGv4BNzJkJ1Lx023r7i8EbfplQAbwxmCk3MiqU7xn5cDIPAlpb
	 hRaOKDg9v0J1g==
Message-ID: <sashiko-outbox-231017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pinctrl: qcom: Add Netrani TLMM support
Reply-To: sashiko-reviews@lists.linux.dev
To: SignKirigami <prcups@krgm.moe>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261124-netrani-tlmm-v1-v1-2-0f84fa251b89@krgm.moe>
References: <20261124-netrani-tlmm-v1-v1-0-0f84fa251b89@krgm.moe>
 <20261124-netrani-tlmm-v1-v1-2-0f84fa251b89@krgm.moe>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 11:04:34 +0000
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
- [High] pinctrl: qcom: netrani: egpio defined with MSM_PIN_FUNCTION()
--

commit 01a0518c16490f7c690609070f78065dd5ccc399
Author: SignKirigami <prcups@krgm.moe>

pinctrl: qcom: Add Netrani TLMM support

This commit adds the pin controller driver for the Qualcomm Netrani TLMM
block, defining its pin groups, mux functions, and PDC wakeup interrupt map.

> diff --git a/drivers/pinctrl/qcom/pinctrl-netrani.c b/drivers/pinctrl/qco=
m/pinctrl-netrani.c
> new file mode 100644
> index 0000000000000..fe37244219c73
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-netrani.c

[ ... ]

> +static const struct pinfunction netrani_functions[] =3D {
> +	MSM_GPIO_PIN_FUNCTION(gpio),
> +	MSM_PIN_FUNCTION(egpio),

[Severity: High]
Should egpio in netrani_functions[] use MSM_GPIO_PIN_FUNCTION(egpio) instead
of MSM_PIN_FUNCTION(egpio)?

msm_pinmux_ops sets .strict =3D true and .function_is_gpio =3D
pinmux_generic_function_is_gpio.  Without MSM_GPIO_PIN_FUNCTION(), egpio
does not set PINFUNCTION_FLAG_GPIO, so pin_request() rejects GPIO requests
on pins 114 through 140 when they are muxed to egpio.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124-netrani-tl=
mm-v1-v1-0-0f84fa251b89@krgm.moe?part=3D2
