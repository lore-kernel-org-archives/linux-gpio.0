Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793042548;
	b=Vily3mbyTFeM6qHH8TzMfFhYQxNrBMeAw6Lgzj5Qiw/RMH+nXHwJK11WjL7frcT0OKjx
	 bU0bqtzuXIW2j+acqRSjzTw3UES7dcSjh3UPw8YpkD9gYC0aAuWi7PUbUZ/UQvrLq4u0w
	 yo7a/a1umecVb1SqHM0+nvRljRQwCS9x/NR8FIs8ZbzbaafCZyogjs0OcYaCR1MZkWfCk
	 gjfBgHFrmqQY8jamFiZoEhNbAnudiuR4yC3r0vOIabzF7UWSLpc59AkEJVa3e318JqyEI
	 btE9YqHeHxUrb9q92h0YwcdG3pSu0iPiMMtMiFGHipwzysed6bevHCjlSkoJbfmKLOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793042548;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
	b=hRA+CBexsvTe4+jpVEZtPC3V5wXDN47XLCYEXCEicRZfFfrjMSVDf2l5LzkkXSqC69gD
	 UXkR1JO2o4JPQaGfPh349hO3TcfNvNTol2j1pKehSMXzqFj89FbqyzRvm7B7JnckbFctY
	 cRGCwy5KuQqYtSCBO4ycC4qMsYNn0iuxoS+Swq8VQFaVO5rMSUarcnHd1DkfLZXFa0hMI
	 bqVSmeGnddmAidfgYN0yDXjsOXCZk4oTfGZ2oLCbGl0BqiHi4eYJFKyvWRpVH09gdgD4E
	 15duBuRUwIcXypUOm5aNUhUUse2WwQLT8ztN0DWv+meh7bv8uxg73Q7GpCKwNQ3QBMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bdo9L8xn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.177
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC767606A320
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 19:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC767606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bdo9L8xn
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2e608cd460eso21585855ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 12:22:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793042547; cv=none;
        d=google.com; s=arc-20260327;
        b=JDuW5TCRUevydS3ZMbzQxc4zshRp38xVp2CcySCuuHk94BEU92HMX2c1SIqp6FFjL2
         WsfyYU6tNm9G51TPbGYxH/s/HcxynJcGv39c9ol8jo1V9xD1tiSh3CEbd4OJLy+KymSk
         863EsJT0ecItJI1XRBiLR+cEIyKJ6BVrewCSO5yGmN4ep4ptthT4c8s5N3psm0DUsJtW
         6rZPoCBH6lPlNy2ssKru3+rg2UPiIGXSKHdRDQpi5kTgZmkPrpfjCYaO60QSydqSFj59
         760623Sepq2LUEs91FO8hDRq+y9iJ3yWUJOr2YRlpddQlQhHFlFmJmDvRT5t1n6X5++1
         yO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        fh=E6zQM+RpPXsb78+DGDm0eVUx6IDV6E80+M4zAG3A5+k=;
        b=XWR3R/sfCcpjKkNcZCEkNecp9BLm0cyUfvoWvI228Yg01R9vdCAUSotsYHr0TrdqaQ
         FnGsCxbvgmfU6To3kYU7I5qYza6q8ikXdl5/2Vx6M/tH3L8uCVDmJwIlW1UQXVUjtX1a
         AlVsBdIYeDSQ48x6dtlH8BDxlqz06FST/zIdtBmu/XcEbcovq5WUHj/pIGISO8C5epza
         yLWnIq1RyWoaAVoTST2fuQEYdTTFGwwZ6kw8xmPCcyQYy9279ctPFNq/HCVkhbGJrh79
         Kg5YksAOONxQDaPoPwTW7nZIWSsnjL8YBTwt56ysnzzRmK+D9FN8OttO9Ck25YDWhM2j
         i5ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793042547; x=1793647347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=bdo9L8xnCaTnoVnTYyRwdU0hXn1FeG4472V1eMuVO30LmRUV+eGIvfvVYZD1gXCOO9
         BhJVg0rsk4JDnMq9USWnbNMs1x0vf0WnQOyTIpmXY5eMVzr3EgD5jfViggqNu6zXOb67
         LRUg13+1Fpqtoyo8ww04m2Cc2IMXAslAh67fzPKcM+fcSO0OrIhlQt0FYgTajnPYD6E3
         1HaAW3R8fB+zyC9wyJdsbWpfUwBBcfJ91J5uJjhpaYAOvmKxfkwrgkunwbgUMDuC6b96
         XohzLstHtzgb5AuUqBmcsDGcMmPcwVQDf/ZHnVf3NAtZmsjKU+QQysF9EFy8eIxK7E0X
         YrNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042547; x=1793647347;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xwTAuUAToCB+PtpxcqmiSYPvP1xLCOZOzG4SnyhT+Oc=;
        b=IthKNdpUTu+P14hxk97RrXVYH6CMtjbNGttuIKD6OTVINjSkcbhkYFxMLdol9nje/C
         zt4AtulH5vHBRKwemgF38NTOrCPczON3EfTfekNVOP00OdLGuinqDypwlkOvjgG/fA71
         aSjdAsuS3K9BUXKnVtSDIdyO4rfTTionIQVCN3lqXeu6qAHHhAWXBHvqpidgyfeAhVGJ
         LZj/zdkvsGlOrCAvuoS/L9SSSv+Xbe002euhltLwLNbJLH/3QFbdshgm6/P7YvMcyDGU
         KY88efCauAjaXpN+fRiy84AXNSwU6Nac48wA9zvpSKSFa+Lt07dlTzVrAz5H/N4hRbqx
         lsaw==
