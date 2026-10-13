Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE6B51991F
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 15:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791904169; cv=none; b=Vi6lQ706RNCy/Ezt40EFXI+vzfHmwpZBJ/VmLig0BtzY68tnD1CwKRwJDfldDms5cMlfNa9OoNPe10f4Tr3CgoPUpBIKyV5mDX4ZkRPIcPvkefLovS3Y99IeZSionfi8RlpxpnfhX9kJHNiY7HHtN3l0eXJnt2/SMrsUTs2FGEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791904169; c=relaxed/simple;
	bh=JzJnXJjt5k2C2q3Rf1h7pvRovHT6SYws8/FAHg3gXmg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IH/8a+s2dCDoCqoDoZDErFCGP5q8lbyLkztpZAVUgIz9sBqvbw45XCjDw22aLylG3IY+Bt/r8S3MvKQMxRRJAvijhJbbR+WJeCRJbbWNd0bPe0xp+adI+rMAvDVK8tA8aikAc8HXSt1QSQU3IMgb0gfUUtV0mqZao0LaH7aF+40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=myMw8iUM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="myMw8iUM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51B001F0089D
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 15:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791904168;
	bh=JzJnXJjt5k2C2q3Rf1h7pvRovHT6SYws8/FAHg3gXmg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=myMw8iUMj8ew/uSlXxWwXPm4SGmUAylivxBH3Gtr5ryhM1aXUudamajMyG1T0//yX
	 wjfRLyWFmmxEwYVxFE4cyRZFLN7XXUuHq8TfDtwYWFMv0qIFKBPdWwgguJHYvcTPJJ
	 Og48A37aKhX7l5Q0gHD2wZCLihKWyDu4C5qYcqjVwUfxliCuZzgMunHcSupxf1wfCq
	 tbCn6aowlBmrVsXcttEQrEmdxJINOfhfjeeNOsIMu30QcV+naUhhyM7h5kBm49qCxD
	 1hWBzRbDtObqnYMs0h7D6tNOnZykf+Kw11BAEj6WhqkwSmunmMYakW7L1LsaJbOIlG
	 NTwaavOCFr1Kg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba41ea31ccso3478162e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 08:09:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBypH8fStYFLua7e2LZgrqOleTYVl/XYTdW0LgYANedzk2qxJffJGcUILUWO8e9TLEV+Ok9QCzbeP//U@vger.kernel.org
X-Gm-Message-State: AFq9FYIiMHWyh7lZ99KKft5WL9Lwl20TAbH1Bx9hRxogLa9LSlST1s0V
	M/dpQMxnmva5+Gs7/A/uvZLK3UPYAvcbRLvV9gpVBJDjCsNmj+6EuUZ+uzVmdl/cC5pRiIIYMxG
	Xxnz67BupIpy6BFKMBNErsPqYHXZi/2POYsjwf7fPAA==
X-Received: by 2002:a05:6512:6c4:b0:5ba:3abe:425b with SMTP id
 2adb3069b0e04-5bcde5aa70bmr4129065e87.40.1791904167039; Tue, 13 Oct 2026
 08:09:27 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 11:09:25 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 13 Oct 2026 11:09:25 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <73c4ceaf.9c2f.1a13599e8ca.Coremail.zl020895@163.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009-cv75-gpio-v1-0-5836bd438423@ambarella.com>
 <CAMRc=MezU71ByUoO-GMxSwsFsGZTUmQisYYrYEwtdbwyFiEqsw@mail.gmail.com> <73c4ceaf.9c2f.1a13599e8ca.Coremail.zl020895@163.com>
Date: Tue, 13 Oct 2026 11:09:25 -0400
X-Gmail-Original-Message-ID: <CAMRc=MeDEfaqciXt+u6a7riof=KObrWB2qJ96LjFEzoGwi=eSQ@mail.gmail.com>
X-Gm-Features: AclHuK9_9YzpLfejzw7rn-1jwhqIoegOlkZSxzlWKn2bfBr_tjHwRd0W1yQHDBo
Message-ID: <CAMRc=MeDEfaqciXt+u6a7riof=KObrWB2qJ96LjFEzoGwi=eSQ@mail.gmail.com>
Subject: Re: Re:Re: [PATCH 0/7] gpio: add Ambarella CV75 PL061 support
To: zl020895 <zl020895@163.com>
Cc: longzhao@ambarella.com, 
	Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>, Chanho Min <chanho.min@lge.com>, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Oct 2026 16:10:41 +0200, zl020895 <zl020895@163.com> said:
> Hi Bart,
>
> Yes. This is effectively a v10 of the GPIO patches from the combined CV75 series. I split them out and restarted the numbering at v1 because some maintainers preferred separate series, so I am trying that.
>

Please don't top post on mailing lists and wrap your messages around 80 lines.

May I ask which maintainer asked you to reset the numbering? This doesn't make
any sense, this is a continuation of the other series and should be numbered as
v10 and include the changelog.

Bart
