Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0171B479864
	for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 22:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789942805; cv=none; b=WC4r7wSg7dPMC/DhIF4c8fLQ2/jmofi09kfciljsr/GXkBFgFuC2tBSmWg+TvraU3gd5+wXTabyXssDBMrAn9tobgcOII/UokZoLtcstuZKnL/lsMfc94LelXGEgKQHwtIFPYIzU+RI9iIVl/fPe4dH4j8Pb7RGfDF9PMJvHVPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789942805; c=relaxed/simple;
	bh=pNeaKSj4MMMvcypowKS9mH/BYCgebLM1oZqX7vmR1uY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J2AglReufLeW14yDqBsf9F7A0KZ++2l+9h5C8goAAT/4iN8wW09Hth+RMwj35EOlbNdc3Au4QmgLr3fdXdSXd9/gPsVULgELxiW3r3Wi/DGxm/0Fn7l1DRRAn9+FpTh64gdKtKSNyeWkfoEbdLMsjC2TplZ1x/qZDX3XFzT+XTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JXH6r4a+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JXH6r4a+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C30B1F0089A
	for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 22:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789942803;
	bh=2w8wLiwLCbCZA5mnhHgNIr2MdMFZTmftVKlMcU9mq8E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JXH6r4a+QF9NRJOe0m/AeiIEsT/LiY2CqcZWfF27Nf3mVL/SCP6N86OkJf7GZba/r
	 nNpcm8u6Q1Kixc3jG0kUuGTxe6/TEZXR5Tn6bsaZySpGfWsO2ofGA3y4ZuZAZxxv2o
	 t3+NW6MbA9brRqHDlXl9Xd2uVXzLIxHLkLGEnVA4MFLI+kevMAki89RKUj9e/J2002
	 ovNR6+ItCXeNqJS2laCD+dB6e9xpv/IqHwKsaEsjGPuExLhDcB7k0eqtvpc0NrEgQg
	 H+kCFGZMIvrOWxQENUULLjIfPAAJ03kCDxzLpjGv9zKE6+a+yNRUE10EZNWcp/U3HU
	 v6YzEktGNDlRA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b5f21afe8cso3891683e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 15:20:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwcJghRDGq9cRAvTIKU1BAOeN96ExSYEtSdd4MblWzEiidfu4Cn7VIpxM6gl7ZzhY2tZLn7krdgmCab@vger.kernel.org
X-Gm-Message-State: AFuF++kMYY0RhHlI2pQx8eCZ0b1UuJ0gtEjdPTJDUOST3FEnhKGnq8Ti
	s6EDhwq8elH1B9E1FiF2oxX6eCfzw+1BRUzQwn8wLr8bXFrfY5DUSWIQ8KifbuPUct0LtfmqUJc
	flUgVrHxnhgA4QNE7oUiGlAeG6dAFhWw=
X-Received: by 2002:a05:6512:31d1:b0:5ad:68aa:8a78 with SMTP id
 2adb3069b0e04-5b8ba5d1323mr3879483e87.5.1789942802233; Sun, 20 Sep 2026
 15:20:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916100630.37849-1-Basavaraj.Natikar@amd.com>
In-Reply-To: <20260916100630.37849-1-Basavaraj.Natikar@amd.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:19:49 +0200
X-Gmail-Original-Message-ID: <CAD++jLnONmRBvxco=-CGrRY1xdUN3aGTE3=jOtHqr2HJQ_Zy+A@mail.gmail.com>
X-Gm-Features: AcwNN1WOA1nF9Hq2yyyRPycjSgQjqDZqUVsEe0zaoUE0G2i6JRusJmcK55yU_sY
Message-ID: <CAD++jLnONmRBvxco=-CGrRY1xdUN3aGTE3=jOtHqr2HJQ_Zy+A@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: amd: Add Remote GPIO (RGPIO) bank support
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc: Shyam-sundar.S-k@amd.com, Matt.Devillier@amd.com, 
	Guruvendra.Punugupati@amd.com, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:07=E2=80=AFPM Basavaraj Natikar
<Basavaraj.Natikar@amd.com> wrote:

> Some AMD platforms expose a second GPIO register bank, Remote GPIO
> (RGPIO), covering pins 256-271 through a separate MMIO region that the
> platform advertises by name. This series adds support for it.
>
> The first two patches are preparation: one centralizes per-pin register
> access behind a single helper, the other factors the optional
> named-resource lookup into a reusable helper with a minimum-size check.
> The last patch adds the RGPIO bank itself, including its pins, groups,
> pinmux and interrupts.
>
> The RGPIO pins are registered only when the platform advertises the
> region and the main bank spans the expected number of registers, so
> platforms that do not expose it are unaffected.
>
> Basavaraj Natikar (3):
>   pinctrl: amd: Centralize per-pin register access
>   pinctrl: amd: Factor out optional named resource lookup
>   pinctrl: amd: Add support for the Remote GPIO (RGPIO) bank

This looks all right but does not apply to my "devel" branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/lo=
g/?h=3Ddevel

Please rebase on this branch and resend as v2!

Yours,
Linus Walleij
