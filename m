Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C330C414DC4
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 16:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784563452; cv=none; b=F9yy3IhRoU6rk3Wu5gjo2DwnuMHPtjXeNe/5OmpLp/rh7mvrldpIIbtpuhdNu6Aje/Gbd9RxQeXW0sIpUmTWQFiT45U8xtBhKf6sLm28+38QSE9CW3e/nZ8MsBRMVHvGCsqvJA9Fs9VIOwxW/InFasoEWlr8YC7d/wqkfkY+WTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784563452; c=relaxed/simple;
	bh=u3z+lHD5m7/qFz7kQW7VowSbBq/fycf2z0IDWgC6UQo=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oPRWdcBm4E2qn+1sGrr+jz5KC4/3gFkX4xSbFe4p0ArtzX0Dp4GaVeL7I77fBqAthm3+PwivW5euUzaawAzW+PsJGKODW+UhEBaczoEpO63ymBITsKwrUOuo1J1ggmAETQFoood0qaQpuuPiVMLyWa2Rw+OPj+lQ+j7MYG9yMPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TenWakaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TenWakaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABAC41F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 16:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784563450;
	bh=u3z+lHD5m7/qFz7kQW7VowSbBq/fycf2z0IDWgC6UQo=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TenWakaHQXZLPErPCHKrQngLteyv7OcgYAF39bxdrthS9qyPHcpOmz9JkYH3TXhIZ
	 MQUXGRdZLqrzMw0B5sFJPfcFl1aEeVQ0mfYeOcUTX+/481ul+MUzRTKLH921/A+IK5
	 fzeSGLYHodmOfjhKmWA3iGsT/nQeAIEzLIp81VqZGGiee4oYClRQQDrrNPr/9W8vSe
	 Glt49Gqm7Mo1S3ccasOxkX+tOUFUik+1QRKumGmFiQqcgzR5gB6p6GQb/Ok014p36e
	 fHWy/zrWJrMbTl2scEir+PZn+VtieMbb5ROcy4C1yX36ehDKY7r4XLuHJf0NXYCaZa
	 1OCTXY+DsXDbg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c94fccf3eso64019641fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 09:04:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpERQ0ZsQ+DgYUT73lZyEAfaWdtULWpJ6eqXIyE7pDC/Akwde0t1/ue0XVZ0TPHccBKSWoeAaLysEJJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwziS8MNY/gVX7zx7DJ5rxD/5skmbhQoEfqb+DD3EoS5MKS5qHN
	J/ChmXC76TKVPcUGVqbdXI5C5L6nCID7M2NxDQVDr+eT0/PU6+b8utZo88hLC5Wgqo5G3ib87iG
	eHOAcmV3WXXBONOcLkVuKvgJ74n9/AugST2feDYy05w==
X-Received: by 2002:ac2:4ac5:0:b0:5b1:51f1:594f with SMTP id
 2adb3069b0e04-5b28f9a58b4mr2058147e87.38.1784563448908; Mon, 20 Jul 2026
 09:04:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 09:04:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 09:04:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <44ee60ff-c7f8-4ca7-ad65-7b610ad13d24@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com> <44ee60ff-c7f8-4ca7-ad65-7b610ad13d24@kernel.org>
Date: Mon, 20 Jul 2026 09:04:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mf6tohNxQ40AAcx=MXb7ZQN2mj6j4LJ=4V4ZpQfPktS3w@mail.gmail.com>
X-Gm-Features: AUfX_mxOVg1PhmmsBrl72jslVLexlQFkurPRt6iAzfj_5V2DjRA_XPcfkRV349s
Message-ID: <CAMRc=Mf6tohNxQ40AAcx=MXb7ZQN2mj6j4LJ=4V4ZpQfPktS3w@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and
 Hawi LPASS LPI TLMM
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 15:54:41 +0200, Krzysztof Kozlowski <krzk@kernel.org> said:
> On 20/07/2026 15:42, Bartosz Golaszewski wrote:
>> On Mon, 20 Jul 2026 15:05:07 +0200, Prasad Kumpatla
>> <prasad.kumpatla@oss.qualcomm.com> said:
>>> This series adds support for LPASS low-power resource (LPR) voting
>>> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
>>> platforms such as Hawi.
>>>
>>> On such platforms, LPASS requires LPR resource voting via PRM to keep
>>> the subsystem active. This is handled by adding a new clock ID and
>>> support for PARAM_ID_RSC_CPU_LPR in q6prm.
>>>
>>> Additionally, a new LPASS LPI TLMM block is introduced, requiring a
>>> dedicated DT binding and pinctrl driver.
>>
>> What is the merging strategy? Is an Ack from Mark required and the series
>> should go together through the pinctrl tree?
>
> Why would an ack be needed? Cover letter is very explicit on that
> through complete silence that there is no dependency (except that it is
> not true) so why would you take ASoC bits?
>

I don't think the cover letter is very explicit on there being no build-time
dependencies, hence my question.

Bart
