Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792529918;
	b=jOgz17Jvf6Jcefh+f8xJf6QdESx9zKpiqj1xvk0IjEkErKQmxq56pYbe+OSsa50QaxDX
	 TVkq/iagRhlFAGvb/okXWK++CWdf4QnmLPQTI852gPWKrwBfJUMBh9Z2SCZbYyX0fF2Sh
	 Ln3oXL+jnG/4hVE0SWlDCRa3eAzn8LHuY0Es+UPXnawFx/1cyZHhvM2AdFlra9tgOyatX
	 YHKZbWxPgmLtGyy8JLnk+Bu0Kwl3AjDTtUrmnv6hZm7O72Aqg+oK3hqSywR+rj1qNt1hN
	 YS3iRnYkPwBj+oV9a4x4kgSHybhtrMKc6z9559+9RTdFiD76MMLiDG+eouFngcTDgCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792529918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=Q5b+pPp413CBSxl+QGpMW6T1+hK4jWtfcGZrztrLCC0=;
	b=aG8IsQx5XsVmpAkxnYpk2SAwicUtXbZlA/tFeFoTcEHX6KtbbWfbSKioHSKRcu0APJC/
	 OeoySP710XJ8lR9j+kFMq40WatMGR53+XrrFdJ+7WwAvAFWJKa5aXhr8hOI7adHpS0/uu
	 EGbQSGz9C2VpW829X3cSuNX2KUPGG8Cc7mhQyEsbPCkZ4EVKF7F1vASiCVaXG7t88KOOS
	 U5ux7coGRtUVrs5cPKWj/uUKGoAYSxUp2KeZhxrjhDJk/gnhtCH8PBXnT6UuT91L9EkJk
	 Y7MQN9DMaQyjDOYxDHJv/HyEKVwDX/a2dzsFm0PSfQwfmuMsJS+FMxuvzPUzR6HM1gw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ooo0c5sa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.224.46
Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B264B606A319
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 20:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B264B606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ooo0c5sa
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-679aeeddc6bso35308d50.2
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 13:58:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792529916; cv=none;
        d=google.com; s=arc-20260327;
        b=TwNIReEzXkwTMvqNRYyTjJFSH/L8lFCB6ViVpsnHAI0eGnrNxFMaXt2oZLjHqFqYvz
         9Ny6Hg7vNOswU77fYHfbPkaIn+nkqxB8GRW3rxxKy1lrYAvufDMsZeYMCaxOFwtMftEl
         ZuoyLhvfbW5ypnxHNb5tFL0Ab2Nvg9R971iR4YLmyBuUJDhz1iPsCRGfd6CF3dAtqp9G
         WU2fsM1SlRZBE0bcGTjh6onZ/Kij/3b1UYJN+s/Y3u4cIkRY+2I+kgN/aBXxP7OpI8JO
         BBrqidRipCS/VtiQHuFnRYJfg7ammuKQhn/wSKuNeGTL8Gdu+5mk1/fbSrjaXJhVSeQv
         ANaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q5b+pPp413CBSxl+QGpMW6T1+hK4jWtfcGZrztrLCC0=;
        fh=lVbY9JkkIKGU0bgEFTL/gADrkzuiP+/5Ir7IXoxPEiY=;
        b=KU2qjJzwG/Rfy3mGdSPHR4mDKTR0gjhLWtkarfDZz243g+xa1Sm7KdEDA1BZWMN4pm
         JaQCaU0MzYpDuKRihNWdBqCSlUjTd5YhYLO+lAhfw3c6KCqdRDYUhVUgEEtxGnRNRmcj
         7G+y/FYS4bWlKo42EWo83QnhWJFJLq8Szy8g/TgRkBDa9rVEwErNqy1YVsW3krRYn8YW
         FCwk/l/h3jhcSw8LiPV5SHZTVHDnjSp7QAcms0JIFUlanvDjNVqlPf/II5f8TrSWuifg
         vJW/iPbxjBLmBucyoObSeUUC4NRcXxyWTOSnZx9/yIk1TG/lU9hMcKqWAZL9zb99nGhU
         3gcQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792529916; x=1793134716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5b+pPp413CBSxl+QGpMW6T1+hK4jWtfcGZrztrLCC0=;
        b=Ooo0c5sa7ew4OcttCN2InowuCBUucnWgbncRg6BuSjDHl0FHI/5X/pX7XUhqogacVS
         047Y9SM3lZAGVShqET1ADP31gYmp833o67XLWxyiZ9s59K5BHDJwiCqMHFB7quCvpKrF
         aA3xPzitnGZlQwSUn7ST4yllG0JegQxRLnRjFHX4HvU7BtJX9tFLT883LvomyxM8NZb9
         +lDoHg2tLKUzpINQxtFF3UUnZjH07mv5Ca8K6HIEZTGiPVR4frWbVc+wl5GSrv0MXWBW
         5dsA+nOjHPPdW8MUnP+L3NXOcL7+78UxCUzlbzQtKLxb8RLd1GSLq6UxRZkxDsM6L66v
         KAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792529916; x=1793134716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5b+pPp413CBSxl+QGpMW6T1+hK4jWtfcGZrztrLCC0=;
        b=X3mF8SFP4w1YO11AE50oxesaNdvhqlVedCGrIIbxoBBepfYFis6YHGMZQ2pALu2dzg
         tX+Oois8S6Ucxolfmq8dvmdSREOw5GdECBL3payn08LcSBSmrI4NHMpYpA17ihr8vZDJ
         j0P3KEXpMHq4C9HhVBaT9KjRVjhAhbk41erGvPHl3el1w91X5qj+mvS7/aWQZ82hfUHj
         GB48qjNJnN0AUx1o7diSt0/awK/n76JQ36jkU3nvLqRFPGClzZWGcsthu8q5xYI9Vhi4
         nS0ohbpcJfZpDBhUQi4crgA4ySkBI6ZOjMKEZMvr4EiRpSx+c8ZSc1JmMz6E+tybSkGJ
         R0dw==
