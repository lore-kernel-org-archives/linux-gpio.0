Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793866700;
	b=n8WR1+iSzb3ioR+qgS0kpCn65yPgc/00iGycqXIuEd+lDWMR1iu5+LORIYUl7MAYXzk8
	 60CQgtQGuJnrX2Ip+QgLd4eT0gKJgXN5Pz7BaH+vXlzlAEZvyBYXCsDtjQy7fvIicbYXW
	 qiqRXm7vgCAgu+8xieM5TX/+GZErw1AEkuo7eWHNJfeZOZ8U8rssHsTjkcrIRDUPA/B4H
	 tETVX3A0gCZaeRsFk287jvk2taSrteHAQoexAUlW2psoXCBZHqLlS4+TJL/grYyDjEGDn
	 IyFueL9m1AdfU34EfGMttylibcTo2na96sXFjzqV8vFs4lsgQYW3MSkIL5Knq4A/B9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793866700;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GpvzrD7F7jCcCoPYNwHv5Dd4S0jtahNQZKslWEbQ0P8=;
	b=ywDTvmLRRbSAMyAhUP2V9yOfSoJFXbkFtxDfFFUmhsjmvpPkx+FwJcyWL27M6HFdcTNS
	 k5uB4URFTkskgC2NvW9uJcxULfl0diApcEDouEO1n8Ita/ppgEuYsFSYeCM4jd27J4F+a
	 /XMODfnhd//Png3K48jCGBHCst8qVYMwFCpoI9J/myP0qIekGMHl59epZcnPb5mBhJU6Q
	 HN4GKUnjdWXju7T+SmbtZ1dQBD2R6k23AmzxbAyJal5btJVBLd7rKtMEAMR0qnDI4yz29
	 LCqcMZwngrk24w7SVtIBKPg3bKNCpLEAvpQVHcNYJd3S8gSx3wKKEULWukdXNrMMmhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccwPl9nR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066DA606A326
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ccwPl9nR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC6711F00919
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793866699;
	bh=GpvzrD7F7jCcCoPYNwHv5Dd4S0jtahNQZKslWEbQ0P8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ccwPl9nRkf2ZOFBjnTxVK9cOOfKgAS0ppaY9JPoljHKTeCyNa9xXaim+rywFlFRCv
	 G1napga9Rx4UzdL4Mn1Sq9z+JsNwcl9oW9zUqAXhva1vSdaNMeCCAAfxJmSJKAUaZZ
	 Mcn9FCcz+TohZC4yZX/l6pC3C/hqfNiTc3bXH6JGk/q+OalieFL1x35auKhG7XM1rC
	 OH5vu/nlTcDJK3ge53Zgd4guj+0q2ER5BubCx0Z0myIfLLinvggLVQeFgphzgrK/SX
	 gKHp+NvCf1wNGVnMNCYNuZf4i1hlEXUvOvO0t48DPi/qG26tR5szmrOylkGikaJGyM
	 pAHNDJS3mjmDw==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso1127415e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 00:18:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByI20TdkLHWFawnO4lmQY9G2ZZkRvjhoKWviXV1qa42weOAXeQsQ9eaUvm2qle7qfCGzK9a9GGxbgMb@vger.kernel.org
X-Gm-Message-State: APuU4Z9zAgELEoXfnYeQHdlKFuFSSGvJbz/HwuseIRgD3fkYCZS+W1zZ
	9AtpMfT92Xf072RQq071jeT8vjvIyxXcjbTyhKxhRsUBWvyF4w53zoiDNf8JLr2XvqL9y2FA42a
	l2FOwxEvfa/dfKBpdXW2jrBrEdgnlo4Q=
X-Received: by 2002:a05:6512:33d2:b0:5bf:d072:fa3f with SMTP id
 2adb3069b0e04-5bfd957dd98mr6086669e87.54.1793866698495; Thu, 05 Nov 2026
 00:18:18 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
In-Reply-To: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:18:06 +0100
X-Gmail-Original-Message-ID: <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
X-Gm-Features: AclHuK9XBSPBxmFe5Hgt9gaUyZoB-LuyN9Cx81zQH1wuYsj1bWqxtM_WPhjaH9k
Message-ID: <CAD++jLkRYb1Pn2G=cP2yGkSFbuHhzRQ-fDbTygmpxbCsm-02gw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and
 skip unhandled EOI
To: Munique Feitoza <muniquefeitoz4@gmail.com>, Mario Limonciello <mario.limonciello@amd.com>, 
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 8:50=E2=80=AFPM Munique Feitoza
<muniquefeitoz4@gmail.com> wrote:

> When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
> that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
> currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
> BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
> INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
> re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
> and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
> main and RGPIO banks.
>
> Additionally, if no GPIO interrupt was handled (ret =3D=3D false), return
> early before acquiring gpio_dev->lock and writing EOI_MASK to
> WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlock
> contention when the IRQ line is shared or asserted by an unhandled
> spurious interrupt storm.
>
> Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>

Sashiko comments aside, we really need to put Mario on CC for
AMD patches, Mario what about adding yourself to this MAINTAINERS
entry:

PIN CONTROLLER - AMD
M:      Basavaraj Natikar <Basavaraj.Natikar@amd.com>
M:      Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
S:      Maintained
F:      drivers/pinctrl/pinctrl-amd.c


Yours,
Linus Walleij
