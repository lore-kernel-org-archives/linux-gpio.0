Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795650648;
	b=dNCbFxz3P+xVVuWpHGO3RjdG9qlaZNmKRbw9Oew/vckgFivIHYh4FRZXGSGb5co3sZKg
	 GTxRtkAXc2iazZDZwqcR2jkARoNtRRJH49y3h1LfV6XOjehiMaegA+g8Yez+ht4T8ZO5W
	 lsueEJ59louiQu43E8lp12/WE9vlay8ZnTUDelnbfv1ihHT8UbnaA8Ztcqn3XK/GBgLhT
	 EdLubXUpM1pZsz0XDekFQPk3Oj9Ek8mRDm0L7AhFL6E88aqsxCgFhcCi9xexnMTtxEkrm
	 xeGOEgL1NfoH2l0lQ0D/JlwCzo4StUVSR2qOxFh53jN+XNhp0Mbojk6EDUg3QFWLR9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795650648;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SSF3HNmX8IQuqM+s3AUAPIx5aRv7nDlvb0TBcLvwRJk=;
	b=J4R8oH8Mke7uFcy+uUGySGW+bY+s27foWN8PeEs9KJy3HFW5GVZTh8obspPFpa3CZAFa
	 HsjLXaUd/xr6Ge227PuzXuTIh5l23r/wo3bpZESeYXESgR9aHi8xlZBIMCMqAzdg6VkW4
	 L0mWXIhKz3qD+l6PMkKrD3OVti34uSmTEaPfDkeczSICx82FK5mXmE2s8j7AWa0bJtHjr
	 paqwbdsC7SdHnxwsL8pyFSASIxDF0rhWPmW8kgdGwZfv40265/kwj8HDCJT4UpFam5jZo
	 LZnY0TpD+Mhcg/XoboV9a1EH40nSQVV6JHAgbFZ0DpaoANzTSyaT+VEgCQyr1CYcq5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gz54QzvU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D14606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 23:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gz54QzvU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EC7B1F000C6
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 23:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795650648;
	bh=SSF3HNmX8IQuqM+s3AUAPIx5aRv7nDlvb0TBcLvwRJk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gz54QzvU7z1D4kq1AqjGdSDn7QGNa4uhzG96yBRN9vj8aaAF3zpm94Fi1ZvwC49A5
	 zzPYAkG1zHH22bp4pQhgc/SNYvoLiMXBDMS6zUUd8A1zX219lDwgYHuynslXhl8cbl
	 UBnr2OgMGPGu1NJynj2I3rHIIqHSEWyloFhkEs5BnB+dhycNp3vltB1qca+bJP5xUM
	 WsX56fY4hISZWxx+9TyMhltFdSgo94PobsGFJDJXYsWfEUYvuevn8VuTpWbujtNeS4
	 nrAa4P3X3wNe/bj6CvwgbVG6GUc8aTKLtyh+hyRvyIRQFeJPAJrVKk/hQM8DbEy/Az
	 dBm2q5HLjjIGQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14a204305so4366973e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 15:50:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF+imvVEPNfhHSjH3JL4gM25YDaKKHfvuzpoWM9mVoc4vxmc4uH9T61DqHTzg787ETp5zvFjnfzvr3O@vger.kernel.org
X-Gm-Message-State: APuU4Z962ZR7UFXMKf1zAV7H35nlnQxVRuFcVo6HZqAzB0vpRTzBvyMV
	XPCazcJCx4F5qfZlsULvXP40Zk8g+JQciddwkYA24bFLLeeT+LnR8Xfp+LI1o/Da1SrbLzn7R/j
	nGGX0mlZG/rp+ojQPrtuPM7yOdi2Zb18=
X-Received: by 2002:a05:6512:2301:b0:5bf:d000:bca3 with SMTP id
 2adb3069b0e04-5c1bc80af80mr4947135e87.49.1795650647170; Wed, 25 Nov 2026
 15:50:47 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-gpio-three-cell-hog-v1-1-724b15c4f0d8@oss.qualcomm.com>
In-Reply-To: <20261125-gpio-three-cell-hog-v1-1-724b15c4f0d8@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 00:50:34 +0100
X-Gmail-Original-Message-ID: <CAD++jLkLZZjazqrTNhrX5b08o8CCEd-aJApCChg1CA9+4_hBDQ@mail.gmail.com>
X-Gm-Features: Aa3M54o5djYLxkPCzUBBr6bgl1plvSzRd2_k-TGNDmu2r6ajYBxpvQV8WpW-0fA
Message-ID: <CAD++jLkLZZjazqrTNhrX5b08o8CCEd-aJApCChg1CA9+4_hBDQ@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: use the of_xlate() result when hogging lines
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Mika Westerberg <westeri@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, linux-gpio@vger.kernel.org, 
	stable@vger.kernel.org, Norman Herms <dockseed@proton.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 25, 2026 at 4:03=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Since commit d1d564ec4992 ("gpio: move hogs into GPIO core"),
> gpiochip_add_hog() takes the hogged line from the first cell of the
> "gpios" property. The of_xlate() callback is still called for OF nodes
> but only to get the flags so on controllers that compute the offset in
> of_xlate() (sunxi, Qualcomm PMIC GPIOs, tegra186, ...) the wrong line is
> hogged.
>
> Use the descriptor returned by of_xlate() for OF nodes.
>
> Cc: stable@vger.kernel.org
> Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
> Reported-by: Norman Herms <dockseed@proton.me>
> Closes: https://lore.kernel.org/all/qh4LV99kGaQYdQuGbsPX4b9Fm6Cip_Ow7ImY4=
icfwI8IsbMQy_09FovZY82b-_HVkDmR2ELMlKe8bzCuBB5NpaZizoO-s4tc11zAX30FDhw=3D@p=
roton.me/
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Looks right!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
