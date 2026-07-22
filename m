Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7779C479873
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 08:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709743; cv=none; b=cUqrXjzWX0YhX7YKPM27ReOJPPvNtdkwv6EsrPN+QELqAXB0lv3erHxxa5hVS3qjFx26M5DvHrV3wDCcIPTf5aKH0JcbtJXBcZTela0+oi5K6ISzmPpUiN/NMoyZy6P3kNxnQ0q1p502ZWdkCHpAHw7jpvqEOCwChlmpBBkeR4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709743; c=relaxed/simple;
	bh=33WsdPwvP/JZi0NbE3CZFNhUdiVEhViX6yt+oPrIaHk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G9cy0UCmmEGAkL4BV9fmPWZjTd02nCUcAi+jFUrFfBQqI2/5hHE7FDu6GovCK47cuJeaC5QTMkewyZmPp40f0tNPzzzMww0u7JpChh3BUAz4zLz+HE9cH7sb6Bby4sY6X17RL7AdiQ0RGmMKbT1AenyFYmGpLmnTIrkeZvTrV7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DT+084QD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DT+084QD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA111F00A3E
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 08:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784709742;
	bh=3GCVFozR6/36hQtPeMO4srDIGrlB3Wpr1gIirTgwllo=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=DT+084QDMVKqHEeRnu2hI6oOkT9iXLZ2pd+eCbFbu3QhSzoYr2Ew2yNDwaYHNz/ZO
	 /74q/6ppB41cTB+YcbErz/MafEEIxntA/nBirMOJnEJYGD2ckUjgiTiJaSpr5yfgkf
	 Ic4J6b+Z3RUmO/pWgFKh4WHgwyDaIat4gP9ykHX18s9ilpRMDcINW85XwXS/8aK2As
	 lNDKH0ZHm8LybWToRf8hJusvnHjwZoYmLGgyPME9IDLAf5eTjqKIDZSupFWAsX2eu4
	 Q/0ghcmx0Yr1aKbz0RRCVOcaw4O+CkguU+aIRfOMF5ve5BeQODIXfGguij+zIBU5ZB
	 84JwbX7ofhiKQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so2651290e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jul 2026 01:42:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoKXB6bHc87xvtwmn+gD1t5di6uzJ8UV1sCcceUxtZhQcnqN2b42YBNv3hlTJ55J5z0VC66ZYDaRigq@vger.kernel.org
X-Gm-Message-State: AOJu0YygH8Tj6eRIaw7d0Qqq4Dh4hy1Mx8EXCiUjukpfqDJzV+bh2KqK
	A1u9NwAZ2nNeIPm2iAM77NAIJJ4yV3+WlGJnrejEThlzDcLmmlu6+C1VmCu0G8AayVq1t17ZQTb
	smiLwdXagio5yAZCRqV4/S0wv50B0xE4=
X-Received: by 2002:a05:6512:68b:b0:5ae:aeeb:e902 with SMTP id
 2adb3069b0e04-5b28f860f54mr4955614e87.13.1784709740582; Wed, 22 Jul 2026
 01:42:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713083808.168957-1-justin.yeh@mediatek.com>
 <20260713083808.168957-4-justin.yeh@mediatek.com> <10f4ec41-5f90-4b19-a59a-26a76f533a77@collabora.com>
In-Reply-To: <10f4ec41-5f90-4b19-a59a-26a76f533a77@collabora.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 22 Jul 2026 16:42:06 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Sus+p1qPqhAgrc_gYYKvVGkV2CnGHYN70i0zv+BuOkg@mail.gmail.com>
X-Gm-Features: AUfX_mwrltgWgwW5znwwtpoI8YTcDd_8mc2DbQawWOHLvv4LKE280kFlIdLVJos
Message-ID: <CAGb2v64Sus+p1qPqhAgrc_gYYKvVGkV2CnGHYN70i0zv+BuOkg@mail.gmail.com>
Subject: Re: [PATCH v6 3/5] pinctrl: mediatek: allow common drivers to be
 built as modules
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Justin Yeh <justin.yeh@mediatek.com>, Sean Wang <sean.wang@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 4:36=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> On 7/13/26 10:37, Justin Yeh wrote:
> > The MediaTek SoC pinctrl drivers link against the shared implementation=
s
> > in pinctrl-mtk-common.c (v1), pinctrl-moore.c and pinctrl-mtmips.c. The=
se
> > were built-in only: their Kconfig symbols were bool, they did not expor=
t
> > their entry points and they carried no MODULE_LICENSE().
> >
> > To let the individual SoC drivers be built as loadable modules (require=
d
> > for Android GKI + vendor_dlkm, where vendor drivers must live outside t=
he
> > GKI vmlinux), the shared code they depend on has to be modular too.
> > Otherwise selecting a SoC driver as =3Dm forces the common symbol to =
=3Dy and
> > the resulting module fails to link against the unexported common entry
> > points.
> >
> > Convert PINCTRL_MTK, PINCTRL_MTK_MOORE and PINCTRL_MTK_MTMIPS to
> > tristate, export the entry points used by the SoC drivers, and add
> > MODULE_DESCRIPTION()/MODULE_LICENSE() to the three common files.
> >
> > The v2 common code (PINCTRL_MTK_V2) is already modular, but mtk_rmw() w=
as
> > never exported. It is called directly by SoC drivers such as mt7623, so
> > export it as well to keep those drivers linking once they are modular.
> >
> > Rather than exporting these shared symbols into the global namespace,
> > export them in the "MTK_PINCTRL" symbol namespace with
> > EXPORT_SYMBOL_NS_GPL() so they are only visible to drivers that opt in.
> > Each SoC driver that uses them therefore declares
> > MODULE_IMPORT_NS("MTK_PINCTRL").
> >
> > Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
>
> Some of the pinctrl drivers are missing
>        MODULE_DEVICE_TABLE(of, [match_array])
>
> ...therefore module build will fail.

Would it fail though? IIRC this statement is optional. It will still build
without it, but the module won't be loaded automatically when a matching
device is found.

This is a different kind of failure.

We probably still want to add them right now while we are modifying all
the drivers though.


ChenYu

> Have you tested compiling the kernel with *all of the MediaTek pinctrl dr=
ivers*
> set as module??? :-)
>
> Cheers,
> Angelo
>
> > ---
>
