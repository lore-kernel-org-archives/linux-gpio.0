Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2380351E452
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789576538; cv=none; b=iZSrkTKgTW23TUgEVLsDQvr+t1fvRBqYvfi8O8UD1byvMwNC+Ors00nVYgthOIalA4UQJu5MjCl5mCenizDFVbGgjg5ek5e9hi9NsOFJlC7v6QkZuFIAdn+887sctoaX7mzWurrDhm1IZjKpNQIsdICw+v96+yp/EuYTa0riZtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789576538; c=relaxed/simple;
	bh=044CrMqm1hX472GyboH+P8q+RWHr3VuP6wQdlD4joxs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tJT4ZJdHGhelBMOsS/sFeyXmD9kFnGC1O32hzE7ZJxKET5BGlC1eopLWlcs0UweyBcWmslSPDl2XgNEtCnsx4dOOG9D3z5+13pb+Z/za13Lew24Ri3HrloPiKcMhwcv2iMKy2afDBZMTNKIJGPnBKpi76QCXK6CoAgLG7UkH0BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ev8qH/Sx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ev8qH/Sx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3239A1F0089F
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 16:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789576532;
	bh=044CrMqm1hX472GyboH+P8q+RWHr3VuP6wQdlD4joxs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ev8qH/SxBCpyuGF3HU5REG17ahp3YJOMTf5VMWq89VmLTcd29cME/my0j+xE39SBh
	 753CcdI1sS4+tA6b9wrI4PtI4S0Juz6E7sXIBeOvJQRwVcMP3knbNwUQOjO0aypvo8
	 i2Ah48QVlUpeykjmGRWTci0GzvQU8w1ZY9GoZEaN4zUkY07aA3+VjZ7eJL/jH2yZ4f
	 x/oA2Hr74NxP5/ed70hXaRmYNJhbqYxKPxjo2CWTAXqlUHBaJnUPY2Fu4Mq41e5p/0
	 bMZ6JEMmisL3sPEO14aYX+EVc6AkO0TMRDh1/7HE/WPIAE5whK0oCWO/zbmOyOtxrV
	 6VngY2T8yyjEA==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b8997bc6e6so1830413e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 09:35:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzhP+D6iO2JYTl8KNTuMdQBkJMBLd7/0Zr+rVqMRnW4PYQH4odyT/lRM/JwXnF2PBbVUvk7qG6vCXYK@vger.kernel.org
X-Gm-Message-State: AFuF++n7sh0cnXddD1ntB+Eo8+hO/ex34YK2Xwh2miPvW7fFfPuPJ9Gi
	VK0ykcr5NxIRr15SgtTLZompp2n5+ZGOdiGbKbHqHiAPkg4asRGJ7tDTogkrubusD9AwcwcS2lb
	/9snFwtzYi3LlNHuSJ4nDneNj59j5XJ4=
X-Received: by 2002:a05:6512:63d7:20b0:5b8:9999:2f14 with SMTP id
 2adb3069b0e04-5b8ba5eba89mr50407e87.19.1789576530843; Wed, 16 Sep 2026
 09:35:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723035823.2041832-1-justin.yeh@mediatek.com> <20260723035823.2041832-2-justin.yeh@mediatek.com>
In-Reply-To: <20260723035823.2041832-2-justin.yeh@mediatek.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 18:35:18 +0200
X-Gmail-Original-Message-ID: <CAD++jL=3YWAQsYZUTiRUpX_WOkeNYe5NdADwNeoFky+gY=OX5w@mail.gmail.com>
X-Gm-Features: AcwNN1VvaG_CTHc5Gx7LSXS7f1odDC4A4LezNnphRUFVM6XIRyS7EcYx1dfz_o0
Message-ID: <CAD++jL=3YWAQsYZUTiRUpX_WOkeNYe5NdADwNeoFky+gY=OX5w@mail.gmail.com>
Subject: Re: [PATCH v7 1/5] pinctrl: mediatek: use devm_gpiochip_add_data()
 for GPIO chip
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Chen-Yu Tsai <wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 23, 2026 at 5:58=E2=80=AFAM Justin Yeh <justin.yeh@mediatek.com=
> wrote:

> The gpio_chip is allocated with device-managed memory but registered with
> the non-managed gpiochip_add_data(). This was harmless while the drivers
> were built-in, but once they can be built as modules and unbound/rmmod'd,
> devm frees the gpio_chip's memory while it is still registered, causing a
> use-after-free.
>
> Register it with devm_gpiochip_add_data() so it shares the same
> device-managed lifecycle, which also lets the manual gpiochip_remove()
> error paths go away.
>
> Fixes: a6df410d420a ("pinctrl: mediatek: Add Pinctrl/GPIO driver for mt81=
35.")
> Fixes: 805250982bb5 ("pinctrl: mediatek: add pinctrl-paris that implement=
s the vendor dt-bindings")
> Fixes: e78d57b2f87c ("pinctrl: mediatek: add pinctrl-moore that implement=
s the generic pinctrl dt-bindings")
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

This patch does not apply to current v7.3-rc1.
Please rebase and resend!

Yours,
Linus Walleij
