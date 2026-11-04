Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793797700;
	b=xyaO2+2kb05PxYdfLOR+yEAD5/CdflUYfaondxNnH9gWEawlGglolgTjBubXvhEVkj6V
	 YBVe23XioZQsYzH3W00n5EzBG9CybFqDsYQSwVvnOrVtX1iV7hfR4ScyiYj5SMzlEVEfk
	 yn0MujRgou9kwAed6AO5vx4/4FAnmClPf7sC8ULfzRgNBVGsEpi7VHBUiPxMWstxNrKXM
	 +rlDzNL19YSPXiXD/L3VMS2IAqrfmjWTPv/4yzTZJbkeq2hoAZPulturOCDkzq5vfOglc
	 E1xiM/FtweB4a1VMQB3+Zuu6ls++vCWfimkPjcUjSeiZEkbpDeMM2CJ5lww43qY8Zww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793797700;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=26kcf/vMrCHQyo7noPD3338edvr5n4vxSlfc+BWEgS8=;
	b=QJUa2f+F64QPwXSjTHU08culeJ9FdsJDbV11CfGMAnHqF3q9cXaP/VUweppzMM5O3nua
	 BpVUGF71JyR+z2+z+Gh5zpR1q4zziwqbj/TE9hB2qRSOmNfyBroBgfuX46bTWsijk8T2d
	 zyoN1oSHMxrppWeMkjBVnH2xZQf4N4tHesLBNWQiitnBSXxbs3wDfeJrGrEvLaO0Oc/lj
	 1Z/yN0cGYVlRyp0Az8gCb7JvkKxp8dGY6uWD1NrTip9T/lbV0Y8LgHjQW4m3Jl6tj42Dr
	 KRlCtnDIAA4Sdug5Cv+qdtSgzRfDx69vz1GUNNGye3UBDAIwaTlcW7h5mQTPaN0Gsmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2dV7xBK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E2E606A31B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f2dV7xBK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580871F00919
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 13:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793797699;
	bh=26kcf/vMrCHQyo7noPD3338edvr5n4vxSlfc+BWEgS8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=f2dV7xBKvTn6FAmkqiHP6g8a6otPToHBV/wK7r0g09nz2QzboIsEpKBLayDVKWu0E
	 COu5b/inAKXVdJ47Gnw24+E6Uj8VzLaKpAZPQIdoZmOeoh/xXtVotpIDsiRk9Jy/wY
	 yAlL8j0nrt+Xzx/Kt1AgPWLWVF/RR9lTsyIRJYK07egNFo82mpwyslrp2IqqDHr5jH
	 6mueKbknplDvXYx0syMLpR3ftTPF8NJlcbbIJK+nFwnZEFmTj2kEWZlJPu7dixPdm7
	 D8LoIPoVRXP6jycqMw78xnMWLjFb8r2F7MoFzZckRsfG86ncKwzSyLkkwAwfDov7/3
	 RJt7gWChyqpaw==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so810878e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 05:08:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy+R9xVColy0nB/+fW8WKAXKtWOodYGf4PSA7YH40fghqAmLYLRIXxMp9+iPhZ1m+/GfbcVnXcLX+UG@vger.kernel.org
X-Gm-Message-State: APuU4Z+DgVdcqf/vzaygJKHOGrdFCjXJjgW2mSTFWgjD7K3AqejLhrSI
	rGFSZv6EvyIi3iw0PGixfH8oE0FMM1lE3IGpKtLn52FGa92oRByjhIludtPtXOtui9INBLjFeDr
	XGg4DCNvjSqXu5INAhHfB6Fcl9fcqV1U=
X-Received: by 2002:a05:6512:b94:b0:5bf:b5a1:3c09 with SMTP id
 2adb3069b0e04-5bfd95762e0mr5771686e87.31.1793797698160; Wed, 04 Nov 2026
 05:08:18 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021183716.718318-1-florian.fainelli@broadcom.com>
In-Reply-To: <20261021183716.718318-1-florian.fainelli@broadcom.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 4 Nov 2026 14:08:05 +0100
X-Gmail-Original-Message-ID: <CAD++jL=o_DeVNGjHLxuhpDggg4dAuzzG=-UXDVMNgeUhtTYK3A@mail.gmail.com>
X-Gm-Features: AclHuK88BqPw7V6bD677Ez2Rf4GqLNeT0S1fsbGULVrD1tlIZlRJt-eflez34qQ
Message-ID: <CAD++jL=o_DeVNGjHLxuhpDggg4dAuzzG=-UXDVMNgeUhtTYK3A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nsp: support both-edge GPIO interrupts
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: linux-kernel@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>, 
	"moderated list:BROADCOM IPROC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 8:37=E2=80=AFPM Florian Fainelli
<florian.fainelli@broadcom.com> wrote:

> The SFP core requests rising and falling edge interrupts for module
> presence, loss of signal and transmit fault GPIOs. GPIO-A only has one
> edge polarity bit per pin, so the driver rejects IRQ_TYPE_EDGE_BOTH and
> makes the SFP core fall back to polling.
>
> Emulate both-edge detection by arming the edge opposite to the current
> input level, then rearm it after acknowledging each interrupt and before
> unmasking. Resample the input while programming the polarity so an edge
> during that sequence leaves the controller armed for the new level.
>
> Fixes: 8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadco=
m NSP SoC")
> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>

Patch applied as nonurgent fix, tell me if it's actually urgent so it needs
to go into the -rc:s.

Yours,
Linus Walleij
