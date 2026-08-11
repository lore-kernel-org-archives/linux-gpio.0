Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB4C345CBC
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 06:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786429085; cv=none; b=p3370P25R2XiRJ5goAJhRdVqwGtEDIeqJoifADnYbO+11wUrD3q2dPLHg5US5mG79n8thp7rYhjieDwyP+1R261ds73t/v4FynpBqucdc0OdLYO1gcQoH3rleuS8EJ8X8t0w/1pqZZaQOoHzQYabxWHBWNsxZUpoNf6SPtYdxWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786429085; c=relaxed/simple;
	bh=BzLdaUEIX1BvfXPoEs7iJurYd6+YSJTfmxmB3crYs0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma1TxcXeG9uWWgCyK5pwIoKZJHypG/k3kQh0AzzSigyHdaokeoOJipvEclBoL0GcXDYUuBN08LT+HnAZkRsvOQQqhCogtkvD+y5G69RVHxZ+X6pRWJOPSEeXg+1z0MhxhomBfLYcSoVwwr7mosyymff1/obuZAm+Kpkpi8RkiXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=maoHCdFt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="maoHCdFt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86581F00A3D
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 06:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786429083;
	bh=BzLdaUEIX1BvfXPoEs7iJurYd6+YSJTfmxmB3crYs0c=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=maoHCdFtBgDL+Mou80u8Vu6Zdb+FBYio7IgssSFHfKPMekbjaPwwkUoFvWJwcC3SU
	 wecaukHbhT7n/5xl0Owt7T1VHnZEZS0N2LOBA072A+KTiwDZ68WYZxciU6gVVV8WSd
	 8xuH99BNYk9jaiTaAhef40tihePfiRSTpf4sxgbDsF8lktOOONSjADOte8nN7iaSy3
	 FUPtspAqPO6niSJVNUzNZhwBXab40hjD3qpoh4/YcCmv6moms6eixd0SFFTEmzAmzR
	 qSzQa4n7idjorjTafWDr4hoHFRz25EvLqpNVPauFlZqbVlBJPv72kM7AAFdQJKN6cB
	 vhA3HZMZFQqiw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb2bc82ccso3081000e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 23:18:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpzKNij7mgwe+s26zFmLvv/NHDdO56YdOdizr/rAcZcovdZUXjfaYJrbaYtRTayIxYmMU6JTeJqIMhE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5L7Yw3eROdwabbihTxghDzTTO6gZpsWEYS068AHungZvf9Hcf
	N/I/S3/56PP9kvab0+wux6K/lcAOk506sBnh3I2S3nBPZW3mJxQHgHlbEQCqcKQVStEv3Qs1nK/
	XA6QstrkM8R4n04QlxklS9oQhXmESpl8=
X-Received: by 2002:a05:6512:3c84:b0:5b2:aaa2:1d97 with SMTP id
 2adb3069b0e04-5b448654039mr150789e87.48.1786429082679; Mon, 10 Aug 2026
 23:18:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com> <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
 <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
In-Reply-To: <CA+_ehUwO0WEiDGE18a=v=ZjJhpZB_KVP=m-Cog7K9Cm-zZV6EQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 11 Aug 2026 08:17:49 +0200
X-Gmail-Original-Message-ID: <CAD++jL=8BvLvzwN5a8+dZDXU7sSM5m18G=XEnYtWo5ziJ=N6nw@mail.gmail.com>
X-Gm-Features: AUfX_mze3ESUSsSYW8CEZRJNkHQmDt4gP_VSFyh2kb488Z--smL2Lv1F6RAXAFo
Message-ID: <CAD++jL=8BvLvzwN5a8+dZDXU7sSM5m18G=XEnYtWo5ziJ=N6nw@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org, 
	Benjamin Larsson <benjamin.larsson@genexis.eu>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 9:27=E2=80=AFAM Christian Marangi (Ansuel)
<ansuelsmth@gmail.com> wrote:
> Il giorno lun 10 ago 2026 alle ore 09:23 Linus Walleij
> <linusw@kernel.org> ha scritto:

> > If we can get a speedy review on these patches I don't mind merging
> > them for v7.3 already, it's nice to get some movement on all the
> > nice Airoha silicon.
>
> I wonder if the same speed treatment can be done also for the clock drive=
r and
> also dts?
> There are a few patch there that are currently blocking usb phy and pcie.=
..

Heh not my department. I think the SoC maintainers can merge some
late DTS patches, the clock driver is up to the clock maintainers.

Yours,
Linus Walleij
