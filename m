Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB1C41A569
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 14:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784903580; cv=none; b=mOeCOCbJPtV2+do4XjSs6Vh2Kq0TVEu680CHHDrQOSh2PiICEGF4umwA/YA19k88VjtzAV+FRW8fAGrGJIKsJD9oCSsy52532z5PBoEPj/DP6wxQsRSDNZ8JrbG2lfkSgHkXUMR/i3v9BmGJyPlfDekWjfjhGUymrpWkkTVMa7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784903580; c=relaxed/simple;
	bh=TrVK3xAgf8NEmlUAEO3dFXpjqc9Ja3eQp2C0bE+fWBM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4U1aK0i2pdKNCktdq70Gn9S0ahEqdghUJje5pUTpJkb8ADrrQ19PEzCZROC+DFeV4u+514tpL37ODUPSjnLIHafpGJxvXo8tBI412l6MFfvrBEmK8Wi/DWkzkAFNvW8AmEjgHpgDPGT8BULqZOOCqShqLy9FrcAZEVaFo2ddvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g2m0WPbc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g2m0WPbc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F56C1F00A3E
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 14:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784903579;
	bh=9oMWWNXv4iXXLNSmmi6+UqEshM6pQiIPMyI5OuA2LB0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=g2m0WPbclCp3BtbdptdfYOR1n7TYu1Ds/46ukeoEWYERRu5qKihEEYpfxD/yA5Dr+
	 k3wfwCNUJwnLp1XPWg5DFBazapmL1e6m59Zzb/DJYYXQTvGpRSQwm5jO+C9PNihdfN
	 NP2feMimtW+oKpkmYpLiNwyekDxcIZb9/uSsyCw4tjYY0Kz82I8lYSja9jLk4iAhll
	 qvU+4S5DxVzHuyABY03JMOO4g4L0ZXXtu+XfpBjErQvYc6kljjrBNlZxor8SgCgIfm
	 ked9B17lDJAONTHIcg3fxuqELXErez6A/YvQbrIFBBfYiY2r5ONCIHrpSNm47fV6nN
	 D7vgLOikdQWHQ==
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38759bcd877so369239a91.2
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 07:32:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrkc1QarKHjdsHw+p0NeHlSXz1S9Qdl1LQ7/F24XwQ/3a9KE6NWCImYJrV6Y9t0PJqRdqOGsv+bBmYq@vger.kernel.org
X-Gm-Message-State: AOJu0YyjTMXgx350GkBn9WgM6zKfkKLvm27a3DcYFD/SxtgMtYAcXjlY
	iZj7dgFac5aT8CXJeAUj6BiKCSE9XVcJ5fAp7v1DQL4f1yppc74+Td7aRNzIlFkV33nUxGRJy5/
	cC8oBNUsnHaxIu8WVBpkNKVPoXdqxVBXPAsLF0WXgGQ==
X-Received: by 2002:a17:90a:c2ce:b0:37c:607b:2cd9 with SMTP id
 98e67ed59e1d1-38ec65d78a0mr7290586a91.0.1784903578684; Fri, 24 Jul 2026
 07:32:58 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 07:32:55 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 24 Jul 2026 07:32:55 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 07:32:55 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfU=u7tH2r19H9Ex9uEDAb1V3Fanzi2EuqzB+iohPQkog@mail.gmail.com>
X-Gm-Features: AUfX_mxKy-BFtPHI7CTj-67OZpQPRwllkZkLnNB35Dfo2nS4aqOj6RnMmZnC0Yc
Message-ID: <CAMRc=MfU=u7tH2r19H9Ex9uEDAb1V3Fanzi2EuqzB+iohPQkog@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Subject: [PATCH v6 0/7] ASoC: qcom and pinctrl:
 add LPASS LPR voting and Hawi LPASS LPI support
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

On Fri, 24 Jul 2026 16:17:03 +0200, Prasad Kumpatla
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
>
> Dependencies and merge strategy
> ===============================
>
> This series introduces LPASS_HW_LPR_VOTE in
> include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h.
>
> The LPASS_HW_LPR_VOTE definition is required by:
>
>   - the ASoC q6prm LPASS LPR voting support, and
>   - the Hawi LPASS LPI DT binding.
>
> The LPASS_HW_LPR_VOTE definition in qcom,q6dsp-lpass-ports.h is
> used by both the ASoC LPASS LPR voting support and the Hawi
> LPASS LPI DT binding. As such, the header update adding
> LPASS_HW_LPR_VOTE should be merged ahead of the dependent
> ASoC and pinctrl changes.
>
> The intended merge strategy is:
>
>   1. Merge the dt-bindings patch adding LPASS_HW_LPR_VOTE to
>      qcom,q6dsp-lpass-ports.h.
>
>   2. After the header update is merged, the remaining ASoC and
>      pinctrl patches may be merged through their respective
>      subsystem trees.
>

Do you really want to wait an entire additional cycle for a one-liner to first
get upstream? I mean: I don't mind it but it's a weird strategy.

Bart
