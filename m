Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382324A7C99
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789579441; cv=none; b=iAAqvswYh6uNftp5CPZKx//1TRXW768FrOrklA6etytPAUbs8aAP6xHMsE1JO95vdNacDDIcRxzJBmKpz7IszpjHybSz1uE4nzPtNC76y58r8VFKHSrMH+TVu65MLu9r4DbmfEbOHiT6uDoRLhFe+p5e/UjPMb8fyUAYWA0ndik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789579441; c=relaxed/simple;
	bh=0vCWf9MxiT2b+E/T1q/nTE5apuDRiYUK4+cddGkhdWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WBaAXIglPl1nBqs+xpNQ3olB4+TfiSpbFst3Z1Q2A8QRcLvfo2ilWbkcJCnNyTOYEhA/kcWiE36rAmV6oEt75xrHyw3SUoHfa1tiaWGLbQp+0RjWCEm9qioSmFGVcXblkfhcH+MXEoOB6ELY061mj0pG/chGWLK/RBdAOdQ/Jug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9UhQg/h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9UhQg/h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 189891F000FF
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789579440;
	bh=0vCWf9MxiT2b+E/T1q/nTE5apuDRiYUK4+cddGkhdWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b9UhQg/hFLmc0yJyOsH5yHc4qWjxLbaWEpPPSPIOpWGomGurZfgXfG2BOGARFDXOe
	 GBE6XRsZFPobgKGvRvl1obzYywrBG7wg6NRNTjdtPfRIZpBCF3+gmQjIO3H8NtaVyq
	 oaCBmC84C57pFpGsqD2+woXiMi/47aCmXKqsFrWvSYVL/tcOfdqnOLM0qv92Q0OlGG
	 EOcIJPF0nzrm734TvNnu4DeYPj5CCnehFEAjTLL/bbDibJ6VQc6lSv5iStqawl/RU2
	 KV5dgyYOB9PkYY/CxnEHFTqwt0tDCOuWMWnhvOIaOTZr2mWJ084j1Pqs4ZrNJxscJa
	 gV9YG40eUwTTQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b76668f4ddso502381e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:24:00 -0700 (PDT)
X-Gm-Message-State: AFuF++kuZABd2pwMcJ+bCvAvra1FCYcWiFLSwT3zTqXoF8I++i1sNnm6
	9tsE04SPAmmzs9IVwPTaDlF+pEsydcdPrqxbKDMU70713UChPsEPszJSr+WmgCKs1GkYNWpyBUd
	7dVPAuYcBCn+KKD3cxTeit9Mkuf26tnc=
X-Received: by 2002:ac2:520e:0:b0:5b6:421:8ad9 with SMTP id
 2adb3069b0e04-5b8ba5f0937mr86681e87.14.1789579438832; Wed, 16 Sep 2026
 10:23:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915031225.191639-1-rosenp@gmail.com>
In-Reply-To: <20260915031225.191639-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:23:46 +0200
X-Gmail-Original-Message-ID: <CAD++jL=pO+O7iPdE-fBTMSGxQU6LZU-zSrY4X0_rF8=fZ2hvMw@mail.gmail.com>
X-Gm-Features: AcwNN1WAae-jbKZTyT-X17VkdT-7OKOay0Vn4pBpi5oDtpaiYUqdHzuNBS_jXx4
Message-ID: <CAD++jL=pO+O7iPdE-fBTMSGxQU6LZU-zSrY4X0_rF8=fZ2hvMw@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 5:12=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrot=
e:

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

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
