Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794302292;
	b=20a3wFh4DVxklgUCMNuiEdEwwviMU1QQ3noZD5GZdG99zFCDEwVtTdDAtyUpe+otr8FP
	 fDukXatl8FqYI/w/vD2M1VuVpy0DNbG+vYrJ/mWh6RPxywtVyfl4ZIEyPmswPLYfLO78L
	 BYqGdk0W29xxm21EG2jM8QbbYw5pmzH+L22X3AhKVDfy62+/navZPxjAXTUQImDMh/yNo
	 jOyoH5UIKH7R/urPqg0rDA46mc5RgGGkGWjE/bsq6u5H83oV/vUOSe78467DM145QiAaZ
	 5dvoX+2/6afkLKed8LgCd6kxD4CzUS469Ji7Jz0CRnCR8U1NoQ0s+Z0KgoOLTT3Alrw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302292;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tIES/1ZtUVQWW9RQ9o/3BCRLnyN+/ueCJUQ4SJ2LWzc=;
	b=LD52uzo3VTktkYagkt6cyjEctgbYNNQhsdMOIFBiIu8tgMo+qw9ZuU3U4sc3/HbSFRQ4
	 u4MFP+iA3AuacGeqnyvNJmVfyGChTrJuR6bLWhLwld71dGrxmCv9scbeEyw6qMvtDmgAy
	 ObJmp7GQtQ6If2dPYTbDc4SOco4rYjMFhdOPDf5DFMwNiYRY6aKvpTbP7sQ/3S+8Ddxnu
	 CDNgzkE2kbhQCPediYQJNhXmrrIDCl/KxC8nPxiXx8iQxwUZXpYXOk5pytx2kZM48oGV7
	 XGggXAFRErYcqaBKnPhId2gTfF+DKnpfUN0hklR7dREeaoG21fLhxDfPKAmKIw/lBOQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDsa4LgU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA6A6072649
	for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 09:18:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAA6A6072649
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YDsa4LgU
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b308fca7c3so16627247b3.2
        for <linux-gpio@vger.kernel.org>; Tue, 10 Nov 2026 01:18:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794302290; cv=none;
        d=google.com; s=arc-20260327;
        b=f3uO2gdXVvrdTx8GRFmfAmgVDBFqRJ/Ft/o34hlufRommmJinozpd0e+uVPZZGACed
         M7hwg53kbcsPbcveUqH/sOJt+qmOon0ZzEpwV2+xtNn0n6YGjqqs3gIhYy84RL4X5JDl
         e5lf9ugUP5E1bZUdAJM7qIt4CpGkvrSFaC98PT1JKZtAzRwGWb66Ju/FVj2+W928eXid
         krJH6qIedXsl05pDovR2S/ZAP30B1OdRmP1hDCshmz27JqJQZFLsVOo6lyqR1C4tsNvs
         HRICFgunKOviQa0ipkvSaNGPnGsU/pzleExq1/pTENFLd/T2oKZo/Bfsp+Z+f3bonH0R
         m16g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tIES/1ZtUVQWW9RQ9o/3BCRLnyN+/ueCJUQ4SJ2LWzc=;
        fh=Lf8v4cAjf31BFJsmdzCCz+ufoOPcZoSBJ0R2ddd+ag0=;
        b=jk0ZU0DJJgsoKznXRrU0oMe5gCiq0ucXuEtAYGFigQejR3vVWY0mqNfyEQP2GwJCUf
         XIM7T0Kgg2QT1uQD13SdB0uEH+AUZx5POc0oHZZRRcfDaCjgFvLIHOQzgAZTnk+My8qy
         Xn8VRvcwNIC9csKLtSkWY1bEFaLABXtohJVte8hPxXDAddGLXnSX2e7hxUX7DAxb13OK
         43c2wPpzgz3bCxKS1y+uHIuA2PAYMYzAKjpAfzcIM9+THVQlACmL57AutIEWAuuqXFcx
         E4Zb1MZWxumGinDE7AXBqmwG1AuAY0oXhgH2SVgX/1EDsjvMLzZZ9kxGfnA5tggcbbBD
         6cTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794302290; x=1794907090; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tIES/1ZtUVQWW9RQ9o/3BCRLnyN+/ueCJUQ4SJ2LWzc=;
        b=YDsa4LgUv5n0lWCUEIfmMCWjIYt6ygKSrwZsVZ+QjGAEdhc8q2QeEvjCPA1Z/6u537
         WkjwNa1Il5/wGDPX9MiFyr1CTUOScTcunw8/VFBx6wd+llOK8aFQ2hvAUZiWBy8FRwZ0
         KK0usChUNLfDYp9sawBKytdDycg+VjkVsbOP5trDabilCoYB19+bsEUTnoxz8N1EWRI0
         bYEQWMG85TSLNUn5jHqYijJLZ32w/k6K4rTsT9Z9kQ198Zoh3osjWgWPrckZQ64E/Pz7
         vR5bIY15GRLc0p6zrmq7/EcJvsWvE0ZcUSq0erbvi7xitWc9w0qNYrSonBI9pW0dQCGV
         n1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302290; x=1794907090;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tIES/1ZtUVQWW9RQ9o/3BCRLnyN+/ueCJUQ4SJ2LWzc=;
        b=oL9EcbTfT2Tx0TF1fdhB4bWlFnZviW4yx2fQYpCHZDCbszy9E1GWbl6LRBKZJiau0a
         J+MkPi6xtc7c4vWnQHguQt2mCn5YmAv4/8fN2VYWuthgcyWMP+6BlD3QC1ygZ5VZBr3F
         nfuw62YlfAVXIr6AAzkWG42698ZJ6+cN0nPFol9F+MNPS+J4TwAehn5d3X3xcWD2hd1b
         9ejJXhsnOdGBbt1UiTDIiRSA0fqYQhxXdtq6JB7btvKiTb6C/s2xLBru/r9r8rNg6G/p
         p9BtXc+5ZtfiatVJz6QQTmxFT2qnq7sZ87LPmMjE3GtXveKdcPHJSjWgJXI6DyfBNboa
         NmJg==
