Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E943D4B95BE
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638853; cv=none; b=Y+xi/Af2cPdnGT0nwgrH2RUliivoSIPbkUUsKrxg3rrCFGegf0eVGuGkjHTZEJN6SutkacuIz/bn0RNk+ODBx/+XthztMGG7EiFCLNJi3fHkK+6GCkEGqFqDUkl4bzBq81eiTcRhZxeLA75zDdiX8pO9FzuJIyVW+S9umma9/Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638853; c=relaxed/simple;
	bh=J9VEFWHbLCc93Rj6UfpzHiK1m+T26lV5zxlLk6zOXqI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GmzP3WLwHZQUTKiJSB/1KxxumHfzjcMZUpAjwp5Vt39Jjz4Wnvmd8UgGFkbAGeThH+RM2dsdxoJoJOT1N1iEl6VFFdN6f1Ek44waPKDwsIDSq0KYoScdGikI7lcbGFFOY+FkT+BAI+VKGaAsVqta7DowDPxIzNvwjxwmqGOey0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRJWRkGb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRJWRkGb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C1AD1F0089B
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 09:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789638836;
	bh=J9VEFWHbLCc93Rj6UfpzHiK1m+T26lV5zxlLk6zOXqI=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=gRJWRkGbaDngRQ2kGsuxwQbIgi0AzkbeufU5K05Vulf8mQqRxbE/Mlkcj5GNfkbRz
	 VCCcgf/4clyMakFkApciYP08gg2mPml5R725A+6qHDT5+cVaHE8oYyACExwaD/xww6
	 8PtUC2wPX6mps1/gFG21tioiXoef4mgIyw9WMTFaGwYHtmDIj3/aLeMnJVfndNwQq/
	 QZUPF5v5A73fLbWksf0BiPFLbvpXUvylVJ04KOOJAj5GJoLZ/BACUumgCnT+a5KYbA
	 fu8WcNajTSbeBM2aY2ppqiWylGowcEMDoU/Nf5eCd5wO68jkSRauWYmU78+33x45Ui
	 QKrtb+nMB1K1Q==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f12so529207e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 02:53:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzG2HPAADWOXFLnR25TMLDuXfiXRFFEpCzTyntLhZ5rFMVEmOiTkXAeF2nmwkplnrSBBQCqOOG2PwjQ@vger.kernel.org
X-Gm-Message-State: AFuF++mSq5gG/UtNyhy8YE2YjYETtr1lusk6wlHUzFBdPC0BEuMgroYg
	n+iUDeT7o05o5TqtZX7/PjytgBWuirGwD8ba6ARIPjF00VdTk9HIMjI85ghuViToPKRA/fuYyHA
	DpkZJs6WXHuZS3S9ECveoF4Dl35jkB5bN8efvr5Yt0A==
X-Received: by 2002:a05:6512:3990:b0:5b8:bc5e:d0fb with SMTP id
 2adb3069b0e04-5b8bc5ed1e5mr490320e87.37.1789638835178; Thu, 17 Sep 2026
 02:53:55 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 05:53:53 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 17 Sep 2026 05:53:53 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260915031225.191639-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915031225.191639-1-rosenp@gmail.com>
Date: Thu, 17 Sep 2026 05:53:53 -0400
X-Gmail-Original-Message-ID: <CAMRc=Md+HpS6LDLAvfH_=7DrfUq+cFmRqFq=cW-RqBCfQPs6fw@mail.gmail.com>
X-Gm-Features: AcwNN1W3w_VLVFp9ubNWkGJ_MQQOwAOc5cEpU_rUiQINqvY_RThfuCW5IzxIIC4
Message-ID: <CAMRc=Md+HpS6LDLAvfH_=7DrfUq+cFmRqFq=cW-RqBCfQPs6fw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 15 Sep 2026 05:12:25 +0200, Rosen Penev <rosenp@gmail.com> said:
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
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

This doesn't apply on top of the earlier mvebu patch, can you rebase on top of
gpio/for-current and resend, please?

Bart
