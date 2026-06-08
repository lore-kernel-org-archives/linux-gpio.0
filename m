Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A1A387363
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 19:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780947708; cv=none; b=NW30KVfmsvyjb7NHhw+THETYckOa4lBqU63G/QqxKzmNuGQjpz4NQ8WAXRUrnIhl0At49yRurJ8dxJ4Gp3BpfhxL09HWRIE73kHDNZzlOT66YEzCn6qigK89SXYt/HIsahIrYXi9x9ldTig2Xt7edGLlFDooQwQFqK5erNegbD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780947708; c=relaxed/simple;
	bh=NlanG0OsR7hr5y4f0SD+61WAicujm3YlJ775bMj6A3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6rlw0PBE4jg7vhDd0So4udOX+1H/U1JsG/b3kNIpwpDRoLz6StnLu1jgLKV2/FZxvDZAGVP/ikmEVQ+o4B4XA/5HnG54UETMIWmODcq8/bIws5rMMMdRk93EpRgFCrE5x777mZXC9YE4uVuVke3lfjBTrUOBoALchqrzncCA9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WdyC108x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WdyC108x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D541F0089A
	for <linux-gpio@vger.kernel.org>; Mon,  8 Jun 2026 19:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780947707;
	bh=BLpibFS+5Lc7VxgiVaeI5cCGVed4eBL/hTebJNldyVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WdyC108xzDVINL+da/2skSYY6qEw3rEDX9F/iZr2KPIkJd0KacsRRPH5nm10cpPvj
	 Btt7ftSjxA6UqMh30hUB1MNfcHLikoRoaTONvnqpIVL/tY5xUMberx8kH36VZd506E
	 5htfp2IumiZ5eU3KSvFB08JmHM8mu+U3AG7bWAKQ1iv9P7mSte4+8sQX26vThCy0dX
	 Y/Q1QaRe/H27Vg4XSJj4oSEs9Y23TjBpwll+DgTBOQ+yGIOgUQmsu9u8/AxZVcAdmY
	 mP1R6KQ/IgfZSVY7laWxuOcfHwbzszuNc0lr6NyXpi72YgmnW/ne9kK0Asu5GHMpn1
	 yTQd6Jhz0ckCQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3967620ceabso45492941fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 08 Jun 2026 12:41:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ98BdyMazI3vfrSwwv7rjKUrsHFi1k73cl037Jziq6Gz+z+Mkwwg6eM4W/o+MNP1NOfv0R6pc6vX3+2@vger.kernel.org
X-Gm-Message-State: AOJu0YxOEiA9HB3a+4aiFx/P2gZ49J5BTT7aQHHynqIhe4FzOExefCGg
	DLTSjhpnGLVvyUwgMg3AdQL/plpuVflHadmK9qvB6p0cfQf1kcA8smVYsfcqyrSCc0fM/4Y7DZD
	ZRAvE7iFEIkWTrGvrSAuDtZwcJDzLxWw=
X-Received: by 2002:a05:651c:890:b0:38e:58c7:cca with SMTP id
 38308e7fff4ca-396d094cf1bmr44352071fa.13.1780947706287; Mon, 08 Jun 2026
 12:41:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530145800.1029920-1-y.oudjana@protonmail.com> <20260530145800.1029920-7-y.oudjana@protonmail.com>
In-Reply-To: <20260530145800.1029920-7-y.oudjana@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 8 Jun 2026 21:41:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
X-Gm-Features: AVVi8CcfWWYi2fGJNDF5xiud1cjk40ojeeoy7Quaf-aXtvu2im0R8N1WQpdd9og
Message-ID: <CAD++jLkA3v0RD1skaanqqG2eN8JLivUQPrYdK+hbX1YhQBgKqw@mail.gmail.com>
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Sean Wang <sean.wang@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yassine,

thanks for your patch!

On Sat, May 30, 2026 at 4:58=E2=80=AFPM Yassine Oudjana
<yassine.oudjana@gmail.com> wrote:

> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Sashiko has good comments on this driver, look into them!

> +config PINCTRL_MT6735
> +       bool "MediaTek MT6735(M) pin control"
> +       depends on OF
> +       default ARM64 && ARCH_MEDIATEK
> +       select PINCTRL_MTK_PARIS

There are in-flight patches to make MTK drivers tristate for
the Android GKI. Do you want to use tristate for this driver too?

Yours,
Linus Walleij
