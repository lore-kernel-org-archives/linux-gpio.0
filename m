Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910142;
	b=nmgq8zjncGW0HPhNKL1m6oPFeZqBVf7di1eDj0eTGGogiwQqrKAESQlGwMzzWp05POwJ
	 drpUFg9QmbCC1iYBQqKBlw1FX6zhu0gurF1P3fFJq2/B5kuKhTLvljP24J3ZdG853iX+5
	 f7kr2hqjZrOJMbDp/v7BMuw4X1ubmBU64lW3ZKgqUElMqZEpai2hbIYmdMO5LsTz0VLYb
	 C/DZ9amsFsi6Bt+j19bRlmHWWC0Wz0MiSRY+EA4kQYboBbnc9QW1nfqodt8agLP5TtLdt
	 rUdDifS7DldtePap2qRcVBNG1BU9vxGsvAZjEUQScH2GFNLa3UvbMJiHMbAYTdWf3rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910142;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IBXcaC8CSaPOK5lnAix38sTVGCSr2JvQQd/TlL9JIsI=;
	b=TQwJuk5L3ho3xM2Az3Y6UOkw5rsS98ufPCjXRpS3HFqeDVCag0V+Z04ZpiLbwkdoDqZY
	 vWEHrvDViFmcHJO+WQud0pAwClf4+yETkwTCRPgFyfbtfs6VbQoUplTQAnFNzUFupMtrp
	 XuZj20QMAfe2y+ljhXIjwpDLKjQKZbkMVDMyJ7ev1J1td686lVkH/vzbz/+LD901hnsWL
	 4hv1R/FR1dxZZf2jfLyHaQnUHYHveVtPMQ/c/nJ8NTddEIL7xOvlNthp7gKB0h3A51yS7
	 /5GQ9NVibkq2yS04CyYZjB9II3bGD1z9lvJ0NfWu3RbriLCLpFZMV+ihIcjt9ifPeKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrx50Fuq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA6606A329
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lrx50Fuq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 356501F000CC
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910142;
	bh=IBXcaC8CSaPOK5lnAix38sTVGCSr2JvQQd/TlL9JIsI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lrx50FuqQGh4txTkICtA6Ioiy/BxsxtmjN64WUmmTlZp8qY3UcAm7Mpajsk0zqCIN
	 TNRZYb01+1QWyWwvxhktijZ39MFFEUpsjlTdKItv7OpwhaRlmvJKTeFKKcAIkWDkjx
	 e39jk8iDzjegeWOI9/rcfNZZthafEbpLb55qPMiZtv4+f6WitZv4AM839i63yGhUWU
	 LRFPWY6/HY68PfQ/1f+6SCRuLmhsYVSIAgAH214ZMy9j9fuGnDF5rwYsDG9NLBeTsb
	 TFJzdMEoTpAqrQATdcpFhHl/qGdcTqxh8ftKv2ke4eX8UPehtjLJMMDnYtozvA73vF
	 EEW6KKVHklhJQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae0eb56ba1so44564631fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 02:09:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHbffOU2YDdcEoOMufMHk+1wqjMCUwM7ShcAI9NTgV6rdZtl/zNU4AKKbchvB7Z5jTVekWu2vqUlb1e@vger.kernel.org
X-Gm-Message-State: APuU4Z+g3X4UTKix8XwgBe7JTChsn8jg1CLkHrn9NCHMovViT7c26dFK
	uMbWUzpZ+XvAMrAi0vunOtxlcIHu+NmYIkND5MINZUDKB1m9c8w1ZjYXtNGenRaYKL3DTMuCKp0
	3VJg/VWjU3qMbuRYAcsN+0Vhqpyo0nkU=
X-Received: by 2002:a05:6512:2305:b0:5c1:4e18:39ca with SMTP id
 2adb3069b0e04-5c17079ba12mr4824318e87.21.1794910140837; Tue, 17 Nov 2026
 02:09:00 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-6-cee55de54b2f@cyberchaos.dev>
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-6-cee55de54b2f@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:08:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLmXOhfBJGmPa21id+XOafL8+XOJDygxkH6Pu5zxXq9MEA@mail.gmail.com>
X-Gm-Features: Aa3M54oHRchG8imGAtTdXZeU9Swv9RX1BbEKTTONGE2twBx83aIIvKlEdxp-34c
Message-ID: <CAD++jLmXOhfBJGmPa21id+XOafL8+XOJDygxkH6Pu5zxXq9MEA@mail.gmail.com>
Subject: Re: [PATCH v3 6/9] dt-bindings: pinctrl: apple,pinctrl: Add t8142 compatible
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:24=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> The pin controller on the Apple Silicon T8142 (M5) SoCs is compatible
> with t8140. Add "apple,t8142-pinctrl" as SoC specific compatible under
> "apple,t8140-pinctrl".
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

This patch 6/9 applied to the pinctrl tree.

Yours,
Linus Walleij
