Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973382;
	b=leBkhU7T2WHcK2tsJPkx1tu9w8rsgQ3oH5boO75lQwMSgRHIRgxYrR2oVhSTf1S85wQB
	 rt3+iFrfeLgyMU0By6EU58UYc/+5HMwVSnsbKNnwibq9OaXeZ+eX472sZel/lYtN8DTco
	 OyQeCZj50wU49Yb4b+5QzZz6X6GoffNrvbWRO2a7o+XyplEyBMCFURxCiy6CUCeLZHUFx
	 3k2NvlOKFnplpGgQVqYP+QZXJMAzDDyfhhN2X1PGy5k6kgP385c4UcCgwsUSdM4BeMzY6
	 M8S6p95xKszxRoj0gtClvX9WUHiavtewjfwpR6jCqj2n2ZhdIXlStTdLzTKymTP/DvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973382;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YVLYr4jwcTQ5zmfK8dkgZArlDLrc2T7HaDWu68MXVVs=;
	b=1zqtZpa9m3Ibgm2Lqxpc4N2Mx1K+LoxlC3wY2MWUep000EHjNe2KwSDz1kDuOd5Ft22t
	 3yQjKRVon3FUCDjvmWB2OIjD2gRHRl+AbrvQbNZsLbtfMNtalPNxwGt+s3s7qxPdhsJfJ
	 uB5F3k7pirsPOzEe9g4IP7MvLxwEf19lSaE1EfpjckseLQmN+0sM58VsM1zilVqVxWe5o
	 KWPO9VMgZT8QLQ83Jvsj+2vWz7AQeWMVpIRPk0PWuHcjpcc6Sjq1VnXGY3DlmM3+vdeCH
	 Ac68d75MeJIhb7R81ArhyZYMiHqc4CuP3eRc3nOypWtmAxdbmP31sFO4MkKpzFlhlkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="KH0vu/r/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F4B606D809
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KH0vu/r/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 998E31F008BC
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:56:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793973381;
	bh=YVLYr4jwcTQ5zmfK8dkgZArlDLrc2T7HaDWu68MXVVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KH0vu/r/ozEl8qS309WKvZ1sNa2n6d9BpKyLfR47fordxDJoyik9zCiPOvavtHp2s
	 g1/ru1b/jcH6rv3P+powdpnccM/s/cmQePpXPU0PaF/OTWqK7kitBAqtVn8u97LFyL
	 oRXnq7gqrejcZtFhTs3ce1AbgIt5DlTkSeLrctuAK2FiAo9PZtQsyLr3MuVUKRUdXD
	 BuepEM3UQpgXUDecvhRCN+PAw2S5l+kz+trbgjVQ0GBAQyN086VEiBSg6qJYTrBXJd
	 UxOV8xMRwEAIH69q7ndKCXQsQ5/jDWsJl8CmLFcpJeK9WUF0IgLdTZMUSMjGSjfhR0
	 YgkzwB31LEYKg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bfc346401aso513001e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:56:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByRN595EGMVnVcldvWyhKOdWI7Xfj/gK/reQFvaDwssuLqG3keBtjhUxWK7maSDZhL1nQgUQs+7AUlr@vger.kernel.org
X-Gm-Message-State: APuU4Z86CpcaPG+vuNYJkXBLeARygSWWpwM1Y6fJB6v5QsRQG0Gw30kO
	iBkIJCY6N6UWGXxZOmnNAc0kX+AYpiClSYp/i/mMtRYSN3HVDPFX2lsDHumrTV2tADmGZMDkEL2
	VSxI5T6n7wyLsu3FTCxnWoWMUxuyLEos=
X-Received: by 2002:a05:6512:3baa:b0:5bf:c17e:a635 with SMTP id
 2adb3069b0e04-5c003ac9f0dmr835940e87.13.1793973380358; Fri, 06 Nov 2026
 05:56:20 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com> <20261105-b4-gpiolib-free-v3-6-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-6-bb47ad58642d@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:56:05 +0100
X-Gmail-Original-Message-ID: <CAD++jLk+EfkLsHCyY+O6Om_xTEe2dJX+cscDLqW+TVM2f_V8qw@mail.gmail.com>
X-Gm-Features: AclHuK9g7sOVtII_gKjkpYN7oW2jL4cWwR57schgn8cvUWFZLXpd7Vw6rOj4_sY
Message-ID: <CAD++jLk+EfkLsHCyY+O6Om_xTEe2dJX+cscDLqW+TVM2f_V8qw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] gpiolib: avoid krealloc() in gpiod_get_array()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:30=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Instead of allocating descs before the loop and reallocating it via
> krealloc() when candidate hardware array matching is detected on the
> first iteration, defer allocation of descs until the first descriptor
> is retrieved.
>
> Factor descriptor allocation and fast-path validation into helper
> functions gpio_descs_alloc() and gpio_descs_check_fastpath(). Inside
> the loop, acquire the descriptor using __free(gpiod_put), allocate
> descs once on the first iteration, check fast-path candidate
> suitability, and transfer descriptor ownership using no_free_ptr().
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

The kernel clearly looks better after this patch than before so:
Reviewed-by: Linus Walleij <linusw@kernel.org>

> +       descs_size =3D struct_size(descs, desc, count);
> +       bitmap_size =3D BITS_TO_LONGS(max(gdev->ngpio, count));
> +       alloc_size =3D descs_size + struct_size(array_info, invert_mask, =
3 * bitmap_size);

Nitpick:
I know this is not your code, but if you respin try to add a comment
here explaining this 3 * bitmap_size.

Yours,
Linus Walleij
