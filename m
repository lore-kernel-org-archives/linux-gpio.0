Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9927231D366
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 21:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790977649; cv=none; b=b+BDVF0A7p4KPEfJ0GQvlOLkuTdqA6z+XxXHrMA+/Icv7aPqucOaLEFDA64zZJy86TY9RAFz7tW3Gjd+BcPY+BqGv/qOYtR8HqBzy8whPaHgFft0iBNi27pta3Siib8jDWAP6rG3GqkQW46Q2tqfglrbqd26BjjZFnnKLNsYsy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790977649; c=relaxed/simple;
	bh=WHajfgR9tG6mrg38UOvrjUWo2kKLnxI1mnH1hdEytnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c5efLcZK0zkMr8D8lBLKWekFInPToIaIFXr3fJeQHm1IEKkznrMuVGo6wWTVsEy09Zgy31RthVHsKlph2xMB2ToY+09ip0WF0hyr1BfF+rBFddhVyforRT9TP73bd8UgMyekh4N5l6pI945DdAlmJqs5FNvrhOsZ1bNK7kLnuRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EFne6EOG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EFne6EOG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36EA21F000FF
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 21:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790977648;
	bh=DJ7Y7Vy0oY9plMgKrN+3jXLLdo8McfBdorS6mW4mU24=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EFne6EOGzzpEe+iHtI6mBCOpYzxDoduz4hyrOXyRyCJ9VNJDeyWqS64NaGSddvugG
	 Bei8GHH2PfBK2a437IelHELvu8yKqwZljSVS+EaTgbdNrni6q2ekoSfP9ydTYK3Nfb
	 DF81mAn/xdmOBumA/Nf4vuh1dRdF0U95cpwPpHTfZ7e17Bzed4ckQh6cNbmRvvLIes
	 6sYeQXH5tKhbsck6ARVepgoLJF3BGFLdfucLaaRZshdBtSmZ1QaiF0msckBFaeZipU
	 eDYntTGW5KkwtPbrNtwHl9PiNr/Xu4faw3ZvisSpQk7PBcwPatfpV2cj7zWN8+LzM2
	 NcSFHJJS+x80Q==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba418c79ccso1103695e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2026 14:47:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxpnuD9hdnQzdrUURkTdF5NC6arccL+RHPl8YiAKWcBUnRuYsZgU7iXMoYEYTsBdpKgkTOPMms6xdLr@vger.kernel.org
X-Gm-Message-State: AFq9FYIJWMPCb7qZ9Te0894kqZW219JC1wLP9Vw08jQTdsV4aGdtfYHT
	D6DLWeUwL1Hza9xFT2KMz8P4IEA+7iCfm39tO676GR87CXsdV7pPe6WOa9Ti5KNf5ImJhhsI93B
	WbZvIxoNyWLbVJSp57BaTGfITV/R0oqU=
X-Received: by 2002:a05:6512:65d4:10b0:5ba:4329:1c6c with SMTP id
 2adb3069b0e04-5bb93812b49mr1362725e87.6.1790977647038; Fri, 02 Oct 2026
 14:47:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002124722.3545736-1-arnd@kernel.org>
In-Reply-To: <20261002124722.3545736-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 2 Oct 2026 23:47:15 +0200
X-Gmail-Original-Message-ID: <CAD++jLnJgSK7VJYsZuD0+xbDseO-yqN6+yjZx0Lnz2SoZmtCbQ@mail.gmail.com>
X-Gm-Features: AclHuK975eH7Gou6KTmmo7XIzaI7umcFILCAJvSAiCw4CphgQ2CvgjSPFWnmT7k
Message-ID: <CAD++jLnJgSK7VJYsZuD0+xbDseO-yqN6+yjZx0Lnz2SoZmtCbQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: starfive: fix missing CONFIG_OF dependencies
To: Arnd Bergmann <arnd@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Alex Soo <yuklin.soo@starfivetech.com>, 
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 2, 2026 at 2:47=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wrot=
e:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The common driver portion requires CONFIG_OF, but the drivers
> selecting it do not, so we get random warnings:
>
> WARNING: unmet direct dependencies detected for PINCTRL_STARFIVE_JHB100
>   Depends on [n]: PINCTRL [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - PINCTRL_STARFIVE_JHB100_PER1 [=3Dy] && PINCTRL [=3Dy] && (ARCH_STARFI=
VE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_PER2POK [=3Dy] && PINCTRL [=3Dy] && (ARCH_STA=
RFIVE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_SYS1 [=3Dy] && PINCTRL [=3Dy] && (ARCH_STARFI=
VE || COMPILE_TEST [=3Dy])
>   Selected by [m]:
>   - PINCTRL_STARFIVE_JHB100_PER0 [=3Dm] && PINCTRL [=3Dy] && (ARCH_STARFI=
VE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_SYS0 [=3Dm] && PINCTRL [=3Dy] && (ARCH_STARFI=
VE || COMPILE_TEST [=3Dy])
>
> Apparently the problem is selecting CONFIG_OF_GPIO, which is a mistake
> the newly added driver copied from others. This was recently cleaned up
> with commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies
> on OF_GPIO"). Do the same here for consistency and to avoid the warning.
>
> Fixes: 9c4d0c8fc4c1 ("pinctrl: starfive: Add StarFive JHB100 sys0 control=
ler driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Patch applied!

Yours,
Linus Walleij
