Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2391A3988E1
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781126568; cv=none; b=bFdWRCHk7a2/jPG5Rbtx/TKhB95QqxHznYCNnErqSXGG63AzX7jhyP4m3xzDDXFdDTzVd+akxzUq/JzeBe6vMvSLDw4gLSlKPDL+cVf9fphbtpNlgnRH2v6mza2TsjDW9B//pVQx5PcOC7w/HEcNIKEHtXR07zeYDe6VvCe55oM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781126568; c=relaxed/simple;
	bh=a/2uBk/+Nt8G5mgAtnCt+rax48M61g+xnMQQbLHERjc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U/hKQPKKTLxCUj29PA3Nu2JRPB8McqVzmu8TP+1F2Eb4YpZZc8iYEf7dMKH7lFputDejOHhA9CnKVKD7FVvetZuiPL1zdrAENoTmikZF9CnJYQdQwfu0otsqH+xiW6qX+D+Q1MVZsYGgxO54i5zc51pk2s1mThNlUqHKoDEVZSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WGjcL433; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WGjcL433"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D801F00893
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 21:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781126566;
	bh=a/2uBk/+Nt8G5mgAtnCt+rax48M61g+xnMQQbLHERjc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WGjcL433Vp0ncONq5v8jdaAxzdg4FERFKfLB8Ec6DCGKL9PgoNJ+uqfsioXE96n0o
	 i+HedIAIihOnTmCD4SuCvTb50HuI4KpRLn+vxQBNXHepjXTg2JqQwLnEqGpVPulbrh
	 RDf1/gaciEsxxPmflel7hp7oE1k4dNkTAlaF46nds7ASqCZLcWjhzdvifxIUNGYczn
	 99HN+9HYIzfRVI1EoJN0XdZ5PAl09tz1Z4u7octZnIfjGuHtcSgkw+N/141czIO/zV
	 dgJgNHSztKVSFUVeDxfdw0OJ8L3K+zUUseyrwrsgH6/4z6Ku9UML8Ldlqz2Wj1CC+Z
	 Bg/2/Uvc1Vnsg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aa7a7c9711so386045e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 14:22:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/+p9TrdhW4vBKe7Uvs9/rHvpOcAdmSKdisSnSCp3ambpCddR27QchpJjLGCPKW3M6vaDR7X6lTTqBs@vger.kernel.org
X-Gm-Message-State: AOJu0YzptW2YSvrVrpt+cngOL5TOcH00BHSQAq8WaQ6PkubFm9+qGmCY
	ufJ+Ji8t2/R4B6EaYQwZi8N5OtPPz2xTC9c8eISfcHp6ThMOU2x7l96l5izXUmSHY9SPMN8NqpI
	dB4MI5xnTOhnTVXol1IdkFvONEd0pe3s=
X-Received: by 2002:a05:6512:3a95:b0:5aa:7083:51bf with SMTP id
 2adb3069b0e04-5ad27591279mr84971e87.7.1781126565531; Wed, 10 Jun 2026
 14:22:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517134835.588648-2-u.kleine-koenig@baylibre.com> <aimZ-yzZ1hAut_KF@monoceros>
In-Reply-To: <aimZ-yzZ1hAut_KF@monoceros>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 10 Jun 2026 23:22:32 +0200
X-Gmail-Original-Message-ID: <CAD++jLme4HQjp6kWWsgtuiAfzPU5mUOHPEY0EBWF9dZSrFp=Ag@mail.gmail.com>
X-Gm-Features: AVVi8CcO4sDjl88vd9p_2o-1bvzUKwnpvJqwo41ndQVX6rEIpLLPKk4JFwgwIe8
Message-ID: <CAD++jLme4HQjp6kWWsgtuiAfzPU5mUOHPEY0EBWF9dZSrFp=Ag@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: Use named initializers for arrays of i2c_device_data
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Uwe,

On Wed, Jun 10, 2026 at 7:09=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable =
Hub)
<u.kleine-koenig@baylibre.com> wrote:

> Gentil ping! I'd like work on the patch series that builds on top of
> this patch. Do you still have it on your radar and maybe even consider
> to apply it for your v7.2-rc1 PR?

Actually I was waiting a bit for reviews but noone is saying anything
(not even Sashiko!) so I have applied it now!

Yours,
Linus Walleij
