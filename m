Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FED340963A
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411487; cv=none; b=W36kf1fImjVOW6OUXgs7qUg+zNpi9XJaWfWUi36tpEpoe/H7X0529UWhQG0ibbyXpxqzqVgC+Z0fwC5yVIcy+JjsybLe6bBs9ZhxkAXgSm5r7AfsdkZprCL6CENVE/BkxxXorVZtj2XfZ+Ko88mNIFKxeDeyGbyLb3lsALGXieE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411487; c=relaxed/simple;
	bh=V7OWRjin0cgiOYtCoB6GXiQjClXbT2S/XjK0Vy8bIHA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J/dXJZ+5zPdQCIfDFhQAyqki4xrxveu2u+qRn7HP/Y9IhHFqHiH7Z6Zd+YFEzJxpzRsEXZSxeIpX14IQ+m8NrPkB7eu3fEXYnf5LMiEm/TZjkTYV6x3rEOzr9ZNA0+99puloPbmucVhr2auhyHp1JqaZHQKf9odCC/VDAGI5Z5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kl6Wu9rg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kl6Wu9rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2703F1F00AC4
	for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785411486;
	bh=pQ8afElaPZYIadu7W056AAzxSCoB/beP+M9RAOwsZi0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Kl6Wu9rgUBAxBWaM96E3JtmKCI04Gb4dAUeG3mZc6e9TaMTg8A1l8eGfNBbHpAcHn
	 U76wJnBBxeugP4PMILlsr4hos7t4c/xjruUw53I9Wi3jTZ9TQZzt+7Ds1KO40gV199
	 0EIB96Y8AR73Q0GCq3SZeMy6WdTsfEr1Xya6Lh0p877SM2kmMqwYdbZl9zMkHBEgtj
	 YaLtNGUdgQn3z4N7pqT0JruU3eSuyrqEcTZo399NjEn/f5qfOM9qy/PPeaVdeuRGTL
	 dFd1knW0A1GBfnf/NvcoQ0MDB3DsuJLUowkJBM7I0vBTIZPQSgdfPva+HBWL7RWqAG
	 YAxaLNnBWp57g==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2aa3be376so1472171e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Jul 2026 04:38:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpOHKJCEYAVjyplPXwjJ0TxcG+3S15BUpyve1p+r6rdI6AeCIC3r3eyEYA7yCcBj71mm1HkwWtUSvu4@vger.kernel.org
X-Gm-Message-State: AOJu0YwmtxZ08jNFcL9Jcm8yWTuLUYl1HH5u1cP9sBcTvmRsLeePpfP+
	lABaw/ABVDuUgL30Lrzkp3xaun0ZeRMQJUeZhUnltEOBs1yJjL7jPU0b0GW+xT2xMKpp8a+19X/
	K3TM0XPULHNon41uNXtuoSETdROFDpmb96f409AAhiQ==
X-Received: by 2002:a05:6512:6894:20b0:5b0:ceb2:194b with SMTP id
 2adb3069b0e04-5b2db36f116mr269174e87.36.1785411484885; Thu, 30 Jul 2026
 04:38:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:38:03 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:38:03 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <bb6a9164-6dd2-4d11-a9cd-a2ae7ab43949@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfU=u7tH2r19H9Ex9uEDAb1V3Fanzi2EuqzB+iohPQkog@mail.gmail.com> <bb6a9164-6dd2-4d11-a9cd-a2ae7ab43949@sirena.org.uk>
Date: Thu, 30 Jul 2026 04:38:03 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeQRn6dSZ8KM1VGg_7sqqS7p3XjNXm-ohhU6Jm4hVJvVg@mail.gmail.com>
X-Gm-Features: AUfX_mw7XKDuIJBUfTFbP1hi1hz1AjkBP2S645XyXXNZE8slKUswvBnRqke5P2w
Message-ID: <CAMRc=MeQRn6dSZ8KM1VGg_7sqqS7p3XjNXm-ohhU6Jm4hVJvVg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Subject: [PATCH v6 0/7] ASoC: qcom and pinctrl:
 add LPASS LPR voting and Hawi LPASS LPI support
To: Mark Brown <broonie@kernel.org>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 02:22:08 +0200, Mark Brown <broonie@kernel.org> said:
> On Fri, Jul 24, 2026 at 07:32:55AM -0700, Bartosz Golaszewski wrote:
>> On Fri, 24 Jul 2026 16:17:03 +0200, Prasad Kumpatla
>
>> > The intended merge strategy is:
>
>> >   1. Merge the dt-bindings patch adding LPASS_HW_LPR_VOTE to
>> >      qcom,q6dsp-lpass-ports.h.
>
>> >   2. After the header update is merged, the remaining ASoC and
>> >      pinctrl patches may be merged through their respective
>> >      subsystem trees.
>
>> Do you really want to wait an entire additional cycle for a one-liner to first
>> get upstream? I mean: I don't mind it but it's a weird strategy.
>
> I presume the thought is to put it on a shared branch, but that gets
> problematic if I create that branch because the ASoC driver has
> dependencies on whatever is in the huge pile of stuff that's already
> going through ASoC so it'd pull in my entire history.  I suppose I could
> do the tag, merge it into my branch then apply the ASoC driver?
>

Sure.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bartosz
