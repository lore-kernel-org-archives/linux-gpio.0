Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E98847255C
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797453; cv=none; b=pDrNUauZAecRpPbzpIYploVJELW1NHWlsGGqWyRPR9k8bRAK3K+kVgrQ6dxMgjxaXQX/fH/pbS1EHaxtui+u7iXW41XrMFm0oCinngBB6Y6X3hxQNyTSTUHM4y81wHXw7x/vGVTvAhs+25j/uKsPn2DxPWr6N2RYXOvkzI1BlaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797453; c=relaxed/simple;
	bh=JcOgKF4XM/l9A+xkMjDxwLxSXbEYIbrK+MMKAo104Mo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JRi31rbKiSFgZ4Jb69ojlpZhqzECnpRS4lHKJy3eycGlZo4s8BAzH8GS+uRGgSjJTucmJlbThW2oChVBWcXnXfQGLw/JI+cHFVN3F8kQNBfMwuLi9Q8u3zRPgeAiMAHlSRC7xLobxg3NwQuK91uxPkqdZkwmodbuhBNFL/t006Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y0RiYvbb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y0RiYvbb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 101B31F0089E
	for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797452;
	bh=JcOgKF4XM/l9A+xkMjDxwLxSXbEYIbrK+MMKAo104Mo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Y0RiYvbbyQjLEt9FzUTJMM8Ke7og2fwaGtrMdHSeL0MMJbsKO3JmoIbOXz58033pV
	 3l1KyJx/foVS8pHbPVTnGUB6kh1D5LVTL6LcNzURvkolpFl3HmxRLF7CPu/Va7N5R6
	 wCVD3zYPx6v5mmWxtP8qAhJ1LxlrJNh5+mC21vD8x2KlUMtCAKhPEImaMUpjWp/Ble
	 VbAzrViPrm1/hMcSxKQuactdtNPnofxbeJ5ZBb+X48/772/fISYDW0mPl7HU0ha0bc
	 Y5C/WUlk6Gda1kRmAmEKayCNdpMv/DKhf1S2GrPPOotX70oa862QNIHwAbWhDmSnvy
	 EmWuJD7nVEZ8A==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so1630882e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Oct 2026 02:30:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByKjn8FZAUzC88vB7aoUrCoc6XuuMUZej4yQZE9HvmsDAMf0pIB/FKfBJdyzNnD5Gjewd/XTJMdaeWi@vger.kernel.org
X-Gm-Message-State: AFq9FYJc+tB/QXe5w5V25/eMLfbJ2qVbD2BDET22LTHJXIQI49kCm62t
	6n4JIJBC4VP1U4Bw4+kQtJFVXqSc1la37inMPj7K0s+WOiwPMCnEjhF/fLfBaRXODdpCHRuXW/9
	DWc70inRWKeUkfcHQPF//54/DVE4fh/U=
X-Received: by 2002:a05:6512:6882:10b0:5bc:e45b:bec9 with SMTP id
 2adb3069b0e04-5bce45bc053mr1468335e87.35.1791797450757; Mon, 12 Oct 2026
 02:30:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007060107.62221-1-pmazzini@gmail.com>
In-Reply-To: <20261007060107.62221-1-pmazzini@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 12 Oct 2026 11:30:38 +0200
X-Gmail-Original-Message-ID: <CAD++jL=ooz2tMZFrZ_ssH15QSf-hxJJ7kGhRxhBFRx9QAdhNtA@mail.gmail.com>
X-Gm-Features: AclHuK_cjy8EpD9hefzb7XTUyJ7Wfeeo56o29JsaDB2w0FmhBq4yW8z0mIp2Xg0
Message-ID: <CAD++jL=ooz2tMZFrZ_ssH15QSf-hxJJ7kGhRxhBFRx9QAdhNtA@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sunxi: dt: do not accumulate npins across
 probe attempts
To: Pablo Mazzini <pmazzini@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 8:01=E2=80=AFAM Pablo Mazzini <pmazzini@gmail.com> w=
rote:

> init_pins_table() adds to npins in the driver's static descriptor, so
> after a probe deferral the count doubles and the next probe fails with
> "pin 0 already registered". Reset it first.
>
> Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
> ---
> v2: reset npins instead of counting into a local (Andre)

Patch applied for fixes!

Yours,
Linus Walleij
