Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E911A1A682C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 06:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790837536; cv=none; b=UMMtsNkYGlPHhFju+N1nIpxbvxJ3FGosVz2UzYR/9DJB+C5tuq8fZq69mTC8ZnvajIY9hKUQiH6Sr0Ki9o6xstVgsjLJ3rbmvzDRdaWL+velRXW4GXlEHmU13Irp/aqBgd1USFdX8KNJP1VCRxAxMgXHfg0xvrttTT6JzbEh+R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790837536; c=relaxed/simple;
	bh=s6KihODjWLcvTtrTaXOHXpzKQIJ5jPP6ueTaOR+MOFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eu4g3IF7B8mknLAFwFCMzJg+ZCkN+w99HC6iYelQKTQR2bOCSr62zyyNH8zEsZSyPDgks98kkjoI/fc8MqANMINMqtOIqviJetLyhwojoPPstzwB2wmZVYhMcubnN2BwnvnvU4GaabhWWIrIyE2ng2jWGy1FkYRJyyVwtgR+d1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhZcfM6D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhZcfM6D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 893EE1F00899
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 06:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790837535;
	bh=s6KihODjWLcvTtrTaXOHXpzKQIJ5jPP6ueTaOR+MOFs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KhZcfM6DIjfrK5ZgFKYgFHNMBc/Rb5o7lAsP842M8gbeKoYiv/AwrorJ3nHqmZ1z7
	 VG2H1cP47qWxmRDVpTWDyB/1wUj13l1R/6ydb+SMz5kNGQWZ2CURrA/vOOTrPM4unz
	 fBJZaym5bvFLky3T6EKLy5CUZJZzt+SsXr8hGpRtgKP3oH6uIMzB3SSgoG/jzJctAH
	 7Ns8vFFNkyXiwV73R/KGIfWMew2RcQcmHvwQew79JCj8QNZR/8hu5Zo1NXxizPzQ3G
	 t0h/1QY/04+U+meozhdjMjOSdiRFcThUI+jMPCVKQ4Fuk1Kz/gUqmdiAsMeJ9xe+1a
	 zgkQcq9U+e6ng==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a3156692c6so49544411fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 30 Sep 2026 23:52:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzYG/dqbhJK5RA7/NlcbB8t3bM2BTLM2BniIRG3FPsAUPtRbV6hNO3FqvmZlaJZ+Ze0NgxickzHXbIo@vger.kernel.org
X-Gm-Message-State: AFq9FYLyIgNBcM0s4ydo/Wcc4H+kZx2DFMX6EIED1PVexcl1/vrUNihJ
	+vMhTSMa5FN/c0OzBv/sb1dl2q0iz3TF5LhJV/C+gm9RqrTWXBWJOPFEQaFKxJSdUOTsfxdVztM
	izsR+9WiOoDNEdkzIJ3do9PLEYpRwnJM=
X-Received: by 2002:a05:651c:2122:b0:3a7:7dfb:612a with SMTP id
 38308e7fff4ca-3a77dfb62afmr8856271fa.25.1790837534303; Wed, 30 Sep 2026
 23:52:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789983244.git.ukleinek@debian.org> <40e52e7300313b33d7c49e9edea71ec98808c7fd.1789983244.git.ukleinek@debian.org>
In-Reply-To: <40e52e7300313b33d7c49e9edea71ec98808c7fd.1789983244.git.ukleinek@debian.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 08:52:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLnFzWzPHDjBHgEzos0p9zq7o0pBN4hodPufFq_dfcY-vg@mail.gmail.com>
X-Gm-Features: AclHuK92sAD3SPcjdSWOlOd38PzFSOQ2n0p6YEgCyXxEh75uGXrlADVj-sR7rzA
Message-ID: <CAD++jLnFzWzPHDjBHgEzos0p9zq7o0pBN4hodPufFq_dfcY-vg@mail.gmail.com>
Subject: Re: [PATCH 1/4] pinctrl: axp209: Drop check for disabled devices
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@debian.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 21, 2026 at 11:42=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@de=
bian.org> wrote:

> Since commit 6b5c350648b8 ("mfd: mfd-core: Honour Device Tree's request
> to disable a child-device") the mfd core checks for disabled devices, so
> there is no use in doing that again in the mfd child driver.
>
> Drop the check.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <ukleinek@debian.org>

This patch 1/4 applied to the pin control tree.

Yours,
Linus Walleij
