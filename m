Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8CF4756DF
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157386; cv=none; b=s07PDtU2WXK6DYfNE2sL7rs/COSkjrqkJGjvDP9bN7sZ6XTcxEEH/5zTc7ISCI/ovFV9/9CUraWogR1qypD/jBbEaRpLF3zqlL5kA+bCGkGd9d9g7M+vEZQGFtOty1DV7Sf2YAkvxWa9lSYI3/xeweUICxs2Rao5phIRafgj0QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157386; c=relaxed/simple;
	bh=rkZikTgogFEQQZjBsVHDYAkM+UZl7z7VjTHhTROfeGo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rAmzJZgM2wpxf/yavKLaFVGoc0Eo1yXRXhsYagoupxJpJ2cANbx36osczYwlFf6zgpN4AmkNSh9g3NgF8yZ8n+2x4MQhkjKRklVfFuXjtNEYc+euibSxGrCSsyuFiQFzl7Mg3EH+MwTy0sMaVjet8+02SNOUkBxVILXGNaXNHoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gJkOOAYQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gJkOOAYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5931F000C5
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 13:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792157384;
	bh=rkZikTgogFEQQZjBsVHDYAkM+UZl7z7VjTHhTROfeGo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=gJkOOAYQlVa+hiqrBL+gfPlLuNLnkZDYSGRTJHCarVTNimO3Cb4LVSOSEUAwlNFlR
	 qgo2J0Nk6wpo52taxbVUh2AwuxAk9fa/JQdbsFcR/DiDqDlXBSrTaWS1LXjTuVWN8f
	 3E7goHMi3mkrO/ZddVCQx2kep+HWum4Nq1ePwb/IfyapN4F/SpVvU/cvwjxdE3KWlZ
	 ZHSnHQLIqjq4TjlAa9QrnSBDyIEIp7hbN6JTJIJ/ohkMecvJIPRXI0Xv46oRyDg4vL
	 nLy6eqfBfbMHGVUbogPmPVGagC/RDwzsSoJZ1AZvOkVknpw8+LbTZa72qrDOk5+pTV
	 RQjbGGwnfZMTA==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a87e23860cso10957701fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 06:29:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw5GG7NSCK59dcvHyNiE9kwMFSfKw4H/3J/IhRnzDbDEdiIUs/XAO8yn54cbfcB5ktsif/9u13PRhRW@vger.kernel.org
X-Gm-Message-State: AFq9FYLh+h8mPK8sDeeZcjgoR9UECP++mVVVRXrrkMAhKq9dJAc8vrlr
	qsOAJWB+c0UTlTuTnuloRojFDbuFR0bovoRKmeOXKxCYtqy3C8jvWjmGIoAZJT+GS4uErb1AnAc
	xjd2zqDR3U65h4B3FnZzvCIExcP+Cyz4=
X-Received: by 2002:a2e:a881:0:b0:3a9:7c85:a16d with SMTP id
 38308e7fff4ca-3ab147882fbmr6164411fa.5.1792157383421; Fri, 16 Oct 2026
 06:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015-cv75-gpio-v10-0-3fe3eb315a55@ambarella.com> <20261015-cv75-gpio-v10-3-3fe3eb315a55@ambarella.com>
In-Reply-To: <20261015-cv75-gpio-v10-3-3fe3eb315a55@ambarella.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 16 Oct 2026 15:29:31 +0200
X-Gmail-Original-Message-ID: <CAD++jLkMwyL422Bq3SaDAGjsm+FPPmUgup-W_OxT7tf-3TPyWw@mail.gmail.com>
X-Gm-Features: AclHuK99j9nVgnAmXg1QJdGruNNYKiDlB-doAPvBpPVnoTzMk9d9k2qsM5xJ7TE
Message-ID: <CAD++jLkMwyL422Bq3SaDAGjsm+FPPmUgup-W_OxT7tf-3TPyWw@mail.gmail.com>
Subject: Re: [PATCH v10 3/8] gpio: pl061: drop redundant pending check in the
 IRQ handler
To: longzhao@ambarella.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 15, 2026 at 12:54=E2=80=AFPM Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> wrote:

> From: Long Zhao <longzhao@ambarella.com>
>
> for_each_set_bit() does nothing when the mask is zero, so the
> if (pending) wrapper around it is redundant.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
