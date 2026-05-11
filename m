Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337E9364043
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778497662; cv=none; b=sbsEAEYXj1gclJ+wvNGX+bxJBUd8mjZXrs7o7FYxLl0sJ09mkPA7O4TeegrVD7ZlcesIPTCt8FNHjAv+Qg+fnod0qKOSS/yV7JdSMn1PKiDZJv/TxidNsmbBWLSSDF9bDwWKnHuBRu/+w9jwc5eJteLiwHP7L72LClLehMF9DOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778497662; c=relaxed/simple;
	bh=90QOLWTZRJ9Oe39W7j96XxurzXBxvrEjaFrO1jMy5NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRjlMdolxBWg9Iifm5qAbo9wk80EkjIND+e6SKmWFjKJllXvLKDFlXJa7kXUYptdot83A5WAt1Znm0PYRfMKoQpxIYfRKVd/rhlHl5Oy3fsD65U6Hw6P1ULbNKddDIJxX7jqt7+3FKmePlB0UkJGc5D/N/7FDQQEHfxwD3CBj1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfLes43N; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfLes43N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFDBBC2BCFC
	for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 11:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778497662;
	bh=90QOLWTZRJ9Oe39W7j96XxurzXBxvrEjaFrO1jMy5NE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cfLes43NLXfZQzhaK9vlw1oPj5oY+gDIRDv058/DACoyLx8HdXKboDKRR3C3SPkfv
	 rbkrnkxWJLZL9/fYiOAk5DeunD6pg1tXgSaCXC0zHDTicKu0XDHvylM6bNqqKlhe+a
	 2TNnU48ynm3s4GU6rCPg1H+C0So9uidnbB8aNp5iYavX09cYkp05vtTFaHNelEyjTc
	 8qUr6ydI37F1H5ogSc+fVvtF3ic4Lsp/MMP9gfQRBTOuwseyZcnCh371JWX7+w7z2+
	 H9MhEu/zTP/iuT6EyWi1OvICFWCROoeVpQ1hA9FYo4zZIoYPQtdvUbOBTeoV0rWGGV
	 ZMpcyvfjQyzwA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-38e84ed22bdso37342531fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2026 04:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9NY2FvGmRH3kTJUNlgsWniHthGf99XypCny1cVfHUECo5i5lerLCTv134jRyUY4UYqMd0SONk2U/CE@vger.kernel.org
X-Gm-Message-State: AOJu0YxfrRjCLnLv/SCh1G30tSh8UzGnJWv+9prpC+l3RGZU+WwfUtuk
	ohRh4mVOsUxMDGQ2oEeUmDDKD201keW+E0KXXMEu6kh6gT2lFmt8Np+eWkGcWUlNUswgo/dEQsW
	SweZXOHvGJgTpgIOVZNfff27WJ/mf64r/3PbjLIdsAw==
X-Received: by 2002:a05:651c:41d8:b0:393:d1d4:9d9e with SMTP id
 38308e7fff4ca-39407e53a62mr29246711fa.0.1778497660612; Mon, 11 May 2026
 04:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-bm92t-v2-0-2145e4f4386b@gmail.com> <20260511-bm92t-v2-1-2145e4f4386b@gmail.com>
In-Reply-To: <20260511-bm92t-v2-1-2145e4f4386b@gmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 13:07:28 +0200
X-Gmail-Original-Message-ID: <CAMRc=MeA240ZeQTycrdpt1-9UL38nmDqgMKP3vrKa7vmsx8W7Q@mail.gmail.com>
X-Gm-Features: AVHnY4KUAWwOxQE6mN_7EjI9Br-4KEhphWwprxeTnYPRdteZi0IcgsQNw2xtrTk
Message-ID: <CAMRc=MeA240ZeQTycrdpt1-9UL38nmDqgMKP3vrKa7vmsx8W7Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: typec: bm92txx: add Rohm BM92TXX support
To: azkali.limited@gmail.com
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, CTCaer <ctcaer@gmail.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 10, 2026 at 8:32=E2=80=AFPM Alexandre Hamamdjian via B4 Relay
<devnull+azkali.limited.gmail.com@kernel.org> wrote:
>
> From: CTCaer <ctcaer@gmail.com>
>
> Add a driver for the Rohm Semiconductor BM92TXX family of USB Type-C
> and Power Delivery controllers. The IC integrates an MCU that runs the
> PD state machine; the host configures it and observes status over I2C
> and reacts to a level-triggered ALERT interrupt.
>
> The driver exposes the controller through extcon and a USB role switch,
> manages the VBUS sink, optional VBUS source and battery-charger
> regulators along with the VCONN-enable GPIO, and applies per-PDO
> charging current limits (5 V, 9 V, 12 V, 15 V) sourced from device
> tree. DisplayPort alternate-mode handling and dock LED behaviour are
> configurable through rohm,* properties so the same driver can serve
> boards that wire the part up differently. A debugfs interface under
> bm92txx/ is provided for register dumps and low-level command access
> when CONFIG_DEBUG_FS is enabled.
>
> Signed-off-by: CTCaer <ctcaer@gmail.com>
> Signed-off-by: Alexandre Hamamdjian <azkali.limited@gmail.com>
> ---

...

> diff --git a/drivers/usb/typec/bm92txx.c b/drivers/usb/typec/bm92txx.c
> new file mode 100644
> index 000000000000..39e20a4394c1
> --- /dev/null
> +++ b/drivers/usb/typec/bm92txx.c
> @@ -0,0 +1,2634 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Driver for Rohm BM92TXX USB Type-C and Power Delivery controller
> + *
> + * Copyright (c) 2020-2023 CTCaer <ctcaer@gmail.com>
> + *
> + * Authors:
> + *     CTCaer <ctcaer@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/gpio.h>

Sorry but I have to NAK this. This is a legacy header (as per it's
documentation) and must no longer be used in new code. Please refer to
the kernel docs and use the APIs from linux/gpio/consumer.h instead.

Bartosz
