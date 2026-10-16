Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4F34C4F42
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157138; cv=none; b=BjJpJxSHR2rDq1hrPht1pBX3nWA9rrqcJpxpd86/5tOdEbN2RTrkMe00H1y17zjYBuNAIS4YztnsfIcyA6/Zf7yZYUI/9dvBjfPCYgtRAmxPKn0KO3flXpv5LOhClGYUk82BadUh7HILF7PCsvQA96RwqvR9Rr0cK3kUH+7wwDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157138; c=relaxed/simple;
	bh=OOfsqjjwGT2XW0d3NzFMALYw3bv/RKB74gN25shi37c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i5XKRz6Op3AUsVHxQFdEh6iagnWbl+S1AsXvFjwVRkhhYzlL/c3CBk0q8GqwAWHu3Oj2nQST7BXzizbJ4YEMc3XepE5qB6PI10ypHFWKmBwRbpSJrsxG1F0wQzjMCqSf+8E3Zpxv0FubjWC9/qJKs9vgvTnUxtMURiWomVFN1Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETVryMf1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETVryMf1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442BE1F000C6
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792157137;
	bh=OOfsqjjwGT2XW0d3NzFMALYw3bv/RKB74gN25shi37c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ETVryMf1B1rptGIiypQnb1K1s8dv4pBWjZrmcJ3XVLvy2TtLDyQUcgUOk0GzO+d7x
	 3EdVentREYxaZZJp1p6ThdKr5SnDLk0fNJ3Nq3XrVcunsNj377zn1+AsieagH16SQj
	 kN33zt1a+i0ocaRf01vCo3DlCcf8lfS084uBugofX84AXIiW6yP0OoqcLm7TIZOs/d
	 K7lUwAtK3pK6CuxaKHpvQuaoWTXkRfooIoUA3WXmyk2WdG9apAFxcLcQxVZ8oot+xp
	 /NUKm7EcbWaZdKTMoi3YRhJPD8uMNbxGH6qmGbn2vR6nrS3X1S3bxWKqpRwbf9tIUO
	 Mht5QiZpZDnVw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b8b3c8c4bbso1075811e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 06:25:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxM7STpJIP//7m+XGpC1FfFxrtKQQB74Z1y0HLnxk2gRhszdRm4eZu4ZZi8QhPInoLvLsTchNyRyCg6@vger.kernel.org
X-Gm-Message-State: AFq9FYJjNO/+U0QKhw4kn9hQrlgdPUoluYAoHtC7HcbOxHWoD2ZSAq5G
	KQOKljs4I5O1SrOT9BU1Rvc330BoAKwTuGNT8WuViyGeLZJbtt8Wu5S1h3qSVyMf+jHnlL/WUPR
	KMoZ4Md0l/czWW7iU10lBW8yjpGIZ+VM=
X-Received: by 2002:a05:6512:3093:b0:5bc:f296:a12b with SMTP id
 2adb3069b0e04-5be476e75b6mr1121631e87.26.1792157136001; Fri, 16 Oct 2026
 06:25:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com> <20261015-cv75-gpio-v10-2-3fe3eb315a55@ambarella.com>
In-Reply-To: <20261015-cv75-gpio-v10-2-3fe3eb315a55@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:25:23 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6trsV8SxotPEHihmjLjP8M6GFjRYaLfdvBTSQBs2ASQ@mail.gmail.com>
X-Gm-Features: AclHuK9w8mCxwQzii05uCSde21DPZaJUUbhYZYIq1rBPFEiwYVVS1D3meBR1CkA
Message-ID: <CAD++jL=6trsV8SxotPEHihmjLjP8M6GFjRYaLfdvBTSQBs2ASQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/8] gpiolib: regmap: add GPIO_REGMAP_QUIRK_SET_AFTER_DIR
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:54=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> Some controllers ignore output writes while a line is still an input.
> Add a behaviour flag so the output value is written after the direction
> change. This is a legacy quirk. New hardware must not use it.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
