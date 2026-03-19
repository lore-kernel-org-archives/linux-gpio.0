Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E19F3D1705
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 12:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773924820; cv=none; b=QHFEfgos49PPIv9UFWMyDE43AuMBBd53TvOjBWBZkQckpocd5YYVT2ANBSdVL5aGDL+OFhl+d61QLjE55r9/gGLxJJkxNYyw0k3IhzVIx0sr4U8Gx6NgMEYzdz2Z7Gp1uQYBJODRndxwCVFYOLEGMpJYoGaaaLczQ3L9bJ1C8ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773924820; c=relaxed/simple;
	bh=aZGDZBgh8B46KiK5LwZKPSo3Z/c5+KufgSnlcr+rs0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QTmPoXyczw5mO2n+eFkiuSLuR4TwGvRw+j93ieDeaSbdJ1S2+Ia7eGvsQJKJgnXoap721WoZOHb65S7yN8L1Zh4wTiEQwUZ1M6MCrvAksd+5iT5b+/TuiaWWcaVbIp6QgwHj4j5V9KeE+a98TbQX0szLiH6n0/sgB3CWsvCR8/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5ae4X0y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5ae4X0y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 645B2C4AF09
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773924820;
	bh=aZGDZBgh8B46KiK5LwZKPSo3Z/c5+KufgSnlcr+rs0E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=S5ae4X0ybrzEvsJ8y5I4xja7M1TxrCaMMIj/VGk8td2EMv/JbdA6cfeWWM1igWhga
	 8FACR7yKCvLm2nTTWw6mOhiaxNrRiTA36pLv7kX2tWD3zeIT2jdc0db8MUCxJCILc5
	 Lj2xNnxc7WDKHSaszIhxTNJ0AApQM84lS5eenscw3nRBdg5OgpnhL1vPHoKq4RuaN1
	 5Q85T1YEUrKWVgrCFSdVsdJTWVZLu0JuCyV+I6ufhG23g2f+i2H5NTwMYqLeo6ursI
	 J1y9++/8pzqpWyUg6oGUEFTxxgahfwShaHCcrmshR0hqTNjRCvrVEqc5xuQE4m/fFA
	 j1HrrX0TE3ofw==
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-79a5fb98316so8378987b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 05:53:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWbLADyh0mphSufYvjhdmtD6N83m+wPORlr71tenRREhvavVrNpZDL2wxOnGzZ2S48LkOYdyXteOSag@vger.kernel.org
X-Gm-Message-State: AOJu0YzVTpDtq5WOqf+q1c7TNfMj/gZSs+CJE5T6qVUmQFwF05Bq51qq
	3gXmehmToUhgaaWDymK3LnhY8CT+NXPRTdHZv+wJg/bRri50SYPe1PH5O7T362qMKIZ/zwt3SC7
	rfiJXQCXVXQZWJyUCg9zyakOzH3mheMg=
X-Received: by 2002:a05:690c:9307:b0:79a:436b:70c7 with SMTP id
 00721157ae682-79a71c7f13emr58564037b3.54.1773924819696; Thu, 19 Mar 2026
 05:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
In-Reply-To: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 13:53:28 +0100
X-Gmail-Original-Message-ID: <CAD++jLn6AwD91zTM40accHrYeWFgoUkknEt=c+qhBSQ77bRCTw@mail.gmail.com>
X-Gm-Features: AaiRm50JOv-QYXkwbpNYvSXiAbstTRzfapJj9qbqk5T6xP8tXe1iZ5aNllQor9U
Message-ID: <CAD++jLn6AwD91zTM40accHrYeWFgoUkknEt=c+qhBSQ77bRCTw@mail.gmail.com>
Subject: Re: [PATCH 0/2] gpio/pinctrl: spacemit: Add GPIO pin configuration
 support for K1
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank Junhui,

On Thu, Mar 12, 2026 at 9:43=E2=80=AFAM Junhui Liu <junhui.liu@pigmoral.tec=
h> wrote:

> This add GPIO pin configuration support for the Spacemit K1 SoC. Some
> use cases require configuring pin attributes like pull-up/down when using
> GPIO lines.
>
> A practical example is the SD card detection pin on the Banana Pi BPI-F3
> board. Since it lacks an external pull-up circuit, the pin must be
> configured with an internal pull-up to function correctly. Such
> configurations can be specified directly in the devicetree:
>
>     cd-gpios =3D <&gpio K1_GPIO(80) (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
>
> To address this, add the set_config() callback to the gpio-spacemit-k1
> driver to enable pin configuration through pinctrl, and modify the
> pinctrl driver to return -ENOTSUPP instead of -EINVAL for unsupported
> parameters, allowing the GPIO subsystem to gracefully handle them.
>
> ---
> Junhui Liu (2):
>       pinctrl: spacemit: return -ENOTSUPP for unsupported pin configurati=
ons
>       gpio: spacemit-k1: Add set_config callback support

Both patches applied to the pinctrl tree.

Yours,
Linus Walleij
