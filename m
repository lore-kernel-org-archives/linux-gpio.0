Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD553F5BC3
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782821650; cv=none; b=nwlndqCzVAqmtl3bEfYb8BvMtHwxpIO0x7es5pfs322e1DeRIl+2rw7ZNAlsgVU16WJfCN7FK46omn+UOi1AIJ9bTXZSgKc+xvKl4F2Vww3W2RyA6SF45MED/5TR0LwzkW3rPaGTtMl8nIUCsSpYppSkjNOxllv6s2Pobv6Va6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782821650; c=relaxed/simple;
	bh=QW5hfsDRd1FivVmd2ugPokfYmZGbqzRuvms7qEgsMwQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KwRFhLQLR0g9Tpt6vuVOUXGr/xUIWFQjhMu+no6zNSdDvb9jJOmGbVbU8UIRFD3rL7kXoO4XUSZdAlsHy4bWGiIceZ9i3JwqSljEcnlQDjOOXWNhz88ArMI7iQihehukcOF3hiE4iFx5ATx0hC3ouFmCLZeOfTutrqUc/WY5pdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md3pGbPR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md3pGbPR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D382B1F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782821648;
	bh=QW5hfsDRd1FivVmd2ugPokfYmZGbqzRuvms7qEgsMwQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Md3pGbPRwNwsScKMp1sgak9oDRrk20dEpQizuVWSQSz05lFcb9o5XXUsV7YHWTZmF
	 4P2V755bmrNNJaOQOGbulpbgkcsWr7O8XXKz/DOfFQLJv4b1edqHUKxgPH658NG3tj
	 2hNA3IS9360PKlELSAFDsqq6EEnsVHAVjMbdVhhdbebrKux78XJQUEuxoqfYB5dWoP
	 +6eg5NjUI0E9Ua3fAzTAFvJLr9RbRFpgRCOnjeGED2wr07AZhpPilH9FjB6TaKtKPE
	 yth/lnLuYfBFK9LSxbmJtxqI5ZDi9P0f1mtXz+dY6tmRl2bZhRzwasTgL1sPBRKtP5
	 wf50tmaTJ1lAQ==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-39b011ae0b4so20388801fa.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 05:14:08 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpT0kJAVld3PaxnbZlmphJzCtoXolrodVcfo0x4bmEn/EDv/vvlXqcvCOUAKMXiNB3yuOwa6cbpdIVW@vger.kernel.org
X-Gm-Message-State: AOJu0YyLMnfoOf5864tLj2dXyEK5u+xiEVWeHZJOjWLIACm/OUxAwppn
	QLAqRsY2CeV1oTu6MpBIfT/JtufQY4D3Ddby3KkVRgx0sMH6MICi0tSVEbdgt6hhfg9Lopc6Ha2
	R4lQh7g3flyCJg/+1MlutuD9Ywg9uUMk=
X-Received: by 2002:ac2:4576:0:b0:5ae:b9e6:afac with SMTP id
 2adb3069b0e04-5aec10aa4aamr99161e87.23.1782821647638; Tue, 30 Jun 2026
 05:14:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260615-b4-serial-max310x-gpio-get-direction-v2-1-4704ba2b181a@vaisala.com>
In-Reply-To: <20260615-b4-serial-max310x-gpio-get-direction-v2-1-4704ba2b181a@vaisala.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 30 Jun 2026 13:13:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=g6jVJS=MeWxv+1J5m-nKjqNasb82xv0z3=wU47rxUtA@mail.gmail.com>
X-Gm-Features: AVVi8CdUwZsxJGd-1jkbwJC3cpMuesQpbhYucYXzc8Y282bGiYiAvtZpAnJjlJ4
Message-ID: <CAD++jL=g6jVJS=MeWxv+1J5m-nKjqNasb82xv0z3=wU47rxUtA@mail.gmail.com>
Subject: Re: [PATCH v2] serial: max310x: implement gpio_chip::get_direction()
To: Tapio Reijonen <tapio.reijonen@vaisala.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Alexander Shiyan <shc_work@mail.ru>, linux-kernel@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 7:38=E2=80=AFAM Tapio Reijonen
<tapio.reijonen@vaisala.com> wrote:

> It's strongly recommended for GPIO drivers to always implement the
> .get_direction() callback - even when the direction is tracked in
> software. The GPIO core emits a warning when the callback is missing
> and a user reads the direction of a line, e.g. via
> /sys/kernel/debug/gpio.
>
> The MAX310X keeps the GPIO direction in the GPIOCFG register (a set bit
> selects output), which the existing direction_input/output callbacks
> already program, so the current direction can be read back directly.
>
> Fixes: f65444187a66 ("serial: New serial driver MAX310X")
> Signed-off-by: Tapio Reijonen <tapio.reijonen@vaisala.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
