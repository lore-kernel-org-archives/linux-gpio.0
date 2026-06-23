Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DDD3C584B
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 07:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782201205; cv=none; b=FAHZDRCoB2B7e5g/2dRNsxVVFS4lyOzxa/7oX/bZzbViGwcg8wHOssSLoHkE09appMQbt4ZNwH4ffsVFeYYdPNegMKSEqT5CCg1zwfNgapLDvrEi8LV63N2LpJpX8eHDZPD0EyO2aNDj/EWBWmHW8H8MMFIi+IXsIDaD3vNGKzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782201205; c=relaxed/simple;
	bh=+IHO79Vxs8MDWu6ISrA8usVnpL7ajnvUbV0+pwvE4o0=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=To4zNPN0ATLMkB4tU4iAnOH9VMMGXkhTYzRBllmnduDJl5480z4Acv/NEotJtI8eEhZQUqm2j7K3Kg9+1E/Y8RtrEjLu6Xi313rcSE+Nhem0Ya0VoaFDTsqpXh7rd3ImOFSQxlYkuV3ONdvci+Wy+EBZe0aHKq2CmeBZpBVHy0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iB8NsFZ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iB8NsFZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F901F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 07:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782201204;
	bh=zB8GkaiO3WtLE49IJEKv+C6pPmvTNhl512AHzIkZ2Ww=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=iB8NsFZ6n1w6r2NHGou6g/eeMMpHUqmKPcGJ24TSSNR394okKnUXLsdBHy/Sfwe5M
	 doN+ZiFmkZ5Qln7jERMZypGkjrc27md2J6YjW/4B/Qp2cYLs3CSMn99/Rye6Z4uEC6
	 uAtGMzW12VyBZ3kGfrQ8khy/BA6BQY+mWaRwM7knjmqaM0I4GBtP8KFN82RxjdMNih
	 jTf6LZ2PKpu03rYSb2TofmAPYSpdsGpnowr5C/OPOVM2xUdhUJ4RXATQBtFCAFPG50
	 MqbVjMcyURCbik3u20boipw/9zHYAtfi/2c9kt4VDy93lilGkuIJhzkJvmIarWfkDL
	 bGHffaF9YCbqQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39979f72d0cso32011051fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jun 2026 00:53:23 -0700 (PDT)
X-Gm-Message-State: AOJu0YwW/2+wqE/NH2l2bwtr8MOAXPU+x1uj5R12gowZe6BPANC0RADo
	AjcAD8LbOEHx8UcjOrDnlfTdE6z35ZIhQ/Cof8s4Qln7ovgAn82bxNKvwznQiYNyRtvtZMx34oR
	BSqBqScPgMTUX3g4/r5iE2n0YHxvvOdqwzaSxccOM+Q==
X-Received: by 2002:a05:6512:8050:b0:5aa:66a5:66cd with SMTP id
 2adb3069b0e04-5ad5be2fe19mr2528082e87.18.1782201202661; Tue, 23 Jun 2026
 00:53:22 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 03:53:20 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 23 Jun 2026 03:53:20 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260622153204.72071-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260622153204.72071-1-pengpeng@iscas.ac.cn>
Date: Tue, 23 Jun 2026 03:53:20 -0400
X-Gmail-Original-Message-ID: <CAMRc=MdrLcdJ1j4ThGYzOyDDcw51jFmHT1SR-ry4kX+dnYVfsg@mail.gmail.com>
X-Gm-Features: AVVi8Cc6N8U0jDtCB9JAof8b2X7NV-FUghcQQIc2xG4s1L9JBkewzXMa3iB3WUI
Message-ID: <CAMRc=MdrLcdJ1j4ThGYzOyDDcw51jFmHT1SR-ry4kX+dnYVfsg@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: htc-egpio: use managed gpiochip registration
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 22 Jun 2026 17:32:04 +0200, Pengpeng Hou <pengpeng@iscas.ac.cn> said:
> egpio_probe() registers each nested gpio_chip with gpiochip_add_data()
> but ignores the return value.  If one registration fails, probe still
> returns success even though one of the chips was not published to gpiolib.
>
> Use devm_gpiochip_add_data() and fail probe if any chip registration
> fails.  This lets devres unwind already registered chips and prevents the
> driver from publishing a partially initialized device.
>
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
> ---

Please also add the Fixes tag, it's a bug to not check the return value.

Bart
