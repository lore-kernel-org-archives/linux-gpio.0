Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674AD46F483
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 08:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.226.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547315; cv=pass; b=Fm1mLbXRpXwA5EffMGmDPgDyQ81NI2T6akYhXVJ20lvqfbmDCToEleSotLyXAHe1is7Kb/i2yYPX/0EiXFMrNhXr2srHC3iHrodXn6O7N1jUGiIjkgvLK0ZNUnF0IUlE8qGt2XHaU3d/qlPOOxCYMMYirLIQLRmPckH8/KHM6fQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547315; c=relaxed/simple;
	bh=T9FXw02kbHJEl+ZSBnKkmAGVnRlakuQY/1vtyQfdaEU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hq97kBIfb4QGjRcOUgTWLMtpRfznABbNdPBjpwIZKPUBb3pjWXz5oiaXxC+R14oEX0fO+QEhUCbVmXHiS1IblyVU/1ld+xkXZ11bNOEMwjmPWgWgmntdD1V2OCl4WEEByNsRiv09MLm4bIN/eYT2ZAP0sURhAMWqu6uMVYKwZBs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VoGSrkoy; arc=pass smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VoGSrkoy"
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8c0754so90691241.0
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 01:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789547310; cv=none;
        d=google.com; s=arc-20260327;
        b=QfLYrCHuNsr4OFOFvgU9fBOL42SJGrgZ1XgE6MxWQexH6kFsUoXLi2BWrLfCs9W9Wy
         Kyf3f29OC0byEeMWybQanObAautXH6Daj9ORQuzPXkELclf3NWTY/SBhg2wQHSzHjMDL
         4efRzM3vjJjIf5Wc15Uqc4wbxLTD9/9OmqnMg/g8mZD4oC89bujH/7c3kF8Ze7+LAZOt
         KeO/KEnUSNiET2u927ppGMsZhjapLdvI/NDA82iUN6IXcL/aaAtj+tDApM6PLd11NUwG
         HSTLwOTt2q+PGJYo7OwuAyLqvk1ToLA3sSh9r34nF9b6WVJ8hoAUOCE2wpP+0lYP/dkP
         izQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        fh=Q1alzeZP3sOzEJRJEu09UZ+W7xNZMKh7Mwj4F+aq/JA=;
        b=q1k27Nife7rbItLq7qrwNso9FACj2yT5Keimw39U3MqQQrv/3G4k0nvCIu5M2Rxn+l
         b+KwYzzaWPF/G2cRfn9hWGW5/Q8bAht5HCUV3ML1p1Q5zWESnZPWfjFBAKpEFRVvRSJP
         iVg0MFfmD44MhS4wGJ5cvPbbsfUSYXQnO6IPH4h57x1X73/siyoQiY0RR4Gea+u8EMC5
         IcDW8RUwfnJB0K5raq0VJ8C143vrsL/PcN89M5sSLKDE71Wnod/uV7G3EXsoinELFkzD
         Gek6PSJI9rjDGH76LYNIjkz4rXetAjYqhvdlwDJYJ/Wbh5QjXzLOdpmcOW1JSrk7kPvW
         O7tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789547310; x=1790152110; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        b=VoGSrkoykj4iHFBQlHi6x04MMZ4xlV2riMpfJ6wSq6uWEU/YZEm4zFEvaKTt8Bnss/
         KguOf6k2h3GF/q5RTu8fC4OklgcKX8epdHUlHqWQjhJq+iFTkPt/+mCMs4J7O3GvYvQF
         P+hKfiW15cldfddkPJMiS7aOS0vemE/CqqIXnZNuGTjdax3yzKFz5ArlVFlmuAw+0E9s
         Qy6HfEuGzy1JhqU5AikECaOVGMfNxTdehATGPVl74iq2MShnoj+5SOEzJbHLB3Kew61N
         kI+b/JimjFPEp/gErA0Q/OAqkM3ZqEcQY8su3dd7sw7vd/8Cl2vmjq+HPXXJ/PrdOJKs
         vpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547310; x=1790152110;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MArIcxEq1DF3tM6gYQ8CgYvDf8FqlVp7SuT0GyZ8Xuo=;
        b=YlyxVfudOE8E2o6Yao+IQyXBSkUmbmoBuTrA8XuFJjtkZ9KK9nMbMNED/E52CpAqUh
         MMWHAdaPZWtC2husZS4vs7D3we0Ul3NlxUwuarIj8Lw5vyoAi1aMPCwxMS2Dv+I64kCP
         PaxX+iEuY8yEmipVAWVRfQpKbSKgy663Et1ntEK+cdxcDiy5fRjxeUwfUYkXSlUS/JB6
         BXqBtBoYBEFBcXoIanInP1yC4mlbB2Vy1wtY56idazxfp2NVG+zSHzqACgmc5UqteWLH
         95+fxCiFrPwY5+1EAklgEO762H/AwxjV38+zNiGJANHtltM9TRbUnP+eHN6o4smK0teZ
         EWrw==
X-Forwarded-Encrypted: i=1; AKwUvBxKlD1ZzoynOmLknrAVjixbpHeZZOYQNlhlF/86Ui6vLGaRU9zCTEfS9QXtiWMJ31M4HUYmdskTOJSK@vger.kernel.org
X-Gm-Message-State: AFuF++k48cow61UQvJCEWpv1K8eP1/gOWhvVFVClPWmFZYaExht331XM
	YJPzLJtTWQZoSE8xI3srbbqZI16oxEKossO1F90osrzrmMoi4OY42wwEU20gOSg+FgBdGAnphJd
	cC2t5ujcLTIDYV1FBA7afjeteIlK56+hts4sCPYQ=
