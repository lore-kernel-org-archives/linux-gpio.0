Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C1A368D6F
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:04:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691084; cv=none; b=b57WeNsizQM9wqOi1SJvz1vWceV5XprygJ7ZiITDOvP+Ou6UqWrIXqKXGx0oEbudjeXJEskiMtjY4oihkiQOIw3cHzV0T75vwjGlsJL7gzGlE3SoLr6lf6ukRcJjyEER6x2WK3xXI9Ihr7v01xVlWtvV/TIZY935YLn83ixrKr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691084; c=relaxed/simple;
	bh=Y2VJrY3RFv2U33BwPhZZW8GLXn+4w2Ql/us9Potp1T8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G0xY9TiOqAm9Gi6b0aKlt7QTzn6I1hdMrik/6dYh0WLv/dM7EkB7rZXxePyu3BCzGDyBHYgNpqv8h/GNO9wLJ4qZv/oUA5Jq1n/V7zxXqu7jObWMidEBpQBt/42RFgb0l7tA2O9eob4UIfjvc43606PDwq3yxNeoriB6WRoX3KU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jyh7WWYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jyh7WWYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F5C51F00ACA
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786691081;
	bh=Y2VJrY3RFv2U33BwPhZZW8GLXn+4w2Ql/us9Potp1T8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jyh7WWYzK1VaPlKD9QtfVVvGFyGCgMb2fbtE3Xs5yfl2ywzlb1jpTGxPoQZhEWHA7
	 dFJv13QY7DD7u4trIHCTyaEuQcs8I/GcqAzorP9azDBQOJ+rd1FNZEk57WR/RyrcJf
	 rkmOEnjIijCL2NaT72MupEVXn+9NSJGTW5Oq3Dj8nOOcgQ8dTM28FTrnGOkWvMdvrW
	 W2V6ehGR7IgkPRsZJ2ZOp9P/Y5RkPR9HuUCX/ef6V9mkBTaT9frf4pLqNz4rz0WPtZ
	 JI++AP3mZKqMtii7gLZxXsMJxlEiELn/Bm12iDO6uU29C9STr5DfM5qp/l7bXxOJBU
	 JgdDSwG8MgH4A==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b021916bd3so857629e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:04:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoUtAeUIQjGckP0w8HXXu68a5Brc54CkLI1hHquSadz4aDNk07xUZZfnnCQpVwumoLz9dYitcHmAAqg@vger.kernel.org
X-Gm-Message-State: AOJu0YwXnieWGNWu1sP7RSSmxaFgUEF2o1LwaFwkeNbkkHC8ek2CBzQM
	m9OMoazMp8Vdqx3w/gCu8uNpJfYcKppolcTGJmofFiSsmgH5u5TgPhJACS5kWPl2Nmx5x42s+kq
	2QG2jsIZIeFOIS/2+3Mp+kgIPr9X4ZLU=
X-Received: by 2002:a05:6512:8352:b0:5b0:1760:fabe with SMTP id
 2adb3069b0e04-5b45910e499mr328817e87.15.1786691080146; Fri, 14 Aug 2026
 00:04:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-ad7768-driver-v3-0-cb554399ad26@analog.com> <20260813-ad7768-driver-v3-11-cb554399ad26@analog.com>
In-Reply-To: <20260813-ad7768-driver-v3-11-cb554399ad26@analog.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:04:25 +0200
X-Gmail-Original-Message-ID: <CAD++jLn4pOXp1cbU8oUeVw5SRET2bwXJjhsaiostLcSL9frcHg@mail.gmail.com>
X-Gm-Features: AcwNN1WxzH5fNxAN8KNuQfV0d8lfN1xSE3LZbBRL4UZtQT6d5QomeqXC720WWZw
Message-ID: <CAD++jLn4pOXp1cbU8oUeVw5SRET2bwXJjhsaiostLcSL9frcHg@mail.gmail.com>
Subject: Re: [PATCH v3 11/14] gpio: regmap: Use regmap_test_bits() for single
 bit reads
To: Janani Sunil <janani.sunil@analog.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Michael Walle <mwalle@kernel.org>, linux@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	jananisunil.dev@gmail.com, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 3:58=E2=80=AFPM Janani Sunil <janani.sunil@analog.c=
om> wrote:

> Use regmap_test_bits() when reading a single GPIO value from a normal
> register and when reading the direction bit.
>
> Signed-off-by: Janani Sunil <janani.sunil@analog.com>

Looks good:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Do you even strictly depend on this?

To me it looks like a patch Bartosz could just merge orthogonally
to the GPIO tree.

Yours,
Linus Walleij
