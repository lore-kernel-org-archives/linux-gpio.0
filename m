Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA024AA037;
	Wed,  2 Sep 2026 16:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365524; cv=none; b=Fn/p6SPp52v4fUu7BHKkuYfh9JByYdp+42AWA2p+3Lk4vUnrh6NjR3JP5IIGOEaadeEJEp/y6LuZvBlYfY6gMFYQ4pWegPls60kcqdHTOAvnyiNtLz9/cnhlsPrarOwFpGs+6jkcCB1uRao6QICWmEAfkF6FzIni01x4Rzzmo4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365524; c=relaxed/simple;
	bh=lU+/DHoXusoy6ibJb3pTDMLiuDHGgz6V++xla5rQybw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=RrynOXO3rz3Xa+UqUJIyeeeiFdk4GLHsu6lOgOAywftHmnUg4/Yzy1tyjcP7yviEOyo7IZzOm+vviAc8emEHlXme8NM5wQwSi1nwe4nG8voqLMSSPPzf4bNT3rhqbZKUTLyo2vue+iWgbqcOrDg+srv9nxSG1EDaU+f2UpBbg/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=AIzpXwqK; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=LQtkb8zE; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="AIzpXwqK";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="LQtkb8zE"
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1788365513; bh=sWZMe53HaEkPuE6YihWbgPX
	999erW1DZL4BbRTSXgB4=; b=AIzpXwqKNX4xd9hjyCJ/u4NP4ynCFZSZt3u88A9YgCbfJSk/wN
	2junusoUXlm0ArLEvZeu2vNtNSk6F9PazhXhjtvrmwzmdA9gmaNnQfehvg1tLYWjT13Yx86XCkQ
	eTGjpFEayMMJ2GSecfeAUmLGA8qxJZjdUkww8/eLlbm11ggbZJ2Io0Zqxkj8UxXXLvsodg/wSfd
	u+otOhdGmtTJWpuK6gMjju4wEjPU2Ujv5VnACqM3QIIaEw5dNx0ak63kizFuf9/wqboz0dUrbsf
	yz+qG1IPLhtOnFsmETP/qJ+jFG/fMCXqdUz4O7WXmQUrql5XbfYh+FgzAzmBRIKJy8w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Subject:From:Date:Message-ID; t=1788365513; bh=sWZMe53HaEkPuE6YihWbgPX
	999erW1DZL4BbRTSXgB4=; b=LQtkb8zEXjiJ9/N4n4Z0RFpUxLy1n6aG89X0Nsr03MXm32dr0J
	s2BXJXdusFAwZN/vzMgz4i/8eaRnwhIXMjAw==;
Message-ID: <1c059e1a-f791-4de9-87c2-cb13405b69bb@mainlining.org>
Date: Wed, 2 Sep 2026 19:11:51 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Muzaffer Kadir <muzafferkadir@mainlining.org>
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Add MSM8952 tlmm pinctrl driver
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-gpio@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
 <20260820-msm8952-pinctrl-v2-2-bf2b8b7b379b@mainlining.org>
 <7eea6a82-6bcf-486d-9c0e-5a68c34c03de@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <7eea6a82-6bcf-486d-9c0e-5a68c34c03de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Konrad,

