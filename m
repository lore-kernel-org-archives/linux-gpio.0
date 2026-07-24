Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6542746A5FC
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784929490; cv=none; b=AfpbzG9R7XxRC/fjTgx4Lo4df56XMk/jrgN6rb5Ch9IJHFYGB7nDblkYAozz8ATjQW8yPfV5HphA9oz+N/EVD67WddP4OlR7wG2Q3g3NkdJMabbyppdRGNTxbwOjkvbppwL2S9JPfrJtpavVl734S7WuB/nBCmzV7pcS8TDWg+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784929490; c=relaxed/simple;
	bh=7TBvzvmYUVLHPXKKwI4xXmJyXzmc1JDiIJxpABFT5hU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BeW1H6kiOTy/k69ek1XA5Z1Q9htQNYUBgTrCp3ov+JJquEp3OGTIczQyKtRValrx1B+38BJmNkrxfnZwPXfUkck8y5lr33UcXr70FxegbUo4xhbNRyZit+ZKuC01RprCcGMLgO9aEVyVfa/rIKhnXp2V4/i2woKVyROBRXDPhUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uo2aPzzv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uo2aPzzv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0BCB1F01558
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 21:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784929487;
	bh=hs1xmwdeKAsh7q8PV1ezAfF/O0QRzKObCak5JHKTyeY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Uo2aPzzv4PTL3ojE4Qmu//GKxHF2Eagk/ty2ryrBYBbYk1xyexy9+2D/B2lC5lPqt
	 jjXh2GuXbqtdhTbMIRLa7LlTVQQfvjbUmXHQKzabHDVlIC9CraILx9uzc9KYiScGIu
	 eZbYCLxL8oUbe3GIu4awVaDXounnRYnKFCvvJ+8bmGCoAFjenKyJ4/CcBSNGF2AvhX
	 LRSyqlB8r/lS8oaBDDo4Qo+pF8ZwiLFrlA0ECAlOuT1GDKFvymPOI/eTwRcjiN8pwO
	 rAmVBrnoF3vwQ5+lBKQPCXlhmQX9h52vFDjtPOUw6+xkikIa1EaDT4ANdX7ZPywrA9
	 1pJCdsz4hghwg==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c9a3acd40so7011061fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 14:44:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpT0P39QGWFMSqj4ieqw7IFYCcGWqe2ancL9tyPpf7/6kwRr3YV3nz/J9rQiRl7743vBQd/hZszAb3r@vger.kernel.org
X-Gm-Message-State: AOJu0YwNK5u7c1B3nZrhZfion4k7CBxVFQqZHiSwHuJ3uVmUVV+CdO1P
	uu1Zy4SuW7lDHdOjZ2Gc/TqDCzK0uBcatEdIR3qKuEurgTRzLgERyCvZyZZF0zbpphqIrpjLIZe
	n9F/Pjqs6go0NowYlTjTvHOXKzBP2O1Y=
X-Received: by 2002:ac2:55a9:0:b0:5b1:5061:e5dc with SMTP id
 2adb3069b0e04-5b2b2f7df3fmr1260432e87.64.1784929486602; Fri, 24 Jul 2026
 14:44:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716033441.21330-1-julianbraha@gmail.com>
In-Reply-To: <20260716033441.21330-1-julianbraha@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 24 Jul 2026 23:44:35 +0200
X-Gmail-Original-Message-ID: <CAD++jLm+xOW3P_uPEb3_xXn-NnfzO1May5D_raS-KyaBWZAcFg@mail.gmail.com>
X-Gm-Features: AUfX_mz9WbxVv1wJ4mNi8OkOhtnmNOE8vfWiY7hGjzwcubLKTv3Ckuv2sAisxMQ
Message-ID: <CAD++jLm+xOW3P_uPEb3_xXn-NnfzO1May5D_raS-KyaBWZAcFg@mail.gmail.com>
Subject: Re: [PATCH] drm: fix unmet dependencies from missing GPIOLIB
To: Julian Braha <julianbraha@gmail.com>
Cc: andrea.porta@suse.com, phil@raspberrypi.com, 
	bartosz.golaszewski@oss.qualcomm.com, iivanov@suse.de, 
	joshua.henderson@microchip.com, lee@kernel.org, amelie.delaunay@st.com, 
	rjui@broadcom.com, sbranden@broadcom.com, yrdreddy@broadcom.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 5:34=E2=80=AFAM Julian Braha <julianbraha@gmail.com=
> wrote:

> These 4 options, PINCTRL_PIC32, PINCTRL_PIC32, PINCTRL_IPROC_GPIO, and
> PINCTRL_NSP_GPIO all select GPIOLIB_IRQCHIP without ensuring GPIOLIB is
> enabled, causing unmet dependencies, such as:
>
> WARNING: unmet direct dependencies detected for GPIOLIB_IRQCHIP
>   Depends on [n]: GPIOLIB [=3Dn]
>   Selected by [y]:
>   - PINCTRL_PIC32 [=3Dy] && PINCTRL [=3Dy] && OF [=3Dy] && (MACH_PIC32 ||=
 COMPILE_TEST [=3Dy])
>
> Similar options in this subsystem select GPIOLIB, so let's do the same he=
re.
>
> These unmet dependency bugs were found by kconfirm, a static analysis too=
l for
> Kconfig.
>
> Fixes: 2ba384e6c381 ("pinctrl: pinctrl-pic32: Add PIC32 pin control drive=
r")
> Fixes: 1490d9f841b1 ("pinctrl: Add STMFX GPIO expander Pinctrl/GPIO drive=
r")
> Fixes: b64333ce769c ("pinctrl: cygnus: add gpio/pinconf driver")
> Fixes: 8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadco=
m NSP SoC")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Fixed up subject and applied as nonurgent fix, thanks!

Yours,
Linus Walleij
