Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDFB3783BB
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 10:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801622; cv=pass; b=fCq6AAcS0d6aGQZrcTUqzkRvMJeKOwNw+kHFgfLp/Piq+flhbindryot+B3FnKFAcciigRwnjxS4Kpp9e0rsvuUp7daULWrU1DtPInYpOHkpek2scqLQq7BiOjSOIZ29Dy/+sk+XESqKKV4bCUSzgbIuPCSWZ/tstscH1YTYPdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801622; c=relaxed/simple;
	bh=92KIamnWD8cd5WYLKJyli8qdGUGMlFHe2PGqMoGdBQI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LGM6Xdjgba9s/PYzmdb/o3mPhMFRyQnjtcR9T2k5JwIU5KRT5BNNoT2rXM/FRxo5pX33+e2vaJpQHbCRbBwOooOocY6mscVK5Yj71McQeetJhWC4D4NFP0iZO7zWxhqnC9hOcUGP9EyXSwhg5xSxOvcGZCnjo3PVJifj2fBt2EA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNH5l3zT; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNH5l3zT"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso12699811fa.3
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 03:40:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791801619; cv=none;
        d=google.com; s=arc-20260327;
        b=TNuEObmSfpIwknwjytj+OQG7zbKshsxcMYInDKKS0vtMwF+b8t1gyLnmtGGlCOndQx
         n2M+zA9xGAMSPfNyQA58A8CURvYb0eWme3JqJFGP81BvnzLIyCrkNrAw0ajLdCTa1154
         zPUXQY7r2X/EdweHvAmu8aWhVUyoelpaaRbc78/bqoTvnNwcLNZVIITp+6ppiYEXa3RA
         n08J5zvHkUFXQ2L4hErpAuTcBXQvhm5L6sMR4xoOP8Tl9LABhKqSXx6ZZGkTofPz1YaU
         iISvgLnU7Kiz31aHVyD8Bu0FTClqKyOOh/VBIHZ5wjwGanlNQbQQrwzrv0qcXpWtiBe4
         XtKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        fh=ru/NtaU/Yz5g/J3Hc5LpR3jz/LXFUsHksFzy78LtXx4=;
        b=LflhWqTo1DD35jTKbI/4GKYswXSvA5YVsRXagEudXNiWLa15JDVO8nrU7HcphLUgga
         5uKm+IurEbz3kMwO6mjVYTXrFNJSz5di8o6kv2b7fCfD2GvcuAbtRXj1FpqSlqWb+ki5
         ImsJLQzItBDk6369Zgumiu53BK8OkkYrcgVVquE57Oc5cS/t1+GLwMA6DurGfEtA8upu
         Rc8M9SObZszPNqEVkpIcKTQJVGdj3rj9jVe3mOdL9GjRstfSa+gwElLD91A6axgXgz8x
         JumLwX+s2GfKkeMNRraxCSV6+6+OvUvUrF+3nD2jfPwkfMb8duzNHz6xoHGzslXdtprh
         i75A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791801619; x=1792406419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        b=oNH5l3zT/XPHOXZTbeRvG4Q4AU34Xsdlct4Y08OF/Hkh9kUjAIJwq2pkjguXnD7WxE
         /qG5F/neSRsqxoorX/TGENQ98q4f8g7yIDNsh1uhN3rWQ3UkqbIAvcC/HH5W/NTDW4q5
         +btJyoxWDRp69AyOc1kR+5FsIrOswNbukJ47rAkN+uXFpPz26MNEMjF6L76jkBbnkFgs
         7fPb82nu6a1nsQm5dDdH1Gq9dCfDHiFg72GpxqAqggCbemNg5G5pmK/7f4NpgP7kRdQp
         e4XYWb47XmaaGobn4EQl6bT4QkmX1o7KurYFrl3zbbMZRmER9LgGDKpp8RT0AQbQLx4g
         PFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801619; x=1792406419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb9r1QTfT6Icnt2JRunI17mQhOI8vmMkb4F7tmAW4fo=;
        b=2Vn+ZrLgJEpyGxFiO5DreB3XUSHp/deOnOpvwPBm58KrWQYq3KvVztt4udYyMVcoin
         CW2IFkgNMfcDyf8alviyl1I7brYmw6fx2Zaj8PIw9wuckff/z7GwNi+Q8H6dDQp/UWtv
         qwcGLN0wY07HiRA4+6Xce3RprdntCNTCsLLji5YtJUL2r1/a0MDzD1Yt0L8F7SamvUUP
         kTowOYybLPv5RwwFOBmakG1xDkG3keMd67jkzJE+d71Pd4IpNrXSGdYWJ+M52wKeJlY8
         acNnryqaZjU4unQqTIEZjH4+uVdvzyLu8KoTgm4f3mMr4rRgAhGAWoWiUYSpFiush2Pu
         l6Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxEM5TlULYRmKQhscBYhMFKit20+IcYFkZYYYwaGfQDpnmfuSXheW4if26hardsI/PV8KpS0eNi9vWP@vger.kernel.org
