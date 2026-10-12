Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661384D37B6
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 18:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791829578; cv=pass; b=DGR6OVUPoMLjRP9Qsy36bLrLbrN1v1fV3gpFpPpvy5epR5MDJmFboEujt2bhUmKeiBetwk0/te+NGppoD7uXfStoTvd9PjWz03mokxfl5ImZNjawxqtlJfoh/NZYDalt2K1WvQ+LY8pJm71Vwk7supIF05z+hRG3SHY2cJrsGk8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791829578; c=relaxed/simple;
	bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rupMagISm+Qy7XVf/XuS15CwzIlIWMe7gNo1txg4QsZDkTx29xwgJr9PbNoAMcCAdoKceZGYdox6fP1OSf+CR1UcGY7o94XGEkJ3ciJqWRoXZ/icVWy7VKSAi1FF2yDbpuRFb+UG2BDmAPPccrbjNMOF2dwec0VpkWxS1QTpGP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=owuffjT+; arc=pass smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="owuffjT+"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c2e69aa07c3so271050666b.1
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 11:26:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791829575; cv=none;
        d=google.com; s=arc-20260327;
        b=OMCNyCYBqneYrlzh+9pyTHhR3zn6qIUzeU9KS40vliY1ZOcWNsA7o13YPazQl9by/Y
         LvIE7Pt62hrDSlqqbaRmC5xtWDtY4OQvZuC43v/stmEQhvAHPzPTGXHNoA70YrtCFYCd
         Cf15U+9rfi+gCUjTpoOJH7TeJdocVupbyhqtQbRo29KflMrfNWMtYF40XdkNhv6rQJ6T
         i/x+2ce7MvLfdLG5kFX7y6dzcscuW+rv5LegjDiGvFCrTobMPqCCJ7ZVI9g8xdIDqcHH
         V5bgCYV4FeCN++rQagQK5YV8mVFwtdPpNta4zUq1+9u2qe3r2ZtY3jk7CiWtKgk3sYNF
         Jnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        fh=bIo+8KrrwyilWWvibs9LsW9gLQxFIujdVd8EY173iyk=;
        b=A83kOKvD2t2MuREnoxs5Ouyy5VA7xzNaBQ/veXLi8uGlY/WRbgREwyCugFdAy1Jjah
         lJTLhFkIdBLGFPtIKf037SRqB3z8SVx/m4bmnLfpqnnoYe5n7S6UYOPrnl27jtLlLxjH
         cxolWKcHmHhAG+c/QeH6UUOmHEnND3GztJPQw2lG/ABIt2yNahDEUh0WXfj+eiEFH+7V
         1IfcsqjzR6JNggGiUroY/ofjMt1pQEBBkOUMaDh9XyxIZKlhl7Jhbb9AHKn4c3Eq3Yfl
         OqPTZEapRp0vbBuzpmXT71GjKbJ6JiP7bxi6mjoTjTuqmHq1LrnmAnmPnhMYXgBSCmn7
         35vA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791829575; x=1792434375; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        b=owuffjT+l3q4IlEsQ3Zkn/I2utZbjTY3Czaykpn2N/m5tPsCzijRhO/uwdnr/aZ8zJ
         BNmF3YVKvokL3mcSVNmxQ2vvTyp5XMjMV67Q4OI2g0WjRI4wFB2evVihKit1iaJQ4WQ5
         1s9JHT/UzGVFZxOVvfcirEDrdglsSl7659obz2oCm5w6W6iidg3PmVLgxg4eoe8FWtam
         8WNV9vimRnHX2M1H0B6oXNTMudg0j/NuYg82N/u/gSNLrWCXocGjBMq3PaEd020pbZtB
         yCYcx4WmC+516lXVMxIpA3Jc9FMld4o3g0ShGC9PXXrpX/zv40duiBv5UESk/CeMb3am
         Jrcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791829575; x=1792434375;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9X7+vukQhUXex3XswiNVvEIb8n/onZie8OWyOpDCBNA=;
        b=nU8iMpvrEv8fyEUiW4oSXYJgiyupPbn36WRphZADUikKFURffwm0BiJIHN75qzizUa
         5wiqbM4dyBWQC6K1p7zdjh/0GL34ms5VOlJzu11998Ubjzw8M0JK47QuXMN6CQrLECvA
         uAd7VVlmyaSwD3lSxVhMwwuIhhly7ytPwuxG1VlrcJ9QRVDI8fM4qJPj2swRd4vpztEO
         MaWm4Duyip5U4RFOQX6xgV5Bjd6xeN6aEySgBqW7vWVkjo+inzhqCG85TCzYr/156YLc
         p9eOsEjxIJCPLlHMclSfLnJiVP8YfXLfPECcMAfRlMBadNzg7PrD46gENF8n2eVheU+3
         xEZg==
