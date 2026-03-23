Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDBA3AEF20
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 14:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276481; cv=none; b=c2yGbxu8z7mWylDmxYkhT56ErBVZzoLgcvHRfFFl7vQWchHuUBxa6yoI8/8k62vcO46m0/N7P+ULRbBSgjl+dJ0VIdh3bnyW0+vR2jreoTHkCnA8Akf7o1wWn5mjZ1+G//gOcPwnbTpR7huHAXZroAadqc4LIiu0sNMyPAsXSEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276481; c=relaxed/simple;
	bh=Z/d4F88j7gfoM75/lEyThhSgu7EHMMvyXydA3C/Hggg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NDPvvTgnbt32z6lpCd7XFn7QyUsW2wGsT22K7+3Ff2rX5hCqs0KPtX+dSUpUSmpPaD7oRvhQJec1h5SiyhINNxHErj+s8Tqp3tOrzOspw3BXaXhWaL84RK46UtSKSrg491/xlDfofxC0SJupVoKkYgBYGU37rbpDq7a1GzPyy3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyDCXwRT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyDCXwRT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390FDC2BCB4
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 14:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276481;
	bh=Z/d4F88j7gfoM75/lEyThhSgu7EHMMvyXydA3C/Hggg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qyDCXwRT7mA/Twab1Jb9j39e29U4q6Q5hcc0hKOpa6PqHAxL1OcGwfaDlojQ6B+hf
	 7wygA6kX/iqAZSwJ7kJMnGmoBwHfJ9vGaPanU9hG+fPNcPsw+QMk2NKNKTEWufNcuH
	 rDhWw0LWfwy/xoGnd32DQKT+0ajsmXB9DM7PWboB/ir9FtHerSR8wuY2ekJi8zfpXB
	 tZEiFnevDx6DIUSn9Q1g9Wc4jwckxXBrEz4EzZUpBxxjCLrNqMdb3zWTLcJhAjP0VH
	 S0oonq0Tc6rRccuvttDsdDUDyCdOpKnlmkm+VO89mQRpyjkQGHiHr+PzmXGygLCrdz
	 FfkJPLzZYPSkA==
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ad019bbd4so3103278d50.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 07:34:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YzJAfkeOZvCMjnYQylK/LiKETPY2PcOtcYsYCRNyDyer0qt9HFT
	R0ivLdcTEV6PBB9H6szBkqRW+6ybfvN3dryjTPc5YaU5Zj4lDvxJjSUsAQ7ohbLR0BFc1vPdkZ0
	6zpCyf2rbxhjK5tAJhPdLQrp7uWnztBk=
X-Received: by 2002:a53:ee63:0:b0:64c:a2a4:476a with SMTP id
 956f58d0204a3-64eaa6de7fbmr9512265d50.32.1774276480515; Mon, 23 Mar 2026
 07:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302095147.2483-1-1536943441@qq.com> <tencent_C88C86C89249067BA4D394FC9CCC1AB62406@qq.com>
In-Reply-To: <tencent_C88C86C89249067BA4D394FC9CCC1AB62406@qq.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 15:34:29 +0100
X-Gmail-Original-Message-ID: <CAD++jL=-bkhLrdrp_FX0H23k_QLBHOoXzD7ynd0rvX8rMsVvFA@mail.gmail.com>
X-Gm-Features: AQROBzAgY_e0T4O0xJvsu3WMl-pbEvBLFRvFDDYl2QIe3CeTWeJ2TQFmaCWJhrA
Message-ID: <CAD++jL=-bkhLrdrp_FX0H23k_QLBHOoXzD7ynd0rvX8rMsVvFA@mail.gmail.com>
Subject: Re: [PATCH v1 2/3] gpio: add support for Phytium platform GPIO controller
To: Zhu Ling <1536943441@qq.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl, 
	andy@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, chenbaozi@phytium.com.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Zhu,

thanks for your patch!

some quick remarks below:

On Mon, Mar 2, 2026 at 10:52=E2=80=AFAM Zhu Ling <1536943441@qq.com> wrote:

> Add support for the Phytium platform GPIO controller with:
> - shared core helpers and irqchip implementation
> - platform probe path for OF/ACPI
> - Kconfig/Makefile integration
>
> The driver supports GPIO direction and value configuration, plus
> interrupt delivery for platform devices.
>
> Signed-off-by: Zhu Ling <1536943441@qq.com>

>  drivers/gpio/gpio-phytium-core.c     | 444 +++++++++++++++++++++++++++
>  drivers/gpio/gpio-phytium-core.h     |  90 ++++++
>  drivers/gpio/gpio-phytium-platform.c | 226 ++++++++++++++

Why this split? Put it all into one file.

Rewrite the driver to use the GPIO_GENERIC (MMIO) library,
select GPIO_GENERIC, look at other generic MMIO drivers
such as gpio-ftgpio010.c for inspiration.

Yours,
Linus Walleij
