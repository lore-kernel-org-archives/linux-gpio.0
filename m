Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870679;
	b=UqetUNA/yWszKIt+upzHMKQ0qX+5QZBTQxqmvhk/eFV1zKXVCPQyHTtsaef6H2tytwKG
	 VE3SVadGL3xmDjhAWAWDYqooApeyFX+5bzETE1aTbCKWgS7F/wBoN7yNp6Z8rDKHrZ0Xb
	 y5HA+eMVbvR8EPb4KSfCXwvCnyYrr6pSUPg1hLPyYzF2iZMwAPBVSYJtID6fAZbVex3bz
	 u5OkAzTVAurM6ezHVPA5nW+Yg+1x/g/P8dLRgcogYaMh7IqjFAYrOOwnHDxb858do+mXU
	 qVvTrGWvbWAIrprCS4RQ2zIlpt9WuOll2Kcua4KPhmUEIdUg1+fSB+BpiKLrFmbRP2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870679;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=tTqFMC2jfQkWpp4eCpCGIoJ+qOTGr5oTYuPt6Wn0ReQ=;
	b=gjrCB1R7hXOH1jOqOB/I/Pn4eWVg36CdNi5hFgI6Fw4C14eAgR0RorQCzvy7hqc6LZfH
	 WrTZ2qJsmNXXq59329jbSfMYjE9uTPzP2L8VRSQGbGal8t5z1jhAmX6hegXcLKI78rB3G
	 ui7WI31nzNBlmSBLPa/QEwdG3KoqfVQSNT0Lrkeabp0r0iT2sl/dq5S9r59JQoX+CM6sc
	 7OJpVrW1G4OEvcAkS4dQiRa9OmV5BjA3lxcLEGpjFAznI+s52aZuiHWpBF8fPm7vuRvMa
	 5R8asVcdrfDPHin6ndYCdTajobKv89i/WmLXKFy56ngsi2vpvmMK1IYSY6dkdx9+UMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkakNWVr;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4A4606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NkakNWVr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A67E11F00A17
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793870678;
	bh=tTqFMC2jfQkWpp4eCpCGIoJ+qOTGr5oTYuPt6Wn0ReQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NkakNWVrpeJsHpQJZkDxNGNiBhdjE5CTeu0BAedaN9KKhqePQp6RTOZf4Bek5pCVN
	 bVJwEl6wMnv6pqrJVQ4so2nmQ+AnR2RQnxHTv92qHB+7P/ijwgoJyNXhi+YMHvtPVF
	 H/IPvS22QXuSFDaizD8YzQCYn3REuSABlBf6sklJqw4ZbDNLbkzKhkjHG/2iaoZ5wd
	 LWRdvXjuk24Zl30+q8nxvnaty1AX5vsSfYRlAXL3bG5h71c9Jvcb6k3aMcV5nqYuL/
	 q2iZfTm+9naaoTCsOhcA08yYYVPZJ4sqyp9qqb1aEdubjBKDlGqdPBNRRoWPJMmhBw
	 ZV5HMsbtriN6w==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfc2ae6e9dso1309675e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 01:24:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBw5NI1L5A1pd7bJs35slXOcSREV0k9qtygRf+dWVRHM4X2DZb5ajH8nLU3EoEtPELvUJ0aCSfnkunGZ@vger.kernel.org
X-Gm-Message-State: APuU4Z/i7ZQ2pfCp4OvlH8KrDM6H/CZCWWAe1LefXDUKOctgGH29eq/g
	USoMhcjSRXuiEZJ9+ldu+9604xv8CQADXpsRYgUJd0SOKmX42PuthcHYNdRhdfrhIgySfcXJ9rp
	eAaqmlFhddCxD3sgevT7Yi7rr4xMPntk=
X-Received: by 2002:a05:6512:3f17:b0:5bf:d1c4:a01d with SMTP id
 2adb3069b0e04-5bfd95206b9mr6296528e87.2.1793870677493; Thu, 05 Nov 2026
 01:24:37 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103213002.1673560-1-lee@kernel.org> <20261103213002.1673560-7-lee@kernel.org>
In-Reply-To: <20261103213002.1673560-7-lee@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 10:24:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLn0vx9bv7ZUvcPX+Q_E4o+zb-rtfEmsZgw00gMGTVY3Zw@mail.gmail.com>
X-Gm-Features: AclHuK8yYE1rSjLkW5nBivqJEc5ZKlRnSUlmLXkEBc7bHuzlAPbz8NNmplKC7xw
Message-ID: <CAD++jLn0vx9bv7ZUvcPX+Q_E4o+zb-rtfEmsZgw00gMGTVY3Zw@mail.gmail.com>
Subject: Re: [PATCH 06/10] pinctrl: realtek: Fix bit shift when configuring RTD_HIGH_VIL
To: Lee Jones <lee@kernel.org>
Cc: James Tai <james.tai@realtek.com>, Yu-Chun Lin <eleanor.lin@realtek.com>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.com>, 
	Tzuyi Chang <tychang@realtek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-realtek-soc@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 10:30=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:

> In rtd_pconf_parse_conf(), the RTD_HIGH_VIL case prepares mask as
> BIT(hvil_off) for regmap_update_bits(), but sets val =3D 1 without
> shifting it to hvil_off.  Whenever hvil_off is non-zero,
> regmap_update_bits() masks val with BIT(hvil_off) and clears the high
> VIL bit instead of setting it.
>
> Set val to BIT(hvil_off) so that the target bit is set as intended.
>
> Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input =
voltage and high VIL")
> Closes: https://sashiko.dev/#/bug/linux-e7077311-3f30-4b77-844b-1447519d0=
c84
> Cc: stable@vger.kernel.org
> Signed-off-by: Lee Jones <lee@kernel.org>

This patch 6/10 applied for fixes!

Yours,
Linus Walleij
