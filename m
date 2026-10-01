Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBDD339376
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 07:54:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790841288; cv=none; b=WUAbdtPu7kQNQi04YPGk5a56x6+lh52oq/6xG8AMJHceA0h3UsoNo30xCXuBInR+Vb/jTK3ErpHDP3dnNSBjIjD24+7/4tAKT9e0Zku6IsJfha8/Y9FC0ccAxQn47nk52IJ7UJIb37ObCRm73bQOnivcdCl/dGDTrIxow4QgHY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790841288; c=relaxed/simple;
	bh=ETwbRn26H7UqXroidy9rgI+SsdhQGimrEFnPy/6ATxU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eXlFmgRT/rSlqUoDY67X9rzwAz+lZElcboMW35k+eOkoUeX7V1UKBc33Mi2/0/m99Xbu6s/0L75cUgwkoEkyvyto1l1bWsBMuugC8G61FtAf/bCfsjnDHhIHM0OJfATC3dHoodX9wSERmazdN7EEdfmJeSYQhSoTvaYDsI4h44Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fq+SjKEg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fq+SjKEg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B516D1F0089A
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 07:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790841286;
	bh=ETwbRn26H7UqXroidy9rgI+SsdhQGimrEFnPy/6ATxU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fq+SjKEgQn9P3yHrzs/atgdjR4PcXMgC5vF27cpyXZks1jQNP35sr5v3RgOOM9sec
	 FY2rEoDDVMyDYvK4nt3oXav1J44etrXW5LciseZo01vY3xXmZ/Cy8AgtE5m2h2e9QF
	 NoSJVX9Owbl7Ujq01F47Ovt0xxszViF9DDwxmb9fu2QgBVg4B+jxCAw6vAhUeSah9o
	 MmW7Z9E6IvG6xCljJvaZTT5BjixPYunphoI4k29WgWV/nHPBe08cbR3RIF1cn4zPXZ
	 4Gztwh0Z/Jw6EKD0bbTnCSqTM6SzLnrpssTMgkXQbRZjtDGNUTLl+IrWfJpVPVJDU/
	 1Wd9KXmQFLUxg==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a783ec301dso4446471fa.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 00:54:46 -0700 (PDT)
X-Gm-Message-State: AFq9FYIaD0dqu751d2eawoT+S0fdm/7eKCawmMe8BZ/CMmijA/oO0JnZ
	hGn4LzaQAu3zi8cmMOgPy/AQLFCcyqs9b9EZi7ayDnJQBfB53Up0AUgZmkJ82Thqrv3/lN02apA
	eDL+/tCgT1UIIArnZFqEAIgMLj102o20=
X-Received: by 2002:a05:651c:418d:b0:3a7:6d4a:1c9f with SMTP id
 38308e7fff4ca-3a779208624mr10196971fa.15.1790841285508; Thu, 01 Oct 2026
 00:54:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924160344.109727-1-ag@ffroot.co.za>
In-Reply-To: <20260924160344.109727-1-ag@ffroot.co.za>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 09:54:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLn75jCXJ=ctAYYp_jUaEmSqWfDrcTTT_wmd+xxQ6ednZA@mail.gmail.com>
X-Gm-Features: AclHuK9F1au3yqxI_3whPEzzbCAt4NHBvQy8QV8gno-5Vu1puBjqF3KkK0x1aHA
Message-ID: <CAD++jLn75jCXJ=ctAYYp_jUaEmSqWfDrcTTT_wmd+xxQ6ednZA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sunplus: fix kernel-doc parameter descriptions
 in sppctl.c
To: Andrew Gaylard <ag@ffroot.co.za>
Cc: linux-gpio@vger.kernel.org, wellslutw@gmail.com, dvorkin@tibbo.com, 
	linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2026 at 6:03=E2=80=AFPM Andrew Gaylard <ag@ffroot.co.za> wr=
ote:

> Add missing parameter descriptions to kernel-doc comments for
> sppctl_func_set(), sppctl_gmx_set(), sppctl_first_get(),
> sppctl_master_get(), and sppctl_fully_pinmux_conv(), fixing all
> W=3D1 kernel-doc warnings in this file.
>
> Improve the phrasing of some the other comments in this file, while
> we're at it.
>
> The warnings for sppctl_func_set() (@val) and sppctl_gmx_set() (@pctl)
> were newly introduced by commit 7dcf87d2dbbe ("pinctrl: fix
> PINCTRL_SPPCTL=3Dm"); the rest were pre-existing.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609240204.VHoUp5qw-lkp@i=
ntel.com/
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

Patch applied!

Yours,
Linus Walleij
