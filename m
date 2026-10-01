Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7D130F540
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 19:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790882932; cv=none; b=J/LM/s07Zw3ybB0U8P1qef/6c5/YFbFdWawZTlm7BPJj3eu3NsFdH4+GorucOXKDx6MV5tcyPiHtW6gY6/uYFAYn+DvmRpcts+XRs5WISLSKc4mKUN8q6aKV3ZktRSSpHSiI3P8ZPjunrkKY3T5kIsSXrk+RTBaqC7fpFvaib0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790882932; c=relaxed/simple;
	bh=m11GMEyvhzjd9E6+wwt5uc3aFkOwju9CszSHqjpI5h0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QwMk0bIeUx8OrpfQuZBvOKyqXQGZnuY6Py1DobKbQMzwKTxsNAbAbsLaoOYxDJyJt+iO/iGK9FtwAXF42w+2k6+9KpV1mXr/QHD/i7Mn3x9jKsB+IDuTW2XxnLwFWtaVYNZvlcOa2XkYDN5jrmcbcjpJEZPRjQRCvu0SOAMe4io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XpHF0yEP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XpHF0yEP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E1401F0089B
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 19:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790882931;
	bh=m11GMEyvhzjd9E6+wwt5uc3aFkOwju9CszSHqjpI5h0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XpHF0yEP2CAfUBo0dIKOgho+y53PMw4J0ynCzZzK3Bv5ke5J4Pt+TGBpaXZB/E7aQ
	 i+Li3h43sorfblLs2LronkcGQC8G1KB25jrahgfSUW7fLmOKWSmYKsa2/Yy9llZ24Z
	 Ycc1PTALVDSG1UpjJikuEf+C7j5qe8PDy7urlXiq1YiraQttIRFz5oKyajZNRT83i3
	 6WH5iuJkNOzLtB/Y19CwJ8Vt6Vt9lkRMS5+xi+p1R3ovbrDx3E7FdIBthcj0EoT/Q9
	 8z/iYPaxNfzr7d1UAWPyol5b93IXmPXhLO6evqUfTx8ar2kVNuMJQSTDp9HivFa/z6
	 0Kq4GSyWtTyng==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5ba3ae12b79so2096980e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:28:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwrPygLcRSLMPvhdB1U14pkTO+EKt9Kb+lj5P1CE4HWznkg+viANf6w4nRg/5F2b9IH34gQueB/DGHZ@vger.kernel.org
X-Gm-Message-State: AFq9FYKL9Mf6COiI7Ec+ZGsjTYJORQIJ2ClgQRg2q1tUEhT+Zu9HLe4W
	XkLr4AwnjC093M40lykfdWZmuDIhiMl8konvyGmUQmfVvefouKJsEExoHaatJvWT0jPIWe/Ock/
	shNwrHyPWRduOrs7GdfjvAUSMu9w143Y=
X-Received: by 2002:a05:6512:3b91:b0:5b6:4ae:8c02 with SMTP id
 2adb3069b0e04-5bb9bc3a38amr67418e87.29.1790882929875; Thu, 01 Oct 2026
 12:28:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929203634.32998-1-pmazzini@gmail.com> <a15d179f-8a43-4b4a-8bd5-fc0afecad6e0@arm.com>
 <CAD++jL=wEKZ5nRofe09heO8uUa4Cd12SYz3+XPhsStioQ5XTXQ@mail.gmail.com> <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com>
In-Reply-To: <d9e249b7-baf9-4ad3-a3ae-b9765feca5d8@arm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:28:36 +0200
X-Gmail-Original-Message-ID: <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
X-Gm-Features: AclHuK_wLU1qzQeRdKRPBZrb-Hz7ltUFota33qajxnsq0Ifw9pLY5cjoFByXrTo
Message-ID: <CAD++jL=bhQ8Pj12wgCi8RaRTEUcrXzhHm+EYA67dBEvn8P_rCw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first
 one that has IRQs
To: Andre Przywara <andre.przywara@arm.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:31=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:

> So we could revert the DT patch, and take Pablo's code patch, with a
> Fixes: tag, but that would create some broken combinations meanwhile.

I see it like this was a bug in the DTS file, so this if fine as-is.

> And in any case we should add a word to the binding document, to pin
> down what's expected here.

Can we enforce it with YAML constraints or is it too open-ended?

Yours,
Linus Walleij
