Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793798779;
	b=bTgxGFXceo6cK+7ih1bYha0ZfOtbAbwpM+IgytKyB/CjGZD9vD/uHgHNJtpzCSO4pWd7
	 AO2HlENyaQA0sTNvh7OopoS0NqFzkf7mXlPXpdaamgWaHKIM2y0Wik1WOFij+xYB9bRgy
	 vBOfG5bXDizq9AivoXp9QztwbSm8LcwssnISAKXmPvWYtSTbp2j0Da6+XSj1rYdyXIBuN
	 gKzFOV1WArH6GGxqmyTeSte4Ukrmk9ONaZ8OyXnl5Rm3huwbR6hhVO0jNp8uKCq1UEgfN
	 WowODzVEIJXwm35AIWqtOl/968SyTEfYkcww+49/gN9hW6T2U60Xei6zS10e+/ssdrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793798779;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=TP+uy8U+BoHk6m91wbN8oDBqNKswR9Rez4P1JHA2FlE=;
	b=FcHaZEMFm+aZ5ovZ/tVQXU9VkjUWMwtZi+7Ltm2Cbm77mQEfnlgeeVjUL6bkcQw84TKq
	 iGcdUUHHtFLBTqbHLLjG7ANEB2ZAsGa50xtmGN77gD93P2RHuTP+HS9P65k8VdQH2EjVv
	 wb/w0wyCpyfy4DiEciS0FXGQ6bxYh1aEAihUfEhtHiq8MMWMPVEL/Z9H6tmJ9EhTCf2j5
	 /K2tADmaVFZ6p0GQyLH9L35gmeHuaATQFrnqQDPI3z5AjH0Nugd79Qqu+26uD6qeDNvm7
	 iXg6pngxtzFxHqaiQKZRThPrKN0cS35Yn9zcKnw4tkvSC6a1O3FfaKCoubn2woNcKaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXKUXtV+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E05606A328
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MXKUXtV+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95CA21F00A15
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793798778;
	bh=TP+uy8U+BoHk6m91wbN8oDBqNKswR9Rez4P1JHA2FlE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MXKUXtV+2kBALAGhXjlScCQ7lz12DrKspvJFN4o0JSebDs3WhkLqjSO6R4I5Xn8Md
	 aTvkYUcBklFsUF9tL5HjPVhynLtMaNDp4xDmIPC1djTftgpqevJOx5Igz5XdHl5ry2
	 /RYB2a/2OcAmBxQwC3B69yhB68l6dgzBjC0xLv+pRkTNCx90rUNTIqa9PVXz14xIDJ
	 YfYPimPNAJl/xG8COmq4aqEW7DDjJ2YHrDpJWxxZkjUZ57lghXX0YZhMEsOG5rt25F
	 TCUj10k+WpidXyjNIrgcFLPn6nrFqlHtYhAv46HGkVuki2Zw7ZN/7l0R5aW1KYEM0v
	 tB67QcxWKLqXQ==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be416e603cso426011e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:26:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzFjrrwc4JX8caHJmI0a2FcZz4jvKGpQPBR9vvECwbam4sLZHHfNQLMalWFcenpDTC3Z4yB9izxTNR2@vger.kernel.org
X-Gm-Message-State: APuU4Z/THSjtzkazr1SxwDCz34XW63/+hoWzeN78J6jUUGFGdqYtopDy
	veAWWP2kXjK3+SfuDdXGfEruLCsYo35qxOv+Ka/YR6GIXFRc59SckwTN4LuXEXVvwYEzg/UJnIh
	SV8+J2c7aMD3N89Vi9gBh0wRAfoPfOAE=
X-Received: by 2002:ac2:4e11:0:b0:5bf:b952:e57f with SMTP id
 2adb3069b0e04-5bfd9576f92mr5749815e87.59.1793798777361; Wed, 04 Nov 2026
 05:26:17 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023115652.700765-1-ansuelsmth@gmail.com> <20261023115652.700765-2-ansuelsmth@gmail.com>
In-Reply-To: <20261023115652.700765-2-ansuelsmth@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:26:03 +0100
X-Gmail-Original-Message-ID: <CAD++jLmZHskQet0TtY=zp993B-z2bnQubCHXsMNk6d-AUZbUEA@mail.gmail.com>
X-Gm-Features: AclHuK92QR6RS6JYlLXEO0knuwKdn91VeGZ-EOJ44t8yL3U3eoA4ndZiquqIhz8
Message-ID: <CAD++jLmZHskQet0TtY=zp993B-z2bnQubCHXsMNk6d-AUZbUEA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: 74x164: add support for 74lv164 shift register variant
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 1:57=E2=80=AFPM Christian Marangi <ansuelsmth@gmail=
.com> wrote:

> Add compatible and spi define to support 74lv164 shift register variant.
> These work the same way as the 59x chip family with the only difference o=
f
> not having a "storage" feature by directly changing the outputs as bits a=
re
> shifted in without having to toggle extra pins.
>
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
