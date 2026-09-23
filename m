Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FFD0400E15
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151344; cv=none; b=R/2tP3FKfkC0uIGsyMLXVOyjtWLOH9Tk6u6PZUZvuKYGrrFGpjcAqYq5O7RgqviNfJxvbEfLTC+3i9ljsoG3O5IAt8oNCWrYAifb66jxWgyE487/768Da65wmBdUlzxRpB18JcbNhA4f1PSV9DdxIpy/9c+8UrMba8pKbftQ6WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151344; c=relaxed/simple;
	bh=Aw8qwOlJ9sFdhYrmecSvR+HuKipW2F5+ZK3LCKAb9GA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9U2XKDGWC6hXYzBUUa0x6OFWG2vgAPB3Q6J5ea6TntGHcqBsL9IamiA5walgu0uLyhAUi8fU2vIQqooAY/VLGYbgtUcVEfKsY5IplFRxTtpHUIUVKAUhTK4JIaCVN3z6fUStbjgaxX7p0bSEdlu+duQVtVjTSd0JG76sYRpljw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O76SOVu5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O76SOVu5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26FB1F00899
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790151342;
	bh=Aw8qwOlJ9sFdhYrmecSvR+HuKipW2F5+ZK3LCKAb9GA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=O76SOVu576WVT3Xse2dxpHNsXzDbSJ8JfDG426CQvxK822pjlgcrcMuxQp1lahbmB
	 DhsOnoFt3qk/ln8zGg8jJL/qzeKA0lQAXdAea8rbHfAeCSdMBiDsBb226mAPsux+uO
	 BkIA2SJoVLgpp0453ALpHthPaN5JAJ9gTX7nS1VwOZhmBZvwe8u2lTSmUpm/aRfNjw
	 +5HbNVrXPR0kmutwnUQdvBSzkPkmTfMZRcCYMBSljh8VmMqRGDyr0ayT6hpNcWsFo2
	 Sqaer8pSdPoYuFgNeNSRVcQYUvtHblqonB1DSDE3pkusQY1vT7dPc0hhGpixDVvKHe
	 Qm/1IJsVZFoYA==
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a354118856so5034581fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 01:15:41 -0700 (PDT)
X-Gm-Message-State: AFuF++nycpZNmmbgBn5w+89IyATcW10QekDX2YjXeXZnBvxuaG0L9o2c
	NEOdDvsslYH2bZPPQi03JtLP84bIx3RxEsmhNJHdV3NPyBoBlpCUbA4/PpGkV0bal/r3feVAL//
	7/7ztZIyUVuzxpgqAGldcmH8XWm0jZt5BXtAFD9uGzg==
X-Received: by 2002:a2e:be1c:0:b0:3a1:8558:56a2 with SMTP id
 38308e7fff4ca-3a6305c95d8mr4593041fa.6.1790151340521; Wed, 23 Sep 2026
 01:15:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 01:15:38 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 01:15:38 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260923030855.410109-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923030855.410109-1-fanwu01@zju.edu.cn>
Date: Wed, 23 Sep 2026 01:15:38 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfHeDs5FndscwsM1Ycogq9Z8gqp4=XjY4__g_2yKTqNYg@mail.gmail.com>
X-Gm-Features: AclHuK8uJ4XauR2LfLHmw4IroN5X4QmWH5FoLCLBzcg1D2bp5WkW97t70p99m4g
Message-ID: <CAMRc=MfHeDs5FndscwsM1Ycogq9Z8gqp4=XjY4__g_2yKTqNYg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mpsse: fix race when arming the IRQ poll worker
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Song Li <songl@zju.edu.cn>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Sep 2026 05:08:55 +0200, Fan Wu <fanwu01@zju.edu.cn> said:
> gpio_mpsse_irq_enable() arms the poll worker before publishing it:
> schedule_work() runs before the worker is added to priv->workers. If
> gpio_mpsse_disconnect() walks the list in that window it misses the
> worker, and once disconnect returns, the USB core frees mpsse_priv
> while the orphaned gpio_mpsse_poll() work keeps accessing it, causing
> a use-after-free.
>
> Fix this by publishing and arming the worker in one irq_spin
> critical section. Teardown walks the same list under irq_spin, so a
> worker found on the list is guaranteed to be armed, and
> cancel_work_sync() handles it whether it is queued or running.
>
> A worker armed after the disconnect walk would still be missed, so
> also set a new priv->dying flag under irq_spin before the teardown
> walk, and check it in the same critical section, freeing the worker
> instead when the device is going away. schedule_work() is safe to
> call with irq_spin held, and the next probe gets a fresh mpsse_priv,
> so the flag never needs to be cleared.
>
> This issue was found by an in-house static analysis tool.
>
> Fixes: 179ef1127d7a ("gpio: mpsse: ensure worker is torn down")
> Cc: stable@vger.kernel.org
> Co-developed-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Song Li <songl@zju.edu.cn>
> Signed-off-by: Fan Wu <fanwu01@zju.edu.cn>
> ---

I probably wouldn't have noticed but Sashiko found an issue on PREEMPT_RT
kernels[1].

Bart

[1] https://sashiko.dev/#/patchset/20260923030855.410109-1-fanwu01%40zju.edu.cn?part=1
