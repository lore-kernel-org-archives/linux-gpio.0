Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD0D3783AF
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784971428; cv=none; b=KAkNwZtqxPdqS23fQWnUiWAjAGUw/NpC+Fcz7jj1cuFH0EEGVANwLdAK1XL8dgQp5EB3rUqvoRkUtbLK4MWWBDol2tMdA7/eWkfyPGGHOSvLHw1bsttyEhgjMjXqWUufNaGHZoAl2KOxbYfCEshn15zl/+rkBy64fQ/cFT7IpUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784971428; c=relaxed/simple;
	bh=t7MThxYmbb3VjZjbffFGWRZiUad0vGZbepYSj99HxYc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u949Uv3/vBkoqilgbtEyx3Xk/eFHuwqY+PD/n1dGKWlrODXI+fnj+BUHGoSZnHEwCLQ2Tevydk23i2d2Q1zPi4Y6Qj781KXoZqQImXJhGOr6+crHtFUiYhnQ5g8gECpKiID4acapJlirasAYIrJlDOYkIeJpTsgbqR/Q3Uvtd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OBB7TUky; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OBB7TUky"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFCA1F00AC4
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784971427;
	bh=t7MThxYmbb3VjZjbffFGWRZiUad0vGZbepYSj99HxYc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=OBB7TUkyxV6M8zHbAtd0g+2BpFBj6UyGt9V1b48RgtcBxfaQhdVkt1siIm7j1ZV0j
	 BH9ClGTcTIHpwY8e0BIefu9c8Sxsqs7GfQhAIFBhEkJLH6KK9D5t+GThvabVzX5gx9
	 VPn0yOEKRu+fCaIcZRLmUovhUR0iriqplRcCgj202IRE3hgB28TusOVS4UXG2UafBo
	 wUYw9GLL1tptWiTdV/33ReWgv7zI495qqEuijaopOTGFW2WVl/wLsKi9o/5jTVrJZX
	 JJISt6bjVDfPRWADMU54whT9aLnHvTkaFmwRC3h5v7c1W5NVG5VOZRnvgk338tSFxC
	 bbVxRIPxSljXw==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-39c9452244aso11752911fa.3
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:23:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp1aDO2YcSZbIf5WSZTOdLNWwwLX3NKLahk0qO1t6OsPDReS/um3sDQaKBw4Q5L1+rkYGGX/GADpngE@vger.kernel.org
X-Gm-Message-State: AOJu0YxQUTNBnEr8aYsW5UqfdyhoFR9QFdlrjRUBFc/4P37IM0SDQ3S+
	08Y96PLBU5FW6WS5m+0LuaglRhy9ctEfvtPpXkACBg6+y0xyeHCnG09F5XVE7hKznIa3QhcLcGi
	eOvel2xV3fXv3Cr9WOQcwwg2KXjHz6NE=
X-Received: by 2002:a05:6512:1295:b0:5b1:59ec:245f with SMTP id
 2adb3069b0e04-5b2c1afb585mr286093e87.8.1784971425959; Sat, 25 Jul 2026
 02:23:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718002146.698973-1-ts.solidarity@gmail.com>
In-Reply-To: <20260718002146.698973-1-ts.solidarity@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:23:33 +0200
X-Gmail-Original-Message-ID: <CAD++jLns-5nxWjwa9LiDVbvNngQE+OYF05nD+wd7J1H3rfv9yg@mail.gmail.com>
X-Gm-Features: AUfX_mzEZphqkBqhPp56J4Kw53AoG30iiWRKp6XfygP-QF_fd1T9aE0wFbObjJE
Message-ID: <CAD++jLns-5nxWjwa9LiDVbvNngQE+OYF05nD+wd7J1H3rfv9yg@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: ipq9650: fix audio_sec_mclk_in1/out1 group pins
To: Taceddin Sancak <ts.solidarity@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 18, 2026 at 2:22=E2=80=AFAM Taceddin Sancak <ts.solidarity@gmai=
l.com> wrote:

> The audio_sec_mclk_in1 and audio_sec_mclk_out1 groups both list
> "gpio37", but in the pingroup table those functions are muxed on
> gpio39, while gpio37 provides the audio_sec_mclk_in0/out0 variants.
> This makes both functions unusable: selecting them on gpio39 is
> rejected by the pinmux core because the group is not listed for the
> function, and selecting them on gpio37 trips the WARN_ON() in
> msm_pinmux_set_mux() and fails with -EINVAL because that group
> cannot mux them.
>
> Point both groups at gpio39, matching the pingroup table. This also
> mirrors the primary audio MCLK pair, where the mclk0 and mclk1
> variants live on separate pins (gpio53 and gpio51 respectively).
>
> Fixes: 3c8e7ba0e399 ("pinctrl: qcom: Introduce IPQ9650 TLMM driver")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Taceddin Sancak <ts.solidarity@gmail.com>

This patch -> Bartosz
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
