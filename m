Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867569;
	b=lJ3ciCemFA83jbhAK10erJmCjCPLhOKMFMv87SFm1uq3mEem2w63LbkKudxh5JtCIXpj
	 crm6FMt8jv6R+8WbR9e3xyUvHLHH+ZzrPcrRdUxyAPfiL1ZfR9ZGtcijrkdsLtI9C2bgT
	 rei8lPzbbQvgoRqyvNFOZFzjKfko04kuJ33wtCo5KSZYr5xLZC5EF19II7x/666djnGO0
	 /l4hDM52pNbUv+xddRYx6+rwxrE6g/jKsGF8cuhSwPaNkoDEk/le3yteVTF/tRi/bEMLX
	 iDnLxF1/HJrEEJ1Fp7ZciRlFdZxmEI9ubQBcWpXcgVoWQNxN/1h2p+tiTu28Ibz17nA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867569;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=9G6iLyQ27qSO6+jySl/BSygI1MuIdzR4p+hafZm2OuY=;
	b=cO0+X6a3mWRnyk3+Ho0P+2J/wgedoldoh/3sVhvhfhw5fFTHt/2RKt4TW4sb83gzJfSU
	 AscUEtPt1KF5Rp53/7UvmeClgy0YKOyun/291Mthr0Yu6Z5DgqmvTD21/dzSSIKgdryTV
	 Mf8ASF5DWtPRnB8+uc/LQSKA74TkggIb/ggiiSWIHNkpe8BoIa1EkvRms0fOYjri+Fbcn
	 rh10DsxaWfo/DtbId0QeC39PFAFmiXNZ6WHnKZD3VZhadFd5qWSoRMBA/AtDV4+Dh6MWL
	 R4Gw2PttxPTji3utD2GW1Omft4pLxUQvY5/fnb699CHqTyIdTUpwkhkK2pWlRyBFnOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENBMEQYw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD01606A333
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENBMEQYw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8712B1F00A18
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867568;
	bh=9G6iLyQ27qSO6+jySl/BSygI1MuIdzR4p+hafZm2OuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ENBMEQYwUKLp+rvTag3iQxGfQvFALKFvWzDGMvkQZAE0gQHDxADfPDayM81rcu60c
	 vwsfRZ3dVO+fy1syM2n71wGVrXhYzAxuicxQEpij/IC73cnLMuzZXNI9frDB1MiX//
	 lQitXaHcfWTPQlhLNYrOyEkKm+Di1SfFfnRDPY1dj3iUHzSHxgqTN6D/9WpXY8syvt
	 WZqR5Y4pFZOi9/uAksjtwUNCI0ijYVWhetoOpa6lOsUIsXH0A1VCAmBev4GtCFx6du
	 DyDW5cC/b8nevAKCMxOpykFfTl3rUjv6zCetE9e36B+/mGwyZ09h3cOejbKuGoYDFM
	 DM3nzV+xe8DxQ==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bcb0f245e0so1499426e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:32:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBza6/fPPwS1E2oRIeZKrBi55yg3Euv3XkFJbULox+/+oOKE6rucJPnYXYjtCTCU68cGj/ze3BjQa7Gi@vger.kernel.org
X-Gm-Message-State: APuU4Z+6VAT4zZzts7wYiASEPWlztLtYDYBeOZ7NPlQVqs4GkJWQ0AMv
	BGy0LIFYejV2D61IFJi4AiooLfVHtE4zmYZR8cts3s1B+PLp/fioONUIoy0rxQtO3lsRuIsYgKG
	V+NpZbv1d1oSSfynb6GcgaN0OMmfKD/8=
X-Received: by 2002:a05:6512:124a:b0:5bf:d60c:9f98 with SMTP id
 2adb3069b0e04-5bfd9583912mr7021382e87.59.1793867567355; Thu, 05 Nov 2026
 00:32:47 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:32:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkD+j5HNA48vzuyVDxSJ+J2mYpTD_kaDAtDBYvWLV5y7g@mail.gmail.com>
X-Gm-Features: AclHuK-_e7x6gp0MSxZ4qc8ym5mKcmCBlv1VkGDlRNSYFA2jkqkO8_sgAxCWvSM
Message-ID: <CAD++jLkD+j5HNA48vzuyVDxSJ+J2mYpTD_kaDAtDBYvWLV5y7g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:52=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull one final fix for Qualcomm pinctrl drivers for this cycle.

Sadly missed the v7.3 window because too late.

Pulled in for v7.4-rcN

Yours,
Linus Walleij
