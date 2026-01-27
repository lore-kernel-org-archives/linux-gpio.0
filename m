Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D890A2DC765
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769507022; cv=none; b=P858JszUvA9PKInyMSFR+D9VhPV8wqAk6zny4IM2Zrb8SR/JOyRR/hjpjkJ9dwUJhUWdPk+ZjONka8FR4gt+DpsUrBXg9Sf5k5g+OjiyoI3MBIY71sL9EhfZ9DsBW7ay2q+GMgkDuOkgCjaETM2b/2cm7s4kXtGbJJnLdCT26DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769507022; c=relaxed/simple;
	bh=43+5PkYSSLecE9SQrt5AZOxblPUn6fLI2obB0pdB7Rg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pn7BtYkVpJ2Ta81CMldLA47QsIYsPaajtfcQfz+689DCLjXvStg4gvfFrOZFpaluqG2z3mw+d/zNzazPCmf4cUaN9BsCqHDyqYdcvpSHgDVR9SH1Hyv+G5mV3ETUO4U4WrulsC44LvoKSFdGci/e0jQKYF5DQkY/7zjmOXY74hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=natD1mSe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="natD1mSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7B0C4AF0E
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769507022;
	bh=43+5PkYSSLecE9SQrt5AZOxblPUn6fLI2obB0pdB7Rg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=natD1mSetH8Dli+imFjbLI90gUdb/Uv762wLtvqt4msRA8kIpu+wi1zlQ/E1mLo/p
	 PpN9ufEgR+Z1bka8eFPaaifhWJcdtNZxjytv8QNqgAlrUCXi6s+msBLJfqPaa4nPo+
	 m02QBKjg5EEqKlLS3may3ZtWyYl4g0/uGjoz7nMvS74PWR1B2egQU4udeLA3appSOx
	 c6jczh98DgRCNdn7hB/8mdsFo9lIVFDW/C9liBwPoPXrSzNzZv5LzbEUbc4+yGtdRF
	 nkWZjUjvcto7yX2g47h92jC4C4MgzGnOwgPbi5rCem0DLV7bBNXFYZq7+J1A8Vyn4q
	 AR7BJkpfnIelw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-59b6d5bd575so5568781e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:43:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWRN3I1PCF053sh0O0EZeMZqONh64I13k25lPWiLoR4I0tDRZ3KLcH8cztKjuxq9xNQ1LR0GbwOjcYI@vger.kernel.org
X-Gm-Message-State: AOJu0YwQIiNA6AirGzqbxxieK4t3R6NOdtKg0lx5Nf/AmvMM5AcpX5zk
	+x5kFujwxG6g8SRsrSP8Pn9UohFJ9Sttx4AcPj/WGDtyPK5WlKoREHO2mAOMjZ2FJHFfvbrbyMS
	hDp4TF09fVTjrJZ6T6Q1edpGpSbyp90nAIDYQwEwC9w==
X-Received: by 2002:a05:6512:a8a:b0:59d:d64e:b3d7 with SMTP id
 2adb3069b0e04-59e040343d1mr474018e87.46.1769507021467; Tue, 27 Jan 2026
 01:43:41 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:43:40 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:43:40 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com> <20260122-sound-cleanup-v1-2-0a91901609b8@nxp.com>
Date: Tue, 27 Jan 2026 01:43:40 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfDP0PHTm9_vzSArVr7APK7qPiqZQERkPpBFKoPQrw2rg@mail.gmail.com>
X-Gm-Features: AZwV_Qh39_2kP-cSLOqOUxaAXibtQvi4PDbgUOq2L_s8-r1mjDdVrjD7WkEZ9LU
Message-ID: <CAMRc=MfDP0PHTm9_vzSArVr7APK7qPiqZQERkPpBFKoPQrw2rg@mail.gmail.com>
Subject: Re: [PATCH 2/4] ASoC: codec: Remove pxa2xx-ac97.c
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peng Fan <peng.fan@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jan 2026 13:44:58 +0100, "Peng Fan (OSS)"
<peng.fan@oss.nxp.com> said:
> From: Peng Fan <peng.fan@nxp.com>
>
> With commit ce79f3a1ad5f ("ARM: pxa: prune unused device support") and
> commit 2548e6c76ebf ("ARM: pxa: pxa2xx-ac97-lib: use IRQ resource"), there
> is no 'pxa2xx-ac97' platform device created by machine level code, so this
> driver could be removed.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