X-Gm-Gg: AYBFou3g4uWigdrp7R4jfinR30X6PeE0Z3HyUVTMce4B3WsIAgST2fR1Zh6ONGc6EAt
	3fh1EMRTU1gxe0EhBwD/OTxcjRfUewj1a28hXW2tfWNnKFRjg449uhHhRsYg2ZWb8yeNU0F/t+3
	oyl0OPASIEy5Vekszy9g5MgYQ7mtCQEqB2Fkz381do1FM/PqKpocdhgPslZNnBFR+iAuyUJZxRB
	mnNRhlR8W7tuCsNpZx5Uh//74f/mq01f3jmUmw13Cc0i3t6zxjzQmmGEwRYo5+VyRm7xokLeDkQ
	3DUx//M78KRbi9AO+Kub8H71LSm8ovPsdkTycPR8MNqRfsQv4c3Qfu/D2VGjU4Q34VjRi2nb3Fn
	L6tW75t/MeypL1uRxoCUG
X-Received: by 2002:a05:6102:3712:b0:786:a11e:484d with SMTP id
 ada2fe7eead31-7a0522a8290mr540435137.6.1789547309631; Wed, 16 Sep 2026
 01:28:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915081910.4142719-1-morbo@google.com> <20260915081910.4142719-4-morbo@google.com>
 <202609151155.CC22827@keescook>
In-Reply-To: <202609151155.CC22827@keescook>
From: Bill Wendling <morbo@google.com>
Date: Wed, 16 Sep 2026 01:28:13 -0700
X-Gm-Features: AcwNN1W06HBvxyPAyDNMWJbd-pZRzg8rOuNuZoGljznF0BEtCKl9YZ-3dIsOV-o
Message-ID: <CAGG=3QU2LxKLdqTOHse4U9AZ3sGAUe-C_wbDnBq4W1ncdsPVwg@mail.gmail.com>
Subject: Re: [PATCH 03/28] ARM: atags: Replace strlcat() with snprintf() for
 cmdline extend
To: Kees Cook <kees@kernel.org>
Cc: linux-kernel@vger.kernel.org, codemender-patching+linux@google.com, 
	Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Tony Luck <tony.luck@intel.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Matthias Schwarzott <zzam@gentoo.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	Anil Gurumurthy <anil.gurumurthy@qlogic.com>, 
	Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, "Martin K. Petersen" <mkp@kernel.org>, 
	Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
	Mike Marshall <hubcap@omnibond.com>, Martin Brandenburg <martin@omnibond.com>, Jiri Pirko <jiri@resnulli.us>, 
	Simon Horman <horms@kernel.org>, Chuck Lever <cel@kernel.org>, Jeff Layton <jlayton@kernel.org>, 
	NeilBrown <neil@brown.name>, Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
	Tom Talpey <tom@talpey.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Kanglong Wang <wangkanglong@loongson.cn>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Qiang Ma <maqianga@uniontech.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Pengpeng Hou <pengpeng@iscas.ac.cn>, Ard Biesheuvel <ardb@kernel.org>, Breno Leitao <leitao@debian.org>, 
	Thorsten Blum <blum@kernel.org>, Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lyude Paul <lyude@redhat.com>, 
	Ashutosh Desai <ashutoshdesai993@gmail.com>, Imre Deak <imre.deak@intel.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Johan Hovold <johan@kernel.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Cryolitia PukNgae <cryolitia@uniontech.com>, Jiaming Zhang <r772577952@gmail.com>, 
	Will Porter <mrwillporter@gmail.com>, Cen Zhang <zzzccc427@gmail.com>, 
	=?UTF-8?Q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
	Rong Zhang <i@rong.moe>, Arun Raghavan <arunr@valvesoftware.com>, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-edac@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-input@vger.kernel.org, 
	linux-media@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-nfs@vger.kernel.org, devel@lists.orangefs.org, 
	linux-hardening@vger.kernel.org, linux-sound@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 12:00=E2=80=AFPM Kees Cook <kees@kernel.org> wrote:
> On Tue, Sep 15, 2026 at 08:18:20AM +0000, Bill Wendling wrote:
> > --- a/arch/arm/kernel/atags_parse.c
> > +++ b/arch/arm/kernel/atags_parse.c
> > @@ -121,9 +121,10 @@ __tagtable(ATAG_REVISION, parse_tag_revision);
> >  static int __init parse_tag_cmdline(const struct tag *tag)
> >  {
> >  #if defined(CONFIG_CMDLINE_EXTEND)
> > -     strlcat(default_command_line, " ", COMMAND_LINE_SIZE);
> > -     strlcat(default_command_line, tag->u.cmdline.cmdline,
> > -             COMMAND_LINE_SIZE);
> > +     size_t len =3D strlen(default_command_line);
> > +
> > +     snprintf(default_command_line + len, COMMAND_LINE_SIZE - len,
> > +              " %s", tag->u.cmdline.cmdline);
> >  #elif defined(CONFIG_CMDLINE_FORCE)
> >       pr_warn("Ignoring tag cmdline (using the default kernel command l=
ine)\n");
> >  #else
>
> It's pretty clear we have a pattern of "simple append" that is needed,
> and while strlcat() does that, it's horrible. I feel like we need an
> appending scnprintf(), and it needs to return like strscpy() does (i.e.
> -E2BIG on truncation).
>
> My goal would be:
>
> - don't open-code string length math
> - never leave the destination unterminated
> - allow for format strings
> - yes/no return indication for "did this truncate?"
>
> Initializing a whole seq_buf struct for these small cases is too much
> overhead...
>
> For both cases (small without seq_buf, large with seq_buf), it is also
> frequently needed to know the resulting strlen. seq_buf doesn't do this
> right today, and a strscpy-style return value also doesn't tell us. :(
>
Something like "llvm::Twine" would work well for this.

-bw
