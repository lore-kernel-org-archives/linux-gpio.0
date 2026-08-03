Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DC63A900B
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743226; cv=none; b=nFPh4QLS7BWb0Doz4/ou8zeLbQtHDNJSHVwXqTC9pWdCldgczukXux9jzSntA8gxepqEaKlJGtS5XN7TEHEPYPc7rGnkZzV3cE1HESFbwI1pMHVh2xysYQc4+yKsXTlSts9rmlPVSBzXO+Xe/gvqCLxbv07pNlo6DKAoSM+jwBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743226; c=relaxed/simple;
	bh=403dFbmwi2uDJ9XkHtGEBz3c5Zn1S63P+m2h+phsk/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j39vXWrXgX0dBJEBBatpYyD1aRwiJbABi3QKKwxd9L1j944a5wv1C9+vfyNTCuDKy276gcQ4X+YZq8RJKDUND7H2Oirh5od0+e2zsISDSIZ+hYAT5Tn2rbBdtRvjLtQownDOA1bmgQbyFk8PvnZ/3rjPV3Ic8UfpgEvlpJ+D7QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OXPevsoU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OXPevsoU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2A9A1F00A3E
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785743224;
	bh=403dFbmwi2uDJ9XkHtGEBz3c5Zn1S63P+m2h+phsk/s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OXPevsoUV/McDbWM8JESVVeHAhFzHyXmqCVMbaDReIsSeOMrou8KFdrNAPQyHelKD
	 kX1y0gySzEMqV0Pgl83V20ydNWVt1PNUHkeXzY4WisEGjRok2UCQbOgwJP86hlzwPr
	 wnAist7mTX/sUr+2E4egOg68PpYBT5wm453tlb5CeadFO6RlXMaOoER7Uxae+OD+dj
	 VAvjsC5BcjxqgL76o78qHIRK3xQnckAMMCK1N8YaNo2XH4c1ML6fJMawTXyqPCeN4+
	 UR2IOQDduhZeyFY5FY5Sz6fDdKdBGkCxCs/sefiV3q1EdPPaILRmnZgBjerJlsiFzM
	 kUaR2NgINs+Zw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2a8e4c77eso3020185e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 00:47:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqVW9pONI+6rsx8/gPxCtJcHvrlICdFQa6U9blSyP/Fcee7oRJAQXx9SvWM8r+m4Abyb+C5QY0mqQEM@vger.kernel.org
X-Gm-Message-State: AOJu0YyIaE069+cQz0ECbhG18IuDKcZnQPLLFqk5IFzrabcCIsHZqTRJ
	OaxNsaHz4DgFd1M7pLI6g3V4ahznPJs34Rw1KmUP0IQ7c9anZWazgMHz2sDo7BnrJVdMaxiUCI9
	pxPSwvH8hBFmQu17a+z++ywnM38TLmzQ=
X-Received: by 2002:ac2:446a:0:b0:5b2:9b13:2cd9 with SMTP id
 2adb3069b0e04-5b2e4f8014cmr1179343e87.44.1785743223708; Mon, 03 Aug 2026
 00:47:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
In-Reply-To: <20260729-spacemit-pinconf-validation-fixes-v1-1-edeaff398fb3@linux.spacemit.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 09:46:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLkh0BxaNksg8GzBKbhT20B5qutOAkBc5hMODmG=9uLy_w@mail.gmail.com>
X-Gm-Features: AUfX_mzUZKe_fim1woi5skXnfHo0SBeV2P3xbdCqiKquNyg0_pLWmtWIWfBu1s0
Message-ID: <CAD++jLkh0BxaNksg8GzBKbhT20B5qutOAkBc5hMODmG=9uLy_w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: validate pins in pinconf callbacks
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 11:27=E2=80=AFAM Troy Mitchell
<troy.mitchell@linux.spacemit.com> wrote:

> Pin 0 is a valid pin ID, but spacemit_pinconf_get() rejects it by
> testing the numeric ID rather than the result of the descriptor lookup.
> It also fails to reject nonzero IDs absent from the SoC pin table before
> computing their register addresses. Check the descriptor and use its pin
> ID for the register lookup.
>
> spacemit_pinconf_group_set() validates only the first group member when
> generating the configuration. If a later member is invalid,
> spacemit_pin_set_config() returns -EINVAL, but the callback ignores it
> and reports success after partially updating the group.
>
> Validate every group member before writing any registers so malformed
> groups fail without being partially applied.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC"=
)
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Patch applied!

Yours,
Linus Walleij
