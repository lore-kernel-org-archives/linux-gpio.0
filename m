Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F203C199A
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781182295; cv=none; b=LA3ZoG3CBeS+xWVzJqzejGus54QXb2ubvUOk72Se4Y+p4GSbmj/fkP7qjJbKVt4ad4m+o3/QOV5Qvoe1OGxplrAd5hrl9vVyMiz0M5DES8x45hoiXVKDbpv2JPD6kF9X12OJe+AkfFadRn+/yKkExdcFsAy3ENgq/Iz5KjqpnZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781182295; c=relaxed/simple;
	bh=ZcEyJDUyCpeCJ+KN5CnZSAfgCz0i1CrgESVB3QX8cQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ksEBxisna3OOHcyalIq477hnQxxSE0ickAPxYIDolTEJt71m/qlhqh3DjdKVz8WvgCNgWirjl+nFz63HY+E/Oo4b97SjEg9gZlbIItxxLPlT/HoVFA/Uy1t5bPM41TxFO2m7txzd5SJAz9kQIF2hm8wbHQAlCubgWrdGlQ7YmxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwaI5VqY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwaI5VqY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7F6A1F0089C
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781182294;
	bh=e9WLujsb76wJX19mGC9SDiFMCyDY7pNnF6G3yu8LFgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KwaI5VqY0p7DAHXz8MzhJMOIHJOjZed7svN8SV/HGfUR99cKVb7WfZDH2KjdGcW5r
	 +EzPcme8QoWuXMs3K+H0pPnuXJ9rFvxrqr7Of3PptQnEKQgfGJRQ+98UN4fBIGgLd4
	 DdzOYTFg8PCu4MroMNudhUK8q15qmG3405HG7hIxt+tqio+jQKNi+UUoLsCmZdON4q
	 noIDgWUwO0lhkSyJ9oM/prdrsAOcP7v02fA6KBegv70wCGCvJrDOyLUM2rf9nwWpJs
	 c0iN194kuN0GvY6G4X+fyurayXXGIuuYHXlCaEQRpcG2SyaFfbcdw66g4CkLxe0Ddl
	 VutqEYt1WmDoA==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39677c434efso80960451fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:51:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9W8fqOFulijli5EiL3bCmamrIrHo3zZEfqJbNKzZ3X14g9bR61bTv2MZ8S3EphijgPYINBkRnSsApo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6BB4/Jrpxu4LE8HfI6HZkR4riLq7UcjCBQIV8KBY8XJkvwJg+
	ORrI/3qlj7W//6ZPB99zS3zorXFsfqDQQLi1y1b9j5lvfhpFj5WRNYi0WozEyjOJ+twXqL0SbMA
	L7XYvEPGsLwxtw3BxOAVX/pT+FJnSDAM=
X-Received: by 2002:a05:6512:104f:b0:5a3:6731:910a with SMTP id
 2adb3069b0e04-5ad27ab9e1amr954915e87.11.1781182293519; Thu, 11 Jun 2026
 05:51:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
In-Reply-To: <20260611-gpio-to-irq-v1-0-12201716f23f@amlogic.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:51:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
X-Gm-Features: AVVi8Cd-dIHDWtIpo4Lae4LYz5CqVn4HEUpS_YsaMZ1wtD9Hr9uCut8hp35HQx0
Message-ID: <CAD++jLk3YdMUSkk71rgT=taQZnEhqgMgGP0dKBPx7_5Bsxmu+g@mail.gmail.com>
Subject: Re: [PATCH RFC 0/2] pinctrl: Add support gpiod_to_irq
To: xianwei.zhao@amlogic.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Xianwei,

thanks for your patches!

On Thu, Jun 11, 2026 at 9:54=E2=80=AFAM Xianwei Zhao via B4 Relay
<devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> Some users need to obtain an IRQ directly from a GPIO descriptor through =
gpiod_to_irq().
> Add the required DT binding and implementation to support this use case.
> Since this introduces a new DT property, the property is kept optional to
> maintain compatibility with existing SoCs and DTS files.

To me it looks like you have just re-implemented hierarchical
irqs.

Look into the section "Infrastructure helpers for GPIO irqchips"
in Documentation/driver-api/gpio/driver.rst, especially towards
the end.

Solve this by using GPIOLIB_IRQCHIP and a custom
child_to_parent_hwirq() callback to translate the GPIO into
an IRQ.

To just implement gpiod_to_irq() without any irqchip abstraction
is also broken: you can't force all users to just use this way
to get an IRQ it's excessively restricting.

Add

  interrupt-controller: true

  "#interrupt-cells":
    const: 2

to the pinctrl node as well so that DT users can simply request
the IRQ from the irqchip inside of the pin controller. It will
be hierarchical and lightweight but an irqchip nevertheless.

The GPIOLIB_IRQCHIP approach will help you to get this
right.

Yours,
Linus Walleij
