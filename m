Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212E4366DB9
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771922638; cv=none; b=oJWim0wM5iZy40FaMbZ9JrrSwn3x8z4DBdEGxUt3gtpUnlWSYoFmqHsi457cCL5t8tq77iByfgZj1Z2xDSRcWJuxFQ4DR5kuWt5+u4Bved8GNvig8Inebw+r2D95H+VQ8gneLag4cOOcBWRAKbnJKokj1WH6qPmrS9aMz3adbMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771922638; c=relaxed/simple;
	bh=gZei0Mq3kGPIx0R46/5SVif9bfW3r0SR5h56gJ3ONMM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eQzviJ6yhMSrJnxQZF7k6/uN8gZ7vnB6kMZk7vMctDTa/RMS1GLW/2nn7YcSdKMhIdzGif2VMLW2Sxh0T69exZwWQFb7GVINA5MHSNVXaUZBc3UNLhdHRseTCjQ3rQIIgRD6CnDahsb5jf96V2pNR+vqAseKTwn5cNE/wiWPLSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eOc9xV7V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eOc9xV7V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3B1C2BC86
	for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 08:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771922637;
	bh=gZei0Mq3kGPIx0R46/5SVif9bfW3r0SR5h56gJ3ONMM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=eOc9xV7VAWr2/qcuRwON9u2JvU8x8m3dBqSqPyWQwTQZWwSiuUYxYER+S1KCLubZh
	 3bK1oUVOCIA6S0+i77HPsPsXCRjMsGKTE4IIXD5R7jOlBgeAchfe41UEUBze2+/6sc
	 BXIX7oy5xMPpdkCfu375jpocsFOm3ep34w2W/w9niTCwl9rGXkDYiE4SjQVjT9C6c3
	 X/x99Maqdg8eWH+QisE7KMAHxtQfNA8T2AY6rNZIXbVEt2jZBaEqfvt4+qeaAnsGVv
	 rFn7yjnd/jSdG0NZ3O/sjB68SgZTdleHYMn5Kg/9SfKYj+h0/aIu3XEyMXxy/lrUvz
	 QDSXwpoXSENkA==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7927261a3acso46778177b3.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Feb 2026 00:43:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVI4iy6unIf07rg34B8vE7hu1OieHjUb1Jahb2FqxKgP3zw4a3BemZnMzRRNiUO+jzPKicoF+26etOc@vger.kernel.org
X-Gm-Message-State: AOJu0YzMXpm2vl2wiSUhRd31DLQTLTgr71h0hEL1LYTLgRJt3Hhf/eXm
	pXq202kIFxU6lfbOdYw3iEJJlJWY/GmsNhocfZtHaLCbvnj30reGiVVjifSoMHaKA72+QAsdsHt
	gWA0BcCaXTvAMUZBvBh62AuDVwQ4HpvY=
X-Received: by 2002:a05:690c:397:b0:796:360f:e1d4 with SMTP id
 00721157ae682-79829141d75mr106784997b3.55.1771922637213; Tue, 24 Feb 2026
 00:43:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260216160946.2977985-1-wens@kernel.org>
In-Reply-To: <20260216160946.2977985-1-wens@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Feb 2026 09:43:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6vphCXZpK3xKa-DcNwaXF-A2ZpDyFBboZSdXtUiGekw@mail.gmail.com>
X-Gm-Features: AaiRm52XtLMgoXsFWcWRZ7UmU0Kq2RTrkmkH0mObchmTQ3Jn8fF3OGXhxOobFmI
Message-ID: <CAD++jLn6vphCXZpK3xKa-DcNwaXF-A2ZpDyFBboZSdXtUiGekw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunxi: Implement gpiochip::get_direction()
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, James Hilliard <james.hilliard1@gmail.com>, 
	Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 16, 2026 at 5:09=E2=80=AFPM Chen-Yu Tsai <wens@kernel.org> wrot=
e:

> After commit e623c4303ed1 ("gpiolib: sanitize the return value of
> gpio_chip::get_direction()"), a warning will be printed if the
> gpio driver does not implement this callback.
>
> Implement it for the sunxi driver. This is simply a matter of reading
> out the mux value from the registers, then checking if it is one of
> the GPIO functions and which direction it is.
>
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Patch applied for fixes since everyone likes this patch and
everyone is unhappy with the warning.

Yours,
Linus Walleij