X-Forwarded-Encrypted: i=1; AKwUvByoJVB/Tf5jGH/9NdtQp4lKnanQwc35bQyhcZkL6mr5/tBFyfzTu1DBxJWhU93FMkRx8x/w3PY3c+8i@vger.kernel.org
X-Gm-Message-State: AFq9FYIk6QP/nv+4deEHHbAULwCBUtk/Gz/DbzmwH/+0i8ypmrjhSvNc
	oAXuRnH/Gth8ZCnuxo1aE2dTdJDpqLkYwn1Y83j4EUcXlOoDy5VsOGgq3r6k7T5Aucb/aD//pFv
	KpxVWviAQuuHqdUJHlRbk+NEOr7l2vZA=
X-Gm-Gg: AYBFou27puekTVvxPU8RAcvYTqlbsi6VJu//qDrBuQOZoh4zOidKqPsAcN925GTeQ7b
	Dg24GfnRFI6YotpnoXuA0W9unBRXAyaLKHUnrYaNRyFWbb/Nk0fjuR1+kIPFOpb3otrAdfRlN9F
	aNGN9ox4Bn+BFHyP4nelXB5PBfiQDQdhh12ql0sxxswtJJbupVzu5GftLgwtKNKIkd3l8gLCa94
	Z8PjhqYAzfoJggU5A3Urqq9mfo3QnmkIL5DZUFvQzGjVDfQ07ceTbrfCXBmL1b9wq53xV0KCdCF
	3PcoHSfAmPRFPUKqfjJsq3+7YN/GrVfLA7MVL9ojKTObcLVdOkMnCV4QHBwIaqOU0+cbLbSdaov
	pymE4YXFqsjSAd8PLdgudyIPEbwhhz5AFwQvePwVuqDJfoDACw0xZ
X-Received: by 2002:a17:902:ce8d:b0:2e5:a355:56e4 with SMTP id
 d9443c01a7336-2ea9c5e30a0mr60160345ad.11.1793042547045; Mon, 26 Oct 2026
 12:22:27 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025142412.112216-1-pmazzini@gmail.com> <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
In-Reply-To: <474d4ed0-b011-49dd-853e-697448382a0e@arm.com>
From: Pablo Mazzini <pmazzini@gmail.com>
Date: Mon, 26 Oct 2026 19:22:17 +0000
X-Gm-Features: AclHuK8V-ReT1uOg9VTcgyQYzBbm5tikcDUgJYabpKKgd9T74yNLPiBsMiogtYQ
Message-ID: <CAAxh=jupBYZsadg09ig1v+3OkfjLAf+Hd9NwoR_D=te9XKxkTw@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: sunxi: number the IRQ banks from the
 first one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Thanks, understood. I will wait for proper reviews and for -rc1 before
posting again.

Pablo

On Mon, Oct 26, 2026 at 4:42=E2=80=AFPM Andre Przywara <andre.przywara@arm.=
com> wrote:
>
> Hi Pablo,
>
> just some heads up about process:
> - Please do not repost that quickly! The kernel doc says to wait at
> least a day, but that's only the lower limit, in case the series is
> almost ready and there were only minor comments from real(!) reviewers.
> I would wait for a couple of days, after you got some proper reviews.
> The reason is that reviews (by humans) take time, and it's not like
> people are bored waiting for some patches to look at. So they might be
> interrupted by something or need to do some checks and research. It's
> pretty bad if their effort is ambushed by a new revision, which now
> means they need to start over.
> - Please do not repost just because Sashiko said something. Wait for a
> proper review. It's probably a good idea to acknowledge the comment, but
> don't just re-post then.
> - Try to avoid posting inside the merge window. Depending on the
> subsystem and maintainer, your posts might just be ignored, because they
> might be busy fixing up conflicts. But more importantly: you are missing
> the correct base: you should always base your patches on an -rc1, unless
> being told otherwise explicitly. And since -rc1 won't be out till
> Sunday, this is not a good timing.
>
> I will comment on the patch set separately.
>
> Cheers,
> Andre
>
>
> On 10/25/26 15:24, Pablo Mazzini wrote:
> > The DT pinctrl helper numbers the IRQ banks from PA, even when PA has
> > none. The A523 got a DT interrupt for its unimplemented PA bank to work
> > around that, the A733 would need the same, and on both PK is written
> > past the end of irq_array.
> >
> > Number the IRQ banks like the static drivers do, with irq_bank_map for
> > the A523 and A733, and drop the PA interrupt from the binding and the
> > A523 DT. The B288 (IRQ banks on PB, PD, PF and PG) then needs no
> > made-up interrupt.
> >
> > v3:
> > - apply irq_bank_map to the A733 register layout too (Sashiko)
> >
> > v2:
> > - give the A523 and A733 an irq_bank_map, and drop the PA interrupt
> >    from the binding and the A523 DT
> >
> > Pablo Mazzini (3):
> >    pinctrl: sunxi: dt: number the IRQ banks from the first one that has
> >      IRQs
> >    dt-bindings: pinctrl: sun55i-a523: one interrupt per implemented ban=
k
> >    arm64: dts: allwinner: a523: drop the PA GPIO interrupt
> >
> >   .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++---=
-
> >   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi            | 3 +--
> >   drivers/pinctrl/sunxi/pinctrl-sun55i-a523.c               | 2 +-
> >   drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c               | 5 ++++-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c                  | 8 +++----=
-
> >   drivers/pinctrl/sunxi/pinctrl-sunxi.h                     | 7 ++++---
> >   6 files changed, 17 insertions(+), 16 deletions(-)
> >
> >
> > base-commit: 4f0dbdbdb3ad122e8bbfb1d722fd584bac7124db
>
