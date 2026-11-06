Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793987313;
	b=GAkfLmB4d8YWRNJy+XOrPc8tg0SCHzg0idfJSXsSltwc21Zarg7ns9CIEhjco5/P2ICu
	 UpL7QhiQH/E3o0Qu/Dt+WXw+wrXQnq6ZW05DPCVOpO/6Jxqz5R0+PnxWfyTOtSWR4cYLB
	 YzRue/TaRMYEAL6gQE0WUyAnJ1SPlKcKGDEuwePlZMvdol5CCyfmKtsM2ZYuh+zhe2Kzi
	 i/XMCMfRx+bNSK0fKX7RwgEjdqrX7xTJ2DRSDguQ9aa+esrJSHu9Qt7/GaGcjIyXWD5Co
	 Z5aAkZeEwA8DESRZje8tB6bedfEK3TwTH4ehs0Pv1xPqdsMx6Ly7YYpsIReW6B3UorQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987313;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wW8vMELsSAVnBK6VCjyzxOTijbmPZLXMkWBj11p0mqM=;
	b=MODQYInL10E1itGJpqyBzTCLInLQT4RGnbJq3WSLJbpX1sW5sLjrnYwAxqRRipM2emAf
	 99X/ur00+bhFdJRNZ6Ptdv64wrzjbjem69Y3ijsSzDOmBLk3ijNp3gm7oJLH+q5bx1NAj
	 /tavI6JIOYuVAhjE07a/sC3KP5dbc2HjCehir7+5I42St+7lMkzFohr+vcYb63JU70rAZ
	 BWg6awL2rE2Ev2C0I73OXGeakjLNB08AAWlx3Z4ZHZU7nSj70bshV/DZll9u3Vfdi1MdX
	 vMNmesbxULf+BaFksmexsJKJql9DbMXWzr9u88Ds7icPOyXKa4nZE2ibcaPVGuiLXDQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yixKFmpR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF30606A329
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 17:48:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF30606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yixKFmpR
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ea138a3497so5455785ad.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 09:48:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793987312; cv=none;
        d=google.com; s=arc-20260327;
        b=PHULmglgvUUO5IAMW+xG8SvCepdsReQZjJ52Ol1kDts68Fj03mtZbtw/qE1rhPUvLk
         fguwWBThOBYYv5bPPtxON6dqOv2FfN29SgdK/A848ilBKE+R/q9axDFKG4IWQwZnLnea
         9GktzItQdgb2ASeBAvOOvNjA6+MfGNZbAxi1ElbVtJ9ckqP5kGlzJKtv6QNCR1yU4xXU
         8A2OFPfq7XXxGmIdxFEsuWTjmwp850cRbdLcMK/uG5v5QQePcFaqubNDZ91n9lGkL+a2
         lVqVTZfKfw/O/bSsTTpQqD6tOLCtbujMgsChLCoHa8AAatlnj37QAEqEhPqsBdK8zU+A
         h42Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wW8vMELsSAVnBK6VCjyzxOTijbmPZLXMkWBj11p0mqM=;
        fh=QW1sItX3mmWB1cyTKbEaRRoS3Ms+qQFcMqr6zODPCN8=;
        b=BHgtDh51H94+jXl8RlRdQo0IPxDf7Rr6/u83vkyWLalohYR02OovnSHli02Z7jvrPR
         gbaYwC12tC/ofWrmDL8NPGRqOWntmG+utJ/7iVJV2TFM4FOi3pFeb+VA+uN94whTVmJ4
         CthvBWRlacPc1lKJiThUusHw9f94z7/BiWJDs6prUlSvcNGJCNTgZFguFnvBruKf/kFG
         9DvHBfZ4bnkYRuS7nPw5oIQIQtFOiVcByxh6NNAjuROHQ3QlQyhQ9Hf5OaqxJsWFtPyM
         fyPd/jzaNVx0ZQScjPsg2rHzFDHgTNRNvwkOUBjufu3XOrb8KDM5GnHRwfzV0Ow2wIhr
         TDeA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793987312; x=1794592112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wW8vMELsSAVnBK6VCjyzxOTijbmPZLXMkWBj11p0mqM=;
        b=yixKFmpRcBMF//X09M50mh2S5/EOg7hKShzsAngsCyLSF3KfFWa8hzZktyl5UoeMwE
         dHf9H6unilL1dutvIOd4XLxHP+ujF6ttvCOLXHVg00az7TlBfsDGLa8WFmbJMu5XNF2w
         RulIdnjeLfsiZRK9200ts/dMIR9qfn7fxELYEx3/yWqrAOi4Lx86kq/q0aK7rKfSKz97
         zwcDjC6YxqEbsXiz1snrUvC3xeUqS5JDEj9WAImw8WOOhkrNicLI8UTywSkk7ovGHrKf
         Z1hnGVAuhJVDCYhGkQJl7JlFs/70kGbIGeOrqKoq2ql55JFPRQTlnnk7XtgIgygBETqJ
         HzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987312; x=1794592112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW8vMELsSAVnBK6VCjyzxOTijbmPZLXMkWBj11p0mqM=;
        b=Jd9SPz93B9dBr6vmbaaT0K3P95ZS6P4qQWDT5vTKEO0gudB5Dox1ZwmoZuQub9t29u
         gH7pTYUB1+9yHrxkc7H35eyAZ7DhwReiKHKAe5oO+VYf04RgbqP0iwUQ6fxDnbikMNgV
         PdExAMHaDW0tnREciyYZhWFmFJbb7EpuABdyiPedCI9S93iE+Knhs2bc0fM2v3PNHmYB
         mZNbmFsm4+nFx3OVZ0o/8s/g/96+WYz2WLyFle+89nwnMk1lV9B7Y7L0nJv/S81Pw8l6
         kG9EA4usEqHtC86TLXrByS91G0pp9EzYOeXZbTsQxoS7Aj/a8SvU34aT535fLUoVWdTg
         Z4tg==
