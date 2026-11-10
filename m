Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316881;
	b=yQkLfPYZ/Mk+3o3DqlAGSoscs2i1pY3ngufX66ATS0Kxaqeyoc9FLJVeEEVzFAa408LJ
	 BORyfnBMYPwBR3+lp3KTQCbRz7I5xRnhvUXnQq23Ljpybs+0/4LA/b6GlwtKZYLd0fzSv
	 jRaIdqNg5C7gWHV86Mh1j16OrbgxjfNOv3yfeivlvI2IJQpniCavXoywXPTZ58XRIGPXW
	 ZjFtBzsEaHoMsnxDga7wkFYS4FaSXHCiK0kHjy0zzAtbX/3Aq9byzrQmcHCx8Qnk6Egn0
	 xezcr9KtNvjoc/vB/BHGkoeZL85U/ulpAcqhgdx3G5UHF/1bvcFpfextc1GV5eZFg0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316881;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MdLlX+Rnx7zcplFi3lvqRjMJrUi+pmU8yE0nWBOJajQ=;
	b=o/MV8CUzn0RHxZP0PDWXb9HgMMhesVEJXubD4Lm2JO9tvztrgJnQ2QTBxGpvccoRn+7/
	 Iz/TSVRk0tDp7lNt+P3U0YXJrIH5YNMl/K19qi1jxl3yCwKPNcBwRcCR421IPvWryKQb3
	 MfpK8Pw64RvTI6KJZQ1+cbGfXQeIRMZOtoG+WyLClKngY/gqty6GlcwA2Ub/h9m6jkOWj
	 FckA/0a9i8wd3Y7OL77x83l083vDDFHEtzcm6NAl9i85KSOwAiMtr/IFt3L/eu+O2JCxx
	 WXXzaOfKKoiN4EYzuAjWGKoerxHSjtKD15H5+9V81bFfSCOB7w7qJTKUnzwKH0TvGJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwJeQsfk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C4C606B191;
	Tue, 10 Nov 2026 13:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EwJeQsfk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3450A1F0089F;
	Tue, 10 Nov 2026 13:21:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794316880;
	bh=MdLlX+Rnx7zcplFi3lvqRjMJrUi+pmU8yE0nWBOJajQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EwJeQsfkplTrN+KaYC69OJJMBTRuRZab4p+l11mIS5AwDONYHdtZBuAWr6fV4GNvi
	 cloFWFOepu6pd2+DyHeeFoMAjkCHdH53i4o/Y/KHC/aizSnlA5r1XvnZbX7W3sjxSF
	 DrlKFQRn75XiDPq1MuYRQWTFfBY0k12nghBuGQpQ4CtI3ezK39Te+mjC9Xw6ulFAjC
	 vYYn2IvIPXjj6724LKHYdpQkg2IZIoUc013bjqDqSc5XqzpPhhn4KJuMWmUKKfoxN+
	 busM2CJBLoD/+G3dRpSAA+woZt66x8UTDwnp7xfTPfTQ3+X9v1l9zLswYLT/YwRoc2
	 BxTUGppRExp9A==
Message-ID: <sashiko-outbox-207115@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] pinctrl: sunxi: a733: do not switch the mux to read IRQ
 lines
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vinicius Pedrosa" <vinicius.eduardo.pedrosa@gmail.com>, linux-gpio@vger.kernel.org
Cc: linux-sunxi@lists.linux.dev
In-Reply-To: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261110130157.112155-1-vinicius.eduardo.pedrosa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 13:21:19 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] pinctrl: sunxi: wrong A733 IRQ bank offset calculation in
  sunxi_irq_base_reg() [1]
--

commit e0da3dde27e4a3b5c2c95273c0b30e65e89fd5f3
Author: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>

pinctrl: sunxi: a733: do not switch the mux to read IRQ lines

This commit removes irq_read_needs_mux from a733_pinctrl_data so that readi=
ng
an interrupt line does not switch the pin mux to function 6 instead of keep=
ing
A733's interrupt function 14.

> diff --git a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c b/drivers/pinctr=
l/sunxi/pinctrl-sun60i-a733.c
> index ca82f08a3a65b..456d9170c2a27 100644
> --- a/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> +++ b/drivers/pinctrl/sunxi/pinctrl-sun60i-a733.c
> @@ -23,7 +23,6 @@ static const u8 a733_irq_bank_muxes[SUNXI_PINCTRL_MAX_B=
ANKS] =3D
> =20
>  static struct sunxi_pinctrl_desc a733_pinctrl_data =3D {
>  	.irq_banks =3D 10,
> -	.irq_read_needs_mux =3D true,
>  	.io_bias_cfg_variant =3D BIAS_VOLTAGE_PIO_POW_MODE_SEL,
>  };

[Severity: High]
This problem wasn't introduced by this patch, but does sunxi_irq_base_reg()
calculate the wrong IRQ bank MMIO offset for a733_pinctrl_data [1]?

drivers/pinctrl/sunxi/pinctrl-sunxi.h:sunxi_irq_base_reg() {
	if (pctl->flags & SUNXI_PINCTRL_NCAT3_REG_LAYOUT)
		return pctl->bank_offset + bank * pctl->bank_mem_size +
		       A733_IRQ_REGS_OFFSET;

	return IRQ_REGS_OFFSET +
	       sunxi_irq_hw_bank_num(pctl->desc, bank) * IRQ_MEM_SIZE;
}

Because A733 implements no PA pins (a733_nr_bank_pins[0] =3D=3D 0),
sunxi_pinctrl_dt_table_init() assigns logical IRQ banks 0..9 to ports PB..P=
K,
whose hardware banks are 1..10.  However, a733_pinctrl_data omits
irq_bank_map, and the SUNXI_PINCTRL_NCAT3_REG_LAYOUT branch in
sunxi_irq_base_reg() multiplies the logical bank index directly by
pctl->bank_mem_size without calling sunxi_irq_hw_bank_num().

As a result, IRQ register accesses target hardware banks 0..9 (PA..PJ)
instead of 1..10 (PB..PK), shifting every port's interrupt registers by one
bank and leaving port PK interrupts unmasked and uncleared at probe.

[1] https://sashiko.dev/#/bug/linux-213c0bba-8e71-4432-952e-9f5e320fd4b7

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110130157.1121=
55-1-vinicius.eduardo.pedrosa@gmail.com?part=3D1
