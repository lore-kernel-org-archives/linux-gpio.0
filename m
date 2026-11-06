Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973431;
	b=xL4AP/FlwZ0zD/TzFOwzBhWjdAsbMYMskGtcLVzTL+J6IqyJnSNp8vs4l0R4HFfcSn4P
	 smrWmvnFjEw6YzTDf17+CAkOdXyWciKsO6bywpTdWUFneavs04uPX1rPdz9OHE45GOyjW
	 Uw8KVy6uBed95SIPvGDfdDgng0q1+YTnbXWsPIQO7+//gjXPMjx+l2vYw3sw7xnfGFibQ
	 X72atmuSuf/7lvWrPWii6QiMp20ovdVCrKrYPVTvNZHU8wnDqA+jniTNzXEGwDsvh5TB/
	 6FkAjDHB6jTyVmfijVZ5XnE07L/Rv7aXH0Gevw9Ss1X/wuNNyB5tA5QLSpAp1/NIsBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973431;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=4Ofs7RTHEakhY346X/eO3i41G3i1oT7qff1aljC97l4=;
	b=DJYqr0CvdoGXTveiqyUa+yMTkUM4qNCz5fpn/nE06GWnfSRJBczQQgcWArvjpxm5cWM5
	 iTdug8wnPFZsvGOLLb0IWigZQZr0Nd1T5HJo6gK18h4+jseuvX9mBE0iqL9tN7SvYm0Kq
	 iMztlrW1wR9dS/Wwj6zSksjS2BmGWDQyZ65Z1w1E1vTySjyisbTTE7ah5TB3AeDQo71FU
	 94ns0WAmchiureVYTrt0IHcTlkDsor1+80RvSmN2Bk5u7Tw/3sEgOeMWXowdn8K225A5/
	 hDbjnNdqRpq2alC6kjeeuWCoRjOvtJbSVSk6Azkaja0d0Ywxc4TmqOFrEVdNPixY6jQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=baVZFaLP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C69606A326
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=baVZFaLP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0931F008A4
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 13:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793973430;
	bh=4Ofs7RTHEakhY346X/eO3i41G3i1oT7qff1aljC97l4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=baVZFaLPApTDcYTfKyW0YEN/lxnzuXw256U8A+fz1J+iYofST+2mcDztwcl1cXVip
	 /DVKVJmabDaSbNMqRxSbbtVY1UiSEMJD9cDl78bCx9i7+vJxHaCVQ5c8Y1cOvu+eIo
	 YbPWfcQN7wWstGEtSB4QX+RG/I0WJnvt76JwFhMiZpHc0QguETZyLfHCY+cLHh+Sfh
	 sNL0kTTmxezMvP2HrRAZYKSa/584alMfd1Tgk9Xrenq7WR7y5s5JaSvnEiGbCrHmsN
	 MlmGtQQbt/QKUbcdb91E58VklWuqL6F6Hwn8EUzJNp/La0o1NBtf1V3kRAANxwrusq
	 B4MTOG11u2X+A==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be3cff0f6cso511493e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 05:57:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwj/jG1BpGY0A0OLJnIaGakf038IJlVfVjdADzR51ZPN1ESWuLGaI6+Gn1NfiBwvWVjyarBVN/UeKNe@vger.kernel.org
X-Gm-Message-State: APuU4Z+j/DTcKXze8cT1Jh8S8dcldnQT7yPd53Ifx2QP7jREyq5p698z
	199GfUMMDoC0NPn4J+SMbYiLXx3lwZ6/S5w6VAdouj88WJa8RJMFMhfJhxam7sPTgdT5szb96JM
	ddsoRXjzd9QtbYkbh9jUovJzk7glxwv4=
X-Received: by 2002:a05:6512:2346:b0:5bf:9e4b:929 with SMTP id
 2adb3069b0e04-5c003a96df9mr958365e87.19.1793973429373; Fri, 06 Nov 2026
 05:57:09 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com> <20261105-b4-gpiolib-free-v3-7-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-7-bb47ad58642d@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 6 Nov 2026 14:56:56 +0100
X-Gmail-Original-Message-ID: <CAD++jLmPvptiwa=HuxN_-7XOT31WBRpORYU=C5Ze-zj0YG7nrg@mail.gmail.com>
X-Gm-Features: AclHuK9Qys4M6oOe0Uj42H0w8aKdLZf_LbSkZC12VEcMMHIgwmSK3uzL8ihdJKI
Message-ID: <CAD++jLmPvptiwa=HuxN_-7XOT31WBRpORYU=C5Ze-zj0YG7nrg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] gpiolib: use bitmap_zalloc() for fastpath bitmaps
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 7:30=E2=80=AFAM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Currently, struct gpio_array embeds invert_mask[] as a flexible array
> member, and gpio_descs_alloc() allocates the descriptor array,
> struct gpio_array, and all three fastpath bitmaps in a single kzalloc()
> call using manual BITS_TO_LONGS() calculations and pointer arithmetic.
> This exposes gpiolib to the underlying unsigned long representation
> used by bitmaps rather than respecting the bitmap abstraction.
>
> Convert invert_mask in struct gpio_array to a pointer and allocate each
> of the three fastpath bitmaps individually via bitmap_zalloc(), freeing
> them via bitmap_free() on fastpath cancellation and array disposal.
>
> Although this adds three slab allocations when the fastpath is active,
> packing all three masks into a single bitmap_zalloc() call would still
> require rounding the bit count up to BITS_PER_LONG and slicing the
> buffer with unsigned long pointer arithmetic, adding a second
> allocation and extra free paths without achieving bitmap API
> abstraction.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