X-Forwarded-Encrypted: i=1; AL+hErFSCYO32Q7txSEmgVc7bFUgqlAw5mnD2p6e7X6VPFiPYddvpwK61mhgF3n0j8dV585LF9ubTTG+7kRY@vger.kernel.org
X-Gm-Message-State: APuU4Z8Z8T036b0oqiL4p2EGRc2WGnjyqMvq7gxTy9udGqkqo7TkRWMT
	Qf1WIYGJJEfbmknEgZhrWK0Rx6AnuW1hObnky2b5i6kUbEQu2+vp1h0YAJH1G6JlNQCRR2BGQqI
	pYmUpVhAF/1HFo78bLqkQOL7dl0APjus=
X-Gm-Gg: AYBFou0+84dWigZ8FWPKxUhmSa7l4SvQW2vu7XAsAPAIfz7g62rOspTLEv/+p0QmkEL
	P4VHcwUvzBF1DRt5551PZGpgfB8Rvfuomg5wQ97kqDOjx7JNXH+mkFM46J3EMrlaxgkYy2vFvtP
	gVqNy+xu/J1PiR0Lwoo+sYm3Tk18S149MkZbOwgPoeC8tRUgOfdgCKf3ZO7ptc88WKn1WSSztA7
	HGayVl1xEGjBs6zJkIrt6WRogmFwBUsQYRYQSyJqKM0uYL8Ooho65XILSoECjMElhdG1QezUAUL
	zVOunAXxJsDKKGDiBrAR+8+mRq1yAkwqYmxCHA8Akk7xoakBKA+fvrYs7N+F5lVrBER403cfjLQ
	xs5JmMnfN4kvfcbhVbS6CYa58VQSIzGpnfUxp3oRoZa4d2MByibtCVQydaGw=
X-Received: by 2002:a17:902:ce8d:b0:2df:9057:8bf4 with SMTP id
 d9443c01a7336-2ed40c7730fmr38292825ad.43.1793987311883; Fri, 06 Nov 2026
 09:48:31 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
 <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
 <CANA1Db=sBQFR99pw0YUSS9sUcHtHVn-SoUyj3p6Vxa+LLJF_Ug@mail.gmail.com> <a7668081-54cc-4f8a-9d9b-376365b90dc8@amd.com>
