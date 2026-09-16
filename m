Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 214E647A86F
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789548515; cv=none; b=k6sZ2b11NwfeFQAbMGQ2pa7ErwqfaS+pxYnz9WTUOZ/l+/STMG5eXgwmU6+M0wGhZZ8RBIwM/iMx85tDgQK4RsBKEadzfoaq5CQrr4q4ZaSw2TIY7j1o29kDMTqtSmRtyfpSuex+afi5CfecCn6MJBfy4GCTi5ctlhyNXc2XAa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789548515; c=relaxed/simple;
	bh=BDQIxDdjbU8giXlJWSw8Oz7v/Bd7kKQfnFU78GN87AE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cOEiLRVND5DUIe5ct/Pj4W2b1lGoMMtT+aA9VhoAi1MOuEuNx89xjf8+POiO7Pkkhz8GQtwBTa2rw1/2BBK1rxlkti+LoWp4RQGHpR28AIX10xtnPuSui0O+vNj0dyZspnH5t6jw1W0U9vp0Y6apJRy9AUDJsd4HGaILXZ1U9ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLoOZeRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLoOZeRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6F91F0089A
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 08:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789548509;
	bh=4Db3IRha+wCZ6ZwEwujuzd99+70XV+oYiwxYNWh+VhQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=TLoOZeRFgflgtLzH66pOWdEQfdEykbpmV5/8p0Oefq8LomrgGNP+RtY4NIbVM1+O5
	 96Lq3VsbOsHDwiXx5K3e9BMuoQAnra+tXELPtHUPyML90e7rPJplacSEcD66n9bPvI
	 8ON3IbRH90g1ytg2X4ECxflhiXZatRCcJeD/0c8g0eh/NUHUbNkpw1VumkYUyj4zdw
	 NZfrD7pnap7FhoRJw0Q911tqD7wLPyJTLQetw90X4ug0w2dSm0jKZ8Hwg0WITOYUII
	 E8BMEREo/sA9xJwEyZODXFYiGeLlNaq0Lxg9nOBSgH8N7F9Gf2nupkeMrD+Ekz3r9A
	 M+YD0v66I7D1Q==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so1472597e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 01:48:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKc1OBXhvtgqq6S2roOcUxtHDnP8HMdfAVb44rtGUcJwx0R1zhKIuXNJBXJsAquPMLVX0+Cbk749Vw@vger.kernel.org
X-Gm-Message-State: AFuF++kSC7cIlGWnbVsTXg7BzFiF8CLF8gs+0pHRirlr29E1ZFy44DKf
	uFek8pmE8T6dUBXdKqgc80y32oz64VxS/C1PokcI+IxqwhEtD+RyHTWBsw+3SDDyR/EEq1frWNw
	HWQ0JbrPXXwamdrwtrba2VRXQeI6FtNp3512Vs4gKOA==
X-Received: by 2002:a05:6512:3d07:b0:5b8:97fc:58ff with SMTP id
 2adb3069b0e04-5b8b2a9b769mr1686777e87.32.1789548508265; Wed, 16 Sep 2026
 01:48:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 03:48:27 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Sep 2026 03:48:27 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915014447.282121-2-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915014447.282121-1-shengchao.guo@oss.qualcomm.com> <20260915014447.282121-2-shengchao.guo@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 03:48:27 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mf-QgibJHeXt1dhjJT_-h0=U_zG=WD3iNzuXBvgVrHYKQ@mail.gmail.com>
X-Gm-Features: AcwNN1XUI8fANwsWCaJFu-kAC5CaX85xC2tQ1aD7w6S1r1uDvPqGpX_zlCClRuw
Message-ID: <CAMRc=Mf-QgibJHeXt1dhjJT_-h0=U_zG=WD3iNzuXBvgVrHYKQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: shared-proxy: track direction instead of
 reading it back
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 03:44:46 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> On boards where more than one consumer shares a Qualcomm SPMI PMIC GPIO,
> all but the first consumer fail to configure the line as output:
>
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
>
> The first consumer takes the usecnt == 1 branch and really does set the
> underlying line to output.  Later consumers instead read the direction
> back with gpiod_get_direction() and refuse with -EPERM if it reports
> input.  pmic_gpio_get_direction() derives the direction from the pad's
> input buffer (pad->input_enabled), which pmic_gpio_direction_output()
> never clears, so a pad whose input buffer is enabled at power-up reports
> input forever and the proxy rejects every consumer after the first.
>

Do we still even need this with patch 2/2 applied?

Bart
