Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D047F2EB
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372674; cv=none; b=uPUynK83u98XvTEDRf1Ws8uuRIdehO4535LDcwHyoDsj2EGudnNvQ7aO5NfStbjXHZtpbj+52yyi40JrNYGx4tkMXe34MZUJ22bFcN10/5rrS2T91ilpIJfvVfDkRlmHnisrekHWZUlBzHVcuqdSC0/R2azi30I1PBV3YfqEmdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372674; c=relaxed/simple;
	bh=xgxM6FYn0isBdsQMlcFrK2TIeGVsguqdQQK2vRxPUi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLHk/oh50h/uFQ6RmXWb0NvMylP+8Dj9rJxWxr2A1gLuaW4o0KK9k8OhwUT9w0zjJ1WnrvpvIe0V6/2WcQPEG0W4K3dgJJowY0+bV6Mkp40ycOqieY4U7mfq1nv2v1GFvSUbdDlqri2cM8KbvqvnLefHJzvc5qFidC1AT7Zk/9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTndUSvp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTndUSvp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89C721F0089B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372657;
	bh=xgxM6FYn0isBdsQMlcFrK2TIeGVsguqdQQK2vRxPUi8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fTndUSvpRAekw3zXE5G11CMv1qCMbLi2OZaH+lz3aO0TRCtwePQGkAwqXXphnaXOY
	 0nvxmDMb0M3623XjCr6t0+CC5r5SKRLQoWauL+zC9fBlvZDuj4lDYXocFzzSfxRAvj
	 x/VVqxPc/IKcaF2El984fvL1LPzAj0SmtUT7B+nQ3GWo/uJd6nWmx/H4ZxnHCVD49z
	 hJms/ncDgLh1d1hk0bDRHb3XIuaPRPj6Or2s7PasdonV/+iHtLAgRQ4yv8oim6yR4c
	 PScE5zDJjvT+wqwCInQ7AYfXsG37ZxYcXzEAvB6eVLQjEzaQvLSokpOaIhnwKDfSWt
	 qIEo6wI9e6WHw==
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6c1983dfaffso3361680eaf.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:30:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByGKnGhEavbqxYbgLK+Z4NXkRBQ5BlnTB44QR7UGqSRZaaSN8pWpEMELOj2eGmDY9nDVth+H42v0nBg@vger.kernel.org
X-Gm-Message-State: AFuF++mDf2WeEPnexYNk95naxlLiO+IGYNdE0aBBon3K4wBb4GEW4lDc
	MdAG5VsX8hPkxJLX9ljZmNCGTvv7xKFDht6C0yewKDRXduVmreMuVAXxrbqXjn8q7MyAUj6P0NT
	6BXwhv0FtDgtKHMAkZEyoVbD/qDZ7zw8=
X-Received: by 2002:a05:6820:80c4:b0:6dc:5532:c64a with SMTP id
 006d021491bc7-6e7a6f7ea8emr1872351eaf.50.1791372656927; Wed, 07 Oct 2026
 04:30:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-1-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-1-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:30:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLk9OwY1oQOhD5gGrTtwbiaf04YF0NeFN7VAXhTM4CO5UA@mail.gmail.com>
X-Gm-Features: AclHuK8H3quu5l1-b_eOsuvpMh14N3vpR9eJtEK6ctWPpCH8KQlDYSG-vDGgNc0
Message-ID: <CAD++jLk9OwY1oQOhD5gGrTtwbiaf04YF0NeFN7VAXhTM4CO5UA@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Pull pinctrl node changes from MT6795 document
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

On Fri, Sep 25, 2026 at 8:52=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> mediatek,pinctrl-mt6795.yaml has different node name patterns which match
> bindings of other MediaTek pin controllers, ref for pinmux-node.yaml whic=
h
> has a description of the pinmux property, as well as some additional
> descriptions for some pin configuration properties. Pull those changes
> into mediatek,mt6779-pinctrl.yaml and adjust the example DTS to match in
> preparation to combine the MT6795 document into it.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij
