Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A97499F0A
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 22:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786054387; cv=none; b=kZLKPqdJjSJML/xBKdj92D/pJuN7i/pj9MIa3H/VaufWRHCI1Q7rglB1O1cdMD21xBEtmc12KH/WV0sA5YIX8TXLdANmGMx0fqELAImjgZrCltK9xRxsi8wn0beIZ+g/gOZK7vVXEh5YL/dUvqb7g+GS0FxYO4t/ZD1S6rgITOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786054387; c=relaxed/simple;
	bh=vjzTiVXW2/y+MU8ujdi+EYr76HH3zaimBCpOT0o3bgI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qtOshmx7E1V5o35aq7XpmjSTwrUaQQUX8xYKYdLEDn66s9uBUCIR0Gs/6voCtUEHqDU5s+GK/Ju2fUb2/4LyC+az6h88rBrCHnEDxFrrcuUfFImFS4iM1rZuxavwHS2m8Jy3hSo3Q+3e8fQA8KIzdv1STJHTMlm/FyG95VmXgpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLHo7vAf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLHo7vAf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F071F00AC4
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 22:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786054385;
	bh=vjzTiVXW2/y+MU8ujdi+EYr76HH3zaimBCpOT0o3bgI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hLHo7vAfuR3iX5N3dSh/v5YiHmKofEzbCGMRnW5ZtjHIcnWMSdm/PGkpNgggjnE8o
	 ASNxZzhQ1mGUB4ChfjpQygQo6C54rznb63Nz2Wjd9rNLjMzFrrUJsCT9PebR4yFSaX
	 s0JEmzfQZgPGdSDoegb4zlDyT4KY3TqytVolY1caalzlSmAvBqjFYXWOPSoWJY4+0+
	 tfxiMuT83DM6M94FzDXpH07AxhvLifTlTcapKBUw97Lb17TlwpKrFAQe877W2pZS7K
	 O2/4Osr2CMF124x9Eh46GOTEwv2pRgovVlbdOTYo0wgvqfFtM0ufjq6VKLBhFL99+o
	 nukkIiuEloK0Q==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39fcdaef6e2so12795181fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2026 15:13:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrJwVLbyRgcJsIX/4kolShe+7MbZaM+mqw2wDX0CAslg/yqHyDyb2O0vyFFAo48apg5df9ZDrLT9AV1@vger.kernel.org
X-Gm-Message-State: AOJu0YwKYl/hg9rvcHhrvfomP+YeIqRUsFD6Gc0f4LseFq3nU7Q9NScX
	4gKGWtNuxouLlhJbjK11xOpQaZAoW/cptmadSY/Y9Qig4XVQ3O4pI+OomoQmZVdSS1nLpTGnqcd
	yIULBgsvk24M45YTYw2+rNc0070u4UNE=
X-Received: by 2002:a05:651c:198f:b0:39b:b6d:59a1 with SMTP id
 38308e7fff4ca-39fbb0622a3mr22304141fa.3.1786054384637; Thu, 06 Aug 2026
 15:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803141028.710706-1-sjg@chromium.org>
In-Reply-To: <20260803141028.710706-1-sjg@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 00:12:51 +0200
X-Gmail-Original-Message-ID: <CAD++jLn8nZT9a0Qe+wtk+2zJ5tPvHjAq4PDPt18ANWiyJPdXpw@mail.gmail.com>
X-Gm-Features: AUfX_my-q5AZNQnyrDKzTBxgtSjpIToNkuwuVSkTL2dNFQAFVD3IOuhBlGJ6384
Message-ID: <CAD++jLn8nZT9a0Qe+wtk+2zJ5tPvHjAq4PDPt18ANWiyJPdXpw@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: rockchip: Two fixes for latent driver bugs
To: Simon Glass <sjg@chromium.org>
Cc: Heiko Stuebner <heiko@sntech.de>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-gpio@vger.kernel.org, 
	Vladislav Leonov <vlad@zlab.su>, Jonas Karlman <jonas@kwiboo.se>, Fabio Estevam <festevam@nabladev.com>, 
	Jeffy Chen <jeffy.chen@rock-chips.com>, huang lin <hl@rock-chips.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Aug 3, 2026 at 4:10=E2=80=AFPM Simon Glass <sjg@chromium.org> wrote=
:

> This series contains two small fixes for pre-existing issues in the
> Rockchip pinctrl driver, found by the sashiko AI review of my RV1106
> series.
>
> The first makes the SoC-data calculation safe when the probe runs
> more than once due to a probe deferral: the pin count currently
> accumulates across runs, shifting every bank's pin base. The second
> aligns the RV1103B drive-type override in the get path with the set
> path, which restricts it to bank 2.
>
> The first fix is tested on a Luckfox Pico Mini B by forcing the
> probe to defer once: without the fix the second probe doubles the
> pin count and no GPIO bank comes up, while with it the values are
> recalculated identically and all banks work. The second is a
> behavioural no-op until drive-strength decoding is added to the get
> path, so it is verified by inspection against the set path.

Patches looks good and the Rockchip maintainers haven't
commented on the other week-old patches yet so I applied
these two patches.

If the maintainers have issues with them I can pull them out.

Yours,
Linus Walleij
