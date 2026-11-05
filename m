Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869198;
	b=tiaWgso1MqEKIik8AMNdIuWWJIIuY8/NCjCIYxw/H6kMBZDdoNjPwWuJRGKkyXmRhlQA
	 pJkjfzIept9xAJknlmR0P3k1B8FYhDYyH2/5W930LFOnOJ3bvguAtTWb4pXN5ic+iWXO5
	 hzO54zkkh6B1WLfMCT05OT4qKklIZw+Q8C0FD9n+reo7d18M8/Bk/B599txvq2OV5FhLg
	 Gzs+YCHnCdNtMQFQBODZuxnQ2VGSosCX9y4nISahxz3I16ccOasYdPAiWNYJ2AOOv7bWt
	 fQPkcE5vkYzCIW4Z1qSQ2M53xrRR7NLEDWNr2Sjyvt9ZP3+3GnmTXtqQlFgLAQRh+yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869198;
	h=Received:DKIM-Signature:Mime-Version:Content-Type:Date:Message-Id:To:
	 Subject:Cc:From:X-Mailer:References:In-Reply-To;
	bh=SF1FYYbYdlvQ/8ZL+wg7ATd7qcI5Z506u2KkklWC7xA=;
	b=sc2NFH7qlJj32mbWvqWzWNKcrrD8YOSIJtzMIrySIE7eLLnzTdtfbjybBeqsbiVuBsV9
	 PMptI1HItBTY02aCyGjizhJo3e4+cJRGytRvIM3yAwSh3AmylejKtmctuqRPeHXjlfTJS
	 +Lyn2bR9bx8tq5to9p/QgUYwH0O1bKjTlHB2UkBV2y64QsSD/omhqJyY3CyAda4e1LgND
	 DX+3BHPOzZuR++2369t9QpEtXB8pmnF3Tk9pjk0pTyh1eeYum2o1Nj+6ddKID4NbkZXE2
	 axso5olvkuz34rIpklrPcjYiQy2tw0RZSQAqPbjlY4or6aJN7do6NRDWc68dxT6Tv0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYbqIswk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9CB6C606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GYbqIswk
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AB7641F000C1;
	Thu,  5 Nov 2026 08:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793869198;
	bh=SF1FYYbYdlvQ/8ZL+wg7ATd7qcI5Z506u2KkklWC7xA=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=GYbqIswkR+riQAEwQ65ACb+ySj+AaM/AhWQqWwVqXYfm0UgXZauwHEvEc96vBIliZ
	 FMzfhCeoK/gjgOIF28Fiwyhcg4LkN87+bBzvYy8W/oNLlvfChhGUWjZFjlPnNMOeVl
	 MNKiOt+4QL9v3T7Z8JGlul9kRJf/pHPe7uRQZXCZqpwkIH8BYPDyxb+qlrQXzJ/jEm
	 qSeVNRqdaVGTupOvZGnsqDM7S9OM32pM6hCT53YhC3cFDf8hSxRDT/XFXpSPqA6l5Y
	 CtK+73SLkYr0sayra+dJ207FBfa7iqRlIB3f3b9I7edoOEfIU8V4oAAsYr3edbbFIy
	 Ymjcbhxt4KK3Q==
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=a7562d964d4a3c0af2a2603ee7971fdab95b262a32aa85f42ffc4345f1cd;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 05 Nov 2026 09:59:54 +0100
Message-Id: <DMN5K39I2UG8.2QDS8KH2GH6RS@kernel.org>
To: <longzhao@ambarella.com>, "Bartosz Golaszewski" <brgl@kernel.org>
Subject: Re: [PATCH] gpio: regmap: free the irqchip if adding the irq domain
 fails
Cc: "Linus Walleij" <linusw@kernel.org>, <linux-gpio@vger.kernel.org>, "Long
 Zhao" <zl020895@163.com>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.20.0
References: <20261103-gpio-regmap-irqchip-leak-v1-1-d038a20840f7@ambarella.com>
In-Reply-To: <20261103-gpio-regmap-irqchip-leak-v1-1-d038a20840f7@ambarella.com>

--a7562d964d4a3c0af2a2603ee7971fdab95b262a32aa85f42ffc4345f1cd
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue Nov 3, 2026 at 5:47 AM CET, Long Zhao via B4 Relay wrote:
> From: Long Zhao <longzhao@ambarella.com>
>
> gpio_regmap_register() creates a regmap irqchip and then calls
> gpiochip_irqchip_add_domain(). If that call fails, the error path
> only removes the gpiochip, so the irqchip and its domain leak.
>
> Free the irqchip there when this function allocated it. An external
> irq domain is not affected: irq_chip_data stays NULL and the caller
> owns that domain.
>
> Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
> Cc: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Michael Walle <mwalle@kernel.org>

--a7562d964d4a3c0af2a2603ee7971fdab95b262a32aa85f42ffc4345f1cd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCauxFihIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jCPwF/dK+8s/zJj13wAWtVw6vHwr0pymH6tMSW
kr7Ctx85Ahmp+IiPtjiunA8TiZdVzxmXAX0baK69g5XOg+MVBR7fAqyrhsXETkPB
vkFvLExKdCwPEgn1fLg7IZqqmvEfee9C4ZI=
=Bh+E
-----END PGP SIGNATURE-----

--a7562d964d4a3c0af2a2603ee7971fdab95b262a32aa85f42ffc4345f1cd--
