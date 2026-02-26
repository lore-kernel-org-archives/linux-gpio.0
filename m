Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB9B393DD6
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:37:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772145455; cv=none; b=C+2gEuT6u0HA71Pa8vIGSpkoCJ4AiraVOpdVcwsbHmuJVY4TmoUDd3K564h1+F+k/Pe0u0uU0IdKd2EXGOGIGElC7AKDmdZd4xmiXW4xfdTmbJlWZ4qAZjIslBa1butFkXgYzRzAO8EE3bO9ZFiMX3mDPaIqzxJKfH0enMnwIQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772145455; c=relaxed/simple;
	bh=VXqwWczfl4/h5cdRzGURE6nRmdMuQnYbYejgQpX7XtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ft8MK32ib6C+GcG2bXBIFHG5diNM+cvkwZLZtQwaxJYy8dBMBhhQD5R/fgzwhEsbbw64gckB9d1dVyVVTIt+f30I4bcd7lq1El3vYNh7X9jeLjA1xfyk4Y5lyLHPehKQe4FK4FeUY+/Y3OxQ0nY+bs5JRZGgp8sMqfhOxwB7HH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oNZFGzET; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oNZFGzET"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0617C116C6
	for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 22:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772145454;
	bh=VXqwWczfl4/h5cdRzGURE6nRmdMuQnYbYejgQpX7XtU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=oNZFGzETrTgQXWL98I+uozoFSbjxKZHsPqsbiyISqzsmkWIzE7xAUnJ2kPDRueXPb
	 k7Ds6qKBUi5zpJI+THI/Wr0pmwiN8OEceZd2IWesqe10x+eB/cUb0zVNnVu07FU21R
	 treIMFVbTi5P6pCDog4mzWhCt4aRz7AfGl/D9vIUYvP+HfgkF2tDoDViIVVAeAitnf
	 NBNSayVwEiqwwF+yXZvCSuebkbOx9rq85MkIncaFgguIMVCLwYrU4i+Bd+00+/bInF
	 k8Gr5Mx1bxZIuYbdEXW3SRrqx/C3BpBSY1UkBrWSWLUoq2x9m0rG26W5Phux11zyAq
	 JG98xEK7dhnWA==
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-797ab169454so13552867b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 26 Feb 2026 14:37:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVNX2Dcl4RadwiLyjJCy7inSBxSAuyMFbvp9dt/T8ZOTpvjgrv4G7MQbDFxzobinHV16eO5MNn73Clo@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIwA4rfhkTpyTljtpRh6BCmEnSQRomcv+f3v1MKsvErjD8L9l
	g9VV9qbkHpGTjyXlO7kg5U+HpKJnL1BvHin5+B7ielwC9VwTyKq9kkBr7+0ZSRjCmVhD1RVhmG3
	1+NL2i3zd2jECFN1FCqYuGqMHe21AVEs=
X-Received: by 2002:a05:690c:6611:b0:796:3515:3aa8 with SMTP id
 00721157ae682-798855f9bc4mr10249917b3.43.1772145454041; Thu, 26 Feb 2026
 14:37:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260224202846.2437400-1-ethantidmore06@gmail.com>
In-Reply-To: <20260224202846.2437400-1-ethantidmore06@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Feb 2026 23:37:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLkYaEHEy=P68MRLEFsoxDFh5yxna7Eby8KeDzm8F7Zm3Q@mail.gmail.com>
X-Gm-Features: AaiRm536AEIfXn1jVQwW9WeQFaQzADygUi47L0W9gyAnH3RA1UzO_wLpyCjz_kg
Message-ID: <CAD++jLkYaEHEy=P68MRLEFsoxDFh5yxna7Eby8KeDzm8F7Zm3Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: pinctrl-pic32: Fix resource leaks
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: joshua.henderson@microchip.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ethan,

thanks for your patch!

On Tue, Feb 24, 2026 at 9:29=E2=80=AFPM Ethan Tidmore <ethantidmore06@gmail=
.com> wrote:

> Add three missing clk_disable_unprepare() in early return error paths.
>
> Detected by Smatch:
> drivers/pinctrl/pinctrl-pic32.c:2211 pic32_pinctrl_probe() warn:
> 'pctl->clk' from clk_prepare_enable() not released on lines: 2208.
>
> drivers/pinctrl/pinctrl-pic32.c:2274 pic32_gpio_probe() warn:
> 'bank->clk' from clk_prepare_enable() not released on lines: 2264,2272.
>
> Fixes: 2ba384e6c3810 ("pinctrl: pinctrl-pic32: Add PIC32 pin control driv=
er")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
(...)
>         if (IS_ERR(pctl->pctldev)) {
> +               clk_disable_unprepare(pctl->clk);
(...)
> +               goto err_clk_cleanup;
(...)
> +               goto err_clk_cleanup;
> +err_clk_cleanup:
> +       clk_disable_unprepare(bank->clk);
> +       return ret;

Can't you just use devm_clk_get_enabled() and let devres do this?

Yours,
Linus Walleij
