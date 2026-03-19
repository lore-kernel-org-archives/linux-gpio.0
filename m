Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254D359A88
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 18:52:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773946378; cv=none; b=Ff3xr8DU0VUkfa03TfmdeQaiXohYWjugBdbo3S/y0TAH9PzmqkL4kfydbJjjtzLQ9EL1YSksJXvyBXevW8641+Kp69B2l94bp2YF7HLiRBiTYvpYNw26EPFXEqAZ+eHQg25Sqgce09K8r1dhDBklvk+mZNUlR7ZevGGpq/dNowg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773946378; c=relaxed/simple;
	bh=hPCFRtgX3A3wlaUT/6rWyHaLSFxVZ51xuZ7BWdsOpu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hMML1sexjrclvP6/uPnqQSxl+gqtxlZLX3PQEFDjktPp0FBi+RWgQWii/fgGFga4wy9xx48IXbrmHZVZ7ZWau0KMkPN2WQif4+aoDSn/1oscPmK5IJ3U/JgV1qaN/9nGgQX/+INEmI0enGwxv4nmJfzhtevI3IZ/rPzqgEcKpgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+lEj5y0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+lEj5y0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBBE2C2BCB0
	for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 18:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773946377;
	bh=hPCFRtgX3A3wlaUT/6rWyHaLSFxVZ51xuZ7BWdsOpu0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=X+lEj5y0jCylLOuWl4R4Lgi9gOz3ujHDeWkRbyA62cN/P/51ZWHqxkKyROJOgPRZr
	 XzY2xsXICfCJp19Ls99bCgdI+KQ9nZ2l6CXJ+JX+Vn5YnLoECxsdL07hXyVWMs2PTo
	 o6qlXByurdwwt3ZfgzkKk6EWjsDl5uSgu1RpX2nosv3Z3pgIlDg6yPCySta5DngY1H
	 P8s5+2UXTKYx06EuDQdcmlG/4uhFCrimZSlh2i5icRHFE2ZRqSNvRFqcg+gxTwFEsu
	 NJaQDmnz3ZptDSrGPHcbOKMlSa89NYEhjkQdXjIdItif2xhZ8lRnAQIU4UfiyrZdOb
	 +z+nTOo3TOXfw==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a60975dc5so14379767b3.0
        for <linux-gpio@vger.kernel.org>; Thu, 19 Mar 2026 11:52:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVvZl/aVWKLuOOPAMXBvNmA6hXNYQkgD7oaxxruu7VCW3PQ9/OqvKEdzuQF3wexQSnfeaHT+tlF/hUC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx04vdTDGXGRbUdPRPxp2k1Ugkg3+8LayVuxTg5m+/oQnm2xAcE
	QvAP6lX1xEBMJ1+L355P1inHWQwn96kFsxu73Fu540HxSPhXliaNgidDm+stq1tMlmVktBq0Ycs
	rddD2WR3gpSH5QBCn/Tue/7kIq445pOY=
X-Received: by 2002:a05:690c:6608:b0:79a:40fb:9339 with SMTP id
 00721157ae682-79a90c01f52mr2050597b3.47.1773946377172; Thu, 19 Mar 2026
 11:52:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317110249.391552-1-l.scorcia@gmail.com>
In-Reply-To: <20260317110249.391552-1-l.scorcia@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 19:52:46 +0100
X-Gmail-Original-Message-ID: <CAD++jLnsyNHE48G-Y_Xm0+8qdPxFg_uLjmu-ECJ6WhyLic21Qg@mail.gmail.com>
X-Gm-Features: AaiRm513TfYe7uCQq0CzURF2vQO5mlP7suiM71DI8BWW-DkDxWdNC_gZ2eSCMv4
Message-ID: <CAD++jLnsyNHE48G-Y_Xm0+8qdPxFg_uLjmu-ECJ6WhyLic21Qg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: common: Fix probe failure for devices
 without EINT
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 12:03=E2=80=AFPM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:

> Some pinctrl devices like mt6397 or mt6392 don't support EINT at all, but
> the mtk_eint_init function is always called and returns -ENODEV, which
> then bubbles up and causes probe failure.
>
> To address this only call mtk_eint_init if EINT pins are present.
>
> Tested on Xiaomi Mi Smart Clock x04g (mt6392).
>
> Fixes: e46df235b4e6 ("pinctrl: mediatek: refactor EINT related code for a=
ll MediaTek pinctrl can fit")
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Patch applied for fixes!

Yours,
Linus Walleij
