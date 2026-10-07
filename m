Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7FB492E2D
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372719; cv=none; b=tfm3FSE+SJO0jGFasHtAd0WbC61RIAHSdvN369cxdQqnj5ZSp7WhBtmkM5aXpvWc6zKcXAoNTpg9aTw1p77FcTt+UVheGHsKq4q6CI5WTkrQojQwYFfftJZwDsPDQjXPSJqbzvoFa6qqsmI6ykcvRVB14gruKKi27lPDqFHAz/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372719; c=relaxed/simple;
	bh=g6P+spmMmmlUm27GqFei7PSvg2i8zHuoJmMtTND1pM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mZQ+DtcKm217UUk11bxd+svDvlTdYT2GrM1AlL0S/Ny1PunpYHWvhzeod+2xCA/I+5nuaEcinNtVNcsZ71w1cgEWamiRa3q44/SrDnEtFd1tJQj6ngsk38HaRzcSB5KWWyLh22KSCAaD6sNhjq3Jgiz4VnCx5XqJORwz/6sW+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jC6/zyQh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jC6/zyQh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F56E1F008A3
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372702;
	bh=g6P+spmMmmlUm27GqFei7PSvg2i8zHuoJmMtTND1pM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jC6/zyQh9ODKwfOcpqoO4mtMRkqQMCJucyGcR6GXptshw+GURUSMyeBn4lWmiWa2U
	 BrNgESCGY3cr2zlNEAYXcMTZYJrHqNr8puETHH2U10uupAiL2xaNUQPxsilMLUrFH8
	 fK9Lle9Cz/efba9vdUYtTMM8+jXYxJcisfNF0CX4IlMgfOLYOHa4QhFjJ8f+BgObXh
	 N/GAfqt6dKc8Fcd24DzzHIhf8ymAvi1a0Xol2sg2z3m2GS+fLkSdxbeUCtGAyXQItN
	 twPEegs6RvVfhosT4JI4Mxg6Gr7EmB35d/FYY/fy8jLVkOJkTuJSUfAyTOXCuKJhub
	 CYEDbfTkKX84w==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-49e13495e5cso1403512fac.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:31:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwWFHTaTZ3f43rP7DlH3JfGTQf+q0Oa7SWzisV6bUm4pk4Jjxltd1eHbM9F5/Lagq3X9uEf4zerPxMU@vger.kernel.org
X-Gm-Message-State: AFq9FYKishvmZ7GNHVtQw4U0B5OwZ9OoJBjYZSrq20+ZERyWc/fLWope
	S2lZpPEMInufWJrKmAcb2bDKQlhupD057HYoDvubaAI4fAPkUxIXpPaBZtpVr56eyKJeWTOmNhD
	Mz7rHUj7TB6ysfteGRDQje8p2JUPHCi8=
X-Received: by 2002:a05:6871:7d8f:b0:48f:e0f6:bd4e with SMTP id
 586e51a60fabf-49f4f0b8d3dmr3544055fac.35.1791372701659; Wed, 07 Oct 2026
 04:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:31:26 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Lf5NQh1s543XS6ZMTuV6dKD1ebVJYcHcQjvLN2sv8jQ@mail.gmail.com>
X-Gm-Features: AclHuK91yzMdnow7AVBRSKC7FQKTFDXkxwc5yS2wNsCnGspgKIcoIoO9YB0evBI
Message-ID: <CAD++jL=Lf5NQh1s543XS6ZMTuV6dKD1ebVJYcHcQjvLN2sv8jQ@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
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

On Fri, Sep 25, 2026 at 8:53=E2=80=AFPM Yassine Oudjana
<y.oudjana@protonmail.com> wrote:

> Change "subnodes" to "subnode" in subnode description for better
> grammatical accuracy, wrap all descriptions at 80 characters, and remove
> literal style indicators from descriptions that don't need their new line=
s
> preserved.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Acked-by: Rob Herring <robh@kernel.org>

Patch applied.

Yours,
Linus Walleij
