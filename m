Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838243CB2C7
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780930210; cv=none; b=ajSahDTc6/YeVdsXRegXjEbqcVdE4orNDQa6F0Gq1ZpA68sarrgM8AkI6kNHPV/eKt9SD56glMnJqXyyFhjK/O+8T3VDBXc92OwzwLSkaOgLahXjq9X8jOayEYm+4icxacfV/UU/dvNVP82e2JappUrBssBVnwyZ0LzqcQtc4c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780930210; c=relaxed/simple;
	bh=mVNzA+YimPCo/s+zQoYkCPo7qeLSIJKww/AqXzNRCrY=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W1DboR0kRzQpwUvPG8CJNDnC70CyRtePj7amDT5pE877dK15LEt+dGHDdxSAeenXSyuiXqHRlhlyWE5560cEekyzavK8pMVfCw83UKTAW1NV45v4V3mfXDQCCG/XibmRXIc1jaFNUrdDJd3kzyq0bEV0lqA5NZld26DshS1pCeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TrIIizPt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TrIIizPt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469CE1F008A6
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 14:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780930209;
	bh=mVNzA+YimPCo/s+zQoYkCPo7qeLSIJKww/AqXzNRCrY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TrIIizPtQOgkzaa+GxeDtKPfW60MyqU1ONtrYnymBFbmmpCZtxUqUup3bzaQQPPKd
	 tAj/+o7ldAPervKxCXljVrSNnnVq7o0KTup4xhChoOaINKNyD+eKPTM/73A66/a8gr
	 p76HRluvfS4WZKRcD6BcKNG/LDsXY7yAY+O7YHqa2Q5Jf/t5tBZUteik/pdG+I79+5
	 TE+eOQUzAS5FG5c6GzIkcSrNLaTUVA2ev8ohezUqB/vrIj1AxPPmPJBtJ9IAnXkhOk
	 6b0KOI24YGpsR965rKKvWQ9ja6OAaeyRFZj3GCncGEv1va69MPELTNerCcSxvgLzcG
	 68umfE9R3kV9A==
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1363fe80fe8so6238076c88.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 07:50:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/F11OX5pp6sEMTUlJ+OOAI7CVetIwEVtxbYOI+ys+lS3w/rgoeGFSkx2y4rbK2Q/PJR7PPHhJh5/te@vger.kernel.org
X-Gm-Message-State: AOJu0Yzor77N2cN5eMM92JaoZnGVqKZoBmANU0IyZ5q86SEJAzyimmC8
	n2OWPaUYttUhkp4YiyUI9ty2d7oZ69TRgz1WRaxAU7GaF4b0Pc9DTpF5XW/VHPMtdAf5aK/HUJe
	AIaOdk7DfTt+l94+uYhzivNBLFfsBQfUT4EVeItou1A==
X-Received: by 2002:a05:7022:219:b0:138:144d:35a9 with SMTP id
 a92af1059eb24-138144d3684mr5766531c88.13.1780930208569; Mon, 08 Jun 2026
 07:50:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:05 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 8 Jun 2026 09:50:04 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260607001654.1439480-1-mikhail.kshevetskiy@iopsys.eu> <20260607001654.1439480-4-mikhail.kshevetskiy@iopsys.eu>
Date: Mon, 8 Jun 2026 09:50:04 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfdwrgHU-uQ=23SOth0W69pEnWOBZNADW5V1TZehDrggw@mail.gmail.com>
X-Gm-Features: AVVi8CfLdQbnTOwyGCfZAp__4hziGPZ_SRIyQWjmiKLBoe_O8lP48fbaszTAsbQ
Message-ID: <CAMRc=MfdwrgHU-uQ=23SOth0W69pEnWOBZNADW5V1TZehDrggw@mail.gmail.com>
Subject: Re: [PATCH 03/18] pinctrl: airoha: an7581: fix misprint in gpio19 pinconf
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
Cc: Linus Walleij <linusw@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Christian Marangi <ansuelsmth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, 
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>, Markus Gothe <markus.gothe@genexis.eu>
Content-Type: text/plain; charset="UTF-8"

On Sun, 7 Jun 2026 02:16:39 +0200, Mikhail Kshevetskiy
<mikhail.kshevetskiy@iopsys.eu> said:
> Pin 32 (gpio19) duplicate pinconf settings of pin 31. Fix it using
> a proper bit number in the configuration register.
>
> Fixes: 1c8ace2d0725 ("pinctrl: airoha: Add support for EN7581 SoC")
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---

I think the term we typically use is "typo" but I won't die on that hill.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
