Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100681;
	b=s0QJB2/ETGhIvMY8TZwvlk9jYwKbp2zSouNpSvMU2GTPm+MGknQiNi65WuniaFF55DoH
	 bdZAdyMqttGWCMFGu5F+r+MXLzzul8qKmmKNjNr5kUrWHirolFXOfwoJpHrw8vQGHvll2
	 jPWVLQhMpLbXOJhyabGiBC6aTOg/6EUqCD5JPxBiyUSSx8vSPBD+ZSuig7QnBFaUYZO39
	 0t0r2KSL6xZjjQNVezBQlm5kc1tqdqFLBRnpGcuvIsHYlVFrdv4SeitTuPfmssUhDad+x
	 Z1ntxJnLwfASnFWYOKqrKw5ghfjRRgyfxR2LCW6cwZDNL08LxlgFF2ke4a8+eDC3piw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100681;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HzM3Ak52dY4+VcEHahUyL2Ez8s1LXey16yCm0bEhJ+c=;
	b=X61OQc1OV/CBmkLfVsC0068IPXvUX4XZyjI343fyTF/jvVuSgvBR44lO8ZuawgA4owEv
	 Rvm7RHYqktneSVoIxme7Z0SI4jdVblzuUnaf5YunSE8OPAM4T8fZgv49S25tdLNw+CPWg
	 Qhqv/RKDn+CDkaDwKg+aJApx0SDh9fpUYCEpu7DZGkyYI8VeH3DowdAhIMURD+Dpj55od
	 DJwzN/jAB2PT8gsixhxSzUMSSFgVvrt8lQf57WlzFbUsc9OXP+4yIU8dbKxQ3whLJPz2g
	 jAxCPWWlwzkhDW3R/l8fOqKfKNoRpquiqeiSHLzQ3Ki163UQEsVCCgPGIdbyOCtW9Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ZPboP/BK";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93747606A322;
	Tue, 27 Oct 2026 11:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZPboP/BK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD7C71F031E0;
	Tue, 27 Oct 2026 11:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793100681;
	bh=HzM3Ak52dY4+VcEHahUyL2Ez8s1LXey16yCm0bEhJ+c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZPboP/BKpL7m16nKYOhuuHXJtufM/2gLU3gLsweCYO/i7RA7Esci99za+hqaBUaUT
	 63kTTk8rwGGgXk+WNqD4wKfwPhVb8XksZecrc9O4fV+FmJQYCO02cEzYpwQEKpffs1
	 J1DOasX15yBrgv8JxorIW4DVOeXcQmlLhVL9eQsUNVg6Rm1bFbZR29AObfOtqLyNw6
	 xLvSIJk2dfcVnBHmJdNG9K+maaQQnBTaW46furxximNleWkutP0sYoGxP4fzTfMlB/
	 6Qzy5Kk3boOSZ5gUF73HrELfcT27oFqDutH0n208EBV+2FCbazT1fHmHpQNEqBNZKV
	 M6ukuiYIieUQA==
Message-ID: <sashiko-outbox-186448@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/12] clk: qcom: Add a driver for PDM GP_MN
 fractional clock divider
Reply-To: sashiko-reviews@lists.linux.dev
To: "Taniya Das" <taniya.das@oss.qualcomm.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261026-b4-pdm_clk_gp_mnd_v2-v2-3-ff8e4bc8d567@oss.qualcomm.com>
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-3-ff8e4bc8d567@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 11:31:20 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] clk: qcom: clk-gp-mnd: bogus n_val and duty cycle in gp_mnd_clk_=
recalc_rate()
- [Low] clk: qcom: clk-gp-mnd: 64-bit division in gp_mnd_clk_set_duty_cycle=
() on 32-bit
--

commit 6c57ad9a80b314f181dd85480b5578fd6c5deb24
Author: Taniya Das <taniya.das@oss.qualcomm.com>

clk: qcom: Add a driver for PDM GP_MN fractional clock divider

This commit adds a standalone platform driver for the Qualcomm PDM GP_MN
fractional clock divider, implementing rate and duty-cycle operations
over regmap with runtime PM clock management.

> diff --git a/drivers/clk/qcom/clk-gp-mnd.c b/drivers/clk/qcom/clk-gp-mnd.c
> new file mode 100644
> index 0000000000000..818726c02b615
> --- /dev/null
> +++ b/drivers/clk/qcom/clk-gp-mnd.c
> @@ -0,0 +1,333 @@

[ ... ]

