Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFDA2D3A7C
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782805556; cv=none; b=kaP4s8Lp4zlJABaqRZvLuLhlsIOn3Ifb5ZJFl62+azW3o1sCby9CyKirhUWd5JklXtdotp0imFlyjiB8CC47Qz+r5yRmQqQLkPI9oEvinY4dLORbf5QYPkeHBFlzkWDl05l2tgadxPlc+27Tz+/dx0tnXDgayU62tGyHUScAs+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782805556; c=relaxed/simple;
	bh=VSp9DnnhxfAiiMCrNdSPJPx7Y8RqEh6z+slDdu2WdxI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CY28qGhxl3sjWfpx2U2+R2dEQFWa9Qkkvh5M4Rq0CYdbBfg15lneIVVW7hClNXrDcKravQ31aKgXhjKgdpXVLSqXvoZdU7I/R8jeus2rbjTPmLeRkV21nPVVRlc+ak7kaTteWnwgbg24pgUnQFQT7yt8NoEQbXD0BgdFcKYMFIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=auGxdCLz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="auGxdCLz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75FBA1F00A3F
	for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 07:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782805555;
	bh=LBg8gQ42IeE8kt+1uV3VSZ3Pjow8BaIMuFcOC4tqsqk=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=auGxdCLzzRBPdI7qqIXCDzGuJT4Ug4CmFS8b3aIq8nDE/nBtjZxS4Cp0TXo8Wsefl
	 sz3lGTXCxWDAQz1Vz/xdPnvpHouEJl1javnzgRc9ihEalfd8mj9kOYUrwAhZSYYltL
	 mNsd6FTUPkIZ9AWGAqCYchfZhtD+0cbxjTmE0968de0sZhLz75W/dfLQNM91PDVBYu
	 ZSt4gXhMR7v4lUSpvQoyPJYxoZXV/cgQIg6DbyWiOs7ZIzIn5CPuYw/7xJ1q+M/iHx
	 N0Bfxb+OOXXUINAPSO7TD1uu7RF1JcAsWRQt/jt6BHa4gC9shuOhJMhfrVcWeVNkke
	 AZfxO5jSPQclg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-39b1eb7bde5so4567381fa.2
        for <linux-gpio@vger.kernel.org>; Tue, 30 Jun 2026 00:45:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RryJbyijO83x3RsY8X4Y47AMjFnHB/oSDwiseN7CWHUDfLQZViTPK1vLTJxa2qxCpbhmAcOb+KLkqAL@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pSKIeeSY1o67zlbt78KxKzW/V68wPyHaYKGvAkx00z0dChNh
	W5RG9DRnT77FngYXIGpGxY2ATAf7l2e0gCpW6Lkgn1flfGVXo6G7k1E9NUU4L2NRvdeTxGjykMm
	xqulIWck/ObcC0TK8qJVx8fjTd0V7zFaChdXVXGrOTg==
X-Received: by 2002:a2e:a99a:0:b0:39b:2323:b700 with SMTP id
 38308e7fff4ca-39b2323c4abmr2941181fa.10.1782805554039; Tue, 30 Jun 2026
 00:45:54 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 07:45:52 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 30 Jun 2026 07:45:52 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260630-loongson-gpio-v1-1-576908831fa0@gmail.com>
Date: Tue, 30 Jun 2026 07:45:52 +0000
X-Gmail-Original-Message-ID: <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
X-Gm-Features: AVVi8Cf2IFweTBnhLCHHWzNG_tKwGlyzQxYlAjT3uMoAeW7u7IpDxzdVv20tLXo
Message-ID: <CAMRc=MdtRj6c3Bg72QMaAEMPovNyUdqWL_qDPGb1p=Cu=cETvA@mail.gmail.com>
Subject: Re: [PATCH RFC] gpio: loongson-64bit: Add back the support for gsi_idx_map
To: shankerwangmiao@gmail.com
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jianmin Lv <lvjianmin@loongson.cn>, 
	WANG Xuerui <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Hongchen Zhang <zhanghongchen@loongson.cn>, 
	Liu Peibao <liupeibao@loongson.cn>, Juxin Gao <gaojuxin@loongson.cn>, 
	Mika Westerberg <westeri@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 23:05:28 +0200, Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> said:
> From: Miao Wang <shankerwangmiao@gmail.com>
>
> This patch adds back the support for gsi_idx_map, which is used in the
> ACPI DSDT table to describe the mapping between the GPIO line number to
> the index of the interrupt number in the declared interrupt resources.
>
> This property was removed in Loongson CPU Universal Specification for
> Interface Between PC/Server System Firmware and Kernel v4.1 in November,
> 2023, but still in use in firmwares released this year. A sample of
> an affected DSDT entry from a 3C6000 board I'm currently using is:
>
> Device (GPO1) {
>   Name (_HID, "LOON000F")
>   Name (_CRS, ResourceTemplate () {
>     QWordMemory ( // Omitted, not related
>     )
>     Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusive, ,, ) {
>       0x00000010, 0x00000011, 0x00000012, 0x00000013,
>       0x00000014, 0x00000015, 0x00000016, 0x00000017,
>     }
>   Name (_DSD, Package (0x02) {
>     ToUUID ("daffd814-6eba-4d8c-8a91-bc9bbf4aa301")
>     Package (0x03) {
>       Package (0x02) { "gpio_base", 0x50 } // Ignored by the driver
>       Package (0x02) { "ngpios", 0x20 }
>       Package (0x02) { "gsi_idx_map", Package (0x20) {
>         0, 1, 2, 3, 4, 5, 6, 7,
>         0, 1, 2, 3, 4, 5, 6, 7,
>         0, 1, 2, 3, 4, 5, 6, 7,
>         0, 1, 2, 3, 4, 5, 6, 7,
>       }}
>     }
>   }
> }
>
> As can be seen in the DSDT entry, the mapping is essential for obtaining
> the IRQ number from a GPIO line number. Otherwise, when IRQ is requested
> for the line numbers largers than 7, it will fail with -ENXIO.
>
> The code in this patch is mostly picked from the version 5 of Yinbo's
> original patch.
>
> Fixes: 7944d3b7fe86 ("gpio: loongson: add gpio driver support")
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>

Cc'ing ACPI GPIO maintainers.

Bart
