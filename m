Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0156C2E173B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769506866; cv=none; b=n2rNpCOUekb20MBEa72li908gXSAzlIlXvBsx1L+gKqWR1VzJwPYB2utxMxgB/pOi5tcwd/GyyVKypecCOq8Wvb5K1NwT01pzvw8Ub9UY/Y5gxMtKAj6NOutXubAjsuq3PR86H1u9JYRc5CCnt/xjJ64f8MkLqY/KLYkv1e9Q5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769506866; c=relaxed/simple;
	bh=eOm7lxyY1Tc3UFUw/xoRTNbb5KRa+LpVsi+cTsx+qLc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X9jrTmGjZsJCquen12F6tGmkRr+hz3Fq7cTaSVLlLJK/u/loUiGmrqFNo/ppcEkY+eSe2YvYbB3cHCAnxG8xYwpudIUb3/IisA84Rt4m7IlHdkIMRT/4/olls7B0KM+dreVnPe8Hj4FYRpTWGoHrq87XlTIijErTJvLsEItFQ3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VqQqBU6o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VqQqBU6o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8AEC4AF09
	for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 09:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769506865;
	bh=eOm7lxyY1Tc3UFUw/xoRTNbb5KRa+LpVsi+cTsx+qLc=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=VqQqBU6oOkBOQIAHVVW9j3hspWpF3dWPTc8PDMc0z3BnutT6XrF0gEu/A5aHeC7y+
	 87PKqdGjSaJQjLG7RR+OXStps51moVlqUjIpIH9q2HdJ5VP47dOngle4zLGm+vUKl5
	 XKO5jetR1+UlqoX++ljJOtnH52HD2YahKoo2RC9xSmqY7zKiv1iSXvJMmkd2LmxfCU
	 Cxn+ca0RzOokoptk4L1xJT8n99P9A/NLJa6a5eQ1HcFmiW2DUia74m52P7lItZXV3U
	 YNmbhhYc44wfhiuUmBiVkpfajXXKCCBht6dlpN74+7gaAVuHjnNziquOJmGtspaZam
	 9bnqesQ55ImeA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59dd490be5fso7172100e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Jan 2026 01:41:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVGmW7khTyG3o4aS5uMLJUy8nrIjWnsGQ9oI59Kpmh73JrBFwJwPUc9V9QN64urz2j5FbemHLSLtUPd@vger.kernel.org
X-Gm-Message-State: AOJu0YxrqW/GRa8SnpjutA+c5CW+N5ZSv8RtJdXXcrC3uPAKGJPMkmKX
	XYbntbm6O2S8WVx3GBb8OkMiKsI5bl1T2T+VaxDeQ2bKsPH4blLwAeJ3OGhoEzyRO8W3xWpxgfz
	KPmeeM8qj77Rx688BrHpC3z5JoQ/O7soxI9e0LJh7uw==
X-Received: by 2002:a05:6512:1315:b0:59d:d659:661a with SMTP id
 2adb3069b0e04-59e0401fc28mr534674e87.13.1769506864295; Tue, 27 Jan 2026
 01:41:04 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:41:03 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 27 Jan 2026 01:41:03 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122-sound-cleanup-v1-0-0a91901609b8@nxp.com> <20260122-sound-cleanup-v1-1-0a91901609b8@nxp.com>
Date: Tue, 27 Jan 2026 01:41:03 -0800
X-Gmail-Original-Message-ID: <CAMRc=McPYmbWJuK5CJp3Q1guWJJOHYJvn46RWGs4T=QTPuSyzg@mail.gmail.com>
X-Gm-Features: AZwV_QjxuGgyv_lskuObHAVoLkrg1Z68koiUm97tVl4rp42X06QqGdyJPsB5dj4
Message-ID: <CAMRc=McPYmbWJuK5CJp3Q1guWJJOHYJvn46RWGs4T=QTPuSyzg@mail.gmail.com>
Subject: Re: [PATCH 1/4] ASoC: codec: Remove ak4641
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peng Fan <peng.fan@nxp.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 22 Jan 2026 13:44:57 +0100, "Peng Fan (OSS)"
<peng.fan@oss.nxp.com> said:
> From: Peng Fan <peng.fan@nxp.com>
>
> Since commit d6df7df7ae5a0 ("ARM: pxa: remove unused board files"), there
> has been no in-tree user of the AK4641 codec driver. The last user
> (HP iPAQ hx4700) was a non-DT PXA board file that instantiated the device
> via I2C board data; that code was removed as part of the PXA board-file
> purge.
>
> The AK4641 driver was introduced ~2011 and still probes only via the I2C
> device-ID table ('.id_table'), without an 'of_match_table', so there are
> no upstream Devicetree users to retain. With no in-tree users left, remove
> the driver.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---

Yes, please!

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
