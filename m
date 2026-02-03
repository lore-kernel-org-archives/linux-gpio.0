Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C74F931ED8A
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 23:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770161687; cv=none; b=BIKL+xW9xg2wr5Eg3jlHuK+ZqscYUc44crOSTBp3E4K73ojJRqc5zDEuaxycQg7ZNiT9zN3LkX8PXu9CspqMA+U/3a1t0wUD3qaZonqfJwsMQ1ddGsFOkzfc9QeLBc4eMukLWCQ6ekJFg/lBpoqIwtngjRvB+damanUhvW1YwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770161687; c=relaxed/simple;
	bh=H3N6t3iT+lRw2Y3wcq0juSNfNc3ZLSsvKLjYx4BlJTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0tjgv81+ehHkYVKiIlBjzXqfO6L5RMn9Yx9Cz8mZZpPvNFMg/4nuGVVah8nkzHbz40VyJ2zXiijzaXwJYQQtNq/Yt8uJRA+acY89fnLhno23HkFQqEh/z7lYI/DNRFEHNZrr9TtZO3k3QXHmHk79QIHLmFYMFql17DtbSEViF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nqtchg46; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nqtchg46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC4EBC2BCAF
	for <linux-gpio@vger.kernel.org>; Tue,  3 Feb 2026 23:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770161687;
	bh=H3N6t3iT+lRw2Y3wcq0juSNfNc3ZLSsvKLjYx4BlJTM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nqtchg46hJV6r1bQFLQT7aBrl24yYiUpMB5HgW9eCGF1JT/AyvItPIfcJRJxTC4A5
	 C0CcRJov/r6C6UdEbHNQ+0GBUxZ/Kc99tCry5UO6nlDXm93PLJuMrp9ZRf1/0x2djE
	 Uz9k49tDAjcnFpbt4vytBBRSxC2xDZmqx1YopK8OfLlbl8Uvd5Q078y1oa5RFDwncv
	 Dt2ASczc/ILf0ZN6ez/txaG+HUebwqPiQcsiUZbriRUAQT8ePpOXFLIY7eb9HZ8HYJ
	 54ISvN7+WcYtIrd9jA/MU/1iPGmvL4IHhm4Dp721CEaVKZlP6QUKKrx7EKwsPwzZ7C
	 VyiMFb+TvNTKQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-78f89501423so3753647b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 03 Feb 2026 15:34:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8JvXrgq+sbwoz65stpzE3m1XYDl6O/DQh598iqygkHNGnDPPRzzaMIJ4zDEP0z5X+Xr5ruDYWlw62@vger.kernel.org
X-Gm-Message-State: AOJu0YxQg8aocHE6uk00aIeaFlyxDWhzwHm9bUfl41SQlxLdGLHjZGu3
	bzkZ/ohBint4MVZjXx6NaED/hzsc8LqLzS/4ZO6FIyhjJlNVXee5aU7vrNFA5q2JP6JL4ILkz0M
	cWpJyrpkApqxYRy6oEufvTCzTil+x49w=
X-Received: by 2002:a05:690e:dce:b0:649:ba22:58d0 with SMTP id
 956f58d0204a3-649dbec902amr1077376d50.29.1770161687019; Tue, 03 Feb 2026
 15:34:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203-craftsman-battered-3491ff68f462@spud>
In-Reply-To: <20260203-craftsman-battered-3491ff68f462@spud>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Feb 2026 00:34:36 +0100
X-Gmail-Original-Message-ID: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
X-Gm-Features: AZwV_Qi7lxnWnjXussICca0lyIFaqwLa7DfHaZmiOVa6EJi8C3uLkn3H5EkvZDE
Message-ID: <CAD++jLn8WOobPaoSrMLitFgFZc_6CH9BQbRy_Gdqq3BLhDXWQg@mail.gmail.com>
Subject: Re: [RFC] pinctrl: pinconf-generic: move ..dt_node_to_map_pinmux() to
 amlogic-am4 driver
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 3, 2026 at 5:17=E2=80=AFPM Conor Dooley <conor@kernel.org> wrot=
e:

> From: Conor Dooley <conor.dooley@microchip.com>
>
> pinconf_generic_dt_node_to_map_pinmux() is not actually a generic
> function, and really belongs in the amlogic-am4 driver. There are three
> reasons why.
(...)
> The other dt_node_to_map implementations accept a being called for
> either a node containing pin configuration properties or a node
> containing child nodes that each contain the configuration properties.
> IOW, they support the following two devicetree configurations:
>
> | cfg {
> |       label: group {
> |               pinmux =3D <asjhdasjhlajskd>;
> |               config-item1;
> |       };
> | };
>
> | label: cfg {
> |       group1 {
> |               pinmux =3D <dsjhlfka>;
> |               config-item2;
> |       };
> |       group2 {
> |               pinmux =3D <lsdjhaf>;
> |               config-item1;
> |       };
> | };
>
> pinconf_generic_dt_node_to_map_pinmux() only supports the latter.

This alone is a good reason to apply the patch.

I have a strong urge to apply this already for v7.0 despite its RFC state.

Anyone against?

Yours,
Linus Walleij
