Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D8D41C71
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565656; cv=none; b=t+YhQbcRoN5KlrFxyvYHBC0EK4b0rL/WTnr49xNhDZJs/WkK3slSIvwD7xIZ+gF2J8HKo2J0Uu549S47mtkl/F0R2Z58t3GNTbhUtj3hUK0sfua6JdPI6i7qlVjQ0DUFU5N2iSXmJsBLMMoENjAPn1voC9NvmhzBIA9N+1X2iYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565656; c=relaxed/simple;
	bh=SL0N0err1nZrZl0HktBhkPwZ7Ptdym3maQuJxgqRR3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pfzndbAXwGeGTvWCORz+gq+Y+8nfhsnklKnfGo//lKkjgALtUMy9Z6RIZBFYXF7LGkjCWtF5jEw4y/KfRnTBxoKjwSG2TIzhrctI+z/wt09T9aSdYIUK2FO/YkfMOGnNrVPPbqHVdvAFEH9p53n2Gl+pk9IeZG94YFVroehwpAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FDKwF6Zt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FDKwF6Zt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA8B1F00899
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789565646;
	bh=SL0N0err1nZrZl0HktBhkPwZ7Ptdym3maQuJxgqRR3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FDKwF6Zt3xrnR3aWoFDJkCUoc9ezuYstdOCdmN6nfFTim2tUb8Y/IGV+QJF02tLsk
	 MQ1NhY4/57rbKFdPTCZqyM0S1b3mdez8IMD0hdcdIRT17TMIEHTlNx/N9gCQqAXW+L
	 ed0MV5gFtaueFtcdzpAeG1f/SspnY88X59cx3ZdYYGRZSNgqfr+BE+ZAEAbuZC6zcw
	 6URCygR/n3IG1HVsgk1WCVrWQ7cfa4ROJM+UyIP9NwmePXLiOZJbuKrSpl27k7+58k
	 GWqhxoT3gqj8Bym8Lter+/gCrjeRW9v+TCD9237yUKNq/bJ0kI13C8w61BeFKpNhYM
	 LIXH45rYSm9Ww==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso2142073e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 06:34:06 -0700 (PDT)
X-Gm-Message-State: AFuF++mZvIU36fxCO6t8tfpItacJ0hK9CviTVvGL2w9Hmrmb5kdHFSh5
	kiuCvt4nUNFML1SrZRPtgmSlNVySdDLiFc/U4icJcTq56yETZZY0oPDSn8Po2c64K8PEAmP483C
	R8+7jKpkZWmQ37I6bfj5MvIE6i0Kwqmk=
X-Received: by 2002:a05:6512:250f:b0:5b6:19c9:e53 with SMTP id
 2adb3069b0e04-5b8b2a5e29bmr2267729e87.12.1789565645091; Wed, 16 Sep 2026
 06:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710070704.60680-1-rosenp@gmail.com>
In-Reply-To: <20260710070704.60680-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:33:53 +0200
X-Gmail-Original-Message-ID: <CAD++jLkpAi3Vh=YYMckM7z8SmRFeHUUeXS4wPLfciOyMZpZ1Hg@mail.gmail.com>
X-Gm-Features: AcwNN1X8gayhrt9XNUrdZms7Iwl96lHZC5Mt4H7hlL-SMLIPUbFfIIGz_mTVQm8
Message-ID: <CAD++jLkpAi3Vh=YYMckM7z8SmRFeHUUeXS4wPLfciOyMZpZ1Hg@mail.gmail.com>
Subject: Re: [PATCHv2] gpio: mvebu: convert to noirq suspend/resume to prevent
 interrupt storm on resume
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 9:07=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

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
> callbacks via dev_pm_ops. The noirq phase runs before resume_device_irqs(=
)
> on resume and after suspend_device_irqs() on suspend, ensuring GPIO
> registers are restored before interrupts are unmasked.
>
> Assisted-by: opencode:big-pickle

Should be
Assisted-by: LLM
these days (Bartosz can probs fix when applying)

> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
