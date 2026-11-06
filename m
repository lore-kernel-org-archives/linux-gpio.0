Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924861;
	b=i0vCWzBLtd3QRbFIhq+bkKXiXhcTNrNKJxlPnJQFyraCRf0KsHMubyo+QbJG0XBUzx6H
	 GGuMrBBhukF/jh9ORjd+L49fXDEbJoQRiG2EX2BbBrURtVj60swcmCN0Rt+kTDgtArIGU
	 s+DqtJxGzSccIende92mpAML6w+gAaJNH2o0+CqiuKQ+3pXzMLszKRP68Yjqlc3ux8YIH
	 PHkV0pCR5w+HlGUgDWOfxVTHhflDvtJvZRg+oA0fRS1ys2woAQ4GrD0+cmXdvecCwJrhA
	 OutGCEnKtiS5fZ7qKdqw6U/qOB3qUy/9VLnxVm5vXU7t3D9pgw91VgELJFDbekncXQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924861;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lQxfqQqFBFzOVfTUhrZDisLoJMIcujAgL0jSoxPWA2g=;
	b=pSb8jaT2IF7Y9SLAlxc8P6MGX8f6P9GRmtpCX42+eEncs4antN7WirwTpJ8g7A/dTy0L
	 5OR2+gwnhlcHB9d9AQN+hc8ITmEHB0gS7caOY0CNXcxfZSfXFdMwodO8gcXuEWwJbVHtG
	 7ht0CSvzmbjv8L0OG3kk0VSfyKe/vquyR6g7OEb/4+NRXSb8FH8qT0YyTqhQPTaetzXG9
	 kWBbf1WEfcUUWTW+dEsMrQtP2YGK/UvOzRbiADJcSKWYy08o+ueoT8qtRFwBfJbLRj9Sd
	 RxWbOO9L5tpUqcIMJtJfNO13SLl6NmqjS992I8Yqbx0e8QAsyqRL+yYaG79rbEtERmQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8aotozh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6F5606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 00:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F6F5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B8aotozh
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8a60f90a924so16033b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 16:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924860; cv=none;
        d=google.com; s=arc-20260327;
        b=IGMq4AR7+cnLFoocg1hQJkx4ngn+m2EPnQYG0t2shZAKxxZLTcHD3UMNWTKvpYKoB/
         RJk+7OnaBsttQ1IdwAq+9zkObAkvCuecrg7sFp9z3QNRaeNUB7hyg9CgOHdEnh26fbqO
         fEMKe30H1SBU76DWw/JXYDfT+P+P4jG6ONT1Qw667mmfWAr1AzI9ufKQwHdBY/upAnN4
         CO155+sBkhp6dkR4xPRDpRaPIjbzmBGzR/XCbntKzY+EHDWss92dHzLHgH6/S842saRS
         KfImKWmrBvvTi6TX3vNeH21jawVl0DekR3eCy8NyPn1Rl19AqZnpPmAsDVp4nOv8u6Ic
         G5dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lQxfqQqFBFzOVfTUhrZDisLoJMIcujAgL0jSoxPWA2g=;
        fh=gnwpm0fszpCKOrcr/Io8Rz/EmkVeMOXKAXUbvVIs85Q=;
        b=BfcFnimnFhk9N+/EeClFeFa4W1Y/i+El7/I+mU17gkxOfWWxzpDuzm4ZdVKKFFOasI
         CUqp6j+MS3Ta9ZIjUypUlP32YGAIrrcMDyVFiF7Vf6eQ2ifORmdlFaYjmnWTiloK8CCK
         oE/bIaO/BG9tbFkq5ofvRGfPVIA/yfVSgdZxNLI/LGIzLBOxFw1raDugZDxwsB3pe53d
         3shsbD5kX2YNDKwwOWGIpt61UhCvfCqaDC4QBsYeBthEFzuYHIizvBd/Svx9oT1udZBC
         cRVT5UCKV5H9Q80bjHN+yM11QnCGTG0q9PCfc+1YbQF+4ybG8eLH16MAnJMWCeAQDCt2
         3SAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793924860; x=1794529660; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lQxfqQqFBFzOVfTUhrZDisLoJMIcujAgL0jSoxPWA2g=;
        b=B8aotozh3RbL/dFwkTi4TMSy2nLYpJUYRWEYI3cy5AUlsnNovNsF/611X62qwIKAnT
         Q2Se8RO/zDE3KstqARhy3XiKYDXNDYRU68XBMd1brohkfCDrMN856R/hzeBiGFtfaTmr
         ipylV6gZcwXVF5im89jT0tXa3Te9VZGxBZ4irnxv8ORH4ncezZX44sd03ZY1oIiIfJ96
         +boVPu9To0OpNQ1SueOHPC82BfqVSmXy4OfuDIXN2BFSf4B5UroMtl0Q6f+VqQmTYmc2
         1/8XjFBSNQu7BymnVB+h5n22omGDmFgpDri9FMZ80i5EeuLLXYRDlq5mGN4OWeYkyZCy
         IMAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924860; x=1794529660;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lQxfqQqFBFzOVfTUhrZDisLoJMIcujAgL0jSoxPWA2g=;
        b=KANwpaY/ubIVrzdpNDgINyCvH+2VLaw2rSAPNJGAdGja6XBo9sAGxz11J+cftLMfn8
         9MguKNaMEicSVDXz5jqRsvMXqH2ZtZV2ieCxpwmpQ37TsWjurUqTmynYEQqVQILyTo4T
         9aypKwQ/GEo6DH5TccHtU2MZ7xyyGHdQ4Qu+YfBQT9eJdpS4kL2O6bQoqS24zp7svpCR
         5fKV3PgZVZXjEuzSBVrTNQQ4M7PTOv2DMIFOUUurP8+xgUmtAmeD6o1qm4gOb8+GFNOv
         IDz/b0nwOn+I/EysmcDjH7McTqRqShxB0UreGyDUpIMgEomc4xw3sG3rmUIWNWqsIX7t
         VOFQ==
