Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6EC3EFFA6
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792069578; cv=none; b=tHYM4IgVD/cvKostJ3FUcneXh1c+VwWe+Hv5whxuHB0data/ugYQLpP8KuAi2lIVLO7MCmnA60Y0wwRfyKc++XqAaF9rJhpuFMG9S2N7H6xVGrSsy9tbR8v9VP5SvP5wgGv3VbcZTNC6tANw+VKx3a97ruIqVPdwKiIuL0TjXuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792069578; c=relaxed/simple;
	bh=Ek+WZacmsc1/aFs5Oc+pptcY8b3lL0067ctw+ag+Zgg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h3kWrJRCMvZcCNh9U/udqD/vFe0+Wp+NgeWMKD0WblFps6+K5N6wrvg+ISimMHbOuAuE3KoetSnNKzgQX60nPfTQk6ZqUt/07MoHhqlJWD677g3mqOyNJbIOhXqbu+hqEdFezo055TPsJZQPmAUO9lPGQPbIqzpT9gmyeoROIjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WLOYJ5c6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WLOYJ5c6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67EC21F000C8
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 13:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792069577;
	bh=9GHx/gBux5pSoykG/SgX/bJiOg6kMl+CeW1nP2x4vIU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=WLOYJ5c62iJPXJ3MZLC9heGj9UuaC1047qMfa+DcV5Jv0OolIH4NALqG6HQQ5pkKg
	 /8KPnsCemssHqUtIVAu0YPVysglI2GgrDdxkMyVvjQfR8y8IHUoMNI/ZC1gqC1jigZ
	 hWJ8KCmxT2uDyJCFfX5NAdRamwNVq/QmMpJbPeIRfL2DokQBJN8adrMdaxCrO72MpD
	 sSTgGkphKozA16m8OYWsQwpoPR01mAcQ1N7sPF+pZvcosKXLQ5NIx6CxOZafFXdk67
	 kTvmGZDeO8gJXZf6URowiYwKMPVZxGSgaWIN9/EJy3ivV2wcDrZoeBCBHxJ2VVaHp+
	 0lW4UcBue1H2Q==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a9cc82ef31so16577441fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 06:06:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByEB+XeaFE1uR2OOavgVDs12nTG7QH9W/6wcHmrJdmsE91Mn1nUUJd/Fwt6BSxf9uCW1bEAqrkixCS0@vger.kernel.org
X-Gm-Message-State: AFq9FYI0aHsvKX218sc6L9cdjOwNMTTJYoXu5J8jp2c6QRID6IzQsnA9
	cLswMr0LoBB9T605ZzXM1Dfmn+EMF7L8BOw84762FetvuiejbuuXjoVTY+Zg30dIVW1FK5i9/pt
	yRHokxzxNCkD4DBhP+5aBvDdxf1DRksDdbnMzi8XVcg==
X-Received: by 2002:a05:651c:2221:b0:3a9:9b75:78f4 with SMTP id
 38308e7fff4ca-3a9c5362bebmr45718631fa.12.1792069576082; Thu, 15 Oct 2026
 06:06:16 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 13:06:13 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 15 Oct 2026 13:06:13 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <atDMqjm-J1qoYPeX@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <atDMqjm-J1qoYPeX@black.igk.intel.com>
Date: Thu, 15 Oct 2026 13:06:13 +0000
X-Gmail-Original-Message-ID: <CAMRc=Mf9s7XkM=8cv0WZ_wB=nv92cKyD1q3Kr70HaJ7kHjmYxw@mail.gmail.com>
X-Gm-Features: AclHuK-z_SCfTCyDpzhAwYkbc--v8cYjlHUYaVz9oq9kvdGSJ1IJtdVaMxBwBM0
Message-ID: <CAMRc=Mf9s7XkM=8cv0WZ_wB=nv92cKyD1q3Kr70HaJ7kHjmYxw@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 7.3-1
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Linux GPIO <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 15 Oct 2026 14:52:58 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> Hi Linux GPIO  maintainers,
>
> A small set of fixes for GPIO on ACPI-based platforms. It was in Linux Next
> for a while without regressions reported. Please, pull and send as a fix set
> for current, v7.3, release.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>
> The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:
>
>   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git tags/intel-gpio-v7.3-1
>
> for you to fetch changes up to 3fd4bf93d586cb07304cdcb5e8b3c51ac1d8284f:
>
>   gpiolib: acpi: Fix GPIO lookup using relative path (2026-10-13 22:34:07 +0200)
>

Thanks, pulled. There was a trivial conflict fixed like so:

diff --cc drivers/gpio/gpiolib-acpi-quirks.c
index dd4db58d36ad0,dbfd82056c3e0..0000000000000
--- a/drivers/gpio/gpiolib-acpi-quirks.c
+++ b/drivers/gpio/gpiolib-acpi-quirks.c
@@@ -392,19 -408,19 +408,32 @@@ static const struct dmi_system_id gpiol
  			.ignore_wake = "VEN_0488:00@355",
  		},
  	},
 +	{
 +		/*
 +		 * Spurious wakeups from GPP3 PCIe bridge interrupt
 +		 * Found in BIOS UX425UA.301
 +		 */
 +		.matches = {
 +			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
 +			DMI_MATCH(DMI_PRODUCT_NAME, "ZenBook UX425UA_UM425UA"),
 +		},
 +		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
 +			.ignore_wake = "AMDI0030:00@24",
 +		},
 +	},
+ 	{
+ 		/*
+ 		 * Lenovo IdeaPad Slim 3 15ABR8: the touchscreen wake IRQ fires as soon
+ 		 * as the system enters suspend, causing an immediate spurious resume.
+ 		 */
+ 		.matches = {
+ 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+ 			DMI_MATCH(DMI_PRODUCT_NAME, "82XM"),
+ 		},
+ 		.driver_data = &(struct acpi_gpiolib_dmi_quirk) {
+ 			.ignore_wake = "GTCH7503:00@10",
+ 		},
+ 	},
  	{} /* Terminating entry */
  };

Bart
