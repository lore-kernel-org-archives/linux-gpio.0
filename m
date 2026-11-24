Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795558037;
	b=kGYr/sC7zHFQLfD7BJM4BzjfaS5fnnqpoD0dmyeaeay7IWGYTZwn299dTQ+bZI80/yXJ
	 FDEl5DHfcvNQ51R+KVkSThYYlXU+7MO7oRbM168rMv8mh2Dh4VrrL30MevdyvzdcwcYt2
	 dS0jb//nyEQRCL2M4Zw6Yyhe2GxO7i6Szn6BNsET3VPIpg+7uryWeZr/aNW4X3vQsu2hi
	 4OHSqgZfDO5PuATUHFY4CvZjlrH3z+EEDLC3rf9TECdXdq5GTvB26tcQNXbm9rrvANrbH
	 LNgbVvWgTa7RsdS6ef4AQ4f18Qr8R1XIFanygEhFpyL3gobz2/sfURmRK16n5Vi4M5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795558037;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=g58/NlrRN/IEU7Bn75q8JeTcYj44eEdCXQrRMimrz4c=;
	b=mGtHRako8a026Wi91IWXB0U0qC0vh4eLI2/H2OjyjM2XGptjJKzhmNcDw2gpNCLIiECb
	 1t53PhRUi4hLmLcvN01/+oZ/S1ujcyDEj9L08RyBq/XiFCMJVUBmYZUuhgqC82gVwYZGX
	 PvdOU78pXtKe4ESx6AwUU2ol3i3FA8KKsJ7Mts+f5bgc2QbKLS0asGgRoniucAWWN/zIj
	 3flXRnNigWiJml3aqjyAwYZhL3/VEMX1wDjXQS6ajWPsXzrySWdaKTLe3+mLCf8YrsslZ
	 hCOChYyXqYSsIxeXJKaULFdJGC8CgM4/+DdpqFMrFgBUp6Xxj7jekRqepitpwKoW28g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0tfRFaa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877D5606A33C;
	Tue, 24 Nov 2026 22:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E0tfRFaa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A1C11F000C0;
	Tue, 24 Nov 2026 22:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795558037;
	bh=g58/NlrRN/IEU7Bn75q8JeTcYj44eEdCXQrRMimrz4c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0tfRFaaMGTraed8V9KNmgSQpstTSIMVja+kzRvkQXbf2kKtOf+ctFSQvAKcdPJ9C
	 M6+207h9R8+FEJuQxsJ5FZ0gX2v5tvY/98pKm3AMCvk49f8OJfczkNmqb3La3P4vww
	 M7l78co8nYdMD2yxJ9dtsD6rY/7BQzcAN2AYpWp2XBjeuS0iCc6GFqqUckZUNBWMvz
	 rGcC5vVok5ORMtMY29IQ50264qvzLcIsrZT6MEVyja2pqMS/tvPnruuPwr4bSHB6nr
	 fB6T17yeSUhRGkTUHF8P0tpUJdEmrHdnFSh3hYexL5W5gErN+uLbtRUl7XJYZvS59r
	 hCju+wXvzuAkw==
Message-ID: <sashiko-outbox-232083@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND v3 1/3] pinctrl: sunxi: dt: number the IRQ banks
 from the first one that has IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261124215048.42074-2-pmazzini@gmail.com>
References: <20261124215048.42074-1-pmazzini@gmail.com>
 <20261124215048.42074-2-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Nov 2026 22:07:16 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] pinctrl: sunxi: missing Fixes trailers on IRQ bank numbering bug
  fix
--

commit 009a7489b930c20cbf9490a0cf310e0d4c449665
Author: Pablo Mazzini <pmazzini@gmail.com>

> pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
>
> prepare_function_table() numbers the IRQ banks from PA, even when PA
> has none. The static drivers number only the banks that have IRQs, and
> use irq_bank_map when the IRQ registers do not start at bank 0.
>
> Do the same here, and give the A523 and A733, whose IRQ registers
> start at PB, the map they need. Apply the map to the A733 register
> layout too, which so far ignored it. This also fixes PK on both, which
> was numbered 10 and written past the end of irq_array.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>

[Severity: Low]
This fixes IRQ bank numbering and out-of-bounds writes to irq_array on
A523 and A733.  Should it include Fixes: tags for the commits that
introduced these issues:

  Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
  Fixes: 648be4cd9517 ("pinctrl: sunxi: Add support for the Allwinner A523")
  Fixes: 3fa025dfe1e7 ("pinctrl: sunxi: support A733 generation MMIO regist=
er layout")
  Fixes: 0535bfbfa97b ("pinctrl: sunxi: add support for the Allwinner A733")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261124215048.4207=
4-1-pmazzini@gmail.com?part=3D1
