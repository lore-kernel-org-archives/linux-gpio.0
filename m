Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800180;
	b=fstoWgbncSqczjXI6ET0aHWreXl5JtWe0G43o/6lBuoFei9FA3De9oPdI0M0gH5lpHan
	 eBYQZvKttz/1ERROOvVORkYgSFWxa9Q/ZBeBp6rBlgoU1kTyYE71VfXfauF+ieeNtwSec
	 TfGR9AbdPxQ8DCoaFk9AdtQPu6wCWMtAQBJHDYl8A5zzK6A5t5qtGtkSGJyuhGRqSz3Ep
	 DdMkgGXglLXVIBPK0RGKF6V8sdi7MnlSAb+0hAhgL/sA/1Ana8uBJKjrgSY3mRl5BvX89
	 VCaz0xTQ14EQZQXFMM+pOrGIssnKIIJlcBEIgAD4tgNabr4X7T0oumbV0iMRo94/qEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800180;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=xh/GEp2c7zYgIWG8y5Hydozqk2C8+o7JeISPlaQEupY=;
	b=JV8Wm1fy7xB2+NTFPtHJZ7VdNVzBhuUyw80li5x3QzYmmoSM3pO5MWSjoUCe0kmnhXo1
	 17aXzVGtyEPIGvrLiJZgneP192zTRT0wPPdYRQVRbyG58OAgvqhGSD+IudnlQFLzn3sWq
	 d+3ff3auoON5poEgG9pPbk8raxDIapiGpmJAgmA/yrz0J2i+KW2loHc/sOW0sMMEq8TJK
	 CJ+EDeZVPrm3VxI17nld9aJ0mqpmqHgd+cJ3ATKkIw4BqqWRY0IAXDzhTZyvqznzvOJ6O
	 JNNwIVaW4NMYmOlMWCjJp6MuxiPjn+F6Uhgr+LuB5MlEvtDRy8xUfs4h+juqIZI82/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ax2k85fQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBF9606A326
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ax2k85fQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A841F00A1D
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793800174;
	bh=xh/GEp2c7zYgIWG8y5Hydozqk2C8+o7JeISPlaQEupY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ax2k85fQ/GPwwFEnF0c2ksgEYkv2siBK4xaOdobJMhC1SQoOgtEquppNpz9om+WPJ
	 2HighJ8Ah8IddaDfAvxhiJWT039TtBrMWFg/kKOa6Quzg7FmNht3VSVTFuuj9wuMYW
	 UPIe8W7UFsH8Vuh5Ma5Ve0PKuL6e/7Kk4TS0/aQWTq9Rq/ACHPTxsXycz0iGWOEChb
	 6fT076Gqv6EKNe77wUihUEJtSh7DdSVUVRWPpuSa2cu2elLVCc1dx7j+5NbdciBph6
	 DHgwasp8tavBk9cvLmW2zcdOYrKGVimvDUQIcSZKfLcY+3fm9LNK/12waef5sIFa8Z
	 9RexZ4fguU0BQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bfc9154ceaso541827e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:49:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwM4aJ4vzIBbqUKcktewRZyRtMbgG2TvCQLehrOMlj0lwQ3uPhImQa2sl1g1Qci9Nf6H/xGnmmJMujD@vger.kernel.org
X-Gm-Message-State: APuU4Z90hVG0nKFPX5wHsIl4QIQbElgytdbk/6SWv6Y+7AP5IVjIyump
	1fgun2aLxLfccNtq9tEOrs+JKfcj0+opM1nTEThbPsbAtb7YYCh5jb/p/7zayK1e+FuzHp8EPo6
	NQcJNyLn9NwDbhrEGt/xvBWOU46/Wll8=
X-Received: by 2002:a05:6512:3e0e:b0:5bf:9fc1:3938 with SMTP id
 2adb3069b0e04-5bfd957bcc7mr5494867e87.38.1793800173643; Wed, 04 Nov 2026
 05:49:33 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com> <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-7-c22555400e18@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:49:21 +0100
X-Gmail-Original-Message-ID: <CAD++jL=yuKLqcpABypsd1icKUYesX=uiaJvUW28xUZoF2k5yjQ@mail.gmail.com>
X-Gm-Features: AclHuK9neIpLEL2dp-ulhGPwQf0eKyJA8-7rsKU-aX6vjOndnPekJ1Twq9QUMqM
Message-ID: <CAD++jL=yuKLqcpABypsd1icKUYesX=uiaJvUW28xUZoF2k5yjQ@mail.gmail.com>
Subject: Re: [PATCH v12 07/11] gpio: pl061: keep the parent device in a local
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 27, 2026 at 5:19=E2=80=AFAM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> IRQ logging uses gc->parent. Keep that device in a local so the
> gpio-regmap switch can change where it comes from without rewriting
> every log line.
>
> Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
