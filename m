Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5644BCB8
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 16:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781626460; cv=none; b=Idn822YtqFIYiJNtxGTuZIguu7VU25LenAjPoYGO7a6DkMCqDWKn/+QrO/QufP8Gp/3cmr4FXZriWsULx0XgaBXFStyOp+tXUmYRFlFBC74b1MUnsZZkqwY6mVpAGOOFikYTkXVyguWpAtmXENYbUOpN2bzwFMbCcxqDbkpeJE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781626460; c=relaxed/simple;
	bh=EAQw3UKn4KppMBnCMb2MlKJYL4Zr7xDqiYbKLp83X00=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=mR6YxEVmTtNTtHmVStDE16j3FO3cDHFfb3YBY6MTu58/CQJQUvJVxMYYPU8CzAMDGP5/mUV87syuQa4S+EiAMfJC+EJc7EF62y1DqSx4ocqFsfQ93IhMP08LSxnnYm64nq6IK+fR4Cj4af5q9znkXnCOcTjtip6+W+MNOZTl+S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVHda4QG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVHda4QG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 373B81F00A3A
	for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781626455;
	bh=EAQw3UKn4KppMBnCMb2MlKJYL4Zr7xDqiYbKLp83X00=;
	h=From:Date:Subject:To;
	b=BVHda4QGPFqRb+ga0c+EO8XFxJh/mcc8z64PFY1G0X29s4dCrr7EeFpKgHk75cuKT
	 DDB7VJg3BlY25e8LfLKdbpGWQ2KJn9jn/UhNikuSdFcbF50R+asu0eeHxo+hKvC7Wg
	 BImHmPxdH24+R56AnVkZGgHXTUXfunBAffUscDRM5LZyG1D/CR1hCNOW5LckMihnE0
	 +HWK6/N+yRMGQQ7c0If4wrmA4W2G95O46y7mt3tunJh4OGHb85HV7KiSf33E7encm8
	 kf3gTRZ9NRRvuyU7Q1/2fwoydYyIj/wlMYbejzDwscFnpgUI+pAxKPlTJTzqlGi4am
	 6aSwBBoDXwXnw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aa68d7d757so4161176e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2026 09:14:15 -0700 (PDT)
X-Gm-Message-State: AOJu0YzwFALgLJRFe0tl7cMBpr2pIG6Cv3eA89CjSSxeOHBOwysoi0gM
	KkbXwBdO3GgisPBDrMgtjMVM696fLRZDCwGoCv1J8FjQ5AKtBngJPJpyyq8dIPF3vK6xFj/rVLx
	Z3u2k3iofUe1LiIZmGO0erlorqiOiAgTuHL5aE0p0Dg==
X-Received: by 2002:ac2:51d1:0:b0:5aa:7363:820c with SMTP id
 2adb3069b0e04-5ad46fbfc61mr37614e87.10.1781626453939; Tue, 16 Jun 2026
 09:14:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 16 Jun 2026 18:14:02 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfgV0TbA-6cezd2_Hc2PLFchfZC_tJptrtAPwNHT_U2LA@mail.gmail.com>
X-Gm-Features: AVVi8CcIA2DpTvZLtJJQg1cNjKQAdY2tgtj-YpElYcBXnt6aXvGvFkolyJkyir4
Message-ID: <CAMRc=MfgV0TbA-6cezd2_Hc2PLFchfZC_tJptrtAPwNHT_U2LA@mail.gmail.com>
Subject: [ANNOUNCE] libgpiod v2.3
To: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

I'm announcing the release of libgpiod v2.3.

The biggest new features are the change of the build system from
autotools to meson and the introduction of libgpiotools which exposes
functions previously accessible only internally to gpio-tools.

For the full changelog, please see NEWS in the top-level directory of
the source tree.

The release tarball and the git tree can be found over at kernel.org[1][2].

Thanks,
Bartosz

[1] https://mirrors.edge.kernel.org/pub/software/libs/libgpiod/
[2] git://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git
