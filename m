Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A9853A6405
	for <linux-gpio@vger.kernel.org>; Sat,  5 Sep 2026 20:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788639901; cv=none; b=P6hVcFxy1vTZDOvqdHfSZD1hO20M1pARQ+PhiMJ9iqU1CIbK2DUU2QW/H0tleGsUXig5KYNbvHMg9Ytp5SOFhne5/CCRsUMcjP0ZwGYZqX8qWg5Xv9i2ultsPqGpqFtnWiFPPMr3P4m+wPAbq9y6bhmgfoMi9Syo3c8HteODSNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788639901; c=relaxed/simple;
	bh=l16DQ9BSQ/W8JfOAuWRT1EqZWffIvJf0bH+7/K4eZjU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kKy4XXMrD6yx69+KTg+Zazm3g7RhEDUCyk6qle5qao5ZfbgyT8C8lvBlx90XxY6Z0xSLrh5ZjRFtkvxqeKKXs6UpcXXs1fGfO/vnRBRgaLPS7AXE0sdoFFoT59ZWbvvYivNw5WDxsLWZtLfHnkOs3Ge8f0g8RZknqY+Rucs534c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kszycZqA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kszycZqA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A37261F00A3A
	for <linux-gpio@vger.kernel.org>; Sat,  5 Sep 2026 20:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788639899;
	bh=l16DQ9BSQ/W8JfOAuWRT1EqZWffIvJf0bH+7/K4eZjU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=kszycZqAtTpf+Czlg2/zBrDa5smRfOq0xlh0GFHXv9CP1/hiBYT5ygwaKMCryL8ou
	 8lvVRc3Wo3pcPRQSUXGW7k3ZCp8IBjzZyULhdOC9MPQQbdhfxreFr7DM3DceB4lWOS
	 0gtT0uw2UCQJglc8ZZ3q5/mto6LcGqF3F/niL5NKN5J6fYauy4pa+E7RT6gEmAoQtP
	 cx4Lsyz2JvuzRh91CO+wvch+cZQAZM2R9zwMwSWuCpMZgQ8aYgrDAR9kRf5+Gk15dj
	 lfYQG4JHNMl/7vWm2xd5mXjVlzMGlwseAAEET9ApCwSIyxjvxkrf19UFga5801yC2f
	 8Uqc9PH6EBBMw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4ac3ba821so1958985e87.0
        for <linux-gpio@vger.kernel.org>; Sat, 05 Sep 2026 13:24:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy+5WmesLWwwC0sm8qHfgA9iv9uybT9nWAc5Jsj0fKKK8eh4KomoWJEJsnZzpbLeUOluUvEnePy5Buf@vger.kernel.org
X-Gm-Message-State: AFuF++nwAa8G6UPraczQ6zdiyZXB8fX24Sy5E+Mcf1KsgyPP3Mo1QtK8
	4TAw8FkoiasA9Jr/G2n95gxS5BQjHf0RI5lztDxz6BIXxD1nyuGLdPAYBZkCs0cP0QN+MuKuC9+
	hSoPZrryxZyYO2Cvo+Nj2VdNTD1Yn3RY=
X-Received: by 2002:a05:6512:39cd:b0:5b6:183b:d1fe with SMTP id
 2adb3069b0e04-5b6183bd394mr1710778e87.37.1788639898367; Sat, 05 Sep 2026
 13:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <apvciC1NYWyNfseD@google.com>
In-Reply-To: <apvciC1NYWyNfseD@google.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 22:24:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=zTyoRDTPNFFnHY5Nb3EH3D0z8fCsQBJkAN6gUq4RR1w@mail.gmail.com>
X-Gm-Features: AcwNN1VtOQEj3vO87BBDhlcWcs7ZEAlkGKu5TODz5yzNplvWhMu4GEbb7XewE3E
Message-ID: <CAD++jL=zTyoRDTPNFFnHY5Nb3EH3D0z8fCsQBJkAN6gUq4RR1w@mail.gmail.com>
Subject: Re: [PATCH] gpio: crystalcove: add missing MODULE_ALIAS()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 11:12=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> The crystalcove GPIO driver lacks a MODULE_ALIAS() to allow it to be
> auto-loaded.
>
> Fix this by adding the missing platform alias.
>
> Fixes: 104fb1d5153c ("gpio: Add support for Intel Crystal Cove PMIC")
> Assisted-by: LLM
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
