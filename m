Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795514201;
	b=j18kDEmGsPUGOUZ6aSZJPXeJS3bg7LCoEi1GbVfKMKtIVWv78dK7Ge2l4ZlmVoI5ClOi
	 t4CJ08GPlhVk90n+sBzd/2LY0wd9T0rRvViXVCe0Q4PnhCxcTcxhaSXHZ9emm109MpEeP
	 82AmJbMKbc822EVQZFlymsNlwmdGuctZYX4NWT76hh1ZgPtqMbajE1WHScbO1cYrZLVyV
	 bV2tyxUy0w6oxkEUNfX55/UuJsgHBOGboSF46jen8gN0qqEqOz+xOD/BFJ+hOr9en6S1x
	 dQsyxjwACC+BIAqjw1duxIQ+6KIVb3jCetg9p23tVTEhvjW/pgsC8xJ0HmGX4FBjHIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795514201;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	b=20vYX54OvHkDwSqOSe3apW9BGb6Ebm8xUmpAbNXJlZSTdqVSZcOjUpsenii5fYLj9OhA
	 pZyDrUCdTLhCpko911FORF2dCn2T5OlPpwxb0M5R+gH8d90DXBWZu0YF//JJDcxTJN6R0
	 La/N6+6p5sOg1NNkRqJ3I017eJy8b6ISH5+7649Jyxmaecye1S9wzJpg3tOpZOSBeV7ht
	 ie5HmSGzUiGF4BfQP7SXA9VCxDqKFYuhFpLREchWLCdouD8tAOpbx5POHOjvJF5ZmeRsx
	 kFAevDASDzO0PRFIgacnwBf1r2FFRl7o0LOBWiP7US+YxnwcBn074YaXFgMWGC+ekYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED34A606A321
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lf2VEmI1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A6951F000D3
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795514200;
	bh=6RxDNhcrptkLwm5icpyITA1cARO1T74TvXZeN92Qajg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lf2VEmI12JFLEgUGjVFCTv0QjW3DzCel4nyHoZURtSOyTH4f6ATQ1F9160ju0vvcJ
	 1PxA6UlQXZt13PWLF8DKe4G2fyNtZEfkNquipMkfq4cB4Vyyt9Vb8QLIjeBylBY68V
	 8fkdXxi2Q/3e9CgZNUHA8x8SIhVN3xZ7Go/+IbWqCEQoBiEztDO1QPeqv+6bOeCBfl
	 eGtwiPdREEoZEEaGpzvmpTVcOtD31t91A/v5X3KXjPTtvGx+yrS5sJKsvgO+GX4oTb
	 OlIqX7l7+ISlIVFgCxMWp9ns6b0uSX94naPiT/WMszXh8HjzkH/+81WGhZ75t3GckW
	 FxW2yjPsT6HCA==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c10dc41270so4644759e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 01:56:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHT8uuPy5p5RyzxW3xJ6mYTejeyHwEuLlLBPGWhI5l1g2JH6VLd3qGBrF3eeKyV2QMkGK2ER1w1zc8u@vger.kernel.org
X-Gm-Message-State: APuU4Z90VNMNrgM09Ia515Qap9trDyhLYaUfmbACClMQruYScQQ7EpnQ
	K/GKyHaWqulDEhR90mYCa/Ple1V13DbDyGFfVVHVVGIeCK4EF2EpqzDMvBaN/SSROsAVRUcrnJh
	QEZqtzCzlR3PF6Ekz2xZ1q+g32bXZaNg=
X-Received: by 2002:a05:6512:1048:b0:5bf:6c4c:62ce with SMTP id
 2adb3069b0e04-5c1bc81c49bmr3664194e87.55.1795514199208; Tue, 24 Nov 2026
 01:56:39 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-cs7542-syscon-v2-0-1cd74b2522f9@gmail.com> <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
In-Reply-To: <20261123-cs7542-syscon-v2-4-1cd74b2522f9@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 24 Nov 2026 10:56:26 +0100
X-Gmail-Original-Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
X-Gm-Features: Aa3M54pJBPNtS8HBHNO_8ov-NITzhFzIUmDM0dw5V6Dl7sMdZPPnTtRSJZShNYc
Message-ID: <CAD++jL=jLDF1mRBp9mai7hFKU21SG8ud-Wf5ebS89BHiUWM9sg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] pinctrl: Add Cortina Systems CS7542 pin multiplexer
To: filipp.dunsky@gmail.com
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 9:27=E2=80=AFPM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Use the global syscon regmap for the five GPIO mux registers. Each
> bit selects GPIO when set and a peripheral signal when clear. Support
> GPIO on all 160 lines and the six UART pins exercised by the OpenWrt
> port. Do not guess mux settings for the other peripherals.
>
> Use masked regmap updates so independent pins and users of the shared
> block retain their settings. No register changes are made merely by
> probing; only a selected state or a GPIO request changes a pin.
> Register and initialize the controller before enabling its own hogs.
>
> AI assistance: Codex prepared this change from the existing OpenWrt port
> and GPL vendor sources.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

This looks good to me:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
