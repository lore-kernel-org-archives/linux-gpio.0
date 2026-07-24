Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 505F2385519
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 07:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784877523; cv=none; b=MoGfuQAKMBbOID+BSdWWx6OJ05uR1TGp+PixsymJGhIZNkfljyPFvVXnIIWyKzOkPI34SB1fXKrVgUavTi3uuzEt4+s8I3pq8HExxbqQwZVxCact32Hb8QryfWR1P8z824dDMAS+HlwmxbNC4UXo9yWRLl4HJK6cMrMSQWg6xvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784877523; c=relaxed/simple;
	bh=knvul0d5dUbxhcnkzSOe7QxyLGBpeQVKwjE+WYlIefQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sgyfWEU/X1SPHsgKAN1L7uwIXlPQGMp/XaqxSlmRXk04LrZirx9pULQlEq/08ecj8tVAyaLSxY68XFrSD6SHulBTaG6CFMUC6RoWDDQCIH99FdGySIbnct4sJsxBpcW2phZWzIU508x0Zfg1YD0UfrI4Adb4dT3mZtuYEbdVf3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3Ydsf36; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3Ydsf36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201AD1F000E9
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 07:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784877522;
	bh=ulBWl2+S7bBB8m9+3b1VcGjSXAUDgrY4GX40BaI80DI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P3Ydsf360n3EDirffVd2RTImsBGgDjID57tRKN+ZuYIRLcRjBSdRNBWVU5Yjxt23O
	 poQAO1z0Fe3LXjTrWVOisN7fPGwQdsLsVVqigEzb+kQGdtFUr8PmPn02FtTNcOy6Bo
	 YYzsOVZkvZGt+V+Pmte+xAn6CfS++7BPse0ohQI+rZbQD+zdEH/dSbNAezc37mCusF
	 xPDLCNiF7G0DuzgPE7Uiy/LLMBe9DPz0uMItyuGsvdhvt4J+A8BS7KKp0JOM+aiIlI
	 JT2T/32rkOB4BnXF4J4gjTaMATw1lxjCEdlzsfdd1jdEfuLSbjXJNX4fWqKiAUPzlX
	 4hc7azHlfut0A==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b29599b81cso125696e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 00:18:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RosC5sabuwTpK42B0qJIQXm1DupyNaWYWgOTq3oYJ3eesVX+qBeXulvFx9AF2v3rkX1XkJZ7S/8m4lK@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9hv2KbdUgHaA0TVHhsWkjWWgUR6jbSWEk3jTrK9e49JCDKk2w
	Bwlg5A+gFXy7Bf9yMX7cVIsQ/bonw/cLO+EbfA8pyBwcwy1yMbQw2t5ipuIy1+uC3NU0+/gQR4k
	3dwtezeENp8zhPJ//7aHesFvlmBXNQbE=
X-Received: by 2002:a05:6512:340a:b0:5b0:23c3:4f55 with SMTP id
 2adb3069b0e04-5b2b2f72e6dmr1312857e87.53.1784877520653; Fri, 24 Jul 2026
 00:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709-ad7768-driver-v1-0-44e1194fd96a@analog.com>
 <20260709-ad7768-driver-v1-5-44e1194fd96a@analog.com> <ak-AcfH-Igsa_ksV@ashevche-desk.local>
 <1e353a66-3543-4a6f-91b6-d5e8524d9754@gmail.com>
In-Reply-To: <1e353a66-3543-4a6f-91b6-d5e8524d9754@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 09:18:28 +0200
X-Gmail-Original-Message-ID: <CAD++jLnwV7ib82c1cvf8V6xWYjUpqJb+6w2We+NXhU05+B3RxQ@mail.gmail.com>
X-Gm-Features: AUfX_mxx0k-0Kh2ddvU-MPx1m1Pt8f4Mw4eIBEpD-5PrpQ6uCr47fdzZ-uEusJE
Message-ID: <CAD++jLnwV7ib82c1cvf8V6xWYjUpqJb+6w2We+NXhU05+B3RxQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] gpio: ad7768: Add AD7768 GPIO auxiliary driver
To: Janani Sunil <jananisunil.dev@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Janani Sunil <janani.sunil@analog.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux@analog.com, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 1:03=E2=80=AFPM Janani Sunil <jananisunil.dev@gmail=
.com> wrote:

> gpio-regmap does not naturally model the AD7768's direction dependent rea=
dback behavior.
> On this device, GPIO Write data (0x0F) holds the latched output values an=
d the GPIO
> Read Data (0x10) reads the logic input level only when the pins are confi=
gured as inputs.
> Using the generic gpio-regmap would always read 0x10 including output GPI=
Os.
> The custom implementation preserves the device specific behavior.

The memory-mapped gpio-generic has this flag:

#define GPIO_GENERIC_READ_OUTPUT_REG_SET        BIT(4) /* reg_set
stores output value */

Just implement the same logic flag for gpio-regmap and
the problem is solved?

It's such a minor improvement to gpio-regmap that I don't
think it's much to ask.

Yours,
Linus Walleij
