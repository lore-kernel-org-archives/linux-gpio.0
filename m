Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13C9831F9B4
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784972374; cv=none; b=gbkV/IEY3eABvDWniApoufm2SeQgaBPqVq6MJe0bCdc9mSFMKTkNJKAknk27rgW9MA9TMU/8HhlDhu+T7HLOnlZZVaQeeHrrzFGz1XP06LZxHoQcz0kTSDhBEKX08xnHBrU8CB3dvGYjSo9wbKoTAQpM2KFBk+caiDN4epZ5YAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784972374; c=relaxed/simple;
	bh=WwKQm0k3uI6tzAuxRzRXu2CKyKNHm2aVYlQer+UxyKs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iIGspr4lZvQ7t/nYmcvp29u4S+++8VpRloe2FDZ6jBXz/ctg4sI3DMqKI+alHVS+jDQIHUF0kepQWlK77TAxnlhUIOKtW/WXqnZ0q1MdTBPIl1e2VoNYBNu2GwinPvXItrRa2dnbqVGI3YI86F6sA06Nsm9Sgi46K1bHg4UyY5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YNKfaQze; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YNKfaQze"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70821F00A3D
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972372;
	bh=WwKQm0k3uI6tzAuxRzRXu2CKyKNHm2aVYlQer+UxyKs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YNKfaQzec5ds6Dw+i2SG/EQKqFylo3lUPMsWQDriVzdnCgW9qiBTGa8su9lifhae1
	 Q2QhnPhhAAOMTnOht8sEiHvUD3NDO2oWKKrFsorV22ENjW88RuouLqAgauRLUCGgIk
	 Ht2yzZxLNNL2fIFNpvwvY3fnsDSNDqoxXevSRZ5ThxTw6ltAzaSGsy83pfSX2ClZ2x
	 tN3hKGodqGDaJUrGLB5/PReZJd5UCkS7Jd1oFu7TxIJ0TJDDXyw0rjI1Nm8rB5UGMO
	 fH97fotrk9maMsV3ITzDqzVTaBzcACVeDTu8CL/3Ebgkc+Az1P1M+SAoRXpBI1du1l
	 jX1QIvaB5VbSA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5b0115b9e17so1125055e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:39:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr5EWzFPPqC3yVuOnN3VifqMgx8QbfbrRu85jipWy+LAt9kQwXbgjm+cLB3kxQPL2uMFp1cA+MPS/c1@vger.kernel.org
X-Gm-Message-State: AOJu0YyYb8UVroTgu3WzTzy5Z1QuMsF12EtTUzokKAUMlotfJN55tpFG
	VikrylzWJI0gllOwIJAuRpfFwXPSpTermW/AhCmkfrP8tJev3M/f+gu6u18mNSyIx409rRLxan6
	75nyNy3pJ1ImnVt6LWbH4GfXBh0oZj3A=
X-Received: by 2002:a05:6512:3d91:b0:5ae:a36b:e6d2 with SMTP id
 2adb3069b0e04-5b2c1b1815cmr304948e87.27.1784972371522; Sat, 25 Jul 2026
 02:39:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710183439.996923-1-adilov@disroot.org> <20260710183439.996923-2-adilov@disroot.org>
In-Reply-To: <20260710183439.996923-2-adilov@disroot.org>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:39:18 +0200
X-Gmail-Original-Message-ID: <CAD++jLn1baGEBUv1p9txDEPCpmHaZehkwWf_z0P99jZpS=7byg@mail.gmail.com>
X-Gm-Features: AUfX_mybi2OHHdDsvgN79PSbpZj8Wza9STirHdaChjkIubMg405F7vOazPhXfAo
Message-ID: <CAD++jLn1baGEBUv1p9txDEPCpmHaZehkwWf_z0P99jZpS=7byg@mail.gmail.com>
Subject: Re: [PATCH 1/2] gpio: realtek-otto: use __raw_readl/writel in realtek_gpio_update_line_imr()
To: Rustam Adilov <adilov@disroot.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Sander Vanheule <sander@svanheule.net>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 8:35=E2=80=AFPM Rustam Adilov <adilov@disroot.org> =
wrote:

> In preparation for upcoming changes to how bank reads and writes
> are defined in this driver, change the ioread32 and iowrite32 to
> their __raw variants. The realtek_gpio_update_line_imr() function
> is used by all devices regardless of GPIO_PORTS_REVERSED flag and
> thus this is the only place where there shouldn't be any byte
> swapping whether SWAP_IO_SPACE config is enabled or not and that
> is only possible with __raw_readl and __raw_writel.
>
> Signed-off-by: Rustam Adilov <adilov@disroot.org>

This makes perfect sense, since the ARM-based ixp4xx does the
exact same thing in gpio-ixp4xx.c for endianness-agnosticism.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
