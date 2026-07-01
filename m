Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B58B3B0AE3
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782889248; cv=none; b=nt1pnaugDg/HeyDpov81SY27B5ppVSl9EOzFatQOK0R2p1loZKxcfJ7vwOrwyLp4J1eT5PlOBSsztJDfeh49vRZcI9oMOvCaBP6YV7ehRy9oOwP+h0DSFy15H8WpGpsQwGJxUbyj0WiLnOsCYs4sahO7o0/1KJH5r+CQ0OEq2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782889248; c=relaxed/simple;
	bh=FNaghAsFbQcBu1hL0A0nxJoR5EC3advss/SPSVEWuxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ao2t/OFdcXtne0nPuRRwFQlKBO8sqVRJdc/Gwk9tpJwW6HI+0NsJWA0qCtAYUWbFKuPg7RG87wq2amiksD6lncjXyJZLjNA1FOikb18bWXi3qNw77yOqL7WNPfhVE8hEt7zg3GSN5QUW2htwvc799Tdvm1VWzTHqqgmOXxGscIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YuO2ARNh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YuO2ARNh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72691F000E9
	for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2026 07:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782889246;
	bh=FNaghAsFbQcBu1hL0A0nxJoR5EC3advss/SPSVEWuxk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YuO2ARNhkifLEqRBI7j7NdZnXq40CaeOqFNMpGQiwI0SP/bQnrXf52DXc5Nq817z8
	 loMIPu62bmCDSUITiZuz7ZX5DPLydilJ9nP7w5KB7x/W/KR+j9xbsAJbdiYKQf/c/6
	 b/XuB8c2saxfUkywb+JEdhfYWg/rKBNtRX7PTE0RtvBsvsInauBaRnlQ8P8ZXQ0FmB
	 bQwBYtlv9qdmCKr/LjEwp7Bnx3G+3rfvhMQNcd6ZzPeOS4SQ/e2VwOxGI/2AUis+y0
	 s7osJG01LdBfzmVxPBQXQNyE6evNdYx9yfvmtPRQgDfeC7gj2w8R3Cu4RTWZ7jImVU
	 BWFM3H8gCvIJQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39ad9c80fa8so2672261fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jul 2026 00:00:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rpr5DmQSMuzSIKYDRUPaeTvbltXIYL3EuT4CVn0Tl2346dm3hO6KiXE0DiS/zV4xHl3+Z+g2XknXxJx@vger.kernel.org
X-Gm-Message-State: AOJu0YyKDG6/NwokDp+8e974RpDMoiqLksoATEbcfJC0kBlUp5Xxyk14
	zf0jQcsVJ4LS3pfWBgJxazmSpzmepRSrhKicnDvR8Zbe/3ILANzxGjJJbwSVAMRBHKzsR9bx1QG
	cZFZOOUVLGI3rPxlS0iPVnQTBYzyhCkw=
X-Received: by 2002:a05:6512:6391:b0:5a8:88f8:9ed4 with SMTP id
 2adb3069b0e04-5aec67b670cmr65217e87.30.1782889245754; Wed, 01 Jul 2026
 00:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
In-Reply-To: <20260626-topic-8280_pinctrl_wakeup-v1-1-2ccb267148f5@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 1 Jul 2026 09:00:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLneg_hxaBbcH915K8h1aec3L2gHKMhCmmj_eZ3iOs=VJA@mail.gmail.com>
X-Gm-Features: AVVi8CdI-_vItMKJXwnRjSM6nQ88A-oDIf8o0u40FgC6OwPwBKcTIUz_nMMJrOY
Message-ID: <CAD++jLneg_hxaBbcH915K8h1aec3L2gHKMhCmmj_eZ3iOs=VJA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc8280xp: Add missing wakeup entries for GPIO143/151
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 3:08=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:

> Pins 143 and 151 were not included in the PDC wakeup map. They are
> normally used for PCIe2A and PCIe3a PERST# respectively, so they're
> unlikely to be excercised in practice, but still add them for the sake
> of completeness.
>
> Fixes: c0e4c71a9e7c ("pinctrl: qcom: Introduce sc8280xp TLMM driver")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

LGTM Bartosz will queue Qualcomm patches, but I see he's
already on CC albeit in the qcom address.

Is this an urgent or a nonurgent fix?

Yours,
Linus Walleij
