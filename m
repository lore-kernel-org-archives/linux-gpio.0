Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792937313;
	b=PxQfOeb6sdTlOJr7BjAPpf8j6k3t927zIDCnO0vZokOvLHFRRaYIvjK4Ndc4EkjuqCbl
	 ct6L1++m70jt7XASnxCKdbGBccXbkePJYYGnl+5ghUB8zVg91jIsc2R/r1GPl7Eubd2XV
	 AazoJ6+gk5JKps5EEaTd6hyEekIAubySD0J8QhLtw2JreymP8T4KGrWpZdcrOwkXDlFHY
	 LKM/+Kardo/io1Q+Rp3N/I3vtuQBgqnVFnQ0DTosu/3mi9Ut55wjdAVVsJmML6SSGs4zt
	 OuWJZHyRTs5ltWWhGkPoZV6D6juCKeaj3L+vJDIDPMrO/UQAt5j2r+fGd3nvoMrVLkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792937313;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IHQuY49bT6r89fdLO80x1UXeaPCfUCT1KvncrKpCkaw=;
	b=mo26TQxgstAkXlwlmFccmr75DHB62eL5Nls0yIWKW6x2nUt/MAAZcFWNuJL8ezzYx7Ct
	 xtKG9soj5tla7LNnyrCToVJbp4PuV0F9xeUy1FuBTZDfXNeJcOCFjCUXnboJV/8ZtLtJe
	 iE/9BcQPYNohUb5PUzitkAHU2pc/2nDmg9VXUbeNLhSedhVbJoN4M/7fWssa/WuOck+tr
	 mvBz23x80y0z7E2M19SEsz0zRk97D7oX/gX5HjW6L+I+siX1dC4O+Xf4spRa96WtQooNN
	 xdzBvo93eahsbDXp7+8UHKMokyHbhjw9tjttbhukcOzg7siiSse50JQ3tuRF7bdgiMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="MUByVO/3";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5619C606A31A;
	Sun, 25 Oct 2026 14:08:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUByVO/3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A43BF1F01825;
	Sun, 25 Oct 2026 14:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792937312;
	bh=IHQuY49bT6r89fdLO80x1UXeaPCfUCT1KvncrKpCkaw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MUByVO/3AeUY2b6doKVB3R7DcuVuKZRRYpf3mkGzwhw2KR7BkEJNjg1qR5AK3u5C/
	 bkXYrYoxaIPX1uaXqmy278akFpqLlUVW7eM6vN5N1L8Ka6gVVPBoAw+kEEUCkf3pc1
	 T8R/I/ejYDUrX6E2YFJ96tQ+Og2abSAnmHGrEQr5p26I9VRUu6I5DX3/kZgxT3OGpy
	 jxSHO/pu5KWMXdl+MaXnjh0eu60NTO2ff80e40IOwxGRlef2wD6LFQGJ7mA9jDtnAN
	 qqMpHEd1FWQG+rDgaRPLiLUPY2WgcG2uU5/hg+kvIFhHh6YQYX4n2p3dTK7wdnMVgE
	 iROZpRScZE28g==
Message-ID: <sashiko-outbox-184239@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] pinctrl: sunxi: dt: number the IRQ banks from
 the first one that has IRQs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pablo Mazzini" <pmazzini@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-sunxi@lists.linux.dev
In-Reply-To: <20261025135745.102970-2-pmazzini@gmail.com>
References: <20261025135745.102970-1-pmazzini@gmail.com>
 <20261025135745.102970-2-pmazzini@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 25 Oct 2026 14:08:32 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] pinctrl: sunxi: sunxi_irq_base_reg() ignores irq_bank_map on A733
--

commit 1d99efa95c547fd409284e1974176bcf35345f69
Author: Pablo Mazzini <pmazzini@gmail.com>

pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs

This commit updates prepare_function_table() to number logical irq banks
starting from the first bank that supports interrupts rather than bank 0. It
also updates the irq_bank_map tables for the a523 and a733 pinctrl drivers =
to
map logical irq banks 0 through 9 to hardware banks 1 through 10.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctr=
l/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65b..3ebe926a1bc6b 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -21,8 +21,11 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_=
BANKS] =3D
>  /*	  PA  PB  PC  PD  PE  PF  PG  PH  PI  PJ  PK */
>  	{  0, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14};
> =20
> +static const unsigned int a733_irq_bank_map[] =3D { 1, 2, 3, 4, 5, 6, 7,=
 8, 9, 10 };
> +
>  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
> -	.irq_banks =3D 10,
> +	.irq_banks =3D ARRAY_SIZE(a733_irq_bank_map),
> +	.irq_bank_map =3D a733_irq_bank_map,

[Severity: High]
Does sunxi_irq_base_reg() actually consult irq_bank_map on the a733?

With the change in prepare_function_table(), ports b through k on the a733 =
are
now assigned logical irqbank values 0 through 9 instead of 1 through 10, and
a733_irq_bank_map is added here to map those logical banks back to hardware
banks 1 through 10.

However, a733_pinctrl_probe() sets SUNXI_PINCTRL_NCAT3_REG_LAYOUT, and
sunxi_irq_base_reg() in drivers/pinctrl/sunxi/pinctrl-sunxi.h handles that
layout without calling sunxi_irq_hw_bank_num():

static inline u32 sunxi_irq_base_reg(const struct sunxi_pinctrl *pctl, u16 =
bank)
{
	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
		return pctl->bank_offset + bank * pctl->bank_mem_size +
		       A733_IRQ_REGS_OFFSET;

	return IRQ_REGS_OFFSET +
	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
}

Because the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch multiplies
pctl->bank_mem_size by the raw logical bank index instead of
sunxi_irq_hw_bank_num(pctl->desc, bank), won't all gpio interrupt register
accesses via sunxi_irq_cfg_reg(), sunxi_irq_ctrl_reg(),
sunxi_irq_status_reg(), and sunxi_irq_deb_reg() on the a733 ignore
a733_irq_bank_map and access hardware banks 0 through 9 (ports a through j)
instead of banks 1 through 10 (ports b through k)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261025135745.1029=
70-1-pmazzini@gmail.com?part=3D1
