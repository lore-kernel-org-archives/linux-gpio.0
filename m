Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A0732D0F5
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 16:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080027; cv=pass; b=IfsZ7C42vSZPAIZ0maoRZa56/TqrGp0OZcQI4IH7jwDLqGfOwcrwGyp8p8Q/ok8CVL3R14bHBcNuSAOHLoWjf1wSYF2raSMlc/NfXFI3hk53/2E4dEhWw6FHHSCbmmOKZfX5Eebn4Fx4KtOBwpCBVaGw2ptghr+STNWthUO7p7g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080027; c=relaxed/simple;
	bh=FliHvTEsbM/zv34ZqRM63NOm/+pxcZsJToQjbeoGS6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ac689+3fKtAvB6sv5Vgwa76lvqg7cjrH6CwQ8+I7E2bCATkpyKBDxMLcLRN/t3YpYLP0cI7w7jnt6gTwgGEaGWTtXHfuH/kPPiskWmafhnpyYmNTDcbk08Gbw2BAOFd1lZM7tmm77dnyCbY93S7NWNGDEal4TjpI+cNdtrlb4bA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JMR1gkyx; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JMR1gkyx"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b0cf2c0785so14850927b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 09:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792080015; cv=none;
        d=google.com; s=arc-20260327;
        b=eJRW+IHOywgmKt3JS+yKblBkmI/isdSDyHL8wbBg1b3Xd0rnV/mHrpIK1AxEXXhMuC
         B3KnxnBbuhC5+ts8so5Q+PS11tGWxZ/6o5Y7wQUCQ4JdDkjXbJOQxhJm3PeNdT+aSLP/
         Bh2qdznWtPeVKUFoby4bheYnvSupRgEBvb8+8P20B8KzufAyFSqhTk30QSRg/9AS+2LN
         PabjW/3gEY1i4CotmeUyoylkZnoTbJhP2GVaP5P092lwPKgYIuZtXmb0T5TPc/oSnuIr
         qoRDRWNUkQaDXKWkemxca6RtxwTB/0oV+yaH0Vkn6NKiZiqii2JCY6dxQSMHelfSfQr8
         NcMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EpiamPpg7tsWlSrLw5y7LmqhMB0UGS6DfO66CA4pLkg=;
        fh=CVtZn6GaWkX7uJsBQmfTYOWjkz+6cM/G3cjxhhLDl2I=;
        b=Vc2jlsAchNg4KsKKfi6PJbYm8hnodlaYr4+9PpkqPhRiwty/y8D/U+Z3Hwc3ZYhDRb
         Mn5LVY2301ZcSb57kguBVCTf0AFpZOMFQp71Bo++eF/L3vx9bahoeHYGBkPlP9KxzlPL
         zeNLUWm9HGUWFNr2Ja7knYkdY4/o6f1Bcaeb+qpCpKYWLsEDhVrxe0U23hciPTvK4ijy
         CFrcgQT1VA34Lx5K1/h6WCplFG7Gypu5emRLiIrK63WHdAR6IGPYWi6BOU1Nd2UVCau2
         j0NR/K+SPL42hdgZhh47/4W4NOZ1mk/kNPeOb5ELfcioKpG7nZGs6WJo39+BFFuCEd4F
         mn6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792080015; x=1792684815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EpiamPpg7tsWlSrLw5y7LmqhMB0UGS6DfO66CA4pLkg=;
        b=JMR1gkyxU2899dJ3fFA6hC08t0Wmes6MrcynKF5bRXQDnqqFvUd4luU93T5UKe086P
         e+J0U44NXUntpW38zLXMkgRZspXH7/0NBFfLcF2Y6FsBwf4vfvXvLZFl1a9yft1Jzib2
         DX0NHj+TvTjTXjTq2po9L911AzzT384Me8E5jSgy5jNk1LFvP31jZPm2X280B6Zk39zT
         fYaLrZ2oM7WYG2jJqid5YvC4JuDgRiEDXPz828Rd5dvhMNkIOSDzSgdunaCv0BtnOWpX
         slDVeqSEdXuqmyAmNNBiGWrRoTSfOvQNDr+Z+QcXRQCcJ45bSQw9AwfRYCkhVZeSUuiz
         W7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792080015; x=1792684815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EpiamPpg7tsWlSrLw5y7LmqhMB0UGS6DfO66CA4pLkg=;
        b=xsyt85DGepGb506XQUgW1Hf0/Wa0D00PxRSUN5wmHpN1wS4XfPyqfBsYtolBW3p2fJ
         vYIyVXUWo7W1CrxKypwj6lR0uDVrFZnKUgpMaoXmX9VRa9JxBJJuNh85lscrS3hvbRVN
         hfDuYAzz5pLqwloz5KSdy3IQwGBjptYAcvewbex7Xhgx7TEUoTsp3j7Ardbm+NjpuKpg
         QscjI/ufrNhW+SXe9XrFrcrKuYuGenpmFA5HwXI6vt/KumrgcerP5X+HczLn5gAoO+Wt
         ZF2BFMelX2WTAwdY9FpsqNAMNWSjF/UP4wrUyOj8tUmvM4S093HJG4/LeIMSWtHjOr2O
         7n5g==
