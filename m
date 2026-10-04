Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFD193F39E2
	for <linux-gpio@vger.kernel.org>; Sun,  4 Oct 2026 06:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791095948; cv=none; b=Z9JvGkzMkC0H+6katlcY6nB8Xf/39uAJX5KuZrcflOfO402Si2XMAQTg8kpEV62TXUDEib5omljSqAbLGTD9mkbEoumglqLVs6PvT0ZiqHjeDG5yr0gipHK49nVtvZlYFIP0XknbhaY3/9cbptqeNfPdVaJe8YAj6J8ScuFZhSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791095948; c=relaxed/simple;
	bh=Y7EjX751Z2kdVCaCpsvCYVebDfqPAwGp3Im7F4WlXSk=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=E66JgMcdOCX/uOokIxrXJ4dZiCv+K466MitEUCZ1Tf8PhtoAX8EU4fOKzdP5sVdpvv8Ttjr/8DUBLbaBIxsX3M1FwWV0VDWvm906oL/Fm+fFvik35eHleTqZCKS++UhvbZOSxNLCNlr9mvBp+IxcQ6TWwyh9BDLF+Z9yVGENEqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=E2Ez0S4t; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="E2Ez0S4t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=ypm3tercgjcidctqjyemeslyim.protonmail2; t=1791095940;
	x=1791355140; bh=jkeBQXMC0mxk0cVDHkusiZ0VJqmjJ/qXxgzgEOL765k=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=E2Ez0S4tFO8YVQ8T5qWnVIic2lvgr3uh0+BneFzPTl3KOrw/shTnKvF9OrARpxbl9
	 p03kHEZDlviTZPO3vjguFBd1Fd/ypPxNdH3jJdwBq/RoGgCD4YK1TeIN2sWZEIpEhw
	 OL7zWysttLIM+ka6wB+hWoWgcf9VkX7OMObcCozhI68Ej6WGmu3oN4uBs+pFH9Z22E
	 8F7Elywq9okdORKCk22Y2YHkvW3uHjZb98eHXULmXerj47t2Mfu2TcwSdPb/iccbxm
	 /CpXcM5zZ3l+WhTyr4imdHXixLGOKvyKTTAb3Om5fQgXWaU1SWErzz5YSU8zImtvjp
	 84KUwJA+ryfFg==
Date: Sun, 04 Oct 2026 06:38:56 +0000
To: Andre Przywara <andre.przywara@arm.com>, Linus Walleij <linusw@kernel.org>
From: Norman Herms <dockseed@proton.me>
Cc: Pablo Mazzini <pmazzini@gmail.com>, Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-sunxi@lists.linux.dev" <linux-sunxi@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: pinctrl: sunxi: a733: irq_banks too small for port K
Message-ID: <lqyUiTS5jK5vqN8dT8ByLl8sBPTW6eSDG_13v8UAkVIUCnnxLv4UBrlHTm0c7f4brqOd5ur4sDdgld0Ol4usnXOHgJscjqwJl2BrzPpJk5Y=@proton.me>
Feedback-ID: 144388465:user:proton
X-Pm-Message-ID: 9d76db5c45f7d18900f3d56a77fb38acbbf9487a
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Andre, Linus,

Observation on "pinctrl: sunxi: add support for the Allwinner A733"
(Andre's series [2], now in linusw/devel for 7.4):
the A733 pinctrl description sets .irq_banks =3D 10, but PA does not
exist there, and prepare_function_table() in pinctrl-sunxi-dt.c counts
IRQ banks from PA, so PB is 1 and PK is 10. This is the same
numbering problem as in Pablo's thread [1].

With irq_banks =3D 10, PK (26 pins, bank 10):
 - sunxi_pinctrl_init_with_flags() allocates irq_array for 320
   entries but sunxi_pinctrl_build_state() writes PK to 320..345
   (104 bytes past the end) at every probe;
 - PK gets no parent interrupt and its hwirqs are outside the IRQ
   domain, so there are no GPIO interrupts on port K.

Measured on two Radxa Cubie A7S boards, same kernel (v7.3-rc5 plus
this series), once as is and once with irq_banks =3D 11. Requesting
edge detection on PK0 through the GPIO v2 character device fails
with ENXIO as is and works with irq_banks =3D 11. PB0 as a control
works in both cases.

KASAN (generic) does not report the overflow on either board. devres
rounds the allocation up to the whole kmalloc bucket, so the 104
bytes still lie inside the object. The out-of-bounds write is
therefore invisible to KASAN here.

Regarding Pablo's thread: with the convention Andre preferred there
(count from PA, placeholder interrupt in the DT), the A733 needs
irq_banks =3D 11, which also matches the binding (exactly 11
interrupts). 10 would only be right with the renumbering from
Pablo's patch, which is not applied.

I am not a kernel developer. The measurements were run on my boards
by AI agents, and the analysis was done with the help of an AI
assistant (Claude). This is a report, not a Tested-by.

[1] https://lore.kernel.org/linux-sunxi/20260929203634.32998-1-pmazzini@gma=
il.com/
[2] https://lore.kernel.org/linux-sunxi/20260910133519.459011-1-andre.przyw=
ara@arm.com/

Thanks,
Norman
