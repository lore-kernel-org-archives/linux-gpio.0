Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982459;
	b=DnEWan8+Y7i2b6SWshZVatJ/01/GkFPV8zqGWMXmBevC3fFHo0pnfpPhoosZId46qK9p
	 Diy39CKPsNZFd9EGmC26jhKhN+D6unTbqS416wc0hNcU3CM2a7wNlhfCKCGxxrj7BRQLc
	 HY4hi5d7lI0FICZ9TfU9vCv5iHYBJzD39X/DSPwxyZMrcJ/VEq7dPCSz1dygldu6BUCiv
	 Xim2IjHuEFX5IeU/f0HPiWUTkpkQ0hbm120e+iG4Zloq0tZwqJr2WxEDT8YHda4RuFcyL
	 Gr2Br7xrfqPsj8tumoHGMpdkiFoEEfjZKfG7Jov2ED4zGqsbdbQfEsC5pGbc1oRjF8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982459;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rHA92cDMiNd2/5+UcoBgOSleIB2v6yBUpxJhlvD9jwc=;
	b=CtoRI5VzNihnnOLhRzWwdgpw5XM2EXQxDGEOiXFWm29dJODXwhJocfx5whIDrMtIKUlF
	 tXqq10TODH0FYbmKalXLd4AhZpxigzX/vy6Xc1ZvhC7isAuwND0d9btj1FK1jEFYZy6uL
	 lXJx+kd670R6yaw3VeHBrUrMXfo3YKvwTttSleTsc3ka8FGX4fCMdCKYdIiNDS/8iLXAM
	 yv13dBK7mWOxQeeLjdjUPz1uEZcAUvRVeEfbW/zXJYu8UVqRT8oqNDp6t7XzH7MsbRv3R
	 owwH3xQL2QI7J0J0bbNBvZUZRbf20LUt0zvBaTPfiIatedr3Vi83208fYVb5R1BE7Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="hX1/Kfbe";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96424606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 16:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hX1/Kfbe
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3161F0089F;
	Fri,  6 Nov 2026 16:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793982459;
	bh=rHA92cDMiNd2/5+UcoBgOSleIB2v6yBUpxJhlvD9jwc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hX1/Kfbe1PWjPfSR5/nSehRh6YGe6p+efZn7DFYxW44DfQxFm/4L9ZQCig/huQ1Le
	 J1ZeSXb5YmPX3jEwPbIQw8scDXyw7l04kHGE5HUVBVQC38tmenSPhfSokXbj1ShVTm
	 h6sHnZ5KY9x2CHEZWIPh11MaU4E/A5ylp/8PVWvAXMZbK6Ie32FiZBL98uvQQI3lmQ
	 RTEPVqwERucdmAheNmcmcc0YikIZvrmM1FnZWkvc6+UVWvdxeCfM1/frHMD3KDXG15
	 PEn82fsO8wQwdlaZbo0wYvirpwIDUz0vbMkwN5vkvEBgFRgXhD189ZxL3fKUpJPX63
	 GLVIo1jpsjkFw==
Message-ID: <sashiko-outbox-201810@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/5] pwm: adp5585: Clamp on/off counters to the 16 bit
 register range
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261107000733118AdMi1NdZNf834PvT-O3bC@zte.com.cn>
References: <20261107000724697MsR-XmE4V-ADPPMr3wGom@zte.com.cn>
 <20261107000733118AdMi1NdZNf834PvT-O3bC@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 16:27:38 +0000
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
- [Medium] pwm: adp5585: clamp on before computing off in
  pwm_adp5585_apply()
--

commit 636e863f3fd6ed7ec6fcc05f5eed5bd16bc080a9
Author: Shao Mingyin <shao.mingyin@zte.com.cn>

pwm: adp5585: Clamp on/off counters to the 16 bit register range

This commit clamps the on and off counter values in pwm_adp5585_apply() to
0xffff before writing them to the 16-bit hardware registers.

> diff --git a/drivers/pwm/pwm-adp5585.c b/drivers/pwm/pwm-adp5585.c
> index 9a1dbba75bc14..da83fcd35e1d7 100644
> --- a/drivers/pwm/pwm-adp5585.c
> +++ b/drivers/pwm/pwm-adp5585.c
> @@ -96,6 +96,13 @@ static int pwm_adp5585_apply(struct pwm_chip *chip,
>  	on =3D div_u64(duty_cycle, NSEC_PER_SEC / ADP5585_PWM_OSC_FREQ_HZ);
>  	off =3D div_u64(period, NSEC_PER_SEC / ADP5585_PWM_OSC_FREQ_HZ) - on;
> =20
> +	/*
> +	 * The on/off registers are 16 bits wide, clamp the counter values so
> +	 * that cpu_to_le16() below can't silently truncate them.
> +	 */
> +	on =3D min_t(u32, on, 0xffff);
> +	off =3D min_t(u32, off, 0xffff);
> +
>  	val =3D cpu_to_le16(off);
>  	ret =3D regmap_bulk_write(regmap, info->pwm_offt_low, &val, 2);
>  	if (ret)

[Severity: Medium]
Should on be clamped to 0xffff before subtracting it to compute off?

The hardware PWM period is the sum of the on and off counters:

drivers/pwm/pwm-adp5585.c:pwm_adp5585_get_state() {
	...
	state->duty_cycle =3D on * (NSEC_PER_SEC / ADP5585_PWM_OSC_FREQ_HZ);
	state->period =3D (on + off) * (NSEC_PER_SEC / ADP5585_PWM_OSC_FREQ_HZ);
	...
}

When duty_cycle exceeds 0xffff oscillator ticks (65,535,000 ns), subtracting
the unclamped on value from the period ticks and then clamping on to 0xffff
drops (unclamped_on - 0xffff) ticks from the total programmed period (and
triggers a warning in pwm_apply_debug() under CONFIG_PWM_DEBUG if the same
period was previously configured with a smaller duty_cycle).  Because period
is already clamped to 2 * 0xffff ticks, clamping on before computing off
preserves the requested period and guarantees off <=3D 0xffff whenever on is
saturated.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107000724697Ms=
R-XmE4V-ADPPMr3wGom@zte.com.cn?part=3D3
