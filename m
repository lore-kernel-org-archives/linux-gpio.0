Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60844EF15E
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 17:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790615446; cv=none; b=g8U4hzCKvuZ72PfI0O/06g57R2FfM0dyOzBJiiMznWAWM5KOwLvRbb5Ry7rHC0aUOC+r+8xTcRTBKJJNFH0rgaVv++30i5eEukqL+J29T+mZjYrGePn2rP/olOpcV8CdMRHNodR88xv2J7oSvBdPHGA11O2J88aJZ4UzRIjaEfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790615446; c=relaxed/simple;
	bh=hUNCHJwFpam2Irjsw/q9tqB5YBivYxYfCxwhow1tEdc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=st/8CQ1A99FxXxlBFDSK4xiSa+plppPKYSyM1MrV97hFaY6wfxhaTydQZlVkx9XUtk7JXl7QHNGc9hy4SaAEheeKg52vTWLGAzIo4nfvFx+TkAUQv4LESg1gUb4eqsOALLYY8A/+sPyU7KEnf7Lgs3IEB2DOgL5XwAH3cy8zhOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nKDnfURd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nKDnfURd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9D31F00899
	for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 17:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790615444;
	bh=JcFXSH4X0/3t91WTYW2fMd7IxwoWSZkT3BkV9Fwq1fY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=nKDnfURdHvsSgI3KovWEm6PRfDdethceYEgRgxGujPR+gYmMpuV3zsG5aSQHkCZUr
	 J3439tQ5Oz2jKM/bYaR4JT0JWMegzSKkvSCYobGuwJOqz0ObI+058/b46cXHxLE/nT
	 Dl1HPuvj7ezL/ueJoOIDE28DL49ExxVmyz+vp0JS9svf1fyfbWdsAjb9jXL/ezo9mi
	 yVcIuLD9o1GemW7knJUTQ3cZejglAbykrgHhUGt8Zagt3QYGDotfg+Xhm2kU+hxmVw
	 hAjMVgR4vEZNDtVbvrWAQVjIegnfDS/fjaKuCx65bu3sC820Tfgf5DeZXNGpkz08vi
	 EKgXDBv4GfSgA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b8ef09e288so2090137e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2026 10:10:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwZMfCzWi7K5Tt0w/iqYMiWL+FblnM2XJvg+ZoeQqw71CjrMAkFBuHxHncGiP2y1FH9vmUvMQDyvGSL@vger.kernel.org
X-Gm-Message-State: AFq9FYKWmb3z55itcWLmTaT5SXZnWaHdNUN0DUqs7iAlMKWpspGOUcXb
	Ij5BjXtVwCQJjCnDwbaetTp4uwBBIEyXs1U/qyAU+ZJ4XE6+0Y3fcI5TDBWIB3419xvttXWEnmx
	6TYovIRor73KeoZQMxko4rNf9KdruxsU72k47sd617A==
X-Received: by 2002:a05:6512:48b:b0:5b8:b3e0:5567 with SMTP id
 2adb3069b0e04-5b8df04ba2bmr3513130e87.15.1790615443536; Mon, 28 Sep 2026
 10:10:43 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 12:10:41 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 28 Sep 2026 12:10:41 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260925160913.1648565-3-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com> <20260925160913.1648565-3-andriy.shevchenko@linux.intel.com>
Date: Mon, 28 Sep 2026 12:10:41 -0500
X-Gmail-Original-Message-ID: <CAMRc=McxxVyAN5gdbegcaUgk8sKRrEAeg+5Oqs11B5AtEM0-vw@mail.gmail.com>
X-Gm-Features: AclHuK8_vTJ1u8nXlYWWKH2Hsij0DKUYMPrdMgOtFs7hDw-YPSX_fZbLQfUZOjM
Message-ID: <CAMRc=McxxVyAN5gdbegcaUgk8sKRrEAeg+5Oqs11B5AtEM0-vw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] gpio: Move Intel PMIC GPIO drivers to the
 dedicated subfolder
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, Peter Tyser <ptyser@xes-inc.com>, 
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>, 
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>, 
	William Breathitt Gray <wbg@kernel.org>, Israel Cepeda <israel.a.cepeda.lopez@intel.com>, 
	Hans de Goede <hansg@kernel.org>, Lixu Zhang <lixu.zhang@intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Raag Jadav <raag.jadav@intel.com>, 
	Junjie Cao <junjie.cao@linux.dev>, Runyu Xiao <runyu.xiao@seu.edu.cn>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Sep 2026 17:57:04 +0200, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> said:
> For better maintenance and development experience, move
> Intel PMIC GPIO drivers to the dedicated subfolder.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  MAINTAINERS                                   |  4 +--
>  drivers/gpio/Kconfig                          | 26 ----------------
>  drivers/gpio/Makefile                         |  2 --
>  drivers/gpio/intel/Kconfig                    |  2 ++
>  drivers/gpio/intel/Makefile                   |  2 ++
>  drivers/gpio/intel/pmic/Kconfig               | 30 +++++++++++++++++++
>  drivers/gpio/intel/pmic/Makefile              |  5 ++++

This makes it a very fine-grained split, I'm not sure we really need this big
directory structure when - so far - we got along with all the drivers being in
the same directory?

Look at drivers/pinctrl/intel - there's no such deep structure there.

Bart
