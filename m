Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C1212566
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779699223; cv=none; b=pNcyq/yE+J/eQ+CUU/hbHlcdzXrKHZ0YrCFvdEhXsKvZGF8GNLG9o2VxGPDXDerzbhk/znaCaL9g972ly6mPSq8BeEI3Ek/nx6MBKT1rOSQ7CDJLo2Z9unhy8OwFFkTDG32tAcKVd800kYuIWhhkWwg1+1zqbpw+Tsp1zu9mjQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779699223; c=relaxed/simple;
	bh=PwYe/NFxLJlA0Egc1mISAxaRoUxKZhZyJuBlrHaPkUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ge3ja2492AUB5PYrRyyotlkiTTKXbEJ2BiCuFd/oyJ1xwhQDA1J6MFTY7B1cRWO16NYGa3r4ybDj9g/GqWBUqfNmEpnOaVEHAvfgItmxRL/YaAU7KZKIabkzsEHS2eyLYXK71NwhZ9GDtKoZiplRCCYWa6VRvaTqYuxRXAJTxkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oEgu8qxc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oEgu8qxc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E701F00A3E
	for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 08:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779699221;
	bh=PwYe/NFxLJlA0Egc1mISAxaRoUxKZhZyJuBlrHaPkUM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oEgu8qxc2llq3MjRhry4F1wlxW6uiDWHfH/Z3sH7BWyAlKo8FJIQoDcAbNtfFDoeG
	 uPdThzbWWqeKY9yhcLf5VbC4lpOd7j51JLHHcupX6wTAlDC2JkqjLAfRPsDVYJiGU8
	 dS1ZFZtGbkLWqecEjfZ+3kT6TvY0KcLz2T/o5x/m/CegHdH3TT2bexOFpL9hy8QAXe
	 eS7K2fIACcD+w8RpoOpTDl0hVfMnhXzKnqAT72dMlJVML9llLM9+Fgr7AohfQOva81
	 0BHBrA3OCpSNZ1gYBv5bzphU6EU4ZvICyZ5hUmogy+Uhj6iI4ErxwHhMTvLeCfXlew
	 ZlDWdqLf+JLfQ==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-439acb393f7so10643138fac.1
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2026 01:53:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9Ur/I+CL8G8rPtWiFoesOL6hfIoMoy3gxYXEovr2PWthT/l0lYGX73Or9gycVrcY9wpJBPJnM7Rjbx@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7WtsSdKGQK+4K+EwXYMBZDFvdAHOJiGYtoQom/OAhQo4HFvHF
	uf1GsRhKqpYazvRYb5zZaeD8+yulIrzQQVYTKq4be1TXB5HfRSEm3ZfliUR7TibDyIZC5djbpeF
	ee6AAy1imQCE/OABJnUsnkzwrqLu/VwU=
X-Received: by 2002:a05:6870:8583:b0:439:fc14:854e with SMTP id
 586e51a60fabf-43b5aeecfb5mr7821384fac.32.1779699221090; Mon, 25 May 2026
 01:53:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-gpio-shared-free-vote-v1-1-6c54966583e2@oss.qualcomm.com>
In-Reply-To: <20260520-gpio-shared-free-vote-v1-1-6c54966583e2@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:53:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLmzwr6UJ_UHgU4HQBhmqjyaoa6-pCDGnfSYvXoLSWk2Dw@mail.gmail.com>
X-Gm-Features: AVHnY4IwJAiD8SPlmz88gVycT05wSKuXpjuQ3lwP-rks5YIGv4-TeuskpC1n21g
Message-ID: <CAD++jLmzwr6UJ_UHgU4HQBhmqjyaoa6-pCDGnfSYvXoLSWk2Dw@mail.gmail.com>
Subject: Re: [PATCH] gpio: shared: undo the vote of the proxy on GPIO free
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Marek Vasut <marex@nabladev.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 2:48=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> When the user of a shared GPIO managed by gpio-shared-proxy calls
> gpiod_put() to release it, we never undo the potential "vote" for
> driving the shared line "high". In the free() callback, check if this
> proxy voted for "high" and - if so - decrease the number of votes.
>
> Note that we don't set the value back to "low" when the last user
> releases the line in line with most GPIO drivers that leave the value
> "as-is" in GPIO free() path.
>
> Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy=
 driver")
> Closes: https://sashiko.dev/#/patchset/20260513-gpio-shared-dynamic-votin=
g-v1-1-8e1c49961b7d%40oss.qualcomm.com
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Really nice find by Sashiko.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
