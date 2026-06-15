Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BA73EFD1F
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 13:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781528489; cv=none; b=jwF60aYvFvZw8r5+O1HeIzHafjmljrT6nF/5/op/viQAKGQ0B418huUA72awIXB8y31TFU/FstUAxUMgg1n3QLJPzdbx0XYUN/L4JjFW85BgPYjVDd5e3QCGe7JW6ouEHgC49HBe/zH5dr+6wJLRnjp/F9iZ4ESVC3NJQoduWqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781528489; c=relaxed/simple;
	bh=UqC405AaF8TrWWhU1dB+lz46uWf0Hq2qOLQieMUrpms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcjyrwERoWpnkN2GY65YO6HJ7cjqu66otgLeUenvbtr5sy7vkFJkokZmWkW4HQR/+URbxX2lqeMI4mfXpTb36XXM6Qr0zjLv89a+FtGTUBrM1K1s3Geaj1A4CqVklSLcnAY11FwiF/7d5DUClAeh0aCOw5it7jK9ZTphIij1RV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UBbUt1Kb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UBbUt1Kb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381511F000E9
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 13:01:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781528488;
	bh=zRo3ktcK7QAV26zbxPcn2AtzYmq1+W8RKTgwMwSUSDY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UBbUt1KbrTQgLnhmPZIsHRJmSFKmec9NmKFFZDkT0uFYohDiAEksT0pkPWze6YN8S
	 AMshzWhAD7+a6Bjuk8SOPzi1qvosOxfWuJnC34gCV8kUZcRyOtDuN0+wI8rMftpTRE
	 jS96kRIgcIUaZPgpMG6AjxVpdwouHs580iylJuTDEzGto+6Y09MsggEh5kaDDJ4Mjp
	 8dxcK2Ae09KvhyjnNW4m+cM/WFRCuvIaCYRbs/2cxPzvDxC1Y0A4cCVJoVCXhN9ez9
	 Pz9U1hYMqlGOBrmxTVdvoWWqMG0h2TZ0GlKCF8itlGO7DVlOdCuF1Wyb2/PbNqnRV1
	 tvgGHMltIu9qw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aa68cd8dd3so2977306e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 06:01:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+Gcc+C6+L5uQOf5wucwJPHM50bsmGcoH+sQ+ukCoI/MnZjvvfMx73I2IE32GXJGt+iGZek19GUm8qw@vger.kernel.org
X-Gm-Message-State: AOJu0Yz91Y9LIKCYOujrUU77f3uUUl/djXRByjL4Mbo7zlwavVc+2YM6
	5AIk/WcfnO5L5dpy2Uzf3mxWASMw+YlvwdnbQlqA+iANmYUUoDTCmgOnG7iEYBZbaP2eDO34zHK
	ls32pMYuiYOJJiFjq8LD4VNfYwD+nxic=
X-Received: by 2002:a05:6512:b9a:b0:5ad:2a7a:868d with SMTP id
 2adb3069b0e04-5ad2db65b01mr4044758e87.36.1781528481218; Mon, 15 Jun 2026
 06:01:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260613-export-get-group-selector-v1-1-fc4451a9ff0e@kernel.org>
 <ai_QMNydoXXoOFmB@monoceros> <CAD++jLm+rv+Tm-WxvD51ynKeDUrPMAG=nfTNxRbf8FvSNy+dGQ@mail.gmail.com>
 <ai_0i2cicHHzwIXj@monoceros>
In-Reply-To: <ai_0i2cicHHzwIXj@monoceros>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 15 Jun 2026 15:01:07 +0200
X-Gmail-Original-Message-ID: <CAD++jLkWajjJsWyPmE16Jymrpzm-vBJymTrpSA6eN-mm6H=cNw@mail.gmail.com>
X-Gm-Features: AVVi8Cd5ZKpulqE0biEIR2A9-XgH3VcXPIFPSLm21T3S9XbmuCga5cAmZ7noEaI
Message-ID: <CAD++jLkWajjJsWyPmE16Jymrpzm-vBJymTrpSA6eN-mm6H=cNw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: Export pinctrl_get_group_selector()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Jia Wang <wangjia@ultrarisc.com>, 
	linux-gpio@vger.kernel.org, Nathan Chancellor <nathan@kernel.org>, 
	kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 2:49=E2=80=AFPM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@baylibre.com> wrote:
> On Mon, Jun 15, 2026 at 02:27:59PM +0200, Linus Walleij wrote:
> > On Mon, Jun 15, 2026 at 12:16=E2=80=AFPM Uwe Kleine-K=C3=B6nig
> > <u.kleine-koenig@baylibre.com> wrote:
> > > Checkpatch criticises:
> > >
> > >         WARNING: Reported-by: should be immediately followed by Close=
s: or Link: with a URL to the report
> > >         #9:
> > >         Reported-by: Nathan Chancellor <nathan@kernel.org>
> > >         Reported-by: kernel test robot <lkp@intel.com>
> >
> > Now that is just checkpatch being silly, because what in in next looks
> > like this:
> >
> >     Reported-by: Nathan Chancellor <nathan@kernel.org>
> >     Reported-by: kernel test robot <lkp@intel.com>
> >     Closes: https://lore.kernel.org/oe-kbuild-all/202606130210.ytVPxHlm=
-lkp@intel.com/
> >     Fixes: cb7037924836 ("pinctrl: ultrarisc: Add UltraRISC DP1000
> > pinctrl driver")
> >     Signed-off-by: Linus Walleij <linusw@kernel.org>
>
> Yeah, so the kernel test robot report has a Closes, but Nathan's
> doesn't.

Ah OK I'll put the Link: to Nathans report as a Closes: instead.

Thanks!
Linus Walleij
