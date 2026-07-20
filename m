Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48264279F6
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 13:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784554934; cv=none; b=DGG3/A894Dra2aEnRvZX1PRPJuSizxykPaii5ZMwdHHUM0kFsxpRE/E3JkhTKt7CZzWwxbZ+3bcOH/DYSgwESPiiJs0RYjxoXVfrczV8doA+GwL3bQF+ckKN2lpZcjxziuUIWA0w6HjrY+j9DdqhtXOTgNAcizT5R5OJG42JmbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784554934; c=relaxed/simple;
	bh=AufKo+x9e+YTdFLLkWDq/9s35hno6ztNd/WNA1wwc3M=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sea+nyXBfF4PY8Bl6P0kFU/LUP/fUtWfsYlWqWsDChw7PhvzEDYUgKUSzEpb+hvzZxYeHGNqQOTgcFil9yiO1U0xSeMSK4MuDahnKRwe0LgnxQ6HbXaL8t9zxhBCr/R6LhJIwph4PDw4g22pkE/KDt7oV1MrDgIBLai8mXP/iDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krAYSCer; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krAYSCer"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02ECE1F00A3E
	for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 13:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784554930;
	bh=AufKo+x9e+YTdFLLkWDq/9s35hno6ztNd/WNA1wwc3M=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=krAYSCerPbAECToptJptyTSvTQt7Kqimf8k+M4PHZeg6rRF79l5bokUGb5Bm5N0A8
	 G+9sSA6KjlEz4F7A1BXsYQJ/RXnqf1kUsNeAqhCZnbfS7cCJHACJdeoBBip6HMlvED
	 uHGd3QwRKS/e61Ck1rt4R3Dag+/GXhyeBFARYWJ2yEXuANbNUSB5gkjF+KWLvkfFNB
	 cGRJ403bqJjvtVE+j7FG3oCkLdqEcATk47NMOQZc/myax3lbpFx7BEvMduC8b8UK21
	 rHNp7EiK/d0IjT5BABx0nbBaJ4Afs8PjeCpHanZWmtx0oXz7QyrSS/pVpLwfzYPDl+
	 UtaSQw5TblhNw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b01146b205so7515854e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 06:42:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqd9eBHnBJH0Smr3YHIUpDemTR9RfY5mWIfF+Mo1P7rbOdusQoe2tbXU3Q4ntFjGrmIEibgvueiPvHW@vger.kernel.org
X-Gm-Message-State: AOJu0YyhapFquyz3kAEwRQWgKCDzXOTK3s2yqr9cQxUUm0B0DgKdEqjs
	j+qyxoStlq8MX8Vn8P8/UxHBH2A2GjAbC1dXcv3cIiD6o2cs4owe3roScGKWZ9KEb450YZfSGVS
	3h5HPOvYmaD0og1SWbNJRZ7ewxfEjG+iJn+oPsz+LmA==
X-Received: by 2002:a05:6512:696:b0:5b2:9f9c:4634 with SMTP id
 2adb3069b0e04-5b29f9c46c3mr777376e87.45.1784554928648; Mon, 20 Jul 2026
 06:42:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 06:42:07 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 20 Jul 2026 06:42:07 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260720130511.493295-1-prasad.kumpatla@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 06:42:07 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com>
X-Gm-Features: AUfX_mzkKRJxqWtXztybEccZih4vaheradj3-Hfi7e4EOBdahV046NLAZZdxguU
Message-ID: <CAMRc=MfvfVvJ4anwY5WZUr5K8fSGkcvejah72fUDLc7ZC59jNw@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] ASoC: qcom and pinctrl: add LPASS LPR voting and
 Hawi LPASS LPI TLMM
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 20 Jul 2026 15:05:07 +0200, Prasad Kumpatla
<prasad.kumpatla@oss.qualcomm.com> said:
> This series adds support for LPASS low-power resource (LPR) voting
> through PRM and introduces LPASS LPI TLMM pinctrl support for newer
> platforms such as Hawi.
>
> On such platforms, LPASS requires LPR resource voting via PRM to keep
> the subsystem active. This is handled by adding a new clock ID and
> support for PARAM_ID_RSC_CPU_LPR in q6prm.
>
> Additionally, a new LPASS LPI TLMM block is introduced, requiring a
> dedicated DT binding and pinctrl driver.

What is the merging strategy? Is an Ack from Mark required and the series
should go together through the pinctrl tree?

Bart
