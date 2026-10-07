Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BC64908DD
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372977; cv=none; b=nh8Pf782gCNiFNqRGofAyeNLrukR3+u8yGDR5UMi0VtDrKf18TelfnqiVVRHekT5dX5XeM1FSUickXhfS46OIUyf+wU11fiGmqxn90tjNJYi5kBmygYLeVjnedeSF7Mo9LgWRUx1Nuyha9EzPShuSx8RzgjphxDStNgdg10PiXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372977; c=relaxed/simple;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=idq9IeVvNJk8MNU52ZoxBe3LV5hBl99JPIboUrbPaM/oBYPB9u6SOi3fxagJlty8HaZC+qONk0pMqmvJUTLwqiqzrao6E+01SdO/ZhB3/HzO2BDkqB6K0nnASN+T/pIJwqHrY42p1ED+5EqOACtxchUJGxCUnOUxfwk159GbMSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O13lfC7f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O13lfC7f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 263BD1F008A0
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372951;
	bh=6ccFrIMNi8thTcS7ezaWwGEgxkFr3q3PBiPerXaosRs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=O13lfC7fZI9543LnfkOM+QX7j9+aaHndmCvTCIC6h91hpGup8MzTEpnynKjXdoZxh
	 Usa68LauI/yxnM5kMkcteBMqM+dXJyfmA5iNFArfOTIGaxktgx+JDT07pZ4cyp5WCp
	 RJVU3xKj+9JPMuxHQCCgPctfFqtgJdyYPfgycRKoUPiNWsNlh4uQ3IXOrzsSr2RUuK
	 3HI5zD73WDuBep40/gojfCA+imj5MFVoCsI2sh8WGdTWCWUOHO7pb5TtDN+zHaZNQR
	 /dGFUvq1H0erUXpjM0bBkQy5vww9kWFZVltHMqqlncqPB2xX3EiQG9TBiebx1FKkWH
	 b+HOoRLWRCDGg==
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4911df1e196so1882664fac.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:35:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpZ6oL+O5o2PHsaR9LPP2gqFFlDMkUzSTxL4cnPy1WlsJGpEipaCX0jmiWXCvLkgXG5v4547FszbmM@vger.kernel.org
X-Gm-Message-State: AFuF++nagEctISImoyiDi2Q3ySra5MeGLq+zErLPS08NNHR7U/RMU2lf
	IkvXPRNNUX55GF1VGeT9v+DrumzxFg+etHRaMv5nsJWmr9NpZSbZfN19Gwh+oF01iAG+AEKNdO9
	v0xMO4kNq1ZyjKsV8p8ss5dJN4ch4858=
X-Received: by 2002:a05:6870:d406:b0:49d:999d:c25a with SMTP id
 586e51a60fabf-4a25915bdc1mr1996175fac.6.1791372950531; Wed, 07 Oct 2026
 04:35:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-6-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:35:36 +0200
X-Gmail-Original-Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
X-Gm-Features: AclHuK8iblHRTpngvxt6CuhsOQoecYGccKQlKm7R1bCu_zgHyfj-gKel07yiWEg
Message-ID: <CAD++jLkupRELX-nA=ZWjCaE4=gzipE_njzxHtVXEo+7O3AUtag@mail.gmail.com>
Subject: Re: [PATCH v10 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 8:54=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Patch applied!

Yours,
Linus Walleij
