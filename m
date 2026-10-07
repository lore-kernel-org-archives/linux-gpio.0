Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB4EA385529
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372931; cv=none; b=c23FiAsRRnyO+Sgtn/jcuyV57lftl5JhfmJoTWpGU5Rb5E/5R22eR20iO1vyq0rdU6MBSA5UYwGPVi5hyoRQDLKTY74C/Ma0+iv48A0omW/2W9TIZxN0mVdS0Qxg+haCW73wMgdMTFqfFETaIFHzI9Y5leAv4xLyv3WVi1qsaaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372931; c=relaxed/simple;
	bh=csPIWgh2vjj2d+64o9x9jlg+4Kf6s3JJFOXj1yDjO7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvQVVFct7C8AfWA3rcVUm2ITPBgV4nXK2pGKO5kNRue99u17hTWHlPAdWVL5nVRWA2KKvOOBtHrWRuo3N6pp6IWvKf+/57/KefOMFTjJo4xbFzOAlO7uAL4yAft4YdXAYT1mi42Kpkv8g2f3ruZWT1jdicf2HkflWK1SJ/CYV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F1w1Uush; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F1w1Uush"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F4AA1F008A0
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372905;
	bh=csPIWgh2vjj2d+64o9x9jlg+4Kf6s3JJFOXj1yDjO7g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F1w1Uushn0CK2fctUMMwIBX9Q/AryAYvJosGMRW7lT+tJUc+G+RkL2hgCuE4F8xLJ
	 AzkTRul5lzF1AZdpVmSk6RIXiRaseePmVRvnbNbKOazQornNUUGym2LsrYuWbrmQqt
	 Ui/l1ZqWPO/wHMckVv90XMgsxI4/Nvpk9qhd3MlK58CeM9PKiblqEP4MQUvetI+aM+
	 VSSvqp0p0bFH6sXh1ae6H8SQ2sx+b6d1AfFxqs2RRAstrmI5v1Cksf3gHQfaFz/Gc5
	 mJxpSY96KehYo4SzmKUJgM1Q9ODYmy8hlM46gyORv2EymfskrSdaDPw2xwxvmv8dno
	 eLkcCgBAbkcXA==
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-49e0ee9e7afso595947fac.2
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPOB7onoDRQ/a8oXYEQri6L/hfW5uy4EfOzKhbcg7f8PHNfarBgwqrrjzo1tgXtIaOVIevdS7mVSka@vger.kernel.org
X-Gm-Message-State: AFuF++nb6hldsPgQH3h9NVhRHDWpT/goyHr8RiyCxPEcRsTPH9ssh8fw
	+7FSOHWos0nBlR7UQsfW0cV83v2YPglmVBfO6r19f3QTHyknsh0hkFelC4A9Sy6p3mwsmZOWFB/
	I/3WaPkqmAL0XgZ8HjT+jPKeAy4OYmLA=
X-Received: by 2002:a05:6870:15cc:b0:48f:e0e5:a1dc with SMTP id
 586e51a60fabf-4a2598087c4mr1786465fac.49.1791372904792; Wed, 07 Oct 2026
 04:35:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925-mt6735-pinctrl-v9-v10-5-cc042983c565@protonmail.com>
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-5-cc042983c565@protonmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:34:46 +0200
X-Gmail-Original-Message-ID: <CAD++jLn5gm9iR9cJO5DnLjozhm9MgRpmmdemFZyTcGeL_sz0Uw@mail.gmail.com>
X-Gm-Features: AclHuK8GVwt3n3_Tf9yHLVWOERk-G9rrExeh-m6C4ooGn236qBT253lfkigNGlc
Message-ID: <CAD++jLn5gm9iR9cJO5DnLjozhm9MgRpmmdemFZyTcGeL_sz0Uw@mail.gmail.com>
Subject: Re: [PATCH v10 5/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add bindings for MT6735 pin controller
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

> Add DT bindings for the MT6735 pin controller.
>
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

Patch applied!

Yours,
Linus Walleij