In-Reply-To: <a7668081-54cc-4f8a-9d9b-376365b90dc8@amd.com>
From: Munique Feitoza <muniquefeitoz4@gmail.com>
Date: Fri, 6 Nov 2026 14:48:20 -0300
X-Gm-Features: AclHuK--dc6lBKAHReoOoB6g9IcoALLNd05TNw0fRkqc3CU2ssJv_1d6fR8uNF8
Message-ID: <CANA1Db=d9=Suwh0V8Zu_G_BGq8YX=dsXKU+1DF1hy_NhYU4aWA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and
 skip unhandled EOI
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Linus Walleij <linusw@kernel.org>, "Mario Limonciello (AMD)" <superm1@kernel.org>, 
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mario,

Thanks! I've created Bugzilla ticket 222242 and attached the requested
files: https://bugzilla.kernel.org/show_bug.cgi?id=3D222242

Please let me know if you need any additional information or further debugg=
ing.

Best regards,
Munique


On Thu, Nov 5, 2026 at 11:49=E2=80=AFPM Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 11/5/26 18:27, Munique Feitoza wrote:
> > Hi Mario,
> >
> > This is a real issue observed on my desktop system during boot:
> >
> > CPU: AMD Ryzen 5 5500
> > Motherboard: HA0QING A520 (BIOS 5.17)
> >
> > During boot, the system experiences an interrupt storm on the AMD GPIO
> > controller (IRQ 7), eventually triggering irq 7: nobody cared and
> > leading the kernel to disable the IRQ line entirely:
> >
> > =C2=B4=C2=B4=C2=B4
> > irq 7: nobody cared (try booting with the "irqpoll" option)
> > CPU: 5 UID: 0 PID: 0 Comm: swapper/5 Not tainted 7.2.14-arch1-1 #1 PREE=
MPT(full)
> > Hardware name: HA0QING A520/A520, BIOS 5.17 04/02/2026
> > Call Trace:
> >   <IRQ>
> >   dump_stack_lvl+0x5d/0x80
> >   __report_bad_irq+0x35/0xaa
> >   note_interrupt.cold+0x1a/0x58
> >   handle_irq_event+0x72/0x90
> >   handle_fasteoi_irq+0xb6/0x1f0
> >   ...
> > handlers:
> > [<00000000d546c9c3>] amd_gpio_irq_handler
> > Disabling IRQ #7
> > =C2=B4=C2=B4=C2=B4
> >
> > Checking /proc/interrupts shows IRQ 7 (pinctrl_amd) accumulating
> > around 200,000 unhandled interrupts on core 5 before being disabled.
> >
> > When looking into do_amd_gpio_irq_handler(), pins that trigger an
> > interrupt but are not registered as IRQ lines
> > (!gpiochip_line_is_irq()) only have BIT(INTERRUPT_MASK_OFF) cleared
> > while BIT(INTERRUPT_ENABLE_OFF) remains set. Clearing both bits stops
> > the spurious interrupt status from re-asserting.
> >
> > Best regards,
> > Munique Feitoza
> Hi,
>
> Thanks for confirming.  Can you please share:
> 1) your full kernel log
> 2) an acpidump
> 3) /sys/kernel/debug/gpio
>
> On a kernel bugzilla?  I'd like to look at a few things.
>
> At least this sure *sounds* like a floating GPIO.
>
> Thanks,>
> > On Thu, Nov 5, 2026 at 5:18=E2=80=AFAM Linus Walleij <linusw@kernel.org=
> wrote:
> >>
> >> On Fri, Oct 30, 2026 at 8:50=E2=80=AFPM Munique Feitoza
> >> <muniquefeitoz4@gmail.com> wrote:
> >>
> >>> When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> >>> that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> >>> currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> >>> BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> >>> INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
> >>> re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
> >>> and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
> >>> main and RGPIO banks.
> >>>
> >>> Additionally, if no GPIO interrupt was handled (ret =3D=3D false), re=
turn
> >>> early before acquiring gpio_dev->lock and writing EOI_MASK to
> >>> WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlo=
ck
> >>> contention when the IRQ line is shared or asserted by an unhandled
> >>> spurious interrupt storm.
> >>>
> >>> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
> >>
> >> Sashiko comments aside, we really need to put Mario on CC for
> >> AMD patches, Mario what about adding yourself to this MAINTAINERS
> >> entry:
> >>
> >> PIN CONTROLLER - AMD
> >> M:      Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> >> M:      Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> S:      Maintained
> >> F:      drivers/pinctrl/pinctrl-amd.c
> >>
> >>
> >> Yours,
> >> Linus Walleij
>
