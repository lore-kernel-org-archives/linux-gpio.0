Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982689;
	b=xOorll66jDKBxcBsbl/n4RKMw1CrWNRTrgQpmx2mZHlPyTtosJDjvMdouILtIFyYJrf9
	 s/Qg98LFrFnxio3hJptmcF9PJTOeTc9X9e2lh/9dSFeJOUousuryiirIOE29JQlF11NGx
	 7ZgsI+stsgn4B6nK47XePGljMRfILPd9xKS06dCGO9Xe9ii2Wl1WB1HIF6RmRJddllc5V
	 sL549gM4tu6YXPYAB4SW1+9cxuVa20Aj10LzDz1rhrDlGwIyVo2aR1x7pgDWSJ74IlJHR
	 Ig1M7kB41ghern+CZcFBRLsn+kmfWB0beTzuchjZa5dTea9I5HG+WvrWU8dgrkfQsbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982689;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=rvabY0Z8DsPyYCHpLZONNUDu7QrhQ78iwZkXXpajYn0=;
	b=MajaRq6hoCW7SjeyZGNxlpmJqoNCidpo7KqPndS16pwDd8J5VbL/ktTQbyrtCtQhq7ZH
	 nMAKkXHtl/SPOiQ3eMjQ3axZhki7M7ruUWybimG2ttERIPuTJdCP7fLnc5iH3FC1eV29r
	 iODQ1VGIhObWSI2X+LjZEur0SAoiBes7wKW+k7yXVw8kRUZlEYHHRHKhpBaWjdcNjPd1Z
	 X+FQXT5Vjmo7OVVUnSXXESWgTWrSX84BhLAZl0HK7rrVyNkwWklX9D1u9DT+JTOrct0Lw
	 BBgJqTDgQsfYPy8ZU+zY7WILsPism3hABdIXR3ErnSzjFvMynu2mtAdm5434Za0Ig/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iai69uf0;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDD8606A333
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 16:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iai69uf0
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0A41F008A2;
	Fri,  6 Nov 2026 16:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793982688;
	bh=rvabY0Z8DsPyYCHpLZONNUDu7QrhQ78iwZkXXpajYn0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iai69uf06el1fQQf7fxKCDQa7BLH3EI1i1jS8Fto5ldw5teSP4j7ue16mdin36Hle
	 Z00dFDz/MQlOk5nuiePo7kMEFXERChQ3CIP8TbRGCuoIfTWogGmzCA/26raMKOK8jf
	 tCrhsj+H40GELYfgylKFm2S1EXiacp2LuhZvYQ63xNXBdy4j6dRD1lH9ate4CJx08o
	 4MWGAaS6ZUc5WfyjguJM29YiW5MWiJ1E3Wg7HjDg18c/iV0fX1Hm5tLKLTVJtt/7PC
	 gba2mT2hROJ9n3xJ9fvi+YviPE8Mi9ReQJyVo/SF3PMoPA6T4Ej3OivLlwSoGa/V+j
	 P9zgLGwjo8/hg==
Message-ID: <sashiko-outbox-201825@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] pwm: dwc: Balance the runtime PM reference when
 configuring fails
Reply-To: sashiko-reviews@lists.linux.dev
To: shao.mingyin@zte.com.cn
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261107000734514kOTBjwDH_ZQx5Rq7e_WwC@zte.com.cn>
References: <20261107000724697MsR-XmE4V-ADPPMr3wGom@zte.com.cn>
 <20261107000734514kOTBjwDH_ZQx5Rq7e_WwC@zte.com.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 16:31:27 +0000
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
- [Low] pwm: dwc: inaccurate Fixes tag for dwc_pwm_apply() runtime PM
  leak
--

commit db856b4aa6941fc2e987c693ae9e69e8f32d25a5
Author: Shao Mingyin <shao.mingyin@zte.com.cn>

> pwm: dwc: Balance the runtime PM reference when configuring fails
>
> dwc_pwm_apply() takes a runtime PM reference with pm_runtime_get_sync()
> when transitioning a channel from disabled to enabled and returns the
> result of __dwc_pwm_configure_timer() directly.  If that call fails (e.g.
> with -ERANGE for an out-of-range duty cycle or period) the reference is
> never put, so the device never reaches the suspended state again and the
> usage counter keeps growing.
>
> Put the reference when the configuration fails on the enable transition.
>
> Fixes: 721ee1884883 ("pwm: dwc: split pci out of core driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

[Severity: Low]
721ee1884883 ("pwm: dwc: split pci out of core driver") only moved
dwc_pwm_apply() from drivers/pwm/pwm-dwc.c to drivers/pwm/pwm-dwc-core.c.
Should the Fixes tag reference the commit that originally introduced the
unbalanced pm_runtime_get_sync() instead:

  Fixes: 1ed2b3fca645 ("pwm: Add DesignWare PWM Controller Driver")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107000724697Ms=
R-XmE4V-ADPPMr3wGom@zte.com.cn?part=3D4
