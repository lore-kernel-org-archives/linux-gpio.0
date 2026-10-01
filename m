Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F095349C7
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 21:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790889235; cv=none; b=CLtGF8QV9o/77jJLPH+GWurOZZIX7v5Ypat7/fSsSoA19VT7VkUNzNQgve/Zp74+2wTJd5haMYaIdOT2CRZf34azHW/eohjUH0ynoog8yHxJ2F7xLDwAJ7WfvwSVDIuz+o9mzhqE9gGdAKHXhbuQfuSG6NmgZYa1VZmrLtrjok8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790889235; c=relaxed/simple;
	bh=XyDDvvco+d3mYshhwaSSq4pDGDpCB4IF/PEVe4NawGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQMykeyIZC5ZYu579gUT9Eb4kDUE3bijjUhxLQQiQ8RyWMjE08dT03i8Vqkj3fpx0u6IYfmIjh7MLJUzX62WfVhnxgdohVMMDCfKUv2ITFWkFvaP7J3XPAwL0WDYIdsZXuBOFGEI8u+bEctD6RAlGXcHVGdFKYxIkEqDlF1he6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJmeh5ks; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJmeh5ks"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 795861F0089C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 21:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790889233;
	bh=XyDDvvco+d3mYshhwaSSq4pDGDpCB4IF/PEVe4NawGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=VJmeh5ksyazvF5b+uHiFuo+Fkk6I2oEkomFcTpQ21cV7s7Ezpvo2WgVusFoCZgkcq
	 0zMsaKO6LO+hSz4EJ60U7PJejykfqbW755h946vLBB6L1w5baFM7MtYHfbgXR7s7Ic
	 DsNON4VsPVifglKVHnHekmWa1Hm32i3mwLRJlEo78moodMhXS9K15e8KCLX2R2eaL5
	 jWWTgRAFbdVHjAHmKmJTCU1aazlhC3iWjD8Ovh+PKsZrpknhpTuTwmQ2Z32CUkGIz4
	 26chOz/4enh/ta858jhMXP5Fok4BYwf53CDVQErWoh0nbDdETeMLinDeFNGQMOQnmo
	 XDskNRObVbmtw==
Received: by mail-lr2-f35.google.com with SMTP id 38308e7fff4ca-3a7756096e7so23888231fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 14:13:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzRG8OunjHlTxsQb6IDXy01AxAH5nA1+rx+kM64EF2R9aN1eX1Ym8QmnjE6bY7+AvJcza0Agwj7Ou1x@vger.kernel.org
X-Gm-Message-State: AFq9FYIgoVXKTExCxnTGAxU2ow0xaBg1tgU+39DUfAPtu1PCsn7TfMRG
	ZThe7zNzK0f4IrC+iIRlr6MN2+0QAHxKALPBHerjPeJ7cMVI9WaA1Kns+I0mxwOcP8pg0ZwRddR
	/7cjIIYQO7uZU32ZqY3uDUFF2WAo1UOA=
X-Received: by 2002:a05:651c:210e:b0:3a6:32a5:efa0 with SMTP id
 38308e7fff4ca-3a8877c5ae7mr1272461fa.22.1790889232244; Thu, 01 Oct 2026
 14:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
In-Reply-To: <20260926-apple-pinctrl-t8140-v2-0-620bd11cd2a1@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 23:13:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLm1tFh073xxPx2WzidABvP_fRY0Bhf8DkO64W6VBQ8UYw@mail.gmail.com>
X-Gm-Features: AclHuK_bJIEK2xjDLFUNw_m3k1RB-KhI2mP3RWR1EocLD8uDhL9bs84JVwEtVgI
Message-ID: <CAD++jLm1tFh073xxPx2WzidABvP_fRY0Bhf8DkO64W6VBQ8UYw@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pinctrl: apple: Add t8140-pinctrl support
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 26, 2026 at 4:52=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> This patch series has fixes for probing the pinctrl_ap GPIO controller
> on the MacBook Neo. The previous code would crash in the regmap_init on
> this device, since reading the REG_GPIOx for certain pins causes an
> SError.
> To mitigate this, we adapt the gpio-reserved-ranges property to describe
> pins which are unusable and whose REG_GPIOx should not be accessed.
>
> Also add the new t8140 base compatible to the dt-bindings, signifying
> the different behavior of the t8140 pinctrl_ap device, and make the
> driver accept it since it now respects the gpio-reserved-ranges property.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Patches applied!

Yours,
Linus Walleij