X-Forwarded-Encrypted: i=1; AKwUvBxqzmCZUbVLRA9dCDWATuqDBvCHxlWgXvI4g754BLEGGEKfc3Dr1r7o0a8LLtfn1qEognW401dSmEhq@vger.kernel.org
X-Gm-Message-State: AFq9FYIokNjPvj89l9OU8QYtR7bReFnRZMjKU2IFRj4/hbq2kSstkvz1
	cC8mJo832aOVAk10lqGJXKtj3qlHRu4buHiiFYtB0mJlOsKYWoTaHbyuQAYHLqQRlGRqkFRwaLU
	A4wt5ocFlXbDOsXO79Bx5xRgCN5st/g5C35KZ
X-Gm-Gg: AYBFou0hvcsA+HFQofSqKXvjm7Sd66GzuRJE0LSZVhpZ+Ob+EqFIYH+5k25ZQiCLrfN
	XePEhV0LQ0NPhstfEZUFmex6JT19sOz0i8bF6XLyFA+V8+7ct6C6BTVoBHqHWob0kvLw8HjKbPR
	6j2mtraE4j0bOeqqwiACq8oOzUmv3qI2BSNL0/C5L5bf7FOVYbsarw5AEx08NwN2TsLPwvzJehw
	lXN6TIT6e2Q6EHzaGNDRlco+7AcBYWJH8W0pcL98HUB7Kmf9D7vgHWDtWhJVIx+8ywZgU/0kaIf
	3RqjtoeQFs93t5Qa/1UCctYzQ6HHqsamYaKCULZjzy+sZbbvhbqFdiwffw==
X-Received: by 2002:a05:690c:f91:b0:8b0:db26:88ae with SMTP id
 00721157ae682-8b0db268c9bmr5613747b3.43.1792080014084; Thu, 15 Oct 2026
 09:00:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMFFDGh6XwYD-axu3brX0Tdt3PteJHHGo6oJaghzpvnEyzT58g@mail.gmail.com>
 <OSQPR06MB7252CC7FC2131D45457A1FA98B962@OSQPR06MB7252.apcprd06.prod.outlook.com>
 <CAMFFDGi-Zzwk33Rb2LPVOSz+XJa51iBQ3ZWEP6mLg4C362F=VQ@mail.gmail.com> <CAMFFDGgv0+sUL4V4itKw3pezB4MccYr1rGwrS6F0qwD=0HLB0A@mail.gmail.com>
In-Reply-To: <CAMFFDGgv0+sUL4V4itKw3pezB4MccYr1rGwrS6F0qwD=0HLB0A@mail.gmail.com>
From: Prasanth <prasanth.padarthi10@gmail.com>
Date: Thu, 15 Oct 2026 21:30:03 +0530
X-Gm-Features: AclHuK_aaHC138fG0PxG0zW83HUUPVrTWcZnddhJ4Q2cRZHfJqvDEmtIQg3W568
Message-ID: <CAMFFDGjXyHVthH33ctkCYLu1LUFB3-b3HG2hQbtOyT3tSvy+bw@mail.gmail.com>
Subject: Re: [RFC QUESTION] AST2600 GPIOP2/GPIOP3 pass-through with gpiolib ownership
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Further testing shows that per-operation THRU1 switching is
unnecessary. With SCU510=3D0 and SCU4BC=3D0, ordinary GPIO power-on fails
while SCU51C[9] is set. Clearing only that bit allows remote and
physical-button power-on/off using x86-power-control software
forwarding.

Should this strap-to-GPIO handover be handled by AST2600 pinctrl,
preserving other pairs=E2=80=99 routing, or by board firmware initializatio=
n?

On Tue, Oct 6, 2026 at 7:24=E2=80=AFAM Prasanth <prasanth.padarthi10@gmail.=
com> wrote:
>
> Thanks for the guidance. I continued with a private B650D4U experiment.
> The experiment now reproduces the exact vendor sequence:
> SCU4BC idle:                        0x0e000000
> SCU4BC transition:               0x02000000
> GPIO123 pulse SCU action: cleared
> SCU4BC restored:                0x0e000000
> On real hardware, OpenBMC now successfully performs:
> - Host power-on through DBus.
> - Power-good assertion.
> - Graceful host power-off through DBus.
> - Power-good deassertion.
> The private implementation is intentionally B650D4U-specific and is
> not proposed for upstream as-is.
> Given that THRU1 and GPIO123 are mutually exclusive, what upstream
> subsystem should own this temporary transition? Should the
> power-control consumer coordinate GPIO and pinctrl states, or is an
> Aspeed pinctrl extension preferred?
> I would appreciate guidance before preparing a generic implementation.
>
> On Mon, Oct 5, 2026 at 8:33=E2=80=AFPM Prasanth <prasanth.padarthi10@gmai=
l.com> wrote:
> >
> > Since THRU1 claims both pins and is mutually exclusive with GPIO
> > control, should the power-control consumer acquire GPIO122/123
> > normally and select a temporary pinctrl state that disables THRU1
> > before driving GPIO123, then restore THRU1 afterward?
> >
> > On Mon, Oct 5, 2026 at 8:04=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtec=
h.com> wrote:
> > >
> > > Hi Prasanth,
> > >
> > > On the AST2600, the THRU1 pass-through and the GPIO123 output share
> > > the same path and are mutually exclusive, they cannot be active at
> > > the same time, so having the pass-through pair also controllable
> > > through gpiolib isn't achievable in hardware. This matches both your
> > > observations.
> > >
> > > Could you help us understand the use case? If the pass-through
> > > already handles the host power path, why is switching to GPIO control
> > > needed at all =E2=80=94 rather than simply keeping THRU1 enabled thro=
ughout?
> > >
> > > Thanks
