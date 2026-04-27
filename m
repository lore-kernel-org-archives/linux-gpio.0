Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B53B389E
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777283208; cv=none; b=KoudcsaD5QEph9rA3bdwqtFPEjzTM3FVqnOLqE0CkmBq9aEL6t6ZmlE0nls2Mj/u7JclR+jYxPqlaQFL+Va7L3BfVkdggmFfdyvZTg2lkUXdJCKtoGpfjRA/DDyGrL01yHRCyLChfwM1LC0oMf+IJeyg6P178sPh2QLGRrynay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777283208; c=relaxed/simple;
	bh=y0fy7lc+4ecGjLqijfQj3GLONiVBHD4dhGkY4y7xtiE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ioM2Vrlr1i20VqmsAtKq45RCfq/lH3RC5msqosZfQtxjun2pf5C6jfHMagaUVRk+Vyf86pydaSQsCBl+bSi94cC2zTTjjGBh/uksvp3N4khobvE2yD9oo24xeddLDOJEXEyOWDbKZZEN/XITnK8Mr6z7p6EE5jgcStIdMkfbmv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s77qyTAS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s77qyTAS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F24ADC19425
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 09:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777283208;
	bh=y0fy7lc+4ecGjLqijfQj3GLONiVBHD4dhGkY4y7xtiE=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=s77qyTASmzKVe6sO2F60mluG+dj56WAeBxqI9LEQR4FBWhYeBNuCXdIUQ41w60N1t
	 okjUZ+p5dbzxXLiYT+10L3aADTaUamuf0kCX0I/vkKfxf9OznX86L4Kb79P66eJPkq
	 w9bX8087rgWFPDCd5Sc8FjqCmq+SkYYkkr/IaykoP7HVqPjR9KbuVZYt+/oE++JXxE
	 w5tmE77ANS1Kl1PVgSR3xopJl1jorloyepLW6YeGuYrdfx/kUbBXt7CKeWMjPNH2KN
	 xHOVXT402NYB2+ChSReCFa6OLzs4vw3Y2fMkVF/JOZ1XeniX9iCOx4gt2rCEae8U0i
	 t0J85/N8IfeCA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5a0faa0d15cso9732091e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 02:46:47 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy09qM5I/G5aTqZsIt/YqWr3N439mRI8+lwzp0dZr1WoQM5w1bt
	aUrgkHutBqpkqQqg63qflYuuaI3XEedZu7eXGSp3yOxrsTrn/LgFuxvxVD6JWdMAITVgLyQs6FC
	oPT8hLIYI+rbARbOcjC7r7CrLqbNtv2h5Y0g5L7rMCg==
X-Received: by 2002:ac2:4c4c:0:b0:5a2:bac1:97bc with SMTP id
 2adb3069b0e04-5a4172ec416mr12082045e87.44.1777283206666; Mon, 27 Apr 2026
 02:46:46 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Apr 2026 05:46:45 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 27 Apr 2026 05:46:45 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org>
Date: Mon, 27 Apr 2026 05:46:45 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfF-mPyJMfJ4xgYzW54QNfsiZr8O+rk0opk_91jp=+JRg@mail.gmail.com>
X-Gm-Features: AVHnY4I5QyWoNevkdCkzvdNgswGsXHVekWWLfQoZtIw1ZKHspAa1umCT6cDRihY
Message-ID: <CAMRc=MfF-mPyJMfJ4xgYzW54QNfsiZr8O+rk0opk_91jp=+JRg@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: wsa881x: Move custom workaround to gpiolib-of
To: Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 10:43:21 +0200, Linus Walleij <linusw@kernel.org> said:
> The WSA881x codec driver has a local workaround for old device
> trees that have the "powerdown" GPIO flagged as active high,
> despite it is active low.
>
> This quirk can be replaced by a single quirk entry in
> gpiolib-of.c
>
> Drop all polarity inversion code and drop the surplus
> gpiod_direction_output() call in probe() since we now set up
> the line correctly when getting the GPIO.
>
> Also drop the inclusion of the unused <linux/gpio.h>.
>
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Perhaps this can be applied to ASoC directly we seldom add
> things to these quirks so I think it'll be fine.
>

I'm fine with that but I'd still like this to be in an immutable branch
shared with the GPIO tree as we're very early into the cycle and we can't
tell what kind of patches we'll see.

Or we can do it the other way around and I can create an immutable branch
for Mark.

Bart
