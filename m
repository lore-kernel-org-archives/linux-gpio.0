Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9B2400973
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 14:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784210898; cv=none; b=u0LElB1wvOcxLDTBmjCS2O95Nt3vLMmUrby8jaYFS2HgWMegSBfo0TcTxE8kgmU9nPCNTRfRWzIi6aKoQKRXBmjbYM1g8sYNX7zdf1c+9odWiwMHWTf3gdnKNQS55C0l8v1ls+JYjEOzBwvlV61pVmnVVVz3dqx2Y5N63s/O+2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784210898; c=relaxed/simple;
	bh=4HLWWkU7m5CWTiq/0e+PaS/ZG8H549LpnSL8J7it2sg=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h7IM8wVb3/g2OgKA/ykwWtjBQa4BrG/i5KThLFd0mElpBCG+bOeuqoV5MYLS0T9Wl7pe13shnrCLOwvbS00roqT8debcY0JZ1EuPclnRiZgZ5jq3E87W4gpIJ16zCWOBTGniqv8rTFcjHCl61Dz8urDM3idSWErMjRRxJvpEe1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvvWDlM/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvvWDlM/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F0061F00ACF
	for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 14:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784210895;
	bh=G6VljwOz1Mocqmu55HYxuVcSQLH2az2JkNAYci+ltSU=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=ZvvWDlM/wETenmyF+Zj0qixr2rZ5mJCGmJQrQpuaJzkITGMfbvCZpVoU7/FrltjmC
	 RWWU/8dDdr+0FsTHqX6gUnOSADyQW++WMBmw+Ol9yvZfaCGuky+q8TbidEeVxretSZ
	 q9Luew7Vy3imK27zgtICZiUQ43YKcVQIRs/vSDE6m4aOz+WW4Ni4Zc6JYXlDN67isI
	 ROWpQSDmnXhngdhLVtRAVL496NAeJTIil7ZrCC7OcyGum6s5JZaupG3Y8CDnXeGgcy
	 0PdnWcdBUpORTUGSFBOZ4DJKXfuoAtukiU5v/G7HEovKTQfViiQmCN7m4Na1RaQReT
	 dMI+agA2LWMqg==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c8dbf4ef0so58779221fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jul 2026 07:08:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpVJKB30nbf6hhvngvGc8xkhbhz/P3R0Dqi8oSysj7MglmVz4hSX+RCEGHaLgbVva4l0hyXn1B3ciwe@vger.kernel.org
X-Gm-Message-State: AOJu0YwvdbKQuYHyVYwFW48ug6PKHylZy2z+okD/6qxgCX0r4BPNy0Yg
	Jbn2VS56eQlbg99AisZeObirTjhvDYSUTZjO5U7l99k4rG1qx/z01SAP2WWlgdeEaxxLVxe3U9X
	3SNWw0tf79yL6ewXk6K//OsDzv7lZWg7+u77c17HqEQ==
X-Received: by 2002:a2e:bc12:0:b0:39b:119d:aa02 with SMTP id
 38308e7fff4ca-39daa75c2e9mr26745301fa.5.1784210893665; Thu, 16 Jul 2026
 07:08:13 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 09:08:12 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 16 Jul 2026 09:08:12 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260714234230.886636-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714234230.886636-1-rosenp@gmail.com>
Date: Thu, 16 Jul 2026 09:08:12 -0500
X-Gmail-Original-Message-ID: <CAMRc=MfNZgOgMNC_6Fsho-FytLpjp+_b06vOUVfWcmscK9up6Q@mail.gmail.com>
X-Gm-Features: AUfX_myDt3czsqN7UP5TaeRmPNLp6AuQ_B-AKsuLFtZmgq4Ln8LtZ7V4rBUIQjs
Message-ID: <CAMRc=MfNZgOgMNC_6Fsho-FytLpjp+_b06vOUVfWcmscK9up6Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: logicvc: use devm_platform_get_and_ioremap_resource()
To: Rosen Penev <rosenp@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:CLANG/LLVM BUILD SUPPORT:Keyword:b(?i:clang|llvm)b" <llvm@lists.linux.dev>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 15 Jul 2026 01:42:30 +0200, Rosen Penev <rosenp@gmail.com> said:
> In the regmap fallback path, replace of_address_to_resource() plus
> devm_ioremap_resource() with devm_platform_get_and_ioremap_resource(),
> which looks up the resource and maps it in one call. The helper returns a
> pointer to the resource, so update resource_size() to dereference it.
>
> Drop the now-unused linux/of_address.h include; of_node is still used by
> syscon_node_to_regmap() and platform_get_resource() resolves the same MEM
> resource that of_address_to_resource(of_node, 0) did.
>
> Built for ARM (multi_v7_defconfig + CONFIG_GPIO_LOGICVC) with LLVM=3D1;
> drivers/gpio/gpio-logicvc.o compiles cleanly.
>

That's interesting because I'm seeing this:

drivers/gpio/gpio-logicvc.c: In function =E2=80=98logicvc_gpio_probe=E2=80=
=99:
drivers/gpio/gpio-logicvc.c:93:13: error: unused variable =E2=80=98ret=E2=
=80=99
[-Werror=3Dunused-variable]
   93 |         int ret;
      |             ^~~

Bart
