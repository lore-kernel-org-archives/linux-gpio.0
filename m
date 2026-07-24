Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD2FD327C09
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 22:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784931233; cv=none; b=c115rR/RGme4xOpY92RhkM+mh3pjkKyZbjSfV6yVt9SvjPO+6Q3SXV/84MIdIreq6t/dStoyZ+UFe5BDEhYjlmBl3eqcVtqxqUq3Jva0o52UQwgDOrax2H7aABAo44NBXhjWlLagt198xK5f9gT7JS2qioIB/KmZSbmmK8iY8eE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784931233; c=relaxed/simple;
	bh=aGH1/2toPHVIOQa+jK5UNhDmHBD0aRC5mQRDqAj3tYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CtHeX5XBmGSgQrr7IVgzAoZuMAbkELpc2RtAULj3gflK3X/xr/nek7oM0ModHte0gy0nrcL/hHgDi+WBEY/vLs9sP9CYtuakRu8PhahwdG+VG1P6N6bF9cFZI1Boydy51c0sUTkt2N5MXMNOyp99sVxqpvPY3OWmseYNehLyLAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FXgNPEcm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FXgNPEcm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 755E31F00A3D
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 22:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784931232;
	bh=aGH1/2toPHVIOQa+jK5UNhDmHBD0aRC5mQRDqAj3tYU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FXgNPEcmyUE0kVHZ6djQa3bjOde7CyAnqB+vHKouxeko1ahVwngW3hfMx0OV/00uO
	 HTYf+nqinj93C3ZO4JmCihblplGsmzaB+1X09ObmzLe/jQAnsj5fmB7N2CXsQ4IDIp
	 oVBdD67TFc1L+Kzvxy80Kzz06UpCRGGeo55FJfDOPxX/fT91s1ciW6DdBjhpWxwtWB
	 4QYkwupmYgdeA3zTakFLJIqWH5qK/LX4dd2FDrFNMQ7hiM5YoSPTuIDU2C2IGTnu08
	 7rBLejOy04THX/qe59JSaPVVOIHTCzOsocUcOnIAUp3vOPi+f1p12IOeI9TOE9vcKh
	 E7SDad10HXS3A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aec201b582so930748e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 15:13:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqo6+kED88snmIOjS4/AuJ+p2iGCErHgrQSlZSWTvFqMnJisfsMV5KwgiNvWq0pVIdnsvMMq7cKPa9u@vger.kernel.org
X-Gm-Message-State: AOJu0YznIRcaFAPjbvvE1oN/eH+IQUdfbh3MiCerrL7vmsQ83e+AkQcT
	VNTV8YSIeGIDrrqFnI1eTZlbaLn5ooG3DfwJaAui9ZybUxdpmifBnMvz12LDbEo1lydc2l8TJcc
	sji+G+4kkLDgUF28GfLXjmmZnps6qc0A=
X-Received: by 2002:a05:6512:6699:10b0:5ae:bbd3:27e3 with SMTP id
 2adb3069b0e04-5b2b2e52e52mr1247043e87.5.1784931231294; Fri, 24 Jul 2026
 15:13:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717075918.1869879-1-hugo@ahdrone.com>
In-Reply-To: <20260717075918.1869879-1-hugo@ahdrone.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 00:13:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ASH7jx8YOL2Z5i4K8w4RQd4eWKEGtY1KRBwM-JDaw-g@mail.gmail.com>
X-Gm-Features: AUfX_mxV3lAJSNoJIi5Cr9GxwAU_Lyd6F8eQg8jRexuVpOK8BgTgzF15KgMIbjM
Message-ID: <CAD++jL=ASH7jx8YOL2Z5i4K8w4RQd4eWKEGtY1KRBwM-JDaw-g@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: rockchip: add support for RK3308B SoC
To: hugo@ahdrone.com
Cc: Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Dmitry Yashin <dmt.yashin@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Jonas Karlman <jonas@kwiboo.se>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 9:59=E2=80=AFAM Hugo VALTIER <hugo@ahdrone.com> wro=
te:

> The RK3308B is a silicon revision of the RK3308 with a different iomux
> register layout: several pins (GPIO2_A2, GPIO2_A3, GPIO2_C0, GPIO3_B2,
> GPIO3_B3) gained 3-bit mux fields in new GRF registers that override
> the original 2-bit fields. I believe the bootloader enables the new
> registers via the sel_src_ctrl bits, after which the kernel's writes
> to the old iomux registers are silently ignored. Whatever the exact
> mechanism, on RK3308B boards (e.g. current Radxa ROCK Pi S revisions)
> SPI1, I2C3 and other peripherals on the affected pins are
> non-functional without this series.
>
> This is a continuation of Dmitry Yashin's series from 2024 [1], which
> was never resubmitted after review and got dropped. Following the

No reactions for a week so patches applied.

Any remaining snags can likely be fixed with follow-up patches.

Yours,
Linus Walleij
