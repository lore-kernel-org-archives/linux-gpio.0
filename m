Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180838;
	b=wLQs6mikOU1MSBLu+pkLKcMqrGqrDKES4cue4A87Bsjqrs2D4Nai/IyigpO2Rf6seU24
	 b6ATZK+9kUIc5mOVAuzVH4qSIk+UiaVDhZi/VLVBIBDuiKV6jjy3YOz5/XTIM2ZqTqa0B
	 sB9M1i0/EPYPQtXwPaRwkW441iQc1xKmF1kJ+8B70M4UaAVlS0ByO/4H1o/3fiMPFTvjU
	 sSpNAs9eaFexqvFAsB8TrUd3qN6jRrTUKnCZP0H1AMR6GDamQBUGPM39Y/EYu6KYfbOVp
	 +hvbd3lbUNHDRUJHC2cgEN+xXMxPo1+31SPi2cgiUQHcazdqNvCRGRZbEjCekBwYZ6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180838;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 Received:Received:From:In-Reply-To:MIME-Version:References:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=WusbLHVsIxfQC7Yt912VgHXMTR66ioRkw44xspu0Cqw=;
	b=i8EIfltnm0Q82edjq9dicDBzNLaaJrETn4DZfTL3FkYUGay7AOLhPEgJ3tfrbg3pLQAw
	 afWm5FANrnN8jqPwEdw77lOFe9d3/VbcUWUSnoyp9HePMsIxW2ds0Cq6mjDUuiLe4qPJs
	 B3vosCffRdLQLOMflXlNakGlXFEZX15HS0zVsigaEoLu35SuHCvTPkfP8PwAI3bQ4Jf7O
	 DYATUjpz4VoXgmIUXcHiqZYeZkm86shjFualZNJGwrqOw5Nvs+O2QTVIZvlttk9qL70AM
	 0gub7pfwzMPtEFQT/AKpSN3T/ufo4BF6AT1iNGNmnzwBIwWI/NQujyTz2g1M9c1UVog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="EaQ/uJCb";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42B85606A320
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EaQ/uJCb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E29E61F031EA
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 09:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793180836;
	bh=WusbLHVsIxfQC7Yt912VgHXMTR66ioRkw44xspu0Cqw=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=EaQ/uJCbnWPXlHtr5OchiT406Hq3ckTH12cvHcaO0eg76LUu6zZYqp2I+ZblwuK4G
	 2y9GB87LiAGcjLyDz+TAXxojKPvNn5cDnX7AX2KtBg/52nk5plIi3MZbZSNZaqzdgl
	 hwDgZtycuoKdchx4iyzhEccJvEpOXakE/BG6yAH/P160raDXwi35gICZofQ12jklux
	 DvT3GhUW2o4PI8rImduLewy47S8RuBZJRK2O9JWLVli3KMV1c+64q9bhsc0pP0NxSs
	 S2SL6kIjUXCPkKwg6yLinabNr0PR4vgOsQ/eyT/5tVkecqDyEe559M1V/3/3l2W8PD
	 IOZ3Lk20BwfNQ==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab39af88aeso6242831fa.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 02:47:16 -0700 (PDT)
X-Gm-Message-State: AFq9FYJhIWSwHBu9ShlR5w3sfkEaP01bqOhOn2dauoOASsD41MJKZZWn
	CFK5ArFW+QJx+d/JAzcw0aaDzXv/JZZQNJ89xJdaZPsTVBGoGOiQ9A65vkndV1CanG/UC6rXg1p
	LyWKsQHd1dOVUVOCjRo15osuxW5QRG6I3Dwu0mxTZww==
X-Received: by 2002:a05:651c:210e:b0:3a7:69bd:80ad with SMTP id
 38308e7fff4ca-3ac9cf74f2bmr4236611fa.6.1793180835578; Wed, 28 Oct 2026
 02:47:15 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:47:13 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 28 Oct 2026 02:47:13 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792776697.git.geert+renesas@glider.be> <528b079a19bd4043754bfb56db8e5950bdda62f6.1792776697.git.geert+renesas@glider.be>
Date: Wed, 28 Oct 2026 02:47:13 -0700
X-Gmail-Original-Message-ID: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
X-Gm-Features: AclHuK_iGosVAQO6GwGuzhCeB4_YYSDAdlMHAhkY-OLVFYNCMrxDS4lJ3KzFIGQ
Message-ID: <CAMRc=MdH37DhKMtagN3Ua1doY7ZgD3f+ok3V+h86kb4J8-dtQQ@mail.gmail.com>
Subject: Re: [PATCH 1/7] gpio: rcar: Convert to gpiochip_generic_{request,free}()
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Oct 2026 19:50:39 +0200, Geert Uytterhoeven
<geert+renesas@glider.be> said:
> When a gpio device node has no gpio-ranges property,
> pinctrl_gpio_request() returns -EPROBE_DEFER and its GPIOs are unusable.
>
> Restore the ability to use GPIOs before pin control support is added by
> using the gpiolib helpers instead, which cater for this use case.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

This sound like a fix? Can you add the Fixes tag? Is this patch independent
from the rest?

Bart
