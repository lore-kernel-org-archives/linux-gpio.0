Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE4F49CF44
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 16:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352889; cv=none; b=VxgrbnPMwUWYWO7nQP+amvnnDv+8Rfg8UftC16353Xg82zyJJtV03uh+xqgWsTT2XpB5n0GP21iR4hoUKC5qZ0Z+dJWNEdTXbSYiufhWEkD4Yu+/nkA7/fhVX4I+IfnGoc6TTJWcl+Ey7QOf+aHt3/t0MotMUestXujeg0gSCK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352889; c=relaxed/simple;
	bh=UR6fkRae/o5JQhXKHkfLcs5TrTwIvIlTXSzSjjvARes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cwH7Oex8bWH/2yDlpL+647MYJG3dP+pS2GMm090p9wvroUrnIeWHNC5LFQSvWk4nNespNA7dVCKPI9gjCmj7kkMJQDZrREmcuhCstKu5vNGVOPd++87W5AbhkEfeYciIFelXyC2rI6YovdYICuJXchx4T56hKnqrppxivGiu3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PVWVYEEA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PVWVYEEA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210601F0089C
	for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 16:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352888;
	bh=cMSE9Bs0yudJaN/PpWbZ6WSFdlSmkNNZ65kmIxzm4Zg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PVWVYEEAntAAO+allzhGOj/irv94yY5YLug2MwXrWNhkWEGbyBvrtBDuto9b3gZ+2
	 iAcqkZUt0l+OX2SBier1bEgW+JHhVqeVqgG2+aqbojS3pRX6HRLozFxOgfJ9ZG/wPT
	 o9Q3vpEU9GoEgpCicC8xzqlRO9y/OEZjHwENk6qlvIKF/GUc2FpXmdB0Nci/lDwdlx
	 ZNBJH8aTDDRV31H8+wbJJRuZU/C9k6js0LuyLfRufptvfpak2yjfkZqK4NynoDYAJM
	 8MZP/zyZvQcFYiKy7/n1FK3BdyeGb5PjCgJwdX9ETZahlpLzSJKFI0lQL5Q1pcGPzX
	 GQeCryG/atszQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e6ec4dc5so706602e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 25 Sep 2026 09:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBycg2jrXaaJFGW9xuNVeV4NrX2qxXWpNNH/nEJoYOQ8llWmU3qFggeax5yu+13Fx+rzHCk1qGVYsh5L@vger.kernel.org
X-Gm-Message-State: AFuF++kH+c/ziB5kojCzUY+2yNuq3Ud2EnPNugx12vlE28lZjsldL3sn
	bde8KFibwne6phJQJqKf/fCiRsgebdiKi1wnTN/veVR7ZhYlsBWLtN7ZSFTDLOP1seoCAwAWIWW
	wxmD4TCIRM7xm3uiEh8QII39hGKD4XVs=
X-Received: by 2002:a05:6512:1444:20b0:5b6:1883:d604 with SMTP id
 2adb3069b0e04-5b8df0b5b39mr1722949e87.67.1790352886810; Fri, 25 Sep 2026
 09:14:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925130025.3882279-1-arnd@kernel.org>
In-Reply-To: <20260925130025.3882279-1-arnd@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 25 Sep 2026 18:14:34 +0200
X-Gmail-Original-Message-ID: <CAD++jLmteSSyzEbfv=mnxBCehZOoDtshskvAhrrVWMXjcFWM=g@mail.gmail.com>
X-Gm-Features: AclHuK-j5LQGzp4ZD6a1L1oljPtFpG19o7jpYXGVN7HDWX8vjE9VslcADmoHW2U
Message-ID: <CAD++jLmteSSyzEbfv=mnxBCehZOoDtshskvAhrrVWMXjcFWM=g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: fix CONFIG_PINCTRL=n build failure
To: Arnd Bergmann <arnd@kernel.org>
Cc: Mehmet Fide <mehmet.fide@screeningeagle.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <error27@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 3:00=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:

> From: Arnd Bergmann <arnd@arndb.de>
>
> If pinctrl/consumer.h is included before linux/errno.h, the missing
> error number macros cause a build failure:
>
> In file included from drivers/gpu/drm/tilcdc/tilcdc_drv.c:9:
> include/linux/pinctrl/consumer.h:110:10: error: use of undeclared identif=
ier 'ENOTSUPP'
>   110 |         return -ENOTSUPP;
>       |                 ^~~~~~~~
>
> Include linux/errno.h indirectly.
>
> Fixes: b44aec87658e ("pinctrl: make the CONFIG_PINCTRL=3Dn gpio config st=
ubs return -ENOTSUPP")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

I think this is already fixed by:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/co=
mmit/?id=3Dc2d996d9c6dab31ae41d19507c2b7ef8dbc14602

But thanks!

Yours,
Linus Walleij
