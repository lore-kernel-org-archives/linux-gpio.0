Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7333D47C5
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782979139; cv=none; b=RZ90r8yqOUIMm71ja46GOcK1/wfiHJyeI06eSTIoKNZEKd7UAMHj/EJh/9a2erVoUOAQc5p7Ccdik3pftRRMB31j3OfvqfK/pBOkZRe9QqMHYhWINMBruilIBk9tIm0V4USWNmHDgJ71DvbhIZ8QcnVJAPdxuDoOUWdAme61J1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782979139; c=relaxed/simple;
	bh=10MqKgCWN5l5ayMaSZ3sDtzeHbQ2dyWabULbQumCxF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CKdF4w+OnZCDAHAVB3HkX2AJXpB0WQ1fVhFLH3R1ugzwwcZSEaxEFFFTU5gCmCj0NsPSZehXjbzJkhHfiwVhUJg3L0Gp1+PoSjNGfwIacwzQ9Y9luljvtlI+C7J3N3afycv+/jH1cvK2l+qdbCJDcVgAKSNegFTidKparLcWbj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jhZ1mg3k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jhZ1mg3k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7DD01F00ADB
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jul 2026 07:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782979137;
	bh=10MqKgCWN5l5ayMaSZ3sDtzeHbQ2dyWabULbQumCxF8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jhZ1mg3k5TY2A/toUrZc7lr4m+TYCytS0SkP1wublCPzlXQLqeAH8R+FuCps1120B
	 VFDOGJXFdTKqNaSTl36sT0Z0NpC8n46eZ+xfWf1eYyPBHyyperD5oYjl8xqYQEJjYa
	 O8KTiXxu/QuFM2ZDDxtTS9qSfuATqMsKvkdoZ1sHljXG4xjKv0wuYa9jm/qB1NyjI7
	 2gTqf1tVRL3QUx8HMs5RZorqpTjey+7A/Kz6sT07lhkbLoawYXzC8dLZFhW/WxYPV3
	 mTyqPiWUnssAeNUlRVhYxu0xg6GO+bzy/2oNUDf5M6zYXOefUNA1fWOo9yPhMamXeM
	 4ccAjfGh27ivw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aeb91c003eso1590053e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 00:58:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rrjhafa07KkWxCkqSksjx8ocuh1YrOJkj2mivmsjrsOlMudDXTY0GdnsEhufoh3vRBvbkWODxRlSvCQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzJl/Fmg//0uytKUf8qVoG2I8ALfBnu4iHi1lqBXViLAbvctFLO
	VYk5xpbmneUEGjAh6CrcDicDs6QQBUYaTQvYD+TmgiEQupPrrqEuIlC7M3TgVd+JrEQ0sXdUzfp
	4KexlSHWVpyYU9kgbglfbgi7p7A9CVI4=
X-Received: by 2002:a05:6512:8350:b0:5ae:aabe:de8f with SMTP id
 2adb3069b0e04-5aec67ab255mr919766e87.25.1782979136746; Thu, 02 Jul 2026
 00:58:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260701-gpio-nomadik-silent-v1-0-644d10316cef@bootlin.com> <20260701-gpio-nomadik-silent-v1-2-644d10316cef@bootlin.com>
In-Reply-To: <20260701-gpio-nomadik-silent-v1-2-644d10316cef@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 2 Jul 2026 09:58:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLm-yEb4T3T=6w5gcvoVmpQ7mAuju7LWc1vFf1LefsG0kw@mail.gmail.com>
X-Gm-Features: AVVi8CexZYamlN3uYWqCZl1ubYNYnvZZovE5XFNE2fG6ZYZkeQxg0VWkYO3ZBkI
Message-ID: <CAD++jLm-yEb4T3T=6w5gcvoVmpQ7mAuju7LWc1vFf1LefsG0kw@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpio: nomadik: add missing dev_err() call on chip
 populate failure
To: =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 6:57=E2=80=AFPM Th=C3=A9o Lebrun <theo.lebrun@bootli=
n.com> wrote:

> All error paths of nmk_gpio_populate_chip() lead to logging errors but
> this one (ignoring the alloc or ioremap failures that must not log).
>
> Add the single missing dev_err() call.
>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