X-Forwarded-Encrypted: i=1; AKwUvBx/ty2ltX3ofzYT6ysD3dwjWXeyRyx2eVLWPzsQcfIKMoEZE4DEuzE5XprG2YhP2D1S2gFYOrb8Zlgi@vger.kernel.org
X-Gm-Message-State: AFq9FYLo1/pTvamk2EhaBbqSZSiXjztKOB1FT1LBHfQXRGdklWnlHbSx
	kQ7ioMNAEqGv/gPYqoilr5gpaAD3QooawwBdkM87w7BtWjRv8cw3fpFP+zBtyvWVfRF1ziMqqoy
	mHk/6STHrHQuWrdo0pdNO94ZD1JihkHY=
X-Gm-Gg: AYBFou1Ly3r3Fo5CDJyEjTGyspvmXv/BxKvPBuzbpq8rqjUzVBgdyAG4MCwe+GxLlPa
	gRr0y/OKDQb6+U/p3TiMfhIpGmSBTCT+OZg/hDCTpb8cwB3lISK6Ko42K3o9NypuaX8sioSkH+a
	a6j165o/c2YPuFFzfOHxsin1L0MKwAo+zxmkSL7eeNvZ2iMDqfTkoKUP/qXxZZJM+JHBYSnqHmk
	p2I7CjteFN77rT0lB/7NsbCxNFqlwWZEyWaem6yAd9+Q2GtyU7OWiFK6+Vusb1WurA+wKG4fJPP
	bKCXKEgiwkpmpWCD8LoX9BhMfOur7cFDPWejqyjYGNykY7gg7lcfRgTPYhZ/GE1YtvKnezyMCvS
	aHFzlRuchl/V+O15iZg5LdRpVOtOJeImZUpxVdOiZSTqUy3BWKXhecpVj4jWlsZ8U6vqpw0oAmB
	E60iyZRaQBbUkVbR82nRUrEoTtFGWos9N5k8DYoY1X
X-Received: by 2002:a17:907:3e1d:b0:c2d:d27d:ef88 with SMTP id
 a640c23a62f3a-c31aa0b5511mr1082097066b.42.1791829574275; Mon, 12 Oct 2026
 11:26:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-3-cb47ce2ad758@nxp.com> <CAHp75VfCrQAnVYV-7wiga-R8A4VKgjfV+EHo_7jy=FNmU=Ov6Q@mail.gmail.com>
 <asytkrYip+v2vl/i@shlinux89> <CAHp75VfqdVAYCTi2j0sB=rxBYaJ709-Wq7-aprfZZiBxbu=U_A@mail.gmail.com>
 <aszHhGylycuDIY35@shlinux89>
In-Reply-To: <aszHhGylycuDIY35@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 21:25:38 +0300
X-Gm-Features: AclHuK9Yv8wpNcKas8ocynagdzdCNr0lM7euheMiilCMFZqAJfrfDJ0QKY2cll4
Message-ID: <CAHp75VcJsjRk5v6=X_ut_S_vLLu24tHieOy43ATAH2Mr3P2RyQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/13] gpio: mxc: fix wakeup_pads bit operations
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 2:37=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 01:30:04PM +0300, Andy Shevchenko wrote:
> >On Mon, Oct 12, 2026 at 12:46=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com>=
 wrote:
> >> On Mon, Oct 12, 2026 at 12:15:28PM +0300, Andy Shevchenko wrote:
> >> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.=
nxp.com> wrote:
> >> >>
> >> >> gpio_set_wake_irq() can be called concurrently for different pins o=
n
> >> >> the same port, so use atomic bitops when modifying wakeup_pads.
> >> >
> >> >The code doesn't modify any reader part of this member. So, the above
> >> >paragraph is incorrect, right? Otherwise it needs to be clarified how
> >> >assign_bit() does change anything.
> >>
> >> I will replace with below:
> >>
> >> gpio_set_wake_irq() can be called concurrently for different pins on
> >> the same port. The IRQ core serializes per irq descriptor, but
> >> different pins have different descriptors, so concurrent calls for
> >> pins on the same port run without mutual exclusion. The plain |=3D and
> >> &=3D on wakeup_pads are non-atomic read-modify-write operations that
> >> can lose updates when two CPUs modify different bits simultaneously.
> >> Replace them with assign_bit() to make the modifications atomic.
> >
> >Right, but the code does change only the writer side. There is no
> >reader side that was changed. So this patch does *not* add any
> >atomicity. You also need to check if the reader side already uses
> >test_bit() or something like that. Otherwise it makes no sense.
>
> The writer-vs-writer race is the concern: two concurrent
> gpio_set_wake_irq() calls for different pins on the same port both do
> a non-atomic read-modify-write on the same wakeup_pads word. The old
> |=3D and &=3D compile to separate load/modify/store instructions that can
> interleave, losing one CPU's update.
>
> assign_bit() uses an atomic RMW instruction, so concurrent writers to
> different bits in the same word are safe.
>
> The reader side (for_each_set_bit in noirq_suspend, wakeup_pads > 0)
> runs in noirq context where no concurrent writer can execute, so
> reader atomicity is not needed.

Thanks, now make sure that summary of this is in the commit message.

--=20
With Best Regards,
Andy Shevchenko