> +static unsigned long gp_mnd_clk_recalc_rate(struct clk_hw *hw,
> +					    unsigned long parent_rate)
> +{
> +	struct clk_gp_mnd *gp =3D to_clk_gp_mnd(hw);
> +	unsigned int m_val, n_val;
> +	int ret;
> +
> +	ret =3D gp_mnd_clk_runtime_resume(gp);
> +	if (ret)
> +		return 0;
> +
> +	ret =3D regmap_read(gp->regmap, GP_MND_MDIV_REG, &m_val);
> +	if (ret)
> +		goto out_runtime_put;
> +
> +	m_val &=3D GP_MND_MAX_M;
> +
> +	ret =3D regmap_read(gp->regmap, GP_MND_NDIV_REG, &n_val);
> +	if (ret)
> +		goto out_runtime_put;
> +
> +	/* Reverse the 1's complement encoding: N =3D ~NDIV_REG + M */
> +	n_val =3D (~n_val & GP_MND_MAX_N) + m_val;
> +
> +out_runtime_put:
> +	gp_mnd_clk_runtime_put(gp);
> +
> +	if (ret)
> +		return 0;
> +
> +	if (!n_val)
> +		return 0;
> +
> +	gp->m_val =3D m_val;
> +	gp->n_val =3D n_val;
> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate * m_val, n_val);
> +}
> +
> +static int gp_mnd_clk_get_duty_cycle(struct clk_hw *hw, struct clk_duty =
*duty)
> +{
> +	struct clk_gp_mnd *gp =3D to_clk_gp_mnd(hw);
> +	unsigned int d_val;
> +	int ret;
> +
> +	if (!gp->n_val) {
> +		duty->num =3D 1;
> +		duty->den =3D 2;
> +		return 0;
> +	}
> +
> +	ret =3D gp_mnd_clk_runtime_resume(gp);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(gp->regmap, GP_MND_DUTY_REG, &d_val);
> +
> +	gp_mnd_clk_runtime_put(gp);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (d_val >=3D gp->n_val)
> +		return -EINVAL;
> +
> +	/* DUTY stores the low-phase count; report the high-phase duty cycle. */
> +	duty->num =3D gp->n_val - d_val;
> +	duty->den =3D gp->n_val;
> +
> +	return 0;
> +}

[Severity: Medium]
When GP_MND_MDIV_REG and GP_MND_NDIV_REG are at their power-on reset value =
of
0, gp_mnd_clk_recalc_rate() reads m_val =3D 0 and computes:

    n_val =3D (~n_val & GP_MND_MAX_N) + m_val;

which evaluates to 8191. Because only !n_val is checked before caching,
gp_mnd_clk_recalc_rate() stores gp->m_val =3D 0 and gp->n_val =3D 8191 even=
 though
the divider is unconfigured and the returned rate is 0.

When gp_mnd_clk_get_duty_cycle() is later called (for example via
clk_get_scaled_duty_cycle() or debugfs clk_summary), the !gp->n_val check f=
or
the 50% default is bypassed because gp->n_val is 8191. Reading d_val =3D 0 =
from
GP_MND_DUTY_REG then reports duty->num =3D 8191 and duty->den =3D 8191 (100=
% duty
cycle) instead of 1/2.

In addition, during clk_gp_mnd_probe() -> devm_clk_hw_register() ->
__clk_core_init(), clk_core_update_duty_cycle_nolock() invokes
gp_mnd_clk_get_duty_cycle() before core->ops->recalc_rate() is called, so
gp->n_val is always 0 during initial registration even if the hardware
registers were already programmed prior to probe.

Should gp_mnd_clk_recalc_rate() also check for !m_val (or n_val <=3D 2 * m_=
val +
1) before caching gp->m_val and gp->n_val, and should gp_mnd_clk_get_duty_c=
ycle()
handle reading the hardware state or validating M < D < (N - M) directly?

> +
> +static int gp_mnd_clk_set_duty_cycle(struct clk_hw *hw, struct clk_duty =
*duty)
> +{
> +	struct clk_gp_mnd *gp =3D to_clk_gp_mnd(hw);
> +	unsigned int d_val;
> +	int ret;
> +
> +	if (!gp->n_val || !gp->m_val || !duty->den || duty->num > duty->den)
> +		return -EINVAL;
> +
> +	/* D =3D (1 - duty) * N, giving the low-phase count */
> +	d_val =3D DIV_ROUND_UP((u64)(duty->den - duty->num) * gp->n_val, duty->=
den);

[Severity: Low]
Since QCOM_CLK_GP_MND depends on ARM64 || COMPILE_TEST, this driver can be
built on 32-bit architectures.

In gp_mnd_clk_set_duty_cycle(), DIV_ROUND_UP() expands to plain C division =
on a
u64 dividend and a runtime unsigned int divisor (duty->den), which causes a
link failure (__udivdi3 / __aeabi_uldivmod undefined) on 32-bit COMPILE_TEST
builds.

Should this use DIV_ROUND_UP_ULL() instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-b4-pdm_clk=
_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com?part=3D3
