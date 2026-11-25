Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647118;
	b=njOI1dS0jm3crbc/kFdpUnIToTFwLigRe8KPQH46v/darTOuIF+49I67uQ8yc7AWt8rA
	 SzWyKhn4pbN3fa4V5uMHE9DNUQG5JWNKP9+NjHTOBj4q84jzGNZAgpgxJsb7HGD2REfYt
	 QtySQoQBoKiklB/ceHecDR87FoCFIG/jBoK+e7CNFp0J3ppdO870kZyW+ORwH3B1yopvB
	 /a0i9ZpuoF9HebRt5YY4Br+w5HU8Tek0m5Ahg4sRKCVtRMxgW9Om82LEgl9RXGwMqRYtv
	 ETm3qmN7EtsjpTA/m3D8yb8AI3iGMSh0NJziJxxDEQYW4+p/0KpyTsMMhq3LQHaM5Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647118;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=sMc4d4VIN6xE14pOt1WeHFSfB8E1xxqgFduw2lUV6FA=;
	b=3Cnc6aBxOhdIZoX7ESFyOLnwY2k/WCawpsrM/B1U1ySS8fkHdi0RRH11J8LqnF2m7NEq
	 E76IvW9ZVRIHSDtsIQb7kWh434CW3YnvURNibaF+QSY8lLaDIy/6aNMyiJjzwJNq/dTWh
	 Sb063a/rAroM4laYAB4sY5yRF8Ua3trGBkZM6Rn/eYzgIsEhLOFiWs/rRvJU71lfjr1M8
	 8fVcgRrvxgwhXqXL9+dE88N5va3IBDAB8pdnwK3DW6olJNWPzZq8iSL/5rUQY0326ZGpZ
	 MKuve4Lg5HBfhH7ktUZu0ZVefxFcdwXx3QPs+ZEFqDS5+G3ukW8ZifhzIHSNZIKeM7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpamoWAH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C64606A684
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 22:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KpamoWAH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F9D1F000D1;
	Wed, 25 Nov 2026 22:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795647117;
	bh=sMc4d4VIN6xE14pOt1WeHFSfB8E1xxqgFduw2lUV6FA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KpamoWAHdV8De8Hw0hDCBCXURdJTmBzKoQSArVxF5meXEmuOVKj3Whzc/XUaHrgeC
	 ii4t+p/ku4n6Ds7XXEiCmgO8BnpSTK681BZ+dOQfNaSQmdP2loLp2oGQgpLuHYkN25
	 X2t9cFrDcWp9Gxl43iUO7+tiQGXzqHSejI9Q5ZwqDcpzVdtjfxzQltxjx2CUzoJRsH
	 PQdW8UjLPZnB0laYdiCMTqWyn5CZI+9clcKO/AXFyqf3NBVKkwwZnLaT4Oere7yYhJ
	 OI+Ec6HXOUyo2XeZqo6N1sZRJaIFa9Yvl52KX8jVZGDeyP86buFA3CvGJm5c2urQrf
	 5/p2v8sIzCisA==
Message-ID: <sashiko-outbox-234296@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] pinctrl: tegra: Add register bank bounds checks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Elkin Cruz" <elkin@google.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261125222549.1447825-3-elkin@google.com>
References: <20261125222549.1447825-1-elkin@google.com>
 <20261125222549.1447825-3-elkin@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 22:51:57 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] pinctrl: tegra: ZERO_SIZE_PTR dereference in
  tegra_pinctrl_resume() [1]
--

commit 21e28d7f25582cfa017ebe0451bae69737c000a5
Author: Elkin Cruz <elkin@google.com>

pinctrl: tegra: Add register bank bounds checks

This commit adds bounds checks against pmx->nbanks in pmx_readl(),
pmx_writel(), and tegra_pinconf_reg() before indexing pmx->regs.

> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegr=
a/pinctrl-tegra.c
> index 51684c5dda349..c0b584d37a8e0 100644
> --- a/drivers/pinctrl/tegra/pinctrl-tegra.c
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
> @@ -30,11 +30,17 @@
> =20
>  static inline u32 pmx_readl(struct tegra_pmx *pmx, u32 bank, u32 reg)
>  {
> +	if (WARN_ON_ONCE(bank >=3D pmx->nbanks))
> +		return 0;
> +
>  	return readl(pmx->regs[bank] + reg);
>  }

[Severity: High]
This problem wasn't introduced by this patch, but can tegra_pinctrl_resume()
dereference a ZERO_SIZE_PTR via pmx->regs[0] [1]?

If the device tree node omits the reg property, tegra_pinctrl_probe() finds
no IORESOURCE_MEM resources, sets pmx->nbanks to 0, and allocates pmx->regs
with devm_kcalloc(..., 0, ...), which returns ZERO_SIZE_PTR and lets probe
succeed.  On resume, tegra_pinctrl_resume() skips the bank loop when
pmx->nbanks is 0, but still unconditionally reads from pmx->regs[0]:

drivers/pinctrl/tegra/pinctrl-tegra.c:tegra_pinctrl_resume() {
	...
	for (i =3D 0; i < pmx->nbanks; i++) {
		...
	}

	/* flush all the prior writes */
	readl_relaxed(pmx->regs[0]);
	...
}

Failing tegra_pinctrl_probe() when pmx->nbanks is 0 (or guarding the dummy
read in tegra_pinctrl_resume()) would avoid this crash.

[1] https://sashiko.dev/#/bug/linux-dc81d6b3-2c40-4253-b0f9-393c796e6adb

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125222549.1447=
825-1-elkin@google.com?part=3D2
