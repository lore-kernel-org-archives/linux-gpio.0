Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF4A3AAF52
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743021; cv=none; b=o8GRh3kms4bFcDx1rUnVfSlQN2nlMmoc5U0yv4sJ4M/PH9kpjK6O+tAwI+J9SVXgUPmHMGFSU6nzqvRubZOaIGar0AvBoeFkU2BxxazQsB1C5ZptWGpE1fJNvu2tXOoFNaVW1NmMVDejhqXd4lcRGNP1Jn4PTydZs0MmgiQkyo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743021; c=relaxed/simple;
	bh=t2aDtqeSQny5RBp/7FwqiCQSN/Qv1mCXiAJtBsU739k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fs3wHGKkVLAZUIQk1oUpfMQS9ZrnHbAzjJyaNihxzslYIee9X5wP+M2DzWuSD7eneaEfcYlw/LxzQLqKr5nfkD13rWSRQBnuDtqMNC7hSzWrw2GTRVsX4DNWNjwq4OtqiFp4T0Ac1bi+38nUkUo1UVa0Pfr1mQf+YqlLMyDjDMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h/4T2JYk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h/4T2JYk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB091F000E9
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743020;
	bh=t2aDtqeSQny5RBp/7FwqiCQSN/Qv1mCXiAJtBsU739k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=h/4T2JYkxq8Iq3gfm8/xQq1XSjQ+9B+fb0K8bmLKYejtB3vddTIr88J10Rhgj38ex
	 V2pTHgoKQomlRUJD1Ik9qgGPFbLy9S4CFklf0/1SJmyG6hroWOQjqmSI41s6BcD0s1
	 ctMu4NUSzW220jkeMKGpULFEbrmB91EOt716roR16Bt7STeUtOeoVa+8P3Du4VR0xS
	 YJTD6ikxr0brIScsJdBHG5J/lva4cOGU8SvWJHH2CdXjIsGRNz6i/DDnJbP5ZDNm/o
	 w2LZPl5JM5qY5EAhm20d/uAshGN8HLKoTXJk8N41rWXQqHTjioPqbPdegcr/IRC5gT
	 pSbzb9N/6Se0w==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5b2a8e4c77eso3017255e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 00:43:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrN+fVYypWQD/xCBdp3+JkjZGjEDjhRDQxtYzPQEevo5813j9jLwHQzHe9EjRVfaCi17ccHqRKOEBIj@vger.kernel.org
X-Gm-Message-State: AOJu0YylEabHYA52JJD9xCdbxASQXjqX2vINz5KWKeUUhXLK2elmc0cm
	zz57QLrO7PvGb82cpvGj7ZZCUU+JkkmSTbuwX/CAB7XA8qQ+S/6r3K2ftRcE1N55yF0qW5WRG6V
	o0iK4sjt0U8F1NKQwl4ecugvLmpQaQl0=
X-Received: by 2002:a05:6512:691:b0:5b0:17c9:a4f3 with SMTP id
 2adb3069b0e04-5b2e4f93e7fmr1598511e87.60.1785743019342; Mon, 03 Aug 2026
 00:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728072906.871-1-luyulin@eswincomputing.com>
In-Reply-To: <20260728072906.871-1-luyulin@eswincomputing.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 09:43:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLn_jN025L_=UYJi-g3mx1n83A3g50-CLbLqSuNX+d332g@mail.gmail.com>
X-Gm-Features: AUfX_mzv8-c3NcSh_T9sSm2CbAcRVnCiMsrErgp7XXSZCFaP8bWSyEoQKFfRmgs
Message-ID: <CAD++jLn_jN025L_=UYJi-g3mx1n83A3g50-CLbLqSuNX+d332g@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] pinctrl: eswin: Fix Handling of PIN_CONFIG_PERSIST_STATE
To: Yulin Lu <luyulin@eswincomputing.com>
Cc: samuel.holland@sifive.com, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 28, 2026 at 9:30=E2=80=AFAM Yulin Lu <luyulin@eswincomputing.co=
m> wrote:

> The EIC7700 pinctrl driver does not handle PIN_CONFIG_PERSIST_STATE
> specifically, and returns -EOPNOTSUPP from the default case.
>
> Since all pins on the EIC7700 SoC are persistent over suspend, the
> correct behaviour is to accept this parameter and return success.
>
> Add an explicit case for PIN_CONFIG_PERSIST_STATE that returns 0 to
> prevent errors when this parameter is set.
>
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")

Patch applied, I don't see any indication that this is a regression or
urgent so applied as nonurgent fix.

Yours,
Linus Walleij
