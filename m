Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866274;
	b=XN3vSgv2IDlQ+jnVQIDlfZWTtiVd0oa/J2P/Ve1QRT21Co9NpOBA4PFa6O2sfZESqmYs
	 D+QyI3eyF9jEegpJNczHDU/Rl/vLIW11/ItQ03kT/KFqmYOoehEQfyx25Pp6VninU2tbh
	 XVK+IkFnIWNZelNxHwiqkPogyR6KuOeGOSE4Zc95pqlKRJ3IIquDlD0k1udwr9Ojlh0Df
	 /NQiyYGADwDQjFv/G8w6RXbzXMrU505+YSAOhWve3D9fQbK9G1c4pEAkHRcABLSeIq2CF
	 y5XR1b0jkRRFJ9i1+X7MiaZlli4ivkHtPvXcE3VzZW8YocSnJs9plXuGqye0lmb07aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866274;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3k0TlYcqzV7mPVkptjvVxsR+HaSBcK1pGyBNv8k5DuQ=;
	b=5MJWxCAuUKoX7hmdcwvHrCuC0VmXMSfXKErJ8LjkZuHlBaWoGHlGSj78WgcuEZlC7HNe
	 NJ12un04mbBz4oV2Ce3z7CRK7zUFsjLrmKyM2SNO2W65NHRwDQ017Df7x3ljClBdzRHy8
	 fFyTuCipDrXXCg9TO0vORpEBIKQFRBXs7YC82gPflXLN0gFEVnlIrXnBPdf94aBi2zxt2
	 one3RxO1A72FBTTJDd87YTJPSTApBNu5Zcow/Ez7dubTLJLamzWtCttYgm+mTWx1Z1Ehw
	 4/1mtSApryd9ffbTiuoZJhKMP+K97/MkQa5snvBgvSxODbERGjyMqfDtvZmSdJBSfow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jTgbbLIY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB75606A33A
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jTgbbLIY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0C811F00A15
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866273;
	bh=3k0TlYcqzV7mPVkptjvVxsR+HaSBcK1pGyBNv8k5DuQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jTgbbLIYx0AnEDYBjH5tCg1RJCrEGCLqNEN5ZhzT9oifFd4Azor5PKL/CeNzJK5tC
	 vHa0+q8+EMQJ7MnUCDS77VHnB0uCpvX5Eg70srV1JfhfdRH0cAjnYprOnAZ9Pj6pkW
	 Hq2OtPL6ClpS8m8kpgWf6W9fVANo358EM5Ht50Adxm2OEMoxiT1a4SyGPB746f2mwP
	 ZDluvNpUcouAK9IP8OxLadg83pjqOjfloLrgA5R+mblAAgpr8kAkLX1kbJIxku6LeY
	 dflrIv9V1Uc5KzEqSApxsfoJZ9Ap8SnxUPACA8JQ7tmRbz34lQdFDHh9/xuGkP+Sqt
	 4FYO2wEfJdaww==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5be4fea434bso357772e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:11:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzQXrCOXE74uhDGGIjFz6tslVtDKNb/Mbqkf58c626cS8Tge85OeHEynbl8hn42K2hURJUfFegC99Az@vger.kernel.org
X-Gm-Message-State: APuU4Z9KrsN5of15Kcj+UkvhzqzjlFjRIGtGDrCib5hWKk6zM/0O3slq
	Yd3otdMKU0XjBpmVrJcrWCSeYYw6XMXID4HKA/IKLzkfdskPBmMlxHxxlRb5Hh0zjrudlivFpi5
	XvY9HinqORowBA5xSELSnnCjF1yGKT/I=
X-Received: by 2002:ac2:4e98:0:b0:5bf:faba:373a with SMTP id
 2adb3069b0e04-5bffaba3853mr277123e87.3.1793866272701; Thu, 05 Nov 2026
 00:11:12 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104150013.32879-1-sinha.aryan03@gmail.com>
In-Reply-To: <20261104150013.32879-1-sinha.aryan03@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:11:00 +0100
X-Gmail-Original-Message-ID: <CAD++jLkygr1hdLU3njWx6V0KpMdLAhrUkfDu88La6=fUKDKMVQ@mail.gmail.com>
X-Gm-Features: AclHuK-I9aBVLakE6JYacknndMqjpPK5ZRSL0PyrvLGNqISRkoulYx-ojyMrIVA
Message-ID: <CAD++jLkygr1hdLU3njWx6V0KpMdLAhrUkfDu88La6=fUKDKMVQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: jhb100: use str_enable_disable()
To: Aryan Sinha <sinha.aryan03@gmail.com>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 4, 2026 at 4:00=E2=80=AFPM Aryan Sinha <sinha.aryan03@gmail.com=
> wrote:

> Replace the open coded ternary in the jhb100_irq_set_wake() function with=
 the helper
> from string_choices.h. Gives same output.
>
> Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>

Patch applied!

Yours,
Linus Walleij
