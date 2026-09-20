Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0A635C691
	for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 22:23:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943032; cv=none; b=dYzpRo+4naf8PEEaVLn6bV5r7QIWdpp3ge6cyPPh1QOCa6N6OGvk1bKF5ISi87sP4iQ31wDIxH1gjUV/7ryczXJMd4R8tFiLHwd3KDiSQIsaGnbJ81CJLWVpV/OJxCjhV+tagZEuE9JYx643H/mLRjf1Xy/72JMVZ8wopjq5lo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943032; c=relaxed/simple;
	bh=XcpS2C5b2gU7B0ckmofHcYCfd23MRKzruBLpc8zPt4g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cxpM22jo70Yskng40Y64HMzMBEOYps6mpjsaK5iAGaeHBe9uvNGyCh1T6Gls0823s5adt7HBl9RDpjE6wQlykdnA5GOQMvciJ1euALkpq6TqpGrzdU1TvCEEUvYdEZio/Hj2Oym2PWufyxUiFqkXyz3kQDLTxjAC/YB4RxXh22Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jUzB1v3j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jUzB1v3j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D9C1F00893
	for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 22:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943030;
	bh=XcpS2C5b2gU7B0ckmofHcYCfd23MRKzruBLpc8zPt4g=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jUzB1v3ju2gDsG4RCi219Fw+ggbv3vozCq7XFlY4FfIB4lO1HvzH6kLVZOIrJ58Ui
	 aXFZMbVFbCuXt9iTZowfHhsE13QMJ2kLwna2vZIDvMH8SladHk1cFsQqDfJ8VZbMLw
	 MKVn17XruoxrYdYGf+o3MKTjVNMliRCZ1/3/6iaKFxcXUNsv+ezKCECnNqypuZXBa1
	 Gj1D0yGOKZ60uU8bPKhHiSld8jIxnqLgoL3gnlDm3I1P2LQ1LvitRbKuihVJPqFs4R
	 0NVu0hDG16s1iS/cMnNmsvnhx4WYVa/lvRwNGBlWWx4Ca2Di16YLAeRBGcjiaQb221
	 rN1RrqyX/EIDQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so2488415e87.3
        for <linux-gpio@vger.kernel.org>; Sun, 20 Sep 2026 15:23:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwDgiBpgcgbkYN49Gwdpb5eYBrCJaw4UL/zu0U2k9K2/wQkFQvhDUJNjE6t/oiH2spbZkb5dO61Spo2@vger.kernel.org
X-Gm-Message-State: AFuF++l79J2AQbreLK8uS4QAgYF+4P5db7GE8VDO9Qk95bpjz9xfvajW
	02Bppw/yAjbr0sQeUnBx04B6fUacm+7o94V/zJCsW2tht7VSMWeWLViZ/9ArMQ6bsDo9fDCEL70
	m/6rIiqT+ctXHq7Fo5lR4Jmoi/PktBQg=
X-Received: by 2002:a05:6512:1293:b0:5b8:9ee1:10fd with SMTP id
 2adb3069b0e04-5b8c195b2a3mr2596776e87.32.1789943029592; Sun, 20 Sep 2026
 15:23:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <sa6bj9x31zk.fsf@dev-ag>
In-Reply-To: <sa6bj9x31zk.fsf@dev-ag>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:23:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnh9UwMd_opPfhWrkOssDUJQkqmADa9Re_hqnGqHdnKrQ@mail.gmail.com>
X-Gm-Features: AcwNN1WxZQUUkn6BXksV0q35G5hTDHGJ7iW3Og4fCiJ7c6yi5T8Bf6oe0W8b92g
Message-ID: <CAD++jLnh9UwMd_opPfhWrkOssDUJQkqmADa9Re_hqnGqHdnKrQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix PINCTRL_SPPCTL=m
To: ag@ffroot.co.za
Cc: linux@armlinux.org.uk, dvorkin@tibbo.com, wellslutw@gmail.com, 
	arnd@arndb.de, afd@ti.com, aaro.koskinen@iki.fi, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Julian Braha <julianbraha@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 12:49=E2=80=AFPM Andrew Gaylard <ag@ffroot.co.za> w=
rote:

> The PINCTRL_SPPCTL option is defined as a tristate in Kconfig, and the
> help text suggests that the user can build it as a module by setting to
> 'm'.
>
> However, it cannot currently be set to 'm', because SOC_SP7021, the only
> platform that supports it, is a bool option that uses 'select' on it.
> Also, the SP7021 requires this driver to be built in, in order to boot.
>
> Change the tristate to bool and fix the help text.
>
> Tested on linux-next-2026-09-14 on a LTPP3G2 board.
>
> This impossible tristate was detected by kconfirm, a static analysis tool
> for Kconfig, by Julian Braha <julianbraha@gmail.com>.
>
> Fixes: aa74c44be19c ("pinctrl: Add driver for Sunplus SP7021")
> Signed-off-by: Andrew Gaylard <ag@ffroot.co.za>

I applied this patch as a nonurgent fix.

Yours,
Linus Walleij