X-Forwarded-Encrypted: i=1; AL+hErGWZbxWgYVqJKlb/rXNp8fRO5Pr5dy+/v/OIYhsxouWS8+EK/MslqPrXSxLksxB3a52DMC/RcJvqMta@vger.kernel.org
X-Gm-Message-State: APuU4Z/N0MMq44muX/CbB1a7t6pknYMwmbhrvC7tGsk/TDtClF2azqBr
	GZ4ZXFWgU6GzokYJKECBie42tufPEot+3k900H0Gd9FtVaFummI9z2wbmMfdAtL7HG+B2bum3aH
	NuQ4XtDQVs4uupSewLtV3PhQAglK73C2jCueF4kg=
X-Gm-Gg: AYBFou308fOSbTnSl7L6Gwwk6Oap4hqzRB9YNdaWc+Ljad005ZvVHpHSIu5HjqMyYeO
	4UeEmwGrY2F5vx2EAYOHw+qcMi5zFtJfchrcqSZJ/BMZUsgU/ZUOPfmekyx1jlEReCsUXc8nqTB
	rNJ3zflIcsWcqhjrPxKMunEXXL9gzfNis4KFm12WnfvYoJ2yJJzAFJYRT+PJ4oGg6R4TRs2bkhw
	tpdFuys6saFWC6ycmCtCpjb1KiZd/tVkKqfrq9sVhIs4HkhWqNl17Uwd7j3cUmapQa3Pl32cNMF
	7bHST5IyJy5xu8NwxHhRlHzCUobjqhdmlyvC2LZaeR0MPMW4OGd5NKiB4Bm/oTbVwqM5E8Ecqwv
	G4fr8TmGKV3xKvuQG99P9kOPfqO6QsJmvS0hfYy+l5UZmRg7ga/6TQp16Pwi2TNjVq1svI9C2A9
	WUsqV+ttJD/Vr+C6zkAfDeiDRqtKJZdBZEacLaRJT+H8WRJ06h+6Ui1uw82Pg3yrUfx0w/3Q4sX
	w3iLfBuu87mMl+4es6tBw0U6OOoFzrW5eyYorRxp6bCeq4c3JCrwlWf5l7BlA==
X-Received: by 2002:a05:690c:c6d1:b0:8b3:3f54:353b with SMTP id
 00721157ae682-8b392a5fd86mr10563747b3.23.1794302290725; Tue, 10 Nov 2026
 01:18:10 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-gpio-sodaville-use-after-free-v1-1-f572f40feedd@oss.qualcomm.com>
 <kyqnjm57yrercvg5raacrxwt46p2fig6leeeywipv66c3iqzlg@tdh5swet65jb>
In-Reply-To: <kyqnjm57yrercvg5raacrxwt46p2fig6leeeywipv66c3iqzlg@tdh5swet65jb>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 10 Nov 2026 11:17:34 +0200
X-Gm-Features: AclHuK_tfRAddWryhIu2itwZTuCw6dMSKtHbGDbuVRDpd2s9leUebZVLl6Fly40
Message-ID: <CAHp75VcO0tFShCN5n+7WXQwM9ZBAUS7-0G+SQL3LW_tbObKtpQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: sodaville: fix use-after-free bug when registering
 the irqchip
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andy Shevchenko <andy@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 11:15=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Thu, Nov 05, 2026 at 02:14:27PM +0100, Bartosz Golaszewski wrote:
> > In sdv_register_irqsupport(), if irq_domain_create_legacy() fails durin=
g
> > device probing, a generic IRQ chip is left registered in the global gc_=
list
> > while its underlying memory is freed, leading to a use-after-free. Use
> > the managed variant of irq_setup_generic_chip() to ensure that the chip
> > gets unregistered before the memory it uses is freed.
> >
>
> Andy, will you queue this or should I take it for this week's PR with
> fixes?

Feel free to take it, I won't think of any conflicts in this area in
the future with this driver.

--=20
With Best Regards,
Andy Shevchenko
