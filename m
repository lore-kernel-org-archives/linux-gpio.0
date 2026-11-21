Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294090;
	b=Fr+ltBai1jyPJJWvykwveLELThdjuqu0lMaGjRUoJM9SSU3BWloWwylGLlavmqBVJB/O
	 Kigwn4L6+QVK5sdq0V9Vf04ZQiCXlfpqBmjx6FsTT8PWDCQo6T+eBMrcaYtA2d51rBV8o
	 B1NYSNatvmY+4BDeDZxbSq5SFQok7iQdPpResJ6HgNPIjnD3G4GcQEmbK5l33hrUIAo8O
	 NxXA6M5mxjP49JZy0AhZWDBGdBTrY5H6O00eLP/t5Y1oGzrUsR7QgR9/rfokRGHtJnErq
	 PaaMqyvJnHGJsxH0AlIIowSY7IKDf4dh3Xkf12N4n0+3i2cm+7KLbryRdsqkp3CVHdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294090;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XK07TSWDWnxzG2qdvXTXdDgIKWsOp8T6FOtQiXhPIWc=;
	b=akTHgsuthja0g6G3GD9twIE7THW4qRw59SRRnxbbOri8EepsbLhl024S1toPbVwdAMx/
	 NpvLK7XwY5H1JtpiewfPswX+29jejFEU3xPwbBOPUzZxp6Hhiq9g6S1Su31ndbTjX05vc
	 eCiQhwL91dV2/Qgm5G9+VX6+6xtjr7SAnRpmG113ukyicomQvau5UEClx6Zs2+TzMnhpq
	 XF59XGskkfIGjMFlD5qMiZ0YAZe9OzUBb/0IxI/968xrSD1Aa/1XGmSX58YStrPaPT2Hl
	 Hhz9TpofPC3AF6PlbuDIrGx10TJLbva6ndnL6D6D7CxVs8DsoCHLe31mpW3a6ae2fuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3GZbcTm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F95606A331
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 20:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c3GZbcTm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF851F000E0
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294090;
	bh=XK07TSWDWnxzG2qdvXTXdDgIKWsOp8T6FOtQiXhPIWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=c3GZbcTml25n8rFAHKG6bq0uP/NEu45WnXFxPgsvRVuUAgBX/MndE/fX6SNIPo4/2
	 oHuMz9TQAcSP4LHPSa7BZyeidZX+R2Pio1NXT2vH2Kx7Fgq4cbTuhsHZ5B4yAIf5xw
	 WwmqsJdVyT9PQ97GSuNC8dx6TBHUQo3xXLRGw4pb/cwvqhZ43vpSQeuWoxFZQBzu56
	 aSoSknmG4ZUlJQ1/+I1Ihpi5U0qv8yMk9yPTSW5QGp+IunXyu8Sf5DNoC1TxXKGXZk
	 LOVJyjvd7a72fOQaNtUtcKXe7KHfd3uIPdNvXruMLhd4SOPlIdOz8Wrfq6Llq/yMhk
	 lv9ANN2Hx8Q1Q==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3ab30b3212aso15889571fa.0
        for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 12:48:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHUTNH1kHFpHA69U6aNvS8dWJJqi1KWsrzY7IvwmKe93kmgtfBaVllDa3fqqDdCOde5c8PB6wOGmby4@vger.kernel.org
X-Gm-Message-State: APuU4Z9U75NemtScmfzbBx229U7i5Wye7TGnSJFghGMCarOKgGMX9WIK
	7Uy2Rl7vIE0B5wYf7xOMjK8vY3h6PeXP5BFS65RH8lHrVs54dP0k5QpgGLaEg9652MfIN9DzgCm
	wWzIsicVkSEzwAB3DfbZuIr0sdkN0Gkc=
X-Received: by 2002:a05:6512:3f03:b0:5c1:ac35:a0bf with SMTP id
 2adb3069b0e04-5c1bc7d09d3mr1949194e87.19.1795294088796; Sat, 21 Nov 2026
 12:48:08 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com> <20261110-cv75-gpio-v14-14-e586aad0467a@ambarella.com>
In-Reply-To: <20261110-cv75-gpio-v14-14-e586aad0467a@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:47:55 +0100
X-Gmail-Original-Message-ID: <CAD++jL=JVvHgw-oDsy1mFess16RbbuincK3Db6PpX-_kD2rCjg@mail.gmail.com>
X-Gm-Features: Aa3M54qArBucxV2CiW08e6MHP50jl5g5xtF0lKEEvYNPO4RJA8CF8fUH7qfi4I8
Message-ID: <CAD++jL=JVvHgw-oDsy1mFess16RbbuincK3Db6PpX-_kD2rCjg@mail.gmail.com>
Subject: Re: [PATCH v14 14/14] gpio: pl061: use string_choices helpers for IRQ
 trigger logging
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	Mika Westerberg <westeri@kernel.org>, devicetree@vger.kernel.org, 
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 5:32=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Use str_high_low() and str_rising_falling() for the level and edge
> debug lines.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
