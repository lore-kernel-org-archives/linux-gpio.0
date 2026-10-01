Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E3823D7F4
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842303; cv=none; b=QN8cCctc1Dv9vmbxQA4wZxG61hXCWKw9uAF3/g8lQuJzu2YdNCZP3UwC2th/RT0O9SCJ9znOeprIjOUu0RjeCSAFPVJ/Nx5PIkwHNW5d38BWaQh0H3wVofwMxyyM4PBLlzZrzCLX/n+laWGgpSjWnSH0EEkxmMHcyXuD2H57SqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842303; c=relaxed/simple;
	bh=mxQOGnxEw0Hj7D3xY0/AE0U9P/h6afoAJA7aMA+z8WA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nlGvyP5cZREGxQ/y9WTY/h1klZEKSsV3tPdrVwDFtUyzKqOEDxx/SiGjIPPz4kdSWmUeLE3Q7GXEqsW9LMmK5UkKbXl62koCY5YSvXMdKDvEvmJny0mUs1/E6N4Z02PGl8UBYgBvkAfRcD0D9c1hvqpHT1A12JnZkWDINI7d078=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RlSvPtx4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RlSvPtx4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 840FA1F0089D
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 08:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842292;
	bh=mxQOGnxEw0Hj7D3xY0/AE0U9P/h6afoAJA7aMA+z8WA=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=RlSvPtx4uSnAdNzCRgF19kK27sZHZ4BHH/Nu6O2Jdes1bfzGlFnVXLDk8P/lYm7ly
	 3HkbEFTocsAmDF2BAi8dkggqoOZ7rU+LZI2tsu+tfgCQNuAe9uhBQwrHmPcMLPmQwp
	 RFsiRqTeglrrQCkOrTnR8285C0EhR75Y4ooMh/CE1DDuKq+wXXTsEOv4B0k63Eo398
	 Ab0cxntgSXYsiXJgNf9Ltoqyn9fUCMpG5NPULK/MPvus/mNHXPHCGQrg2IdmZvW45Z
	 UH5H/DjtYcvD1P1fMskTp+bkllMi9e3Fk9G+i0HzEqgDwV4v9meC8iBaqlvUuRuMdC
	 EVT12H1Ru8TaQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba44044ff8so595337e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 01:11:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy4rbrIAoJ9YjmALQlXuuEfrGZq0SgeEyOlsQTqQLhTHpNzSjayzdskS+rQgQGD30ss9tY1hN+ljg75@vger.kernel.org
X-Gm-Message-State: AFq9FYI9wkBaDq25c/ImZNYHYl8LrYTuqqrwCQ5o6gKSaiiuP02K/bpg
	f5JiMy7+W1CAvnk7uiuIifbR1ZZj6AjTbkFtZQB6q12rUAqwMUExhTAjC4MXLkuJAtNmh5svvVm
	9mhdn2kx4TXisbAOWqM20oIDrAo7jYrpefwt0FmzucQ==
X-Received: by 2002:ac2:4e8b:0:b0:5b8:f379:eab5 with SMTP id
 2adb3069b0e04-5ba406196f2mr1133308e87.52.1790842291219; Thu, 01 Oct 2026
 01:11:31 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 11:11:29 +0300
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 1 Oct 2026 11:11:29 +0300
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260929191446.21127-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929191446.21127-1-rosenp@gmail.com>
Date: Thu, 1 Oct 2026 11:11:29 +0300
X-Gmail-Original-Message-ID: <CAMRc=MfpR0OWH-JfV_752PbkZmSnsuC_vK4ztzBqHnZebCsbkQ@mail.gmail.com>
X-Gm-Features: AclHuK9H8II8fwd91FeQrUgEaZrZQbe6I8cFGSC1rZS_rmUyyGHHvy74mXE_2UI
Message-ID: <CAMRc=MfpR0OWH-JfV_752PbkZmSnsuC_vK4ztzBqHnZebCsbkQ@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sep 2026 21:14:46 +0200, Rosen Penev <rosenp@gmail.com> said:
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

This doesn't apply on top of current gpio/for-next.

Bart
