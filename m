Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354A468C06
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981487; cv=none; b=sEDjABZmxzrZW48YQpFCpyeGR3e97SDRwW1gFFv8h1+2f7RD4iCQXtpOaMn8CHKYLL0s3+vCnYlpp940vBG/XYeAGWY2MRtRIo/ywDw2w1MwK+rrCvZpoDuO7ZpZZBe3DRrEIU/L7ab/jatqjHvMg6EeG76Xm+aA0bmffwPtyCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981487; c=relaxed/simple;
	bh=VFKHHGpF6NRAqi8ddCzmD3/jk7OUJuPZ01kFQLdlvxM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JdvmIFykzq8U/IILcqbofWw03Jv8zBwLlJtJojvf2XKbOVbTmCgexmimvWfvUaYNa7Rf4PxnFfFlqTgJgViNivRqR98qLKcxwTfZF/OZPmhV86fFLLFntFOntlEUlFInN5stGFo7NhVQ9EdIB9g5Gmoke5eJLKiR9aPkw9I420U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUBoma+p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUBoma+p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5BB31F0089B
	for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 09:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789981485;
	bh=VFKHHGpF6NRAqi8ddCzmD3/jk7OUJuPZ01kFQLdlvxM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=oUBoma+pcuy/bPEkSxFM1/Kl3td60ypI5Gdcoul0w503NCROA3iXjr0C2AoszRrZt
	 dp5jvzL2CHfOnUBrYYUrOCJNHsq8xk3VRkyO4KN4YulSYrwi4Q4JCrDb8Mx4Yt5pc7
	 VeJY4k30NNaOlVpPyTO681h5a71kuIP2Sp9PaB1N7kyKpEDZTXxdz3IBv0kQlVrx0j
	 umertCdCxeVAdS8FmiPaD9LUAE8EPJFZjPJTbogY27SsWM0F6+ceU+Ld+oRhvi8G/T
	 zaN0Yp5zQmSd1whd7UglMT2a8kz3FWlzhb0ID1ALFsO4w/dmYKkVHEwtB1yadKVyHk
	 Gnh4okw2Fvtgw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a6124046f0so8792931fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 21 Sep 2026 02:04:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsh6u79OdTs3v5KB4CqHg8Sn7O77RwUnynYBkuBttrZNrqhdT8r1XigV8mOWi5cyarPnV+BlQF3E9k@vger.kernel.org
X-Gm-Message-State: AFuF++lYR6QeCA3ib4ApDMmlvd4P21Tg0FWSA0eZLHT26IlRQwdID5py
	kao+IslzOFnGsRrWG5O7KpUdUBwxVPllrpz4AIebcukhuzqF9n4ANl2sHqau1sDGQjqQyn3CRaO
	QF6LSJO78ciGIJh4m/JZoLOUrrbQ4LNqbZ4e1CsKHEA==
X-Received: by 2002:a05:651c:19a8:b0:3a6:95a:52ab with SMTP id
 38308e7fff4ca-3a6095a546emr13661581fa.18.1789981484353; Mon, 21 Sep 2026
 02:04:44 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:04:42 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 21 Sep 2026 05:04:42 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <CAD++jLmB-sEea0rVNAE7Lnw4N4n69iutY_xU-CEOCBoT_8HnNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917094356.7040-1-bartosz.golaszewski@oss.qualcomm.com> <CAD++jLmB-sEea0rVNAE7Lnw4N4n69iutY_xU-CEOCBoT_8HnNw@mail.gmail.com>
Date: Mon, 21 Sep 2026 05:04:42 -0400
X-Gmail-Original-Message-ID: <CAMRc=Mdkd2ksvx+4FgC2Pv00Q+dR_iUc=WV-VuTkuqAdFq6Z6Q@mail.gmail.com>
X-Gm-Features: AcwNN1WrYJAoBHNr3ytSsgTaT7gy6peMzoBxhqJfrKvkq013nvGw7rfxcxp8Dm4
Message-ID: <CAMRc=Mdkd2ksvx+4FgC2Pv00Q+dR_iUc=WV-VuTkuqAdFq6Z6Q@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3-rc4
To: Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Sep 2026 19:01:35 +0200, Linus Walleij <linusw@kernel.org> said:
> On Thu, Sep 17, 2026 at 11:44=E2=80=AFAM Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com> wrote:
>
>> Please pull the following set of Qualcomm pin controller fixes for the
>> next RC.
>
> This was not based on -rc1 like my tree so I just pulled off
> the two commits and signed them off on top of my existing
> patch stack so I don't have to pull in -rc2.
>

Ah, I think we never discussed the upstream tag policy. I typically base my
pull-requests targeting the *current* release (in this case: v7.3) on whate=
ver
the latest upstream tag is. I try to base my for-next trees on top of the
current rc1 unless there are conflicting commits already upstream, in which
case I pull the earliest required upstream tag.

Do you want me to prefer rc1 even for fixes for pinctrl PRs?

Bartosz
