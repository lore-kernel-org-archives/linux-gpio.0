Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47BA434407
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 20:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786392477; cv=none; b=prRrOwap7STiyPx94WtbdHvN87qYg+KUR9iITFBSXYJecvWMzkwlHHUHLAaz+zZOCPm1gX1m+L+8x9bThdRUtF1muwAH2h3dgmpOfoy8HcUBlVN4wB2G2FDDWoBauDnW01LOfQZbYAFgk5bYn6SYUIj1bQF/gMh6gP+3cunt3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786392477; c=relaxed/simple;
	bh=bYSs7pwGOcP1HawBNqhdmv009wD4aFz+D/7i7ebIbM0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzKQMsqy0FkTSkFeSnXAPcg5DCn9X2wpt67gUwK8NXse2xYXmMVbB6VAmApKxeysQEa6q/jbojO5sLxOEenEdgenxNBdWzvJbpNVPyXpNAFXWSuozlxxNZZu2dErNBF0DS2cqLyJPABzGb5BNaZOk+30g7gm9t3n/OYMqK0wuRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ofNkM0Ah; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ofNkM0Ah"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AAC81F00A3A
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 20:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786392476;
	bh=bYSs7pwGOcP1HawBNqhdmv009wD4aFz+D/7i7ebIbM0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ofNkM0AhJ0ECf2vZ3YjsXcL6Fm9B/LUx9zOf2sBqypegScFN1+CgLPT7B1bDeqx51
	 64PSAdfaZ1hzB5RB1MefD71UVLE+rsrI7C7ZbugQa6QuVIsqlup3TfRVm3MYkEkwwy
	 A9SeKcscMEkg2HrBmxV4WHgOk9fLvYOARh3TH3ELrwnPIXUjd4DVFm8T8fsJrpBmT0
	 m/mzsIMEkeZAYuOVcn9jjZPhAals1XDOZwp+BibAMzZhsMTjjC4CPdFfL19rCmVmwg
	 YbX8uQhX8QYpT1LFs60IIZ9w1QMfk3Zj3EDVp6skcK8i3xpbxauMyjx3Vkmauqblmj
	 FmdZm5LV/9d7A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so81164e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 13:07:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrOqaZAM86TN1W0Q9CqS3A0kD+tWMccAcKN2LaxM5juoq/uiE7f2ewiqC5sHVWd6S0BLookzw8MnJ3N@vger.kernel.org
X-Gm-Message-State: AOJu0YyWI5Ozlzrv2I3FF9sUA6lP0TzN6G2VNkOvAuiARpyiLq6fCOBw
	Z9ySDsv7V/QpwTzOcI/QUDYfRScekF/v5DCkJdQnBV8US8pYm0XFa56xJNLgKzUt2FlcVn/aUp2
	/MSa4+cKhKr4DQJzpuVtuD1JTMCUpxtI=
X-Received: by 2002:a05:6512:3e0e:b0:5ae:a995:c16c with SMTP id
 2adb3069b0e04-5b2f4cc0f61mr5811088e87.27.1786392475246; Mon, 10 Aug 2026
 13:07:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260729132736.3807082-1-sjg@chromium.org> <20260729132736.3807082-2-sjg@chromium.org>
In-Reply-To: <20260729132736.3807082-2-sjg@chromium.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 22:07:42 +0200
X-Gmail-Original-Message-ID: <CAD++jL=hGH7a-LM+Foy=mVxmVhCdtaxdaF5Mfo+3BCwMLHNVdQ@mail.gmail.com>
X-Gm-Features: AUfX_myfAckQ8mgU7iFbZ97rmWnbGSBawmIas1W-k7uCRWa4QUHeMhWOocB5lDc
Message-ID: <CAD++jL=hGH7a-LM+Foy=mVxmVhCdtaxdaF5Mfo+3BCwMLHNVdQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in the
 get function
To: Simon Glass <sjg@chromium.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-rockchip@lists.infradead.org, Jeffy Chen <jeffy.chen@rock-chips.com>, 
	Ye Zhang <ye.zhang@rock-chips.com>, huang lin <hl@rock-chips.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 3:30=E2=80=AFPM Simon Glass <sjg@chromium.org> wrot=
e:

> The decoding of the 2-bit and 8-bit level drive-strength values sits in
> rockchip_set_drive_perpin(), where it is unreachable: the SoCs whose
> banks declare these drive types (RK3506 and RV1103B) take the early
> ctrl->type branch in the set path, and the read-and-decode logic in a
> set function has no purpose. Meanwhile rockchip_get_drive_perpin()
> lacks the decoding, so pin_config_get() and the debugfs output report
> -EINVAL for these SoCs.
>
> Move the two cases to rockchip_get_drive_perpin(), where they belong.
>
> Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
> Signed-off-by: Simon Glass <sjg@chromium.org>

Patch applied!

Yours,
Linus Walleij
