Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910727;
	b=ekONLCrsTWnKTFePfaCyirqp/Nv8eU4q/bqn35u3gEWv7SThBeZjNcGOKle4JMGW3zsW
	 GQbmyWta52akVhpbryBX/vlbgTLovQmD2MTUvW7VsheTZ1mepdnUsNi/GlX+YArImccQJ
	 HYOC9Khi5w24+4vBwqyDiEHRC0y0IMZktoxY0Dm+4y7fd2pOVMf1FKKrXIjkL8wgqL1By
	 qT/vxPwmQE1OSs9ETi9hKoXF9pqKmxlmRJct/RUqm4qOw0EiJB4niZRyFs9lD8KkMjKRK
	 uKxPelzfNjaMzZD1teEwFoNLcRKkhU7DXqFW0swsQY6i+eTsIzVUgCeUxN1pIfxmb9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910727;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=O/o3wnK6Vqf/0SWEfyvD3x+u+U38GqH4RPIdBLOwj2w=;
	b=CT/KSAvrs/sFwkgCdnwEBO9JkK4yP8FsTQJyCmduCRGO84u8a9qYsThInSQUtxAVNDpn
	 RklFL8ukWsTYGVytVu7NivT7ZceIobniB0n/rXjfVnm71okVvDOTbQoiP+rHvYYkvxPqL
	 odEWddc14D1MCbhlqmpNcp1KKNiiKGyZBMLDwhnbJ2KSuucJhLQjgHVcd/asy0eLJuZzw
	 LUfNmM0kLUrS8ULfGwHop75aP87Vc+WBahOL3lflIxXGvcKg0PZKKoxglaNItcXHlGp93
	 viwhMj1qGzwQgjQkaefZMr6Nq84F8ROF0oTGjulj7+kAR2U2DEUkFZ98cpNYPwJETKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PN37U+Ak;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9629A606A880
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PN37U+Ak
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36DF91F000C9
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910727;
	bh=O/o3wnK6Vqf/0SWEfyvD3x+u+U38GqH4RPIdBLOwj2w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PN37U+AknC+CF2p6Nad6wmfD4rsnTV9WhRARmVDKmrMDGAO64UHQ30knB7Tye1DgI
	 VMb2fBdbmchidiG8LffZ5ObMRmoqeQ+nkh0a6lhDQ2APn+5NsKlNSiTP0dQWkknIQJ
	 0NVNFHAgIEk0MlMn+bI6DdxpJhHJ8M0ZkA8hjq8rQUOmqpdpSOAg0Mcigo2Zf2iUNH
	 /kOFXjLam9/fQCGAcscWgPbmL0dPh+oByo8oORUWZvggJ+maAUTlLgWOETEk9T8oaQ
	 mFRWxHyEtL+HIvwXcTwqv1kQtPoDM2Ng0S0LCXFkP9UxoH1CqLDigt4+WOQsOOC/k7
	 MZzcDdkwc+Vkg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso5374688e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 02:18:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFvPL0BtOz8ZZmnRwubr6AUvYIwt4BpIp2mQFc09ThIhGQ7xD/XFTdVkGerwwpmgOURVwbI/4eK0CGn@vger.kernel.org
X-Gm-Message-State: APuU4Z+wf/vHYwO8YllLiKkDa2pj/xkYfouWfBvBJUgw01SZ91QlBEAv
	xQOOpIB504Nh7KDTdw8ifw2PYBxOuDj1gaHKg0DyJIcYG7719N2e+70ho7GvT5ycjYpHu90Gwg5
	KNNLQnnv1iCEZyVbF5veTcoCjV4a6jjk=
X-Received: by 2002:a05:6512:1322:b0:5c0:a57:2cc5 with SMTP id
 2adb3069b0e04-5c170746417mr4425379e87.3.1794910726036; Tue, 17 Nov 2026
 02:18:46 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
 <20261105-b4-gpiolib-free-v3-6-bb47ad58642d@gmail.com> <CAD++jLk+EfkLsHCyY+O6Om_xTEe2dJX+cscDLqW+TVM2f_V8qw@mail.gmail.com>
 <CAHp75Vf8dd7N-9QvciUQ7Wug_JY=Ru4_CGvhSpA+-icx3z64tw@mail.gmail.com>
In-Reply-To: <CAHp75Vf8dd7N-9QvciUQ7Wug_JY=Ru4_CGvhSpA+-icx3z64tw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:18:33 +0100
X-Gmail-Original-Message-ID: <CAD++jL=+O2yzQJsww7-cXah+PVKDHCkcTHMq8ivkD0Y-8A=GGw@mail.gmail.com>
X-Gm-Features: Aa3M54qw5HK-Mjc7JeNhdPC4ZsVhWbeohA8fFSEt3KlGLXmli9eahmWQPmYa2g0
Message-ID: <CAD++jL=+O2yzQJsww7-cXah+PVKDHCkcTHMq8ivkD0Y-8A=GGw@mail.gmail.com>
Subject: Re: [PATCH v3 6/8] gpiolib: avoid krealloc() in gpiod_get_array()
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 12:13=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Nov 6, 2026 at 3:56=E2=80=AFPM Linus Walleij <linusw@kernel.org> =
wrote:

> > > +       descs_size =3D struct_size(descs, desc, count);
> > > +       bitmap_size =3D BITS_TO_LONGS(max(gdev->ngpio, count));
> > > +       alloc_size =3D descs_size + struct_size(array_info, invert_ma=
sk, 3 * bitmap_size);
> >
> > Nitpick:
> > I know this is not your code, but if you respin try to add a comment
> > here explaining this 3 * bitmap_size.
>
> And the very next patch will remove that as it makes obvious what's
> going on. Since it's not a fix, I don't think we need such a
> short-live comment.

Ah you're right.

Yours,
Linus Walleij
