Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F472E8B9B
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784972909; cv=none; b=AWWlmWTCqR8xHGy15V2g/+yKxSylVOETrNqab7r7RnjQ86QIs/AwkJgaZNBrRm611TnLuqKpFaBXz/FATREPZlF54nkvROdJfhBf2rV2ibeaFriKqvNLhaiLYFJcps2XML9v+uR67pxXUELMExuWCN9MwA0yJVHiqVMeLySICfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784972909; c=relaxed/simple;
	bh=bmfA0+GpWd7rWihBx7NsJY/C0PcgSTsD1nNyDBXtTdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bvMBwRPL95cO04O1C9oRmgBcoEwLSLXF/aUiCRXJQCd40zgUxLK1o1Ts5WLwGO+kZm6kRE0s5uAUthJBwMMBxXdVgYKAYwwDpOkoQoBf+zNgK35xVC+3X/CN6wzLHj3mfyhhCDVdh2E99fzxwt21bUilBFyxINHvd5T8kIjcy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKez7odS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKez7odS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DC551F000E9
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 09:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784972908;
	bh=bmfA0+GpWd7rWihBx7NsJY/C0PcgSTsD1nNyDBXtTdQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UKez7odSKAU1O/di1oZTiOnaucUfN+Xd30VpxPzaNdHmAW+iPRvZSiJmz4XM8kGX+
	 UjpMT7WSettPVqLlW3JRLHiMEqsp9fdaSy5VRBWvDFssiPx8W3hBpjDgXmwN/E/g6m
	 fwOQ90lLZ/9qaQZtdtj8txfrrQ7oG3EXzq/7U/fS0v7ybCq/S3izQW6xIBWU4UigRC
	 Lr80i1JnMQ76QOra7ImfvVMuzdcGlnqsyIkWEIHVSXJ7u0LjBJ8uLBcvCM4UwiZ+D7
	 qYJfsBbpafVbadq1wpA+ZM1qJqr0JgnhHUJTo5Sr0e+YDYNkr5aiD+9KfdV5dtRJ/Q
	 RwhylBwrYnzuw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5b015b2d792so1278855e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 02:48:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoflNdG0SLKPeVKC7rnBUkuUTsg0bDEHpHQp5/E8bJ/yXe86fmBkxFsLD5NBOzYbotTeFsGpMWVm1/n@vger.kernel.org
X-Gm-Message-State: AOJu0YyHcTxMOeOL36GQVNHuyrLE/WsxUVh+PSvL47jRXWywT7WzwlTe
	CC1U3vcv8YwrOEritfHVLLqinYFR1aJDAcqvvDWHlBWZdHyY5x7FSzas81KOw1OjGtzxq7mFyco
	TK/0vg8LsOVw7vdT+YoNpLusGBrLREY0=
X-Received: by 2002:a05:6512:3195:b0:5b1:1b50:7201 with SMTP id
 2adb3069b0e04-5b2c1b2ef9emr300160e87.36.1784972906980; Sat, 25 Jul 2026
 02:48:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260722213314.155310-1-julianbraha@gmail.com>
In-Reply-To: <20260722213314.155310-1-julianbraha@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 11:48:13 +0200
X-Gmail-Original-Message-ID: <CAD++jL=xTS8uvqMeb-fi6z1-94nZJC3cWvCKV0facdxGvp1wVw@mail.gmail.com>
X-Gm-Features: AUfX_mxOggyFq5f07H2jGjvpwJ0GrPvq6ulspmciTxcqJLpv9tzd1X_xmuZaOd4
Message-ID: <CAD++jL=xTS8uvqMeb-fi6z1-94nZJC3cWvCKV0facdxGvp1wVw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: s32cc: fix unmet dependency for PINCTRL_S32CC
To: Julian Braha <julianbraha@gmail.com>
Cc: aisheng.dong@nxp.com, festevam@gmail.com, Frank.Li@nxp.com, 
	ping.bai@nxp.com, chester62515@gmail.com, mbrugger@suse.com, 
	ghennadi.procopciuc@oss.nxp.com, s32@nxp.com, kernel@pengutronix.de, 
	bartosz.golaszewski@oss.qualcomm.com, andrei.stefanescu@oss.nxp.com, 
	khristineandreea.barbulescu@oss.nxp.com, arnd@arndb.de, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 22, 2026 at 11:33=E2=80=AFPM Julian Braha <julianbraha@gmail.co=
m> wrote:

> Currently, PINCTRL_S32G2 selects PINCTRL_S32CC which needs GPIOLIB, witho=
ut
> selecting or depending on GPIOLIB.
>
> However, other similar options in this subsystem actually select GPIOLIB
> instead of depending, so I think we can do the same here.
>
> This unmet dependency was found by kconfirm, a static analysis tool for
> Kconfig.
>
> Fixes: 94cb9e8f2707 ("pinctrl: s32cc: implement GPIO functionality")
> Signed-off-by: Julian Braha <julianbraha@gmail.com>

Patch applied!

Yours,
Linus Walleij
