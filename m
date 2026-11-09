Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220638;
	b=zqRDPeolUOXP+TvyxD9R+d/MivxO3dJ3SHqML51aZOjxwBRypijWTpDVmHzzMuM7lPOf
	 CwC6SAvryit2R+vBW05JcsQnAAVRMR+poWCOpl6SxOd2yKmmg2r1gwT9mgc1AA/w4neJD
	 HlYvDeSGc07/GvgEhcoUnNGH9DCkbbrhu2OU0nDxhApx2ZcRl5XZ98Z6rcBMsC1yUNAF/
	 bKulR3b5Ew0Q6pbCO9y0hMW7Uru3KuTJDfGly6XKiM5PeKLUTUT60lctR9fSUZnKyAsg7
	 V6NliBf1uYWGKDVRfeNuXPj5OlUhskLSZGtEEXkDpfQA3boDFPOkPGwfPWT+r+ExU5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220638;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EnmeDGD8X1zVEYM1yluOG6GufnxfyHmcv02wdJro7qE=;
	b=gSeVLL5SK5tGO6OmE3xgFJ7OGJ+qP0tm3Fh/XcppWozDYkzGo+yKFPeAV2eRi3tiYQvs
	 bOqCNUSbp8EjGzFOKPg8fIHPF2q5W7Wl1bzzaPTsGGiTAz4rQtQU35Al1yTL17fbVZ3BK
	 9eobelTmVpS5mHFve4WBfSYkrFm9k6h+a2fmi1qCUK5sH+Ajt+O/n6tXHvOrw/JuydeKj
	 hZkCWL23dcYsJwwERP1cgR6ZnkCMy6E0tFtfuOJy92LlrxFrjlIvZGjDtBz8u4iW1pl/Q
	 HKEMMclwjmR2GZAXdjv15Mk4u6/q4SblJiE29elTAds/cOfUewTMgL59TA4DkQLJD5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1SQBFpO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34144606A339
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 10:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C1SQBFpO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 926471F0089F;
	Mon,  9 Nov 2026 10:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794220637;
	bh=EnmeDGD8X1zVEYM1yluOG6GufnxfyHmcv02wdJro7qE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C1SQBFpOSRYzEsj07HNJfbskz90YPyStJYviFh7tysRCM+0JQ7YlPfgiPySG6cAwe
	 npoeTymiFh1QaWxIvRuOW4acTdLgdBrJmuiTEoH4vdUmIz8QPBsjT9k03S5beiBErs
	 a7eqHDM5+hz28MTozyILArI3wvJf6PDrFqzJf2PmCQjEgBYNO/7b5mT/3HW4Yvd9uA
	 +HzJXFZO7Eje+zGnnbGYBAMZNqNJazQemPZ1Wk/WbkZuMkViqTMVr6OjCtxexA2BbV
	 +1tUcXKW91puUUlGwFnVrwRr4qHd4CIRJNb1I4d7l+edvUAfVUMp+lctCU5AAQO4dv
	 NlBEZydUeIAsA==
Message-ID: <sashiko-outbox-204829@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 3/5] gpiolib: clear debounce period before the
 "requested" flag
Reply-To: sashiko-reviews@lists.linux.dev
To: "Bartosz Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org
In-Reply-To: <20261109-gpio-desc-flags-atomic-v2-3-c4c54b476628@oss.qualcomm.com>
References: <20261109-gpio-desc-flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com>
 <20261109-gpio-desc-flags-atomic-v2-3-c4c54b476628@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 10:37:17 +0000
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
- [Low] gpiolib: missing Fixes trailer for gpiod_free_commit() debounce
  race fix
--

commit 1841b5514ac5cdddcf5ae7cb26a7302861e4ac43
Author: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

> gpiolib: clear debounce period before the "requested" flag
>
> The debounce_period_us field is protected by the GPIOD_FLAG_REQUESTED
> flag, so it should be cleared before the flag, else it could potentially
> race with a new request.
>
> Suggested-by: Kent Gibson <warthog618@gmail.com>
> Closes: https://lore.kernel.org/all/20261105042905.GB8436@rigel/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

[Severity: Low]
This fixes the ordering where gpiod_free_commit() cleared
desc->debounce_period_us after clearing GPIOD_FLAG_REQUESTED.  Should the
commit message include a Fixes tag?

  Fixes: 81625f362497 ("gpio: cdev: go back to storing debounce period in t=
he GPIO descriptor")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-gpio-desc-=
flags-atomic-v2-0-c4c54b476628@oss.qualcomm.com?part=3D3
