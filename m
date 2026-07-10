Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5486234A76F
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 20:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783714633; cv=none; b=gQX7svX7gjzfudE2WK8nXKNtapeLCGt1AETIwIy90HGu8t+08qYtjdm99xX42GdRg2Ft+UaZvtEKDlBd+Arr7TrBdzbaDUkz9NvrlNgnHrYf06YjT3OwopBSYDevx4cKFwI2XmRiaElKUe6arQulG4OyJnkDelEJK99Ih1TnPnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783714633; c=relaxed/simple;
	bh=tQPbVbfxwect0GU4Sdbz+MR0Fwi568qtnWkuB9xn3nI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CNxASSHfGI//8X+XYsoYmd6RQ8eK3ut/xtrx46ppfS+DQxmU+8ASfHVlswDHu0wQ3OxNvNY5MtQYoF7bFhT4wHTEFhhRwZRzznHc4IoODnGblTiByW/E1ArSrfUxdZcv+DOovFVgMjVZL1u/roK46ryKTBT9uarUXgP6UGil1Ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hqJ8lWyf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hqJ8lWyf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3071F00A3D
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 20:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783714632;
	bh=kVxn3DZhdGrpJ7FFDLro7VI16MvBN6YAJO3dopkK6bE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hqJ8lWyflEMUTaA05MQHqxhXHJbMt/h5NVA4XggKhXokhzA8ZPwyOy57BCSBgu8dW
	 +xndV5LXUS7JG13edZsln3kRg3qMXz4Ca9KR/ZbIoeBMoZuja4MWVDwuVaJRAk9TBz
	 4XUTPiJwY2HJrd2TZ7OWTxNgUivRM42+roYEUuvJv1M4JHbYqryI7efPEHqNctroeH
	 g2CLNP3kOM0Y1P9+qLI6CNk3J0R6Gc6XD8SHnEUQ1e2IYcbHS2OTD+e8SytlsaFVio
	 qz1UqZb3uMnVmI2OPikF+86czrAll6ItDC0x5OkCYTtj7an9nGMgKpO/XZc/lkIBa3
	 NeXjpq4XrHABQ==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aeb6d00883so1223698e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 13:17:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrcMJTansYI0i7sVFrncNXWXReDfxN2ppISZ7acF33EFDWpbuhkOGKnddJ7jH31Q3rQlTlDzGk9doDM@vger.kernel.org
X-Gm-Message-State: AOJu0YwbCwfX8wrD64sk/ROxRnXiS6FL2SbiA7v6g6rHE556WSWM+L63
	/m1Xs6wCMn7O3Qilnin93m1J+FoKK6uDf2QeLPFoVi9L1JsLhgNtBBTLN8Scd0z5q5CyBi9nTxp
	7AmFzMCCIOvyj0JxgQLQwBUZjyjSQJIw=
X-Received: by 2002:a05:6512:21cb:b0:5b0:190a:5b54 with SMTP id
 2adb3069b0e04-5b023698addmr71572e87.42.1783714630728; Fri, 10 Jul 2026
 13:17:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260705070422.764-1-ceohunk@gmail.com> <87cxwulkl9.fsf@trenco.lwn.net>
In-Reply-To: <87cxwulkl9.fsf@trenco.lwn.net>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 10 Jul 2026 22:16:58 +0200
X-Gmail-Original-Message-ID: <CAD++jLm9oDeMrJU3NAW3333qvVso5P4WxQBgp6-OngOL5_fFiw@mail.gmail.com>
X-Gm-Features: AUfX_mw4ORYsmrA46OyiqMjntDFb94AtBYMCMf7lHIgUwLGcBsKCW3uY8_blLRw
Message-ID: <CAD++jLm9oDeMrJU3NAW3333qvVso5P4WxQBgp6-OngOL5_fFiw@mail.gmail.com>
Subject: Re: [PATCH] docs: driver-api: pin-control: fix spelling of below
To: Jonathan Corbet <corbet@lwn.net>
Cc: Yuhong Cheng <ceohunk@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 10, 2026 at 9:18=E2=80=AFPM Jonathan Corbet <corbet@lwn.net> wr=
ote:

> Yuhong Cheng <ceohunk@gmail.com> writes:
>
> > Fix the spelling of 'bellow' to 'below' in the PM API section.
> >
> > Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
> > ---
> >  Documentation/driver-api/pin-control.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/d=
river-api/pin-control.rst
> > index 1f585ecca..80106e44a 100644
> > --- a/Documentation/driver-api/pin-control.rst
> > +++ b/Documentation/driver-api/pin-control.rst
> > @@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "in=
it", "sleep" and "idle".
> >    selected after the driver probe.
> >
> >  - the ``sleep`` and ``idle`` states are for power management and can o=
nly
> > -  be selected with the PM API bellow.
> > +  be selected with the PM API below.
> >
>
> Applied, thanks.

Do you especially want it? I queued some stuff on top after merging it,
so would be great to keep it in the pinctrl tree...

Yours,
Linus Walleij
