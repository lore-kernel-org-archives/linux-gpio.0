Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949511;
	b=Ld6/VKYBD+21aQl+5TF7047+jtpAd9qE5aof7s7s8YdL7fOhmS6bYdpqW68jfk2+o8La
	 OZrW5GffBW0xUk57b7p2u8w9Jao7v3uGl7vLJ3gqTxZDB1q56BbLvjP+xhWLPElu8N6Lb
	 HxOrSZFubW0YiVBOlxk3XtnSPwTQsR8MFzRlu4IlonisSNQAxYV/Js139nDeky7OoeMzk
	 c+mAI9Sxbtxp1tmx5+xcAYcREmn7epr+7B6tAozbWVz9pQeJVkNezysYiTucryM3R8wcC
	 +ZuCRhVqLVJUHYwk9fJv8YRAjTx+5/S+g1tHQuV7uucm6cvTlxY/q2f1lzlEHvh61DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949511;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=5/54paWIL8ueAepMG2+NfLjyaw2eZDDP5C0HmY0jh3c=;
	b=cHW8pT+F6+f7+j6lVHTYXJyo4S4e6hXexvXbwLAnoaAwfz7JhsBKmNgPqAGOqgPiy/ll
	 B3Dwp0zWWy+j/1kR8W/0Z4leYyKHqhOdcNnwCzha/37hwHCvbrzHmsa90oKuDeOunfU17
	 +o9/4TcW7auSCJmO+OCGQjomnwa7rcoEtRfU/wlXJgR8Wkwa2E0Qv0WUml3sL1YJB06TU
	 7aw7nHLiFi5mQC2lLqJ9j1/GUgqBCFMegBT2JixqID03Dzjnw/4Gyb2uDZFr5zZmrddOE
	 HOCzF9StE3weSDdevug8UyMv7QZM7mTcM0zSyp5+CLB6IolldvviUw9HqzaaegJk6Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4IMc5+K;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB177606A328
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 07:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4IMc5+K
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 513D31F0089F;
	Fri,  6 Nov 2026 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793949510;
	bh=5/54paWIL8ueAepMG2+NfLjyaw2eZDDP5C0HmY0jh3c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A4IMc5+K7phD/whTZykDVmwmbGzkhU2XVfmzcY6Bf0O2+WFcUUI9fXMX3BAYHYvJg
	 GVByMIzPaX9CdL8MRBb+TyX/M95WWO9Pgdod5BhA/leQM9LfCsqcHyFLuLrCf3iXbP
	 wG40t7mlaeerekJ/0jMJbhRDETgaCfPakTKbvzqVOVS4i7TZ3yt9A6OlHRTOCFqVmX
	 N2j63aXUCJWGyfmJYdMvwCOCdpcHyQc8C+Px4V1+s4oON38/IrHsfFs+qaIDXm3Bg8
	 1QUh9Y+SFoF8M1M6yqF3HUspuHBgVIIdRw1cSeqeBJu7H8Z09u3SCbZGdzX8z5XVeG
	 FTRbl3v5fnAoA==
Message-ID: <sashiko-outbox-200985@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: amlogic: a4: Allow functions without groups
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xianwei Zhao" <xianwei.zhao@amlogic.com>
Cc: linux-amlogic@lists.infradead.org, linux-gpio@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
References: <20261106-debug-info-v1-1-067c5c554f91@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 07:18:29 +0000
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
- [Medium] pinctrl: amlogic: a4: bogus IS_ERR_OR_NULL() check in
  aml_pctl_probe_dt()
--

commit 52848e3d0d015ec420063e02e0337040b95e6237
Author: Xianwei Zhao <xianwei.zhao@amlogic.com>

pinctrl: amlogic: a4: Allow functions without groups

This commit allows pinctrl function nodes in the device tree to have no
child groups and ignores non-GPIO child nodes without a "func-" prefix.

> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl=
/meson/pinctrl-amlogic-a4.c
> index 39eb8cc7fc0d1..d0e3cec3ead03 100644
> --- a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c

[ ... ]

> @@ -1128,7 +1134,8 @@ static int aml_pctl_probe_dt(struct platform_device=
 *pdev,
> =20
>  	info->banks =3D devm_kcalloc(dev, info->nbanks, sizeof(*info->banks), G=
FP_KERNEL);
> =20
> -	if (!info->functions || !info->groups || !info->banks)
> +	if (IS_ERR_OR_NULL(info->functions) || IS_ERR_OR_NULL(info->groups) ||
> +	    IS_ERR_OR_NULL(info->banks))
>  		return -ENOMEM;

[Severity: Medium]
Does IS_ERR_OR_NULL() match what devm_kcalloc() returns here?

devm_kcalloc() returns NULL on failure or ZERO_SIZE_PTR ((void *)16) for a
zero-sized allocation, never an ERR_PTR().  Although the commit message
states that this checks for ZERO_SIZE_PTR, IS_ERR_OR_NULL(ZERO_SIZE_PTR)
is false, and rejecting ZERO_SIZE_PTR with -ENOMEM would fail probing
whenever info->ngroups or info->nfunctions is zero.  The original NULL
checks already caught allocation failures while allowing ZERO_SIZE_PTR.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-debug-info=
-v1-1-067c5c554f91@amlogic.com?part=3D1
