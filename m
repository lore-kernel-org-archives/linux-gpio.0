Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD094218B1
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 06:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786430502; cv=none; b=HrT2CrTVzTYfeiolpzcqes0f/KcBmfXikN/QwCHuV2CKkJWttp3TOnT1F0wOWsuM1sdYl1os6RnqoK7blyZqP9IP6/Q7TwYWdENjsyiHzpvHDDjfBgFnzD356WJp23F4XZmjvvauP9zQx7WjnIsgblD82uNsNOyAXJFJtYs+Hic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786430502; c=relaxed/simple;
	bh=JK+wAqQEUhQz/LHRYT7KzbEjMdMwSq9zpsH8Nz0jD0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oy6YyRG5oq+xhhnL7wm2Gt7gZ/Ebs6UXVUlVljN8TQnn7f4FT9KjUe25/qWhPyd07XkZBpKfIh0/m8dFsQXKDvqYOENgsd9UjVaehi/r7VydwpPraOibp27iXn5puIW/FMqMR7ILxnWtsv0F2RAls+kY4zBznBiSDeHYO9gHVhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhlwd25v; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhlwd25v"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C754C1F00ACA
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 06:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786430480;
	bh=JK+wAqQEUhQz/LHRYT7KzbEjMdMwSq9zpsH8Nz0jD0Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dhlwd25vW3cf2orHqbCy/uIaCgOeHKczyl9ZkDbeQyTQ23YwBV06TgCt2GCs0W2vH
	 fv2pMNS6G2yOor+IV3XuTsU9WezaYHO0l59oGm8czWeb7cJAR24ijA4Ms8xIiUcIt6
	 bviYwrdIxLIjeIJcpjxvH3Gyk3pyx+DCGsRYkzc30n870YVXi9B8m8OQQa7eptpGSg
	 rJ9xHeD4DMFiTvebT3hthwkBq67GrtCEG8M3IJ2UGv1y9TcJShmbn6H5E2oLXyC1MA
	 dw9nl1Q+CdrOKzuxGttUuak+eSKa+vZMu+Q9L2RSDF29eOsqL3fNAfUCv7s0u0zm7B
	 fHo68SXNc4afw==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39ca300db70so20314081fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 23:41:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrPScs2mrlgwkPGRS87jPAWx98XSrTixXv1NAWYDz4j37/CFn/j3UzxfdXS44ow1EgwNCJQmMR1ZjSe@vger.kernel.org
X-Gm-Message-State: AOJu0Yz59vS1M5GgJImHJWEG4gj+y4zdyfOCA956ZjTKT4Ur58yBzxe3
	P+CWbcuIsf+Jm6QQpyzHEpy9WyTE8sQFQ0hysy0r1MeYNWk3Oecn2cU9C6o+j+Wj5L7h8Vuuf2l
	fNPYOAo6zMxVKdnqMG4ynnzRS3YJACZY=
X-Received: by 2002:a2e:b8c9:0:b0:39f:86b8:c99a with SMTP id
 38308e7fff4ca-3a0f8d4a576mr1467731fa.15.1786430479553; Mon, 10 Aug 2026
 23:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260810-gpio-pinctrl-output-set-val-v3-1-8e35222b5c8c@oss.qualcomm.com>
In-Reply-To: <20260810-gpio-pinctrl-output-set-val-v3-1-8e35222b5c8c@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:41:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmgx1+biSfritZpvcpszgfwh_natnZ5TE1qARJzqj8QLA@mail.gmail.com>
X-Gm-Features: AUfX_mwHa1j2GRoz1m5TcZaWA7KGRI5dxYnkFWL2oqzKYFMxItB2ve2Q6tOx0vQ
Message-ID: <CAD++jLmgx1+biSfritZpvcpszgfwh_natnZ5TE1qARJzqj8QLA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: gpio-by-pinctrl: Apply initial value in
 direction output wrapper
To: Alex Tran <alex.tran@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>, 
	AKASHI Takahiro <takahiro.akashi@linaro.org>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 8:59=E2=80=AFPM Alex Tran <alex.tran@oss.qualcomm.c=
om> wrote:

> Apply the requested initial value via the existing gpio set
> wrapper, so that the pin is not left at its previous level.
> Afterwards, configure the gpio pin as output.
>
> Fixes: 7671f4949a6c ("gpio: gpio-by-pinctrl: add pinctrl based generic GP=
IO driver")
> Signed-off-by: Alex Tran <alex.tran@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