On Wed, 2 Sep 2026 15:03:33 +0200, Konrad Dybcio wrote:
> The following is a review from my AI agent who inspected the
> hw specification and prior art/review feedback regarding qcom
> pinctrl. I read it and approve of it:
> 
> 
>  Hi Muzaffer,
> 
>   The driver currently contains function/group declarations which are not connected to any PINGROUP() entry.
> 
>   For each item below, add the function to the corresponding GPIO’s PINGROUP() definition:
> 
>    Function                GPIO
>   ━━━━━━━━━━━━━━━━━━━━━━  ━━━━━━
>    mipi_dsi0                  0
>   ──────────────────────  ──────
>    smb_int                    1
>   ──────────────────────  ──────
>    qdss_cti_trig_out_b0       2
>   ──────────────────────  ──────
>    rcm_marker2                3
>   ──────────────────────  ──────
>    qdss_cti_trig_out_a1       3
>   ──────────────────────  ──────
>    codec_mad                 13
>   ──────────────────────  ──────
>    nfc_disable               16
>   ──────────────────────  ──────
>    nfc_irq                   17
>   ──────────────────────  ──────
>    flash_strobe              33
>   ──────────────────────  ──────
>    cam1_standby              35
>   ──────────────────────  ──────
>    cam1_rst                  36
>   ──────────────────────  ──────
>    cam2_standby              37
>   ──────────────────────  ──────
>    cam2_rst                  38
>   ──────────────────────  ──────
>    webcam_standby            39
>   ──────────────────────  ──────
>    webcam_rst                40
>   ──────────────────────  ──────
>    rcm_marker1               41
>   ──────────────────────  ──────
>    accel_int                 42
>   ──────────────────────  ──────
>    alsp_int                  43
>   ──────────────────────  ──────
>    mag_int                   44
>   ──────────────────────  ──────
>    gyro_int                  45
>   ──────────────────────  ──────
>    pressure_int              46
>   ──────────────────────  ──────
>    fp_gpio                   47
>   ──────────────────────  ──────
>    fp_int                    48
>   ──────────────────────  ──────
>    us_euro                   63
>   ──────────────────────  ──────
>    ts_resout                 64
>   ──────────────────────  ──────
>    ts_sample                 65
>   ──────────────────────  ──────
>    sdcard_det                67
>   ──────────────────────  ──────
>    audio_reset               68
>   ──────────────────────  ──────
>    codec_int1                73
>   ──────────────────────  ──────
>    codec_int2                74
>   ──────────────────────  ──────
>    key_volp                  85
>   ──────────────────────  ──────
>    key_snapshot              86
>   ──────────────────────  ──────
>    key_focus                 87
>   ──────────────────────  ──────
>    key_home                  88
>   ──────────────────────  ──────
>    backlight_en              91
>   ──────────────────────  ──────
>    lcd_en                    92
>   ──────────────────────  ──────
>    usbc_irq                  93
>   ──────────────────────  ──────
>    uim3_ldo                  96
>   ──────────────────────  ──────
>    wsa_irq                   97
> 
>   For example:
> 
>   > static const char *const mipi_dsi0_groups[] = { "gpio0" };
> 
>   must have a matching mipi_dsi0 entry in the GPIO0 PINGROUP() definition. The same consistency is required for every item in the table. The gpio function is intentionally excluded because it is inserted
>   implicitly by the PINGROUP() macro.

Sibling SoCs like msm8917, msm8953 and
msm8976 do leave them without any PINGROUP() too.
I don't know what function index they map to
and I don't want to cause bugs by wrong indexes.
I don't know what to do with them.
Should I remove them?

> 
>   There are also functions missing from the GPIO table. Please add these to the corresponding groups. The final column is the function index from the MSM8952 GPIO mapping:
> 
>    Function     GPIO    Function index
>   ━━━━━━━━━━━  ━━━━━━  ━━━━━━━━━━━━━━━━
>    gp_pdm_2a       7                 4
>   ───────────  ──────  ────────────────
>    gp_pdm_1b      20                 3
>   ───────────  ──────  ────────────────
>    gp_pdm_2b      38                 1
>   ───────────  ──────  ────────────────
>    gp_mn          39                 2
>   ───────────  ──────  ────────────────
>    gp_pdm_1a      45                 1
>   ───────────  ──────  ────────────────
>    gp0_clk        46                 1
>   ───────────  ──────  ────────────────
>    gp1_clk        47                 2
>   ───────────  ──────  ────────────────
>    gp_pdm_0b      48                 2
>   ───────────  ──────  ────────────────
>    gp_pdm_0a      66                 3

I don't have access to the hw specification,
so I didn't know these exist. I used downstream
kernels as my reference for my port until that point.
This is so useful information for me. Thank you so much.
I will add these in v3.

> 
>   Finally, please move:
> 
>   > MODULE_DEVICE_TABLE(of, msm8952_pinctrl_of_match);
> 
>   immediately after the OF match table, consistent with the other Qualcomm pinctrl drivers.

I will move it in v3.

Thanks a lot for review.

Best regards,
Muzaffer Kadir
