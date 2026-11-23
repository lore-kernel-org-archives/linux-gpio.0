Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421128;
	b=jB51mqNvJUW7Bu9813RI5HIqEuE05L7/wdh0Rf5HMuz0tzQFMSM0RGER6B4KTqlCpI9L
	 cqAKRox9i6+FGtIF2ifEKYAIZPZnmaPbYBzceCgigs6jP39FZPOoUYe138KQ/m3mYHCs2
	 OPhafo7iSi34Q35j7Yd5fQDybZplT3kRW1XzfVF8Fn1rmjHvHTLv5NqhWUlSqsis0aYDn
	 brH9asR5ptq2S9PNDuEOHqfDFAgsfiAUDzwDW09bpw3PaToRIXqZYQi6Rxlv9q6vYmViW
	 Iyv8UG+XdJS9HtSOw3D+5DDE4qYr/t7PYWU7SeV2mB1PQlu9hbPBYmrolZJd4JMOJvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421128;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=twrxjfkIjpHysePIox8EoY+a4mTY5HZBuzREdgZ4c4k=;
	b=O9yqPWy8nCol/+f45krN41qttfQnkwT0aD40jQpWW/roOSZ0a7Dt2gCXh7jHeuEK3JQp
	 zQUHJMLvJy4lURWjay83dYJaIdAvr+EwuG17cGl3C/H+JFgxJJbpnjjqguCCR4RjTzzx7
	 0DDChy3XWpIEOtMCZ3TOXrG2bfFJ01y442dDgrGaA+C48ZZl145NM5dle6NtKUVhecdQD
	 1uAu93j+5OPwGvqP0eaRa4oDKyxfh/nHvneIoBCHpCT4RVO7EVbO2KQZzbvhbRwaAa7+t
	 eeHzxiTFDVi4ykeig+8dL6xeUhzCQ6H1mUMti3O/Kx0bJl0cd25QPDTx2tzWDO69eAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4BM2MtX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD109606F626
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 08:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q4BM2MtX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AC581F000D1
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 08:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795421128;
	bh=twrxjfkIjpHysePIox8EoY+a4mTY5HZBuzREdgZ4c4k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q4BM2MtX4N41I7AjB0viwchCUFmXmEQbYJ6K5yH9c1hk06TOaDGke9c+9jSk69MXK
	 23hBtcz3HcpqVJqsXQhBAfyTPI6oSGP3PEVTrV4ObYDJ+DZrvkxw1fncBCJS7CZe6P
	 QGUN+W9ifC+VHNlHSTbXrDIiufhH5wWFH5Ky2fU9f1eJwnnO7PUbBSFOz1+IQccxIy
	 OKVoAcNSivdZCtf9+7MSDgZ3M+y7f5eaaIW3jVw5oTklX/IoOL0P8cRDbmhOJDgFds
	 I+079TKuUpMo9CzhPtR9zc+KAqJzYFGQvrzaz/cF0aYAk4EbtazPOHntzNGqDYqkDb
	 V9vnMo2kg7ldw==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be4a2d94adso2616411e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 00:05:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH5cqWi6D5UPnwNMNQ3tbF1/7fg5K12uEGMj3UIVifYcXNZLbOv4OwsgZRvWd+0rZx80Pg3X35CsIDB@vger.kernel.org
X-Gm-Message-State: APuU4Z/B+PRHtgfREZaILeqId9uRaEDSlrhn6ebMHo2P1icMP5XNYCPL
	tVweoA0HH4UFOTbgoO8P+g5TcO520OGnoB/3T0idWv+q+eM+ZwFMJHdvPNlhuzyV7QAI5ZIRtWS
	4Ti9rcr8eG5tREP2XJXY0t7tFzFiDoAM=
X-Received: by 2002:a05:6512:33ca:b0:5c1:520f:728a with SMTP id
 2adb3069b0e04-5c1bc80af8bmr2732246e87.38.1795421127123; Mon, 23 Nov 2026
 00:05:27 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123004501.1771603-1-rdunlap@infradead.org>
In-Reply-To: <20261123004501.1771603-1-rdunlap@infradead.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Nov 2026 09:05:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLk2fZyDwTgc_ZpHSyd+M2oxpB8qT_nXS7wkE45D7Pbsew@mail.gmail.com>
X-Gm-Features: Aa3M54oj6YBbA9XFup0ctnJJbEySVwx8-0ciWrikSUzYcfK9CqN6GvfxpDvMdTw
Message-ID: <CAD++jLk2fZyDwTgc_ZpHSyd+M2oxpB8qT_nXS7wkE45D7Pbsew@mail.gmail.com>
Subject: Re: [PATCH v2] chardev: GPIO common access methods: repair
 non-kernel-doc comment
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 1:45=E2=80=AFAM Randy Dunlap <rdunlap@infradead.org=
> wrote:

> Change a "/**" non-kernel-doc comment to a plain C comment "/*"
> to avoid 21 warnings like these:
>
> Warning: ./include/linux/nsc_gpio.h:2 Cannot find identifier on line:
>    nsc_gpio.c
> Warning: ./include/linux/nsc_gpio.h:4 Cannot find identifier on line:
>    National Semiconductor GPIO common access methods.
> Warning: ./include/linux/nsc_gpio.h:6 Cannot find identifier on line:
>    struct nsc_gpio_ops abstracts the low-level access
>
> Fixes: fe3a168a2ce1 ("[PATCH] chardev: GPIO for SCx200 & PC-8736x: add gp=
io-ops vtable")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Acked-by: Jim Cromie <jim.cromie@gmail.com>

For the patch:
Acked-by: Linus Walleij <linusw@kernel.org>

For this stuff's existance:

$ git grep 'nsc_gpio\.h'
drivers/char/nsc_gpio.c:#include <linux/nsc_gpio.h>
drivers/char/pc8736x_gpio.c:#include <linux/nsc_gpio.h>
drivers/char/scx200_gpio.c:#include <linux/nsc_gpio.h>
drivers/leds/leds-net48xx.c:#include <linux/nsc_gpio.h>

Blaeh, we need to get this "necessarily different" stuff in line.

I'm not blaming anyone because it may very well predate gpiolib,
what could they do.

I'll analyze.

Yours,
Linus Walleij