X-Gm-Message-State: AFq9FYJzi8+DoiOl5HNII6KFtJN8tRqmuc7WA77s0TWyYqLYIZ/O9yyg
	MmJ9r9J50h/HmZR+UvboZeqUhs5bUoJq374pjzALaIKXHep7cf+5MNDBDfLoDhBLZKIfDBG8H+s
	/QN5PecZYIEXXKwPLC/i/jweCWn0un16w6KXG
X-Gm-Gg: AYBFou3UO5QOYlqNo8DPc69A3gKqhWV0OvD7uOyPzL5/Xnyf9AJeSI1denEAZJIhlhb
	NccOxr0Vf1MzCp06q08OeNEsRj19DYeasvEii5F4shonxtbzEh9xmMv1+qwJvg1upCHMlVppa0I
	I2aT9gFfpBtMHGJlQyWm8nHbde7+qRl+XUR5lY3tVLdU5nsQyU5Bmf7EIC28N4uBQoEbs/PpEr0
	i4t7KArnOn7GviztvLtGwk33sIaGxbGk0MdfQeeW4mRIAVV8yN0L3nErIisn6b+13kqTNzlUaA8
	NtNlwBcq8IME7dAtZk1gU8i8Eya3KH8+T23gO1cZ8O+3Yt9ygdwIvnxPLdz9a3z6gUT2LbPFkwB
	wKNpns3ektMZT
X-Received: by 2002:a05:690e:b47:b0:675:3142:bfb9 with SMTP id
 956f58d0204a3-67a0e57c68bmr177717d50.109.1792529916078; Tue, 20 Oct 2026
 13:58:36 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020003728.13669-1-vfazio@gmail.com> <20261020003728.13669-10-vfazio@gmail.com>
 <CAMRc=MdDNWEYkzGPMRw38CL2EE6p2meNJ636VxEgoqs93mdS1g@mail.gmail.com>
In-Reply-To: <CAMRc=MdDNWEYkzGPMRw38CL2EE6p2meNJ636VxEgoqs93mdS1g@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 20 Oct 2026 15:58:25 -0500
X-Gm-Features: AclHuK_A_P9kFaoXPbUgTpJZWLZ8G0_-Km-vMqLzALDmL0T6ck_zISo2UGdjTgs
Message-ID: <CAOrEah7+ydbnsOOciOuYhTpa4zEdp-+PFNK5p16HWr7LUxAWWw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 09/14] bindings: python: chip: use literals for
 dict/list and declare types
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 8:02=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 20 Oct 2026 02:37:23 +0200, Vincent Fazio <vfazio@gmail.com> said=
:
> > Use literal constructors for dict ({}) and list ([]) and explicitly typ=
e
> > the variables accordingly.
> >
> > There is no functional change here; just minor cleanup to squelch new
> > linter warnings.
> >
> > Signed-off-by: Vincent Fazio <vfazio@gmail.com>
> > ---
>
> I don't doubt this is the right think to do, otherwise you wouldn't have =
sent
> it but could you just explain to a python noob why we need it?

I don't like blindly obeying linter recommendations without some
justification, so I understand.

"Need" is a strong word, but some of the justification is in the
linter check itself [0].

In general it is uncommon to see the long form of `list()` or
`dict()`. It's no less correct, but someone familiar with Python would
find this just as easy to interpret.

As for the type annotations, this is to be a bit more explicit about
the expected types of values within the collections, otherwise the
contents are open to being inferred by a type checker like
mypy/ty/zuban.

By being explicit, we don't rely on this inference and dictate what
the type checkers should be expecting (so we're less likely to run
into errant types finding their way in).

-Vincent

[0]: https://docs.astral.sh/ruff/rules/unnecessary-collection-call/
