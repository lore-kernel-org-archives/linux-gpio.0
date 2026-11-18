Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037817;
	b=I/hHzgCtlZ2XlgBiCjY8l1KVjR6eVcit7R3Sd04rOI2cQfcZO5i3Udh4kTjwaZn+b3s1
	 1dvpG0psQEyDP0Qxxxcq5WPmljRl25oZGs/gnSuae3FNIl/iMvgsAfohEKFGwVch+OlBB
	 7/ivzp+n8eXUB4W88E4LQoHlhqHC3g0b9B6pbMzS0gTmDgdT0shQOEo4yRi3ie6rq7Rct
	 n7WmMZyAQF4awkMQ1xIUIc7KSC9cHWeb/yohq33RUs414WYmXRfwn1u6WAGTiiSbP7NLc
	 DfQttYo82VqQ5sPR2PMk4S9uB4bK9MvEu/tQ4YQCTZb7S6nK33hFSyBdmb8OdWJNfvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037817;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=t3iUhuIRe039+C63q9gXVxzAmWZkEWoSbisgpp+dtXQ=;
	b=WuyHZme3aMM41mapuwRps+r3mF8DBORNv1QbXywgtg/7CUzPymNuWSMdZ7/BWwgUeRSp
	 nrRBHlk0+4aiRiSdY3spZZnKQvOKARt+MzYQMsXdSaUQ5JsPLJjvT12itNFehdMT0mk4R
	 dlCNeHDBhbgWRTrg/6qffeFd+WdOO0Bn+3mDOumJRTFmvxDtGm0Owg/O5pBFjoxKTna0d
	 RLoiKsbDjcdVbPahs5uwEEOQsQP2sB1R8cMH1rVxIEIM9iO9s/bMSlUx9TCzCC7TyoTde
	 9/Xv/12Z5KzvdfAN9wtcJeDKq8vv3VoZb6LftS+PUfCuWM+qHce/Dtbajl9mGKVthfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="HYhS/+z9";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655ED606A32C
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 21:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HYhS/+z9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F07D1F000CE
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795037817;
	bh=t3iUhuIRe039+C63q9gXVxzAmWZkEWoSbisgpp+dtXQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HYhS/+z9HogZKAIwURSwIAfkJoCvoN0mpD3f/qe5BTc44LIKfVAIdfzSLC+AEZbsc
	 lApDZZi9yNJtAK6g9P36+vA5FXSwQXBF3rSxSdxTNfylnKiKLw0x9vQnlBUECB0hKB
	 0XVyPtxzOdckjIy/6L+KCNo/SSbpOLcXW+BzoII0eEb9dbOc6NQQ+YV+SC/bKzMzxa
	 ctPLAHYX+MACfsk/WoEHMDgKAsePqfc2sCl1LjLk1qKb0hO8RK0PixyL34FqpuuVsF
	 Ubg3G7QVx8hotSMFUleUY0XoND5udUCjVwxnvVEPP5O0i1kqFELdRjcyecGaASH/nb
	 NMMM1PJ8KZgJg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ae22dcfdc3so13290451fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 13:36:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErE2hKDK41lRj/8+F21uuDAMbYDAhyp+JT6U7/a91JRt4rcFV15o//jgT/4kSyBOHk2rF+4obZshdVHV@vger.kernel.org
X-Gm-Message-State: APuU4Z/Kwr6yvDE2pJQyySyXiDVTXEwyoywITv3byNt5wzaVLaIqMxtL
	dT6vcs20cEOL80rC3bQW4i+kyB0+OSPO9TWHb/RkHRhCzz81EUluDzmM2CqOOuv6WpVaDKGU1tn
	+U24g3jqQxo+To5RNJhFdLQtNdAJdrbA=
X-Received: by 2002:ac2:568e:0:b0:5bf:d54c:c189 with SMTP id
 2adb3069b0e04-5c1a9bff0d1mr1449055e87.5.1795037815939; Wed, 18 Nov 2026
 13:36:55 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <auEa46zLITsk-pAa@MON-LT-C78453.mchp-main.com>
In-Reply-To: <auEa46zLITsk-pAa@MON-LT-C78453.mchp-main.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 18 Nov 2026 22:36:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLn2dBDakGxRzCby5bUJpianq65=WdmHKrpeF9ZqwH0Zgg@mail.gmail.com>
X-Gm-Features: Aa3M54rwjq4IPR1e4kJCwH52FprJDEzAdY7p4YW1HQRW8dVTjXlFBIVLA154RiE
Message-ID: <CAD++jLn2dBDakGxRzCby5bUJpianq65=WdmHKrpeF9ZqwH0Zgg@mail.gmail.com>
Subject: Re: [RFC] RPMI pin control specification
To: Charles Perry <charles.perry@microchip.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, joshua.yeong@starfivetech.com, 
	anup@brainfault.org, rahul.pathak@oss.qualcomm.com, 
	leyfoon.tan@starfivetech.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Charles,

sorry for replying so late, kernel development is intense these days.

On Tue, Oct 27, 2026 at 10:43=E2=80=AFPM Charles Perry
<charles.perry@microchip.com> wrote:

> There is currently a spec under review for adding a pin control service t=
o
> Risc-V Platform Management Interface (RPMI). RPMI is a messaging interfac=
e
> between an application processor and a platform controller for riscv.

I actually have only one question:

Is this spec so similar to another four-letter firmware interface that
drivers/pinctrl/pinctrl-scmi.c can be used without changes or perhaps
by a simple addition of a compatible string?

Because what I'm not interested in are two necessarily different drivers
with the same content.

Other than that I understand these specifications are similar for some
reasons that I maybe don't want to concern myself with, so I'm fine
either way.

Yours,
Linus Walleij
