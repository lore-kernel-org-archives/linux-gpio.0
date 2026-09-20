Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198B33ED13F
	for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 22:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789942036; cv=none; b=q7ovMcg1rx9E7frk4RU6TgSOyKx8bgQ6wBaBBP4joogI7QM7JrAXGYHTjm1Uc6kexAFSy3GCe2wNBmm+DVx0Gd1WXRNskA8g+RyIZoOoeq6gYhtLnV7lYZO7sFHCUQUuHF9BgQ6afjF23zU+/Mg7ceguuGF56vQ9uJ5LL2gEwMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789942036; c=relaxed/simple;
	bh=eM2T7KJzE7XrEgyW7SedFNWCzHyys8WpkYdSkfQ74AY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L5llIUX8QCy8eaMN8lano0oo78nkPYssgybL5KDvyARmw/veX9F79sDT/ln9eN77fvfKtZQISyRiiol9Sy6onEQ9L5jQWVbhQAOf++Q+pt0EXRcmKsiS/Tdv9TIoNRGBgCUZuZmna17RZ+0yzXrIJ/sfFfMVmISHTNH1cSAlkKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nEwO5tWP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nEwO5tWP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1CF71F0089C
	for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 22:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789942034;
	bh=eM2T7KJzE7XrEgyW7SedFNWCzHyys8WpkYdSkfQ74AY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=nEwO5tWPF2SmOmfitw1H5xy5EkaTV4JNJ3d1FZiCuIktjtK2mXxVoHFbZMze0akPR
	 Oo4mhEpsenHRuT3sNEyUkKo5EFWbSDAyRJMqBEX9AuljQdA0BBaXLBJ8oKNDcFyScy
	 WtM8OqB2xWrg1MaN30uPGvCZntM7OIFjdRz2F7Ala3tEfn0MviGWKKnM2JMFTtTfCb
	 OQIazbzx0AO3+M/nUpnufnz8Bo+Vrbj6pJEfhwOu0hI3RRWpWQGwaAiV2azHiHlnLu
	 owuQFJYyZYvNoRvsrtS4gj7mIKHsKrbUrR65UO/ZfW5SnJuE4/yt5UrvdUaHvLKEsg
	 6rey0k9xNiuKw==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1801fso2369728e87.2
        for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 15:07:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwV9zQvHQiXw1yZu1rXjdQd6dpiTVEFBjsMkJXAhKUugja0R/kT2SsVY2XgeMaozgQKMRY964+Hd228@vger.kernel.org
X-Gm-Message-State: AFuF++luY48dLM9hOdbTiug0A6JinX31v22/5tDZDHW0p4yVCyEYBovY
	v3imLKcaHE1QUj+bgkGkRtEMiJzzYnzggHwr3tlOS+ra3nkUM8nFRz9GHJS5dTl3dD6WcuM49mt
	OVsAXwrolyeC7Wzndf+zbcH3KaKSG/JU=
X-Received: by 2002:a05:6512:39d1:b0:5b4:24a3:ecf9 with SMTP id
 2adb3069b0e04-5b8c180b6ffmr3029498e87.21.1789942032696; Sun, 20 Sep 2026
 15:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916065132.1411576-1-pshete@nvidia.com>
In-Reply-To: <20260916065132.1411576-1-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:07:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLn+p=fvVG6=EX3LvU9eMe68cfhCzQvoem0sEfpY43ktvw@mail.gmail.com>
X-Gm-Features: AcwNN1VOfHJBNeasa5J7ZELwn9CSLN9B7pBShBYstEigIj754ox3CA5qiQjayJo
Message-ID: <CAD++jLn+p=fvVG6=EX3LvU9eMe68cfhCzQvoem0sEfpY43ktvw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra238: Fix register bank for AON pin groups
To: Prathamesh Shete <pshete@nvidia.com>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bhelgaas@google.com, 
	u.kleine-koenig@baylibre.com, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 8:52=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> The AON pin controller has a single register region and therefore,
> the bank defined in the tegra238_functions[] and tegra238_aon_groups[]
> for the AON pin groups must be 0. However, commit 25cac7292d49
> ("pinctrl: tegra: Add Tegra238 pinmux driver") incorrectly specified the
> bank for these pins as 1 and not 0. This means that in the
> tegra_pinctrl_probe() function we use an invalid index when accessing
> the pmx->regs[] array which causes an incorrect address to be used for
> accessing the pinmux registers.
>
> Fix this by correcting the bank for the AON pin groups.
>
> Fixes: 25cac7292d49 ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied for fixes.

Yours,
Linus Walleij