X-Gm-Message-State: AFq9FYLtVvnu2cOJ/6aJrDRqtMfE1CsKKZ6mi7Y3Kp26EAusNykIAuOk
	BvnZIPYjty8Oshsmcnu2DyQmmr945bVFMFEkSxPhFyP3dpvGAZf883XLd9ZLyUQNYLz4AWf4r5N
	j+YVCOrXtcXifk2d8yIPAKDUsjfTXHmk=
X-Gm-Gg: AYBFou2dBDuqU/szAgzVoaMNm6T0nUHl37i9gGA9UycSYGvS2yGyL/uaOxwUGrFW5+x
	bjpxYmC19Jt68o6lBDcv4z8f1r5ocRz2GGiyTCZEfNAvdsUjdIyICbkcqqf8VYum0J27fZjRODG
	LsI2Eoh68YgAm9Ss6t2DmMrrxvj38OcAlOgjH+5BobbDrYUCcL4sF/lqtdmNfwEXxALdfVNn+Gp
	mJ/amNNuJF267pUXSmOuY2Fjwcur8582Ewd595luZBrBta/R76IAGwXRAc+NrtJIEOUOGIKnW+Y
	mLuchG03KMN/2QIgIjPrL2nv4Bpv0jTp7+DamuKqMI517Wiq1sTZULT8GSletwrmQxkZVw19OVS
	5I/f+NE0m2zHYjiT6WD8xxs5ujISBu1eKFrmqEpaf6BZfgRxpVXtbVMWv2KGhvmNNPSSoDnajGj
	O4RnK+grUZi5D1i0BPxYhj/Vza2vTws5R4bGpyYprD
X-Received: by 2002:a2e:bc18:0:b0:3a7:5ff2:576 with SMTP id
 38308e7fff4ca-3a9c4eb3dadmr26987981fa.1.1791801618912; Mon, 12 Oct 2026
 03:40:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-gpio-mxc-cleanup-v6-0-cb47ce2ad758@nxp.com>
 <20261011-gpio-mxc-cleanup-v6-8-cb47ce2ad758@nxp.com> <CAHp75VeonKZtX8moOdXrmTJbjH5Ew5iVdDDc3KfqQ9r_tvHg1g@mail.gmail.com>
 <asyw9ns870F0g7UD@shlinux89>
In-Reply-To: <asyw9ns870F0g7UD@shlinux89>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 12 Oct 2026 13:39:41 +0300
X-Gm-Features: AclHuK8j5vu_bU9arYI-L7AJUk-wyVDtV4Vr4-xee8wNlRYyo0Qc1_7I9JALruk
Message-ID: <CAHp75VcO8YEBbt--P8WO-_Vu1O0mR2nsdqeBSG=JgavCEoR3Dg@mail.gmail.com>
Subject: Re: [PATCH v6 08/13] gpio: mxc: use local dev variable
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Shenwei Wang <shenwei.wang@nxp.com>, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 1:01=E2=80=AFPM Peng Fan <peng.fan@oss.nxp.com> wro=
te:
> On Mon, Oct 12, 2026 at 12:30:07PM +0300, Andy Shevchenko wrote:
> >On Sun, Oct 11, 2026 at 2:54=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:

...

> >>         struct device_node *np =3D pdev->dev.of_node;
> >
> >Why not this one? Is it even used? Perhaps you want to have
>
> of_alias_get_id() is used, there is no counterpart in fwnode api for it.
>
> >  struct fwnode_handle *fwnode =3D dev_fwnode(dev);
> >
> >here?

What about using to_of_node() for that one and fwnode for IRQ APIs?

> >> +       struct device *dev =3D &pdev->dev;

...

> >> -       dev_info(&pdev->dev, "%s failed with errno %d\n", __func__, er=
r);
> >> +       dev_info(dev, "%s failed with errno %d\n", __func__, err);
> >
> >This message simply needs to be killed, with initcall_debug in the
> >kernel command line you will get something similar from driver core.
>
> ok. Let me fold the change in this patch, I would not introduce
> another patch to just drop this line.

Why not? This is a logically different change. Since the driver was
not touched for a long time there is a technical debt, you can first
send fixes separately, followed by a number of the drops like this one
(remove a noisy line), followed by new features. Make it three patch
series.

--=20
With Best Regards,
Andy Shevchenko
