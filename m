Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08FE493623
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372763; cv=none; b=OAxwCKXgce/bcdj1iaEz7aYmmGxZJINP+CbCE7W9k+IOWS87n5C7poPs9eYRTede5JJ33oqcKRCI6uHlbvTmT4ApKSj4H1YChh4yp0pnx5MD/ObsRbeAr/yfvWPQIARuzY82RhDLk1BkliyN+xqR6XWS4tBPK/4+GlnwJDUZpOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372763; c=relaxed/simple;
	bh=lUzsP+ZtkqnHNfHM6a8trWEqRIMXQwgu/jfvUEJgwzM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=km7PKfe2JyJB/Q55fvg7zQhla3TG4dwVGdRVS88gQ+/QXU4nFs9Spfshcdz/lvzBL9oKeLwU7E//cYCMpxlFu74lyfQ25t0JJuUogvm9Igb/IFzyR7/w+WjLIGwWjOKgLRhJ8hjRoUKXFyC6gOiCNAIhn3Wf8e+Skg2bd2OXLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0mNovaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0mNovaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DBC41F0089B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372746;
	bh=yuI1908oM85XvyraVfGo7n/valCJHZAHziFtWu1aTus=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P0mNovaHcJCuq7f36kaX0J4ZDTJhGRrywGpCU5Zcnim+FIYlrOyEZ6JcLqzV1rC9g
	 LgEtEwlV+c0A9Z+qnE76YT75b2Nhr3TdtMrbwFj9+7/dxDNThFXOtHzM+oUfHgXQ+N
	 F0b2NLu3XIqIBx8Sr0cVsYSl4Ai6gM5r0BnR41nKNic5LOXgl1tU8LKfV95dnxKWN8
	 yW1qZ0Z9gpe04Cjn8YkcWlXECuzJWqZmFzn4G2aL9qcwoURb3FRhu4YVssq8kxZhsZ
	 xWGGKzShwWH8dMI4WAOIYvsoIalHwieuBZ4WIRvX6ssNdMC6xGejArYGWz6MeORdxP
	 jA7L6tvrp2uaA==
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6dfc4510440so1127314eaf.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:32:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxLRTfdanihxeI01Sz4QXilDhX7UE82GH1qQ9ItClcbYu+oZoF3Xp8UlXIm+y1PPq604unhyILvWH+W@vger.kernel.org
X-Gm-Message-State: AFuF++mbgjgQu9hwJgsFSCjLs9j778Z2uMpLQ5ypOBU438H+S8ZaiZPN
	ZRioBf0CeKAdv4UwCKd63JzCFSbgxJX2bX0DLg3uJfvXlsKwtIkpaOLgpwg95Y9H5rTCO2yQaxk
	0BoXH3toBBEvCMef62eS5VTT/lEEYpIY=
X-Received: by 2002:a05:6820:f008:b0:6b6:aee6:c81f with SMTP id
 006d021491bc7-6e4a6e2049cmr4508804eaf.36.1791372745840; Wed, 07 Oct 2026
 04:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-2-cc042983c565@protonmail.com> <20260928132131.GA3950360-robh@kernel.org>
In-Reply-To: <20260928132131.GA3950360-robh@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:32:06 +0200
X-Gmail-Original-Message-ID: <CAD++jLmUyYc2LBgM6R9mx2=d9Ez7kF26f2fiCuVomdYHq6msFA@mail.gmail.com>
X-Gm-Features: AclHuK_cStZXxjDqaDn0NagMxIvgseHdySzJ25Pb7f5b3rzrUHjwiDYhKF_LOik
Message-ID: <CAD++jLmUyYc2LBgM6R9mx2=d9Ez7kF26f2fiCuVomdYHq6msFA@mail.gmail.com>
Subject: Re: [PATCH v10 2/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Improve pinctrl subnode and property descriptions
To: Rob Herring <robh@kernel.org>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Sean Wang <sean.wang@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 3:21=E2=80=AFPM Rob Herring <robh@kernel.org> wrote=
:
> On Fri, Sep 25, 2026 at 06:52:57PM +0000, Yassine Oudjana wrote:

> > Change "subnodes" to "subnode" in subnode description for better
> > grammatical accuracy, wrap all descriptions at 80 characters, and remov=
e
> > literal style indicators from descriptions that don't need their new li=
nes
> > preserved.
> >
> > Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Acked-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml         | 15 +++++++=
+-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
>
> The threading is broken for this series...

Yeah I noticed, I just apply one at a time, such happens.

Yassine: look into using b4.

Yours,
Linus Walleij
