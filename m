Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9043CF05E
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 08:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883282; cv=none; b=f8Ef7CYWrt73GD0JykWut5VJsX0gBmH3QAcSqrYQFhYJPmYtwgilXkNSunMiQfSBLumehcY8Qpgt2tmFlI6CN0nc3+/KbD9YHMVYVa1zWJOdNIdPovZ6LnFX/qBYNWYRO9TrfC4fECIPf15PBJWm2UnGkTkyflAuim6qlKn1+ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883282; c=relaxed/simple;
	bh=VsPYV6juei2qPjiCuy/EV7+R7cnFM1NgIVNhKMuCeFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KQub6nq0sNypMhIuh21dQVCKb1q7J+xSr3zXdj4LC0F85TnoR34eQ9qIZY9VHcC7SMOSEVnoAsGm8S6UnSWT7NsBmIkgY699lq49YjhAKpvEeWivxpGkp3PS1Y/NFPuNMVszjUyEiUJcqgVy7kkRS39hX/XWogZssDAFf/dTtqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hacRXYmx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hacRXYmx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C331F00ADB
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 08:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784883280;
	bh=013sbt/Aqw+70808Z5YZj2obs2K/SGEiCRmD03ytTZY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hacRXYmxHN+gJ4NzV8JwMqoF4SGP5dusGybBPcU4B133huaOOFRiYucSNMaEjw5eN
	 lZfJN0YLp/rLQGtW4knPKyQR19WXxkv09uzH8E3K+geTi8ZC3khArh72Ib0Yzf1NHM
	 AnK6QJrznT9a6bK8Yjx8lybcnyZVpChxkNcV6ETbiTioS9wQUGLHFwF4S9+6Tr29YM
	 /DXv1jcVsmj/uPS9zRtuCboSUPdDpc5azCHRHCbLqNVpy0XvZH+9vvEtQjw3Wc/sWx
	 8vBG6Uk9YHWTeRhE0T2/w8XmUGVAU63FaFVCcVnSZHFwVUrYsOWil/6Ypz7PZid1H5
	 Hzkag1mBMDLwg==
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6986287534eso173176a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 01:54:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rr51WnmpXVx420l9i3yRf70oZ4YmVih6gtuclrMpn1wOwalNugHkkhiuHo0cdkV6DMNaa15FCG4bE4U@vger.kernel.org
X-Gm-Message-State: AOJu0YwdyMpL+kPaC5iRJRJ0YQuCtU0psG0j+sdGZvx9dAGtwsa7qzwX
	HjNA5SHi/XscrMrjR+eAH8glfb9bGSn694E4tlCtSkT0v0VEHp0EVvT1UAnlDbwgPMnphrcQr0D
	JI0z/JT+Qw9oAo+RkvOr65XeS4VXdTwQ=
X-Received: by 2002:a05:6402:2550:b0:69c:794d:48bf with SMTP id
 4fb4d7f45d1cf-69f6cf10bf5mr1691997a12.17.1784883279220; Fri, 24 Jul 2026
 01:54:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
In-Reply-To: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 24 Jul 2026 16:55:05 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
X-Gm-Features: AUfX_mxcYKp2teJzRblheQVA1sSmPKeM5_68qqTL3jby4L992X1O6XKpOblrK1M
Message-ID: <CAAhV-H6kqN1+ZiTqyvXfPEtQJfvFhp_964AB9C00o0O6pigZmQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 0/7] mfd: ls2kbmc: multiple fixes for this driver
To: shankerwangmiao@gmail.com
Cc: Binbin Zhou <zhoubinbin@loongson.cn>, Chong Qiao <qiaochong@loongson.cn>, 
	Lee Jones <lee@kernel.org>, Corey Minyard <corey@minyard.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
	Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	openipmi-developer@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Miao,

On Fri, Jul 10, 2026 at 1:24=E2=80=AFAM Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>
> Previously, the driver has been introduced to support the Loongson 2K
> BMC running on the Loongson Servers, which is essential to prevent
> the system from hanging when the BMC is being reset and the default
> efi-framebuffer is being used. However, there are some drawbacks in the
> driver.
>
> Firstly, the driver tries to read and write to the connected PCI-E host
> controller registers, assuming that the BMC is connected to LS7A PCI-E
> host controller. This assumption should be true for real products, but
> to prevent from accidentally reading and writing to the wrong PCI-E host
> controller, this driver should be modified to check this before
> accessing the registers.
>
> Secondly, the driver uses non-exported functions to tell the vt
> subsystem to redraw the screen, preventing the driver from being
> compiling as a module. This can be fixed by using the exported
> functions instead.
You can replace the redraw function, but I don't think it is necessary
to make the bmc driver modular.

BMC core, IPMI and simpledrm display are usually (if not always)
supposed to work as early as possible.


Huacai

>
> Thirdly, the driver directly accesses the GPIO controller registers
> using hard-coded addresses, which might conflict with the loaded GPIO
> controller driver for the same GPIO controller. This is fixed in this
> series by using the GPIO subsystem APIs instead. However, legacy GPIO
> APIs have to be used in this fixed to correctly request a GPIO
> descriptor from the GPIO subsystem, which might be further discussed
> to find a better solution.
>
> Finally, there is a minor issue in the driver where it changes the
> mode string describing the screen resolution during probing, which
> prevents the device from being probed again if -EPROBE_DEFER is
> returned by the probe function.
>
> I have tested the changes in this series on a single-socket Loongson
> 3C6000 server with a Loongson 2K BMC, and the driver works as expected
> when the corresponding GPIO driver is additionally loaded.
>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---
> Changes in v3:
> - Check the return value of devm_add_action_or_reset when registering
>   the cleanup hook of the work queue
> - Use swnode to create the link between the device to the GPIO chip,
>   and prevent borrowing the legacy GPIO APIs
> - Link to v2: https://lore.kernel.org/r/20260708-ls2kbmc-mod-v2-0-2afdd17=
41766@gmail.com
>
> Changes in v2:
> - Several fixes suggested by the Sashiko AI review bot
> - Add a cleanup function for the wq on removal of the device
> - Relax the reverse dependency from CONFIG_IPMI_LS2K to
>   CONFIG_MFD_LS2K_BMC_CORE to allow the driver to be built as a module
> - Link to v1: https://lore.kernel.org/r/20260708-ls2kbmc-mod-v1-0-c344bf5=
defa3@gmail.com
>
> ---
> Miao Wang (7):
>       mfd: ls2kbmc: Make a copy when parsing mode string
>       mfd: ls2kbmc: Sanity check for the connected pci port
>       mfd: ls2kbmc: Redraw using exported functions
>       mfd: ls2kbmc: Cancel the work queue on removal
>       ipmi: ls2k: Relax the dependency to its mfd driver
>       mfd: ls2kbmc: Able to be compiled as a module
>       mfd: ls2kbmc: Capture the reset event of BMC through GPIO
>
>  drivers/char/ipmi/Kconfig   |   2 +-
>  drivers/mfd/Kconfig         |   2 +-
>  drivers/mfd/ls2k-bmc-core.c | 235 ++++++++++++++++++++++++++++++++++----=
------
>  3 files changed, 184 insertions(+), 55 deletions(-)
> ---
> base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
> change-id: 20260626-ls2kbmc-mod-5209193009b2
>
> Best regards,
> --
> Miao Wang <shankerwangmiao@gmail.com>
>
>
