Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F4B2253EB;
	Tue, 13 Oct 2026 08:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791881355; cv=none; b=Ntk4xDWMB5cwF0ccT9b6FrY6uWfQVCk0IYTJtPjo4yyMDYkEhpdQjklrClvt42fFILSguu2lIpLbCYWzajEP+a0KpBG53EPrKzvSfkWoJSVyqd/hj3L5+Q1wReDOoAl78shNbT57/vGKdUTWNi1wu0u74T+sW5M6iuSgLP8qiF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791881355; c=relaxed/simple;
	bh=azLrT6o4+v0OFDuvAEvF+fW4Ax2X4a88nqh8ZbCJEfE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Wk7Vde0ct3AZuo3EVlzTcZXTkP8hc7avbaLXFQywWTZNkC8DFWA/89raKsDbF1EoX0PSd+wmaVtdPm2n1masp4r9A8w+JDQQU/dpGEwne8DOaLyHlogn/Xyn+8Z73Gfddhd3yuKAoulATqIqcez2086eirrAKpmKLbofayFksH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=YvD0TvD4; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="YvD0TvD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1791881335; x=1792486135; i=markus.elfring@web.de;
	bh=eP5Fq8ixo+Vh50JW7q5I6PGJgRHtdYkPCnw0tnkkWto=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=YvD0TvD4bD1YqXF0W2R9tNog2VKijziOaF482nPjg0K+pXHaNrO1eh27TQicZOLo
	 l6hb+d4E1pIG6ajWnhHk11GtMgvktB86RKsn04kvLbNi5eFJk4b6gWPBMzXuBQhnw
	 C0F2liEFfBJ5WQkmDa2B+B+JIGPzVY7tShHIr+eCPWxWCg9jWuZXmHt6psgdKePmY
	 vQX/+o1NM2gkD36FbfuwX6Npkmv4w+Wmy+NrMHrqfRrUYfxhpl0ilvNkXZeyvqsgH
	 fT6BQnC3EeiqeaXTxF6P2nABBmhqw/KVmRN6EbF/KXgNXXUnvMbi6LyftdZkaJfdz
	 El1lGxntnX1rh3pLGA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N8Elm-1wchAU3gDw-00wWTj; Tue, 13
 Oct 2026 10:48:54 +0200
Message-ID: <80aea221-af95-4367-aa39-50845bf5abe0@web.de>
Date: Tue, 13 Oct 2026 10:48:44 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v2] gpio: amdptpci: add support for AMD PT PCI controller
To: Szuying Chen <Chloe_Chen@asmedia.com.tw>,
 YD Tseng <Yd_Tseng@asmedia.com.tw>, linux-gpio@vger.kernel.org,
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 Jesse Chang <Jesse1_Chang@asmedia.com.tw>,
 Richard Hsu <Richard_Hsu@asmedia.com.tw>
References: <20261013074327.4961-1-Chloe_Chen@asmedia.com.tw>
Content-Language: en-GB, de-DE
In-Reply-To: <20261013074327.4961-1-Chloe_Chen@asmedia.com.tw>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:pIyUcQcPvmKiTAVhWDL6lD1NaEoAf7ac74koBkYgOA9fUoFm7Rl
 zuDdIAgk/bDjewjh57dkpXMBDBXl3Xa7OekAToQwUieY/o5CA4nq1/+9OVbf8axvCdCE0uG
 DUcpBKeGrhoyqr+LxM7MqlowbdQadTQTKz8Hu8LYMjj24LfaXCwcTwUCWHcfWR5jWXBst7C
 ZTtRF+83qBfOZeFITBzOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kNsR5BcYep0=;LRSeJKzyOChs6yk9nCYYjcok7Eq
 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
 =

> This commit implements the new gpio-amdptpci driver to support the
=E2=80=A6

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.3-rc7#n94


> Signed-off-by: Szuying Chen <Chloe_Chen@asmedia.com.tw>
> Co-authored-by: YD Tseng <Yd_Tseng@asmedia.com.tw>

See also:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.3-rc7#n502


> v1->v2:
=E2=80=A6
> ---
=E2=80=A6
>  drivers/gpio/gpio-amdptpci.c | 891 +++++++++++++++++++++++++++++++++++

Please move patch version descriptions behind the marker line.
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Do=
cumentation/process/submitting-patches.rst?h=3Dv7.3-rc7#n793


=E2=80=A6
> +++ b/drivers/gpio/gpio-amdptpci.c
> @@ -0,0 +1,891 @@
=E2=80=A6
> +static int pt27_gpio_get_direction(struct gpio_chip *gc, unsigned int o=
ffset)
> +{
=E2=80=A6
> +	raw_spin_lock_irqsave(&chip->lock, flags);
> +	val =3D pt27_rd32(chip, PT27_REG_DIR);
> +	raw_spin_unlock_irqrestore(&chip->lock, flags);
=E2=80=A6

Under which circumstances would you become interested to apply a statement
like =E2=80=9Cguard(raw_spinlock_irqsave)(&chip->lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v7.3-rc6/source/include/linux/spinlock.h#=
L594-L597

Regards,
Markus
