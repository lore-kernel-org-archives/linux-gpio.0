Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14138370ADF
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 13:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791464960; cv=none; b=SM35zeIUoKnGNpHL8jkttr2cNBaTUWzUNpjveOU55vvfjTNCHce2GbwpWIcAsL0y6ZNf0bmi6IU2MdwDkSWskX30hfn5TBBK5K7FF9kPWrrGV+aUFCwksm+VgbbwF6tAacb6rJFxlma1IfnhYEHWgFEeDGaL0yoxx+7XvSgFHCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791464960; c=relaxed/simple;
	bh=V3eTIHy2DWi3v2L3wOUlRbxeTD70UP9xOW8gQT+EMBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eKfbCxtYqK0WsV/i2GaU6uPlQr10v9NzlnzY2tICWI0lhXY+ryIqDINuC2zQjg4GIEY4fbE4OwmTZWRU059FLnXObJfaCDgOKoP/uHfHPFQEDWwzEj7FYIBPeNdPPG9pfyardn+KT0cxB16l/msYMcI+LkoT9EUXgfxaEFosQ7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YA4+/Fmo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YA4+/Fmo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF33D1F0089E
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 13:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791464959;
	bh=06Y+ZmPCA1Ov0LyWhX2+GB0CQGOz7fspMTCa9v78ZA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YA4+/Fmozoz6fNsIAaGAR+QNTnG2Mm4EX2ktZEjgMF9u/fK57Z5LCgbgUs55ude8d
	 RksTbJ3ptU48C02m4E/CXPl1AqqiUAOLHav8dmpR75E62Bg2c0Ys87qC87F6JASHYh
	 hGZZ6FGfkR91amW+eWPKbSt4oDSPMemQtDYYX3SFNOKjabd7V1NtJpVNYrdEoADnA6
	 VlCX3r8K1zi8PQOYDRsdmxDY5vHkSFl/7Fcd0Bn2Tedip1TwmMRN7IzFoLJnYjGcIU
	 h/+VwhnVD5qrsv13qtp5YoR1DSHeMzkp+iVABLrVY3T0OcOITA2JTbJORfFCHHgsIp
	 2Q25CZ0HzPgWg==
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-486f013db83so1032167fac.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 06:09:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwonZijXVjBu+OZ4ExSuozb+Z3uzzWlhgpCf3DHnL5Npp5d4jMcts0spxexN9nmc+PH8twUHSR4AcYt@vger.kernel.org
X-Gm-Message-State: AFuF++n1jdr3aqd9UHiAsb0jtml3AZrVjQvYB3J06V3fo8wy70ftifYQ
	ONULgqauzRLY+mtxHdWW9DHGW2dnF/CMGa0Jm9uZ04oKgN3YusxJ+Iyh1ibqLw8u8nC5gz2/qfy
	I7zs0Z9M361cOmr35FYmsjPZbRmoq6I8=
X-Received: by 2002:a05:6808:5191:b0:4f6:2ccb:c2a with SMTP id
 5614622812f47-4fc473a72f3mr4935583b6e.68.1791464958157; Thu, 08 Oct 2026
 06:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004193647.182052-1-rosenp@gmail.com>
In-Reply-To: <20261004193647.182052-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:09:02 +0200
X-Gmail-Original-Message-ID: <CAD++jL=6rXAcmubvduVEfVLpMS2Lg=bj4MPvfpuxR0VTTkTxLQ@mail.gmail.com>
X-Gm-Features: AclHuK_XUvLh1xTRAQdE1rC4iigCwbo7HwEZoZ3CB7mNSTeHSs5dlA2T2fNhkSs
Message-ID: <CAD++jL=6rXAcmubvduVEfVLpMS2Lg=bj4MPvfpuxR0VTTkTxLQ@mail.gmail.com>
Subject: Re: [PATCH v4] dt-bindings: pinctrl: brcm,nsp-gpio: Convert to DT schema
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 9:36=E2=80=AFPM Rosen Penev <rosenp@gmail.com> wrote=
:

> The brcm,nsp-gpio-a compatible used by the NSP GPIO controller was only
> documented in the legacy text binding, so dtbs_check reported "failed to
> match any schema" for the gpio@20 node in bcm-nsp.dtsi.
>
> Convert the text binding to DT schema. Beyond a direct conversion:
>
> - Require pin configuration nodes to use a '-pins' suffix and GPIO hogs
>   a '-hog' suffix, as the old example used arbitrary node names. No
>   in-tree DTS has child nodes under this controller, so nothing is
>   affected.
> - Document slew-rate, which the driver supports but the text binding
>   never listed.
> - Add #interrupt-cells and gpio-line-names, and make #interrupt-cells
>   depend on interrupt-controller.
>
> Assisted-by: LLM
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Patch applied, thanks Rosen, excellent work.

Yours,
Linus Walleij
