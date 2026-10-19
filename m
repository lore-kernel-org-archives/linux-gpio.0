Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9A8494268
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792396778; cv=none; b=E3Ly6z83Lp07Or6WwcseAjYtYfyJaiPmIFnu5IM0TUjQqUB1bG8Weh5l5UBFXw4ixY+8sF74qjQNwNJ7SZvM9Q9fBi8VgI9iXc++z9VcJH3cdWdX0/ZiUq1JVzkkenzVEoH7MLkHp+WDGkqNkj1DELK1ADtEAY6O3e+94/q19Zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792396778; c=relaxed/simple;
	bh=2dNsXEzyYFv8JHrexiP6Nx9jCfUbGebKgg9hTU8nHiE=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P8KeDmXSMqcH9wvjOEaweULMs5zxblyWGlLOv2DjdVEE9S1SD+mhX9i9W0HcRM3IwjiDSR9MX0jdHagtKA8EJJjEV+TkZ2q50EkxKggs8WL8NuSTt1Iln65A+T9ltH9N3s74Xk+YqTtQJIjV3XhX1rWLSYevUNf7d8lopZyNp5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hm7gASaU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hm7gASaU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449701F000C5
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 07:59:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792396775;
	bh=f7jhtByiMNHTI2ztZQFXo5ODg0GLCDRSNKdY7k6SELk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=hm7gASaUllFfxeRjaeJjLqvmIJy4JVuKL405GP1BSS9cGOujyeZCCYN0RueOVYObi
	 YBYBVo20YjtU8RKj7VcXGtsHMIgR2XpE1OjMEWGs+dv7cmmodIjffpEwqBLOaldqK2
	 aAr3a9D8y6Ou40176SGtF1ulTAI7nX0s/B+kU446rVVYvoG30ujALuyBAOnvw6Eqv0
	 7pCRsW2jVU1P3II7grYfNqPouH/OzdvcU1gav600mcVP21hdIwJIZiCZ3DnFjCGP1i
	 JHtZhJCbf6G1pQvYVQoIcCkLucUDORWha54141fo1pXtGMDuCK9VN4hH1ZjDE74uDi
	 xkD5/zEy8xXqQ==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a595487d43so11522231fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 00:59:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy0f++EVgVPzAsMBoOqYL7iUnnmT/CSN53ib9J2b/KpOo8vfJFHuyYTvdUkiiDf9GbkaO6gEzyq9jmC@vger.kernel.org
X-Gm-Message-State: AFq9FYKPsOHcXecmCmCJaVBQ67pfK3znFBqDBwSRWkTsfkF0k36HtPGt
	2GLt4rqqPItiSEpgOtKp48M4272SfDPzStYsNZG+9z4Ut8TghmHlcrMSWLZ/Kzh9VrLBhXq/P35
	SM2ltJ1Sq2krAe2Xcc0MWU/MSh/7/uLgyJTPl8gGBoA==
X-Received: by 2002:a2e:be03:0:b0:3ab:1525:60ba with SMTP id
 38308e7fff4ca-3ab292c6b2amr14511111fa.12.1792396774004; Mon, 19 Oct 2026
 00:59:34 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 08:59:33 +0100
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 19 Oct 2026 08:59:33 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261018230117.23497-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261018230117.23497-1-rosenp@gmail.com>
Date: Mon, 19 Oct 2026 08:59:33 +0100
X-Gmail-Original-Message-ID: <CAMRc=MeUt=dwZUybCx=JUvDs9ZWa8Zyg6DzJy_bxwzn_k=RgFA@mail.gmail.com>
X-Gm-Features: AclHuK8twNEgc9BLz9uWn667h8jaCYy-1CE55nOaqcT5hqxIOiM4nkyZ9YfZtkE
Message-ID: <CAMRc=MeUt=dwZUybCx=JUvDs9ZWa8Zyg6DzJy_bxwzn_k=RgFA@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, open list <linux-kernel@vger.kernel.org>, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 01:01:17 +0200, Rosen Penev <rosenp@gmail.com> said:
> The Armada XP variant keeps the per-CPU edge/level mask registers in a
> second I/O window (percpu_regs) rather than in the main GPIO window.
> The suspend and resume paths however read and wrote them through
> mvchip->regs with the per-CPU offsets, which hits the global
> GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
> was therefore lost across suspend/resume, so a level line could end up
> unmasked behind genirq's back and trigger an interrupt storm once
> interrupts are re-enabled.
>
> Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
> both the suspend save and the resume restore paths, matching the
> mask/unmask handlers and the probe-time masking.
>
> Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  v4: rebase again
>  v3: rebase again
>  v2: rebase

Are you rebasing it on top of the gpio/for-next branch of the GPIO git tree
as indicated in MAINTAINERS? Because this still fails to apply. :(

Bart
