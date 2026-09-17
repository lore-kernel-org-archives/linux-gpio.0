Received: from mail-ej2-f25.google.com (mail-ej2-f25.google.com [74.125.228.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51A1B38F658
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 18:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.153
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789669709; cv=pass; b=QkiojZ3qfZI3sYi58RYdvOgsKTcKh5+s5jzz4N1chfsywTQD0NoqcsTVibAqdKZu1R80khaiT7gpoFThh4AWPswY4MclDjDShHPvGUDN/hnWEEmA1ws5RV/z4CrfN6uMYNWNUr6d2bsOM3YEmQu7piB+vesC+P13yT1H3WUoTk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789669709; c=relaxed/simple;
	bh=gbG9VIZ5l8GhkgsEXdx8QecWG9sDjmGHKbYfhOPZZrc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UA7c0OTLCLTKp4LltnvlyX2A5ojm839PR3a7Kqq9zJJaDC4SdvB1xj0V8LnTEOiOFAIDOaH8S7+xbJMGPXktYtMYLETZihrxo/WJJgTHhRpOps87V4zYWABdJriWt+7FqXfz9NaTopmQDXGqZYr7OtcWDMQwAhZxuY7DEeyoAbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZbgxT7tp; arc=pass smtp.client-ip=74.125.228.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZbgxT7tp"
Received: by mail-ej2-f25.google.com with SMTP id a640c23a62f3a-c254fa4c24cso193689266b.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 11:28:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789669706; cv=none;
        d=google.com; s=arc-20260327;
        b=D/jOYBV9tvdfSMPSjlqKe/Zp52+FhAOycnV6Bp7AgbzEFQNLty2/Lv2yDaUPioflIz
         s6gtWklxPhCvAD2GfwtjzxQjtU6J5gbSf4+uPM1zAdWiX2Poq72eKgXHdYCYIdw2A5yg
         FM2foLUeFQ6YYPmOLSCBw48rXv/+y22IwNbekUp/QYZgxtY9JL+kQgsNeRwnWo3ArIYa
         ILQhSCnQTRl99rb1PMm6U1KzXXaEZSr0pEQmIa4NmBDgr8QdbT6Sc+jqbo34Wyi5/Gen
         z+1KOelJGn146hJNyejwocXrUFPnDmkJ1yYgRmxZSagOuJ3F2J3JR17k/4UQgxZ1Oqwv
         5vSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gbG9VIZ5l8GhkgsEXdx8QecWG9sDjmGHKbYfhOPZZrc=;
        fh=E2p7flVMFEDflQrGNMFE+k+UTqTQ1gJRAc/3+t/aUNA=;
        b=WYCXs2ENDu0dISgZinPhPuv4voAZBtIdOg2vKeIFmKX7Yy7OWrbYQ9QC5MwllH2vfJ
         rjwmIiESTrGW1lmKItfAnqHTjyXG0eyGtdsdRoziOr+LNF2q9BbtRF7xN1itxa+4UkJq
         mDArArVLpRl4pBC4Vyhv2cYhmPg10c2b3uSDWlRjZk8rCFDFVx2JUyMJCXR3homYN+dc
         GLhBUthUPRE4po7KELr7m40J1kMoy3cdto5NDq3UFgeuNEWvTljZser3XB2wuItngxs+
         wyn9kshkk1rmnFc0gcqjoxF7S0JWZfVNCpMDf80YDz5yFGBD3LDnO/3kGLV6yN8G0Hb9
         Q9qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789669706; x=1790274506; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gbG9VIZ5l8GhkgsEXdx8QecWG9sDjmGHKbYfhOPZZrc=;
        b=ZbgxT7tpsgiPMgMfqUVhs/d+kHTbBG5y7Enb8HvwvvkfCutkoasGXdg9aq0OVEFUdT
         mPOkfUzMhfs0K+/rE7oVBZ3TqEAr3xnDEkSsqUXIMtQKzKlCaAi2N5uYAUBVfsE+TTzO
         aV4R2ibxJy66du2mrdBGrKuhyQORjvouEi1nSj/hJPvjdN93817NMRGCK9VyW1Rfjrd6
         o2yB2SL07f/9vAvxDDoohxopb7LvQx6yD9yQtxbXDjmmmdLbdxG3TVOVn4MJjMaoIBi9
         AvGK2Aiih7mr+Bs+EQaA5+g52IG2JLojiRtOU1z1DmbiR6ysMDG8segahR0bIPphiiNI
         vgJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789669706; x=1790274506;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gbG9VIZ5l8GhkgsEXdx8QecWG9sDjmGHKbYfhOPZZrc=;
        b=M3aexsrYgKMxMX/pEfdY/mrntWGS7yrA7ppsFgpyyMNVVfIeI6DD1iYUFMwgXDMbK7
         84/860if3oCa9U9+VR6MCmqBhcG6Bpi+4FHiUR0br240LX6abxM5AC+FaKeDsMVlTm61
         xcohAIb5IPBAgAVMASQkh/HWwkyEV5uUAeTrEEH9M5d7Ns3nKO7gBK7mH7TVHjbu00Be
         5pcarMol7W/dB2Lp3SqaMpmp7XuyPfvVlMM2K8ZZKB6gXswfPG9DQbR0KMfXKL20pTHA
         X/txcSuShiGMVinVo1jgSxaFu2RIK1j8HqgSGglxuS3i35LZ+3xYGIqdqD9rWBBGuAZR
         ZKPw==
X-Forwarded-Encrypted: i=1; AKwUvBwegFDDW2GGAT32rtKXCIkrUrGfdIRXM/Twyi5q1fqIpolgYEfc1kGfjm7yTbFbvVmTGR2vNvn+rEVG@vger.kernel.org
X-Gm-Message-State: AFuF++n2VVNV2Q6KviUt8ttrTK1/WafHSABi345lEvTI/Y6HpfwiZRi8
	4D1ucdOtepn3egldin0xDW5L8YhM75pVI4rpcz5QHhebqDwfQHgAwETqzT1r2gtK7PWyqV9P71j
	8Q7jMK1pFtvuGsReQtHSxJqMgLENCQ3PvGw==
X-Gm-Gg: AYBFou1QNztlMxccbJdTZpyh/yWphEJeF+7PI6x8eDY7iLPrMJoJHN7n91UEeA7PPZv
	CtHHlG/emTLZbWAkea78wsf1dLY+CtFjkwDxccOv5NR2wM/disobX0XGmUUALSt657r6E+qQ37v
	RjUAgMjmn72fYIJ6m33o97NRQY36X8eY02HtgxjP3reDb8gCN9SZhQ3i8+A7OD57xnsDKPsO8rV
	xTwgC0C2MLmXLkJTbbvZIk4Q4IBIxP1qXpbGtlKh6lduIBV45Af5ibTv5PfPQ3o3x6IhiRZv1kJ
	UJJR8GlE9gKjKTb2JE3IOHVYcG9dYf/ifnyfD2MEDcLqnbWoIzT5BReKU3F9NMDN3xjZdGM0xRo
	cu7itFsqYxCVRpPDldjhe1K41WnKS9Ba2PJxpkIOd0P2IBI0RBjTb2RVEI7XvpziwN73QKa+CgP
	PfJY1QnS/lwSVyvYJHZcaORjckB6Yhvh6Wuu3HUs1BmtPYoJVt5eyZmXoTNRGYrRum3Wo=
X-Received: by 2002:a17:906:c155:b0:c29:4187:613d with SMTP id
 a640c23a62f3a-c2a15e0ff91mr2202666b.35.1789669706346; Thu, 17 Sep 2026
 11:28:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915031225.191639-1-rosenp@gmail.com> <CAMRc=Md+HpS6LDLAvfH_=7DrfUq+cFmRqFq=cW-RqBCfQPs6fw@mail.gmail.com>
In-Reply-To: <CAMRc=Md+HpS6LDLAvfH_=7DrfUq+cFmRqFq=cW-RqBCfQPs6fw@mail.gmail.com>
From: Rosen Penev <rosenp@gmail.com>
Date: Thu, 17 Sep 2026 11:28:14 -0700
X-Gm-Features: AcwNN1WkfccXUHAoMGLySCP-Ju7sz9Z1lJWkoChUCP3m5x6uQIxZxYoqPuGCghM
Message-ID: <CAKxU2N_iS+z5dPv9OLpCarCKj0sVH58N2ND-bOUqJrbV=yPXew@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: fix Armada XP per-CPU mask register save/restore
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, 
	open list <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 17, 2026 at 2:53=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 15 Sep 2026 05:12:25 +0200, Rosen Penev <rosenp@gmail.com> said:
> > The Armada XP variant keeps the per-CPU edge/level mask registers in a
> > second I/O window (percpu_regs) rather than in the main GPIO window.
> > The suspend and resume paths however read and wrote them through
> > mvchip->regs with the per-CPU offsets, which hits the global
> > GPIO_EDGE_MASK / GPIO_LEVEL_MASK registers instead. Per-CPU mask state
> > was therefore lost across suspend/resume, so a level line could end up
> > unmasked behind genirq's back and trigger an interrupt storm once
> > interrupts are re-enabled.
> >
> > Use mvchip->percpu_regs for the Armada XP per-CPU mask registers in
> > both the suspend save and the resume restore paths, matching the
> > mask/unmask handlers and the probe-time masking.
> >
> > Fixes: b5b7b487431b ("gpio: mvebu: add suspend/resume support")
> > Cc: stable@vger.kernel.org
> > Assisted-by: LLM
> > Signed-off-by: Rosen Penev <rosenp@gmail.com>
> > ---
>
> This doesn't apply on top of the earlier mvebu patch, can you rebase on t=
op of
> gpio/for-current and resend, please?
This should have gone in first. I'll rebase.
>
> Bart