X-Forwarded-Encrypted: i=1; AKwUvByXOecbnNvYfytlbvCQQgC2gTNHG7E+EmbxTJahx7dtSBOWwrv7eSGjARN0Q8Ic1OCow4D1OPNSR3ot@vger.kernel.org
X-Gm-Message-State: APuU4Z/M3Benx9d13N8iWAYu6gjY3vIkwBTQ0KuPp9z0CHjsT0SJi+wO
	nA/1tzOl9wuMJs8sgpGFV0y7453J/s0hmLKpANvPCzV6s/2sjd6Hx3QBC6jxvGAcnccBHwtgnt0
	XtT500FtA0eO/vQAOE2OrFPwPcN/rxzU=
X-Gm-Gg: AYBFou3bo8APeW53ef7f2dPTz1tTAsotSz8Dxb4bUfpWPwtPXVLSBfeNWb7VaAEdd+W
	GLMjXQR9Yn1PMKtonSqeN2pJeFvrekOW4eYiUE+rU7fz6cdmLknbKXZngZYy1b3hDZ/G6WBCh2I
	tzaBeSx2rUw0ujA9MwCWhuPbC91SeECt9XLh78e8AfKvpia8sY/0bqnsPoYtS9oc7krQ90kHW+M
	CnJHX/RSDK7oU6+1SeWmJ1S4/wOZ1xnwKIlkjwPC3rlWjzaBbhbeCtARBJWitKwFQGY7oEK2bk7
	4j6U6QW+QF3AvqPxj65Yt61Dwj6pgheQb5qbwOLOYUCR+jowfy9V0ZykxG6eCyzehS7qiDOoaIm
	IBNBhrj/zyhlTg8yGE4vdqM4VTOw+fYdSzJPhN+5h7PvoCUW+TVVyBMBnN/uIMqQ4+6uF/7KUov
	yNLOxa3ihj+KDHwM7+
X-Received: by 2002:a05:6300:67c8:b0:3e2:83d5:191b with SMTP id
 adf61e73a8af0-3ebb2aa4cd3mr1017226637.63.1793924860049; Thu, 05 Nov 2026
 16:27:40 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com> <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
In-Reply-To: <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
From: Munique Feitoza <muniquefeitoz4@gmail.com>
Date: Thu, 5 Nov 2026 21:27:27 -0300
X-Gm-Features: AclHuK9Mf-gcoGvhdirtuFilPtygvQ33RIDVt4CdaQjJgJvOHKAoPNhtTi8dHeA
Message-ID: <CANA1Db=sBQFR99pw0YUSS9sUcHtHVn-SoUyj3p6Vxa+LLJF_Ug@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and
 skip unhandled EOI
To: Linus Walleij <linusw@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario,

This is a real issue observed on my desktop system during boot:

CPU: AMD Ryzen 5 5500
Motherboard: HA0QING A520 (BIOS 5.17)

During boot, the system experiences an interrupt storm on the AMD GPIO
controller (IRQ 7), eventually triggering irq 7: nobody cared and
leading the kernel to disable the IRQ line entirely:

=C2=B4=C2=B4=C2=B4
irq 7: nobody cared (try booting with the "irqpoll" option)
CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not tainted 7.2.14-arch1-1 #1 PREEMPT(=
full)
Hardware name: HA0QING A520/A520, BIOS 5.17 04/02/2026
Call Trace:
 <IRQ>
 dump_stack_lvl+0x5d/0x80
 __report_bad_irq+0x35/0xaa
 note_interrupt.cold+0x1a/0x58
 handle_irq_event+0x72/0x90
 handle_fasteoi_irq+0xb6/0x1f0
 ...
handlers:
[<00000000d546c9c3>] amd_gpio_irq_handler
Disabling IRQ #7
=C2=B4=C2=B4=C2=B4

Checking /proc/interrupts shows IRQ 7 (pinctrl_amd) accumulating
around 200,000 unhandled interrupts on core 5 before being disabled.

When looking into do_amd_gpio_irq_handler(), pins that trigger an
interrupt but are not registered as IRQ lines
(!gpiochip_line_is_irq()) only have BIT(INTERRUPT_MASK_OFF) cleared
while BIT(INTERRUPT_ENABLE_OFF) remains set. Clearing both bits stops
the spurious interrupt status from re-asserting.

Best regards,
Munique Feitoza

On Thu, Nov 5, 2026 at 5:18=E2=80=AFAM Linus Walleij <linusw@kernel.org> wr=
ote:
>
> On Fri, Oct 30, 2026 at 8:50=E2=80=AFPM Munique Feitoza
> <muniquefeitoz4@gmail.com> wrote:
>
> > When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> > that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> > currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> > BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> > INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
> > re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
> > and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
> > main and RGPIO banks.
> >
> > Additionally, if no GPIO interrupt was handled (ret =3D=3D false), retu=
rn
> > early before acquiring gpio_dev->lock and writing EOI_MASK to
> > WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlock
> > contention when the IRQ line is shared or asserted by an unhandled
> > spurious interrupt storm.
> >
> > Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
>
> Sashiko comments aside, we really need to put Mario on CC for
> AMD patches, Mario what about adding yourself to this MAINTAINERS
> entry:
>
> PIN CONTROLLER - AMD
> M:      Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> M:      Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> S:      Maintained
> F:      drivers/pinctrl/pinctrl-amd.c
>
>
> Yours,
> Linus Walleij
