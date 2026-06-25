Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0229E31ED7C
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 08:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782374660; cv=none; b=bl4+NS6jI4OtfkDK1k8ZyIW+xOI9YcKSwX4939KQtBNgEd9s/o9xv40jheu1PZHou9fs3uuNDPeZXWYkzPjc/Aoi7NX4PgITWrgk8wIvdWhLKGsCugIqqEIT1s3iKxgjCcxLID2c3jhW21qO+PoRlM/32i9vcVA1IPZm2p5in98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782374660; c=relaxed/simple;
	bh=rc4UgqM02wX3WS4+otXhhGGHCRsw59oov9SQ5Ze024I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=InVXQqN5mvT0Jkcs8DfjlNZe4xFjnuo5qn2YXtK3nxkeK16gOI2zYoJ+AxPij1ZZnJIa5v+h4iHstCmO8+/TUt2EkuFIsZrEy7WtljyNy7CpArhb6HeZmU7CBESGzi9aKPFu73PM5xVe2utBRaKSRVeF1rsj3W53VOD29C8nP6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ijFmScwx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ijFmScwx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D573D1F00ACA
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 08:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782374658;
	bh=rc4UgqM02wX3WS4+otXhhGGHCRsw59oov9SQ5Ze024I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ijFmScwxca4yR6X2sojGzTpvpEOxVMIDOZiP7X34up80RQthP1qXskm8aS8DDgDiE
	 KKreU0ZBugIqqLwHUybFLSHwZ8jjVe1WVo3bFXlZ0Rb+BpJAGgb84T8cPGoDsXrGZz
	 +QRwiwDnZPQMAQRPAy9gLPmU4SEFKb7Zya/OpZhmXy9iR8LxjOGUKFGgriwGv6uIWy
	 5uw0SSvyg3DR4l9ebbGN7VVfnj4MnQuu2wEPXNESMkisuIMPMkhOCLdkyco3teB066
	 PNaWCYq4IMxzg3+XZoqQlf+ncw7LTJKai3oLZgleWWmKG0DN8dkSaSCd4fq6FFwqFk
	 enieRGwLfB9zA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aea1e180e8so466297e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 01:04:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqyR8LeSJOEMkBk8f0CfjEmIwU+Of7Bj0sHlvNAHNRxq/98N2xS4Ta6kfsw/NaGuR26ey85lL6yuwPW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7EbujrMu6XD41AHb8LB7k9j/Ogl4W468n0znj2dhmyxtOBw0c
	6ZmoLRP09wzD7ghhlFGe1B8n+4kNnU8SOlA+Ue4S2dYFA0mqDRhbLfzrDxYYoGIQSxYocRu6kb/
	Wt4LPM9RBEcy8yQ+SdcnFgrBLuNbJKrM=
X-Received: by 2002:a05:6512:6383:b0:5ae:a18e:b06f with SMTP id
 2adb3069b0e04-5aea1f66658mr405055e87.35.1782374657529; Thu, 25 Jun 2026
 01:04:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
In-Reply-To: <20260523-pinctrl-imx-v1-1-73b7cb731351@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 25 Jun 2026 10:04:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkjYBygmV-SAbGgdcCCsY_4Oj8DV3qt=SfyThPDL_ZZ3Q@mail.gmail.com>
X-Gm-Features: AVVi8CdrfAs76i3SCWe75sXDLmxrew_W8p1Qr6Cc1VDBJuXIucGhy5y20pIOo3g
Message-ID: <CAD++jLkjYBygmV-SAbGgdcCCsY_4Oj8DV3qt=SfyThPDL_ZZ3Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx1: fix device_node leak in dt_is_flat_functions()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 12:27=E2=80=AFPM Felix Gu <ustc.gu@gmail.com> wrote=
:

> for_each_child_of_node() holds a reference on the iterator node that
> must be released on early return. imx1_pinctrl_dt_is_flat_functions()
> has two early return paths inside the loop that skip this cleanup.
>
> Replace both loops with the scoped variant so that the reference is
> automatically dropped when the iterator goes out of scope.
>
> Fixes: 63d2059cd665 ("pinctrl: imx1: Allow parsing DT without function no=
des")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>

Patch applied for v7.3!

Yours,
Linus Walleij
