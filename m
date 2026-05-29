Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F5F343D8A
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780085431; cv=none; b=SZf1PzwNK8WB/SJKB1wIU4edqXynJ6OObsWPJrPrz0De3AwNHmFnkR8BTb/og+7iX2v5R3IVVwlo5i7Q8rdd2aus5QUYsK/WW/IyjAQdsrLbtkvDz5qzOWLMV2VwgP+fn5VWuourWbegY9O/AaQVfmxhgBi7RBuPScpWThPue70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780085431; c=relaxed/simple;
	bh=oQDqTDRzNTPwZsPjGf6RDDjOef9CQeyvOpIJfJ3OCq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oLIdrxVKDKPTAlmSN5FX1hFsS+d+WcOBf7wwbw6/1Qjamk8Xth5vLR8wa6aiu3hYpptshvhAmhqc+J5HCCHHr+/GjOAFFDrRHGU0O8KPt4wNfEk/yqKnvH7XY4c8PwEKnzHAwFOynQvHq+vI0lmyNqS49uFLZYiLvj3BS07FeDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hr0FdYjp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hr0FdYjp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8B41F0089C
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 20:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780085429;
	bh=oQDqTDRzNTPwZsPjGf6RDDjOef9CQeyvOpIJfJ3OCq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Hr0FdYjpscSqOgX6XAS7vi179k5c+4IiLv3XINZ5NYNN/JqEKjhv2gt4CMAt0IP8Q
	 1X/TM5PJg1e4ZlShrD6O/HNgq8RKlNw3hIzreEPnWWMwyMh68ZyyB/5kmoaWrmhgtc
	 yV/JISHYI4ywXs67aBR/X40iPXIoyp3nMJl/EkUleFdZ5b4KR79Eht1vk7R2ZZvetH
	 zUodYB54OTRDYsPIuMQA/Bkq1/tWkH/X5ozy/+6EBkvt8RPGNKIP+mWQ2Z4Q+1kfFg
	 8i4rV9h4ezta4qtUiDt/8t5CZABtjhOCs3y71fFeHjpgNVCdrvugNroW64BRNhU31f
	 X4mSFsNnslgKA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa612bf6efso272226e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 13:10:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ96iZaLLUDyaKTCnm/940v9r4OmKh5UYjP0Ke1ETNnMFXY/kNSZAqVXIN4a2/+yVPkn6fbKGCmVoKvN@vger.kernel.org
X-Gm-Message-State: AOJu0YxzPbCVxFXRJtYiGq5W2SWU4RTkcPaOcHxYJx+HzD8VBRjQQxlM
	lJHAjxYW30BzCuIexRkMza+tP81oRRXSueReFrYAh8i6G3/6d4nGGoM1VGSFBP5CZjdkhATfpzu
	qUVO0hgt/04PkBK+aLy/vqU/9VzuACSw=
X-Received: by 2002:a05:6512:3d8f:b0:5a3:e7df:2396 with SMTP id
 2adb3069b0e04-5aa607bc2admr441921e87.13.1780085428571; Fri, 29 May 2026
 13:10:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260525144629.498630-1-jerrysteve1101@gmail.com> <20260525144629.498630-4-jerrysteve1101@gmail.com>
In-Reply-To: <20260525144629.498630-4-jerrysteve1101@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 29 May 2026 22:10:16 +0200
X-Gmail-Original-Message-ID: <CAD++jL=v0fPeOmyN=rW8dqNiExogf2V4GN5jjJFJuMxA=i1rPA@mail.gmail.com>
X-Gm-Features: AVHnY4KYuAdI5WTslUv2iX3q4rH-Di7FQSijsq0vHVgdtoE9bbcWaq0tBRNjUrc
Message-ID: <CAD++jL=v0fPeOmyN=rW8dqNiExogf2V4GN5jjJFJuMxA=i1rPA@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] gpiolib: of: add quirk for IS31FL319X shutdown line
To: Jun Yan <jerrysteve1101@gmail.com>
Cc: dmitry.baryshkov@oss.qualcomm.com, Lee Jones <lee@kernel.org>, 
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Vincent Knecht <vincent.knecht@mailoo.org>, Grant Feng <von81@163.com>, 
	Andre Przywara <andre.przywara@arm.com>, Tony Lindgren <tony@atomide.com>, 
	Sudeep Holla <sudeep.holla@kernel.org>, Romain Perier <romain.perier@gmail.com>, 
	Jesper Nilsson <jesper.nilsson@axis.com>, Robert Marko <robert.marko@sartura.hr>, 
	Pavel Machek <pavel@ucw.cz>, Krzysztof Kozlowski <krzk@kernel.org>, Wei Xu <xuwei5@hisilicon.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Peter Rosin <peda@axentia.se>, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 25, 2026 at 4:47=E2=80=AFPM Jun Yan <jerrysteve1101@gmail.com> =
wrote:

> According to the IS31FL319x datasheet[1], the SDB pin is active=E2=80=91l=
ow.
> However, existing device tree incorrectly configure it as active=E2=80=91=
high.
>
> Add a fixup to force the consumer active low for legacy device trees.
>
> [1] https://lumissil.com/assets/pdf/core/IS31FL3196_DS.pdf
>
> Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
