Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99AA5275A7
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687219; cv=none; b=HKLaDDQERpi7rfNAjgVAw9nehbkAW6IVzKvXsLB0xCYnTopmqFsMMOPcl7hgZ+SEGsJakMZKyH0F7ee4++a8UDUlyMLFeQhEpHNclr4nNq5YCspMJHnWTM83uFjSgNXnjzmwAHmdGQIgTZ0lHnCGHR3UmcNSxCiiYfxe/Sv687k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687219; c=relaxed/simple;
	bh=MqxZsfzI9WhP7f84FP+boeP0nnJpUCfr4BGpZ/6sI+A=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p9tpzX4im2J8z7uCMDxHjfrWlqQec0UQo4t28++GNAfGKw7IQ+/9J8FoO6B4L35hafeWkl+jJD/uH0oK/LfexPDqYBYraIVB95TYWK2Wyhes3yIUpAvh5sOx/e708AvKBhEm8QUhg5noYKMV2LdqWejJppKyWrF1WED3FVet8qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFOj2g4a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFOj2g4a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9323D1F00898
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 13:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790687217;
	bh=MqxZsfzI9WhP7f84FP+boeP0nnJpUCfr4BGpZ/6sI+A=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=dFOj2g4agU8/eNoYzdk6yhk+I6WhSy+sIz3ZS1nkfBi0D8d5OcxXuysntUz9phbkV
	 GEpYIx4v58PoMkD2lz7H7vYv2RPtA32Uf9ACV62ieczKrzAWmwnmL8N8ApQEp973dY
	 NxMzsQx0p6k7p6ds5iQFDtSkCp8tmXGDXu1FFYKX4Ki+VpUJOTfi/++wTD/v3gVGmH
	 yBzwGGKNO3GE3w4B6uw4LQR5ai+VRiBYt1bTOtXhwSaAdH0kC2lfmcKGWARDqjew80
	 Erzw1p7+63/qA4uDoA16/iAvk1mIg3Rtpp9HcuVhzDA3nKNGamCbM7am+4UKIY2emd
	 aNLjYBzLcruQA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ede3ab7aso1178043e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 06:06:57 -0700 (PDT)
X-Gm-Message-State: AFq9FYKVtSafKtGEbB+pYb3v9LoNtflzZI2RJHCQOVRjMtEcvjLDQocF
	R7qTb3eLqKUGZPSHhq/68h2KkZ8BjPUTxOL27Qo1P5UfgUiZOBcmHW7jJKS+V+A4GVcoZiSPz0u
	q2h9WPqMxtuWEoxAnt35Rxsf0aK/Lf00kN8EsdELiWg==
X-Received: by 2002:a05:6512:1242:b0:5b7:c68e:a501 with SMTP id
 2adb3069b0e04-5b8df1f3cfbmr5671817e87.33.1790687216310; Tue, 29 Sep 2026
 06:06:56 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 13:06:55 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 29 Sep 2026 13:06:55 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260929022602.23306-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929022602.23306-1-rosenp@gmail.com>
Date: Tue, 29 Sep 2026 13:06:55 +0000
X-Gmail-Original-Message-ID: <CAMRc=MfM4agR1Pnxuqe=NBWJyhuF95Scd0Tdd-2XDWvRVDh-3Q@mail.gmail.com>
X-Gm-Features: AclHuK973gOURdpXgqyVyR6tgaX6UGY2Oem1VOAS8jdwozi47reJMD9XSUCVqVg
Message-ID: <CAMRc=MfM4agR1Pnxuqe=NBWJyhuF95Scd0Tdd-2XDWvRVDh-3Q@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: mvebu: convert to noirq suspend/resume to
 prevent interrupt storm on resume
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Sep 2026 04:26:02 +0200, Rosen Penev <rosenp@gmail.com> said:
> The driver uses the legacy .suspend/.resume callbacks, but sets
> IRQCHIP_MASK_ON_SUSPEND on the irq_chip. During resume, the PM core
> runs dpm_resume_noirq() first, which calls irq_pm_resume() to unmask
> interrupts, and only then runs dpm_resume() which invokes the driver's
> .resume callback to restore GPIO registers (GPIO_IN_POL, GPIO_IO_CONF,
> mask registers).
>
> This ordering means interrupts are unmasked while the hardware is still
> in its reset state, potentially with incorrect polarities, causing
> spurious level-triggered interrupts before local IRQs are re-enabled.
>
> Convert the driver from legacy .suspend/.resume callbacks to noirq
> callbacks via dev_pm_ops. The noirq phase runs before resume_device_irqs()
> on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> registers are restored before interrupts are unmasked.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---

This doesn't apply on top of current gpio/for-next. Either rebase and and
resend or - if there are dependencies from current upstream - mention them
in the cover letter.

Bart
