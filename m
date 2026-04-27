Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E47346FC4
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321212; cv=none; b=QeT2Nt6/wsPcAENlgmURzP56qVSZ2oxKk03onnYh1I2G9I6aXBd2b5IiREsg0985nBWNpHDnkA36hMNeoo2v6R2MlFO98CAXuP+FLmeFbJ46vh7UQG8a/nNYotKomq71+uAOe0XXdt/LNhy9C0Zcufnb/IkOdnI2ay509ZnGmwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321212; c=relaxed/simple;
	bh=X2bI2UoaLvX4gCevaU7qNOHhhCPcAax0k/u3+iPwhos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cG44j5mv8OgC/eDJcuHIrlmnGjVZPoSvIkbhruotuPoMW7zyPmUB+S+iTKQBaUfMaphMYlIifV4d38Ikh2v6vunwC7QPX+znSh0w1KZmMddnTiI3z5Ab1MW6aywNzcIGl9g3W0UJYCXCKWb39+uqWN1o0Uon+4oNPyIKZde/FVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hy+7mITx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hy+7mITx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B73CC4AF0B
	for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 20:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777321211;
	bh=X2bI2UoaLvX4gCevaU7qNOHhhCPcAax0k/u3+iPwhos=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=hy+7mITxsY3RF9VGJWL98ljKzomsIoVK2oIa2YDlwLMIUaCCYD4eNixLrsMYXtsmR
	 AIRHtSZWpFRDRDqp3k65eLE984AYxIAWHqla3UNhGY2HBXHCsii4MunlzQZPCD+elC
	 UF+zR0neDgrXsafnEilm7MpJOD9/wzaWVLXgIjK3UH5X14DlAqXYCK7EzfQ4en9htp
	 VPw+61liIAZGZATE2rXPbohATDSeqQGDdji0bgp+lHA3+mp4fPFKgb3uFPKrZfM9jm
	 4u2PmyhX+YD4cn5gmYBoeKpdICvenvNqPk0fnTJGpV1ex6n8wtThP313jPv1ECjBkJ
	 n0suIDTqNI5ZQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-38e8292423fso94497881fa.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 Apr 2026 13:20:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/K0GHhe88mhxLjDsGYZG1h5zwKDBItxPIR0gl9SM9het5bCk76jDSzrA1dfCReQ08IbJhn8rVTYWQs@vger.kernel.org
X-Gm-Message-State: AOJu0YwNg0gPYuFVqZIFrw/F5F2JTyROJUBXwXj2rBhDGH3ZZ0sNAGY5
	ED9lSn6feRm8pwLawVtWTdDkCgKFq6BkcEBjjgiuzKX+d9KNO3oODZk0a0O/tNQZwNkY0PDaRiP
	3F6VUZcfQz1IaoUuwDmnlgVdsnFeZE7c=
X-Received: by 2002:a05:6512:2203:b0:5a3:cc81:efdb with SMTP id
 2adb3069b0e04-5a7466234c2mr101158e87.21.1777321210358; Mon, 27 Apr 2026
 13:20:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260410070935.9540-1-bartosz.golaszewski@oss.qualcomm.com>
 <trinity-5e6f6a95-e576-4f97-9085-c6de21945eab-1775813076268@trinity-msg-rest-gmx-gmx-live-5cf7d7879b-qwfn5>
 <CAD++jLnjN-gUdCbmdmLaMYck=sP9wrhT2fFRB0TGCAVGvSsY1w@mail.gmail.com>
 <dc46f7d784281642aad6d47e79a3e91652eec667@linux.dev> <CAD++jLkz189qT1kJr34ratZT_n20oWEAQg8q0ttQ-VrsFchp7g@mail.gmail.com>
 <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
In-Reply-To: <CAMRc=McRuH5Fi-5UQWLRe4+wXKH8qikaYqiqbGXrPOgaifEesw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 27 Apr 2026 22:19:58 +0200
X-Gmail-Original-Message-ID: <CAD++jL=m6RGc8Lv0Cn2xsnn8kzV-paAMos4saYNFTpjUcxwcvg@mail.gmail.com>
X-Gm-Features: AVHnY4I-QfyRqRKRQSMK3sajFg1wZNjagZwtf7cBxvDJnumElCFBOdrk7T_ZX5A
Message-ID: <CAD++jL=m6RGc8Lv0Cn2xsnn8kzV-paAMos4saYNFTpjUcxwcvg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: moore: implement gpio_chip::get_direction()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Frank Wunderlich <frank.wunderlich@linux.dev>, Frank Wunderlich <frank-w@public-files.de>, 
	bartosz.golaszewski@oss.qualcomm.com, linux@fw-web.de, sean.wang@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 12:33=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:

> > Fixed up and applied. Will be going in as fix for v7.1.
> >
> > Yours,
> > Linus Walleij
> >
>
> Hi Linus!
>
> It seems this one got lost somewhere along the way? I don't see it in
> mainline nor next.

I'm just slow at pushing out my tree, it's on its way!

Yours,
Linus Walleij
