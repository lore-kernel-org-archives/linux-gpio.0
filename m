Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC3F42589D
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 08:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788424072; cv=none; b=prp8CdhTykWtmXI0MvoAu7g2764gJ2xuO3Usi7OkdOtF7j98Z3Sj9JQjxPNEkPgdaIDljX0ZyrgKR6rBC8bsbToczdI6BRNjxGYUVK5FIA0jrQ4i0N3DWCbro4pKhmM3VO0SIdi6AGU+8cXeGzql6Kg6IjzmLWVW1GuXQpZT9vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788424072; c=relaxed/simple;
	bh=TrJxAmxvRZ+OJcEmvKu0mS/aQ9NNqWTYt4WrKIdYpSg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Az6KIyJZb1kM42CYYftV6nmiwx6tKCKiLkYV/0T3oG1uq+KJOXTcrRKHSZYRRCTopm7mzNVQaEqrlLDKm2KY/3Vob5L/0obVHxL3h8QOOzHCNYFJvS5aqzfzlZuengdy67wmdGo4gT13bgI9s7PIQo+DGWA8saLpfKe4udrr0NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=omwLy8pQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="omwLy8pQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E94711F00A3D
	for <linux-gpio@vger.kernel.org>; Thu,  3 Sep 2026 08:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788424070;
	bh=TrJxAmxvRZ+OJcEmvKu0mS/aQ9NNqWTYt4WrKIdYpSg=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=omwLy8pQosiS6s6aNjAUOvi+dNK9JWsK13oYqOB7usOvfjM8RvkhQcnQbn4M4HaqF
	 SnH9yImhXfNS4YTsTvTVYU4mAEdHATbCFN7pbZxBWURNcwHDAJogs1Ey3OWu4XR1Mp
	 Ok1BboP2h5vYnn0kFQQG36Vqr4ecxF2zPCGtcGTy7uYPTibG4827aQ1LzlfgjF4C5O
	 MCRnQCuJPraOEWZ3GOoJonEpGIjxPDOk7RbNOGxqJfgFjdCV0BWE8IVljIwMmUfsVR
	 XHQxTk579Y1yfISx5azt6FaUNGyrnSvFJFEYfUaPez3zXLRcA73rujD0nJu0uk7dcN
	 uu1sUfLCDI+vA==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so3180277e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Sep 2026 01:27:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3IJ4BucsYe4xtS/tfGKhbIY0X8AjyzX4AhRBwxG309fSydAAghLbqeK3eTla2ii7oBrGJZFksGNoe@vger.kernel.org
X-Gm-Message-State: AFuF++lSyEWZxeYsjFcLaM6DLpWcI558ZF7/Mx9TqgOXHDrVfCY5FKY0
	WoDb/2Dap0BE4JmjLjeN6mu91FT1sEKtRd5ibrgPU7AJV2rfzMA1y98SBfMxuXa+Il3viET5fyV
	1MZSPfvAXNdgcU0QuzqnArJl0I6YrfWpj1n4Uiol+jA==
X-Received: by 2002:a05:6512:2246:b0:5b6:4ad:77b5 with SMTP id
 2adb3069b0e04-5b6087dc220mr3260661e87.29.1788424069613; Thu, 03 Sep 2026
 01:27:49 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 01:27:47 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 3 Sep 2026 01:27:47 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260903075940.2089367-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260903075940.2089367-1-mehmet.fide@gmail.com>
Date: Thu, 3 Sep 2026 01:27:47 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
X-Gm-Features: AcwNN1V5FdQ_WXfM8AqBAuAps-0ep9MiWg8pjvabZULokJ8aU7j9fqMb0CzLSlw
Message-ID: <CAMRc=Mc3u+2ApzMfFFM1L5MJROaQMSifKReJ-3T+9EX3Zdqzfw@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] gpio: mmio: report the line direction on chips
 without direction registers
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 3 Sep 2026 09:59:37 +0200, Mehmet Fide <mehmet.fide@gmail.com> said:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> Hi Bartosz, Linus,
>
> this replaces the gpiolib guard patch [1], along the lines Bartosz
> suggested there: instead of teaching gpiod_get_direction() to stay quiet
> when a chip has no get_direction(), give gpio-mmio one and let the pin
> controller tell it what the pad does.
>

Why are you spamming the list with multiple versions per day? You're sending
a v5 as I'm looking at v4 and I really don't like to have my time wasted like
this. Please limit yourself to one iteration a week unless you get a set of
comments in which case try to stay at two iterations a week at most.

Bartosz
