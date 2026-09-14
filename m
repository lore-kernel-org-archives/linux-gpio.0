Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE61286D4D
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789377026; cv=none; b=GO5m9wFx8C4G6FKTQ1UVN0gSHqH7otIxIGWuwVXrrJTJP0yJ2awoZHc3+hsSb4MXsZZriF/syM/Pji3pOkKEzeA/iWcjxSNEzUXzTHnlzlOaDGIf2o9gKd/OAo+rM3Ih1/0W95BR7hB6+1ITMsROPgTNztsHdCVSXkEWBgYjZeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789377026; c=relaxed/simple;
	bh=HiF6kaoY0vmI5yZ0jUaC6VsOtStEetN5jUYUzI7+c/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipMNbCjkuNzb2SjYO9mNqRBXV7GXi89DgjX7fsrZhZvvUiMNID/sXDRt1ybDc6C6LgU5x1X+iqcoyG8OacNiSS5fFrobR5Ml9bZK/JNSAeM4BUHkjTAlyXYI+5n7AnqtcWialf14FntULLbZMlAglLAxfvog7DwAvQNQra1Q6dU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Md4rnTmK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Md4rnTmK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAEAB1F0089A
	for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 09:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789377025;
	bh=eM8Qgu6NYAz2KlTImTDOnkezDzsEl+drhOjvzifcCQs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Md4rnTmKu+8ZHcpPlO1k029rTa7aHBYDxtFakKljBYWfvc0s6Rg2C1Y+nZ1AtwVQg
	 BDmUAalaph70nl+ULxhmI6rZvjHpJmeuDOdLK1Tgy/0o9JNhg27B6yzv3uu6HcsVr1
	 z5pEBOYA85TPfIvDk9g5j8fa5xm7i0UA4lzloHDDV/RvarIRnylF2GMHTuqob+mDAg
	 l1TmXRVnZifJ2EQKuxuEHu0EyALc4pMuy4q2GUdr+6xLdq6SJxcQ7cGvP8GQogxznj
	 Q052T5FBKCiLlwJ7T5+e0y9aG9n0r2DQ7km6d5+Q3uIFsFfnR9kHlXWu/NrCF0FMl8
	 sHxVNkSXzjRFg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16f15so1985872e87.3
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2026 02:10:24 -0700 (PDT)
X-Gm-Message-State: AFuF++mg+nQBbhE6Ip4e+BbBUjh7S6OdelbEe1aafx9ypVuJlCxkEOii
	A4foWpcYOwCYpAl4pp5RhPRHzZ1c9Pxg4blhZM/uMpSAyhCKqzEP8U3DmDNmM7fmwGYQLgALJpp
	c6DoqO0AhUxp5Ht9zTUlDUaCVIPDqvbA=
X-Received: by 2002:a05:6512:1389:b0:5b4:ab2f:5bd5 with SMTP id
 2adb3069b0e04-5b8ae68c4d8mr760395e87.8.1789377023628; Mon, 14 Sep 2026
 02:10:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831105056.756259-5-conor@kernel.org>
In-Reply-To: <20260831105056.756259-5-conor@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 14 Sep 2026 11:10:10 +0200
X-Gmail-Original-Message-ID: <CAD++jL=F5efmf+b8wvNRcBq3ORB03f+Zue5A5NiaMP=Deu5vAg@mail.gmail.com>
X-Gm-Features: AcwNN1UxwLBklInMTDkL86Qeyshy5Z5cOuZdxURaH6Lw5kZs_qB3HVR-u2maOv8
Message-ID: <CAD++jL=F5efmf+b8wvNRcBq3ORB03f+Zue5A5NiaMP=Deu5vAg@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] pinctrl: mpfs-mssio: three fixes
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Conor,

On Mon, Aug 31, 2026 at 12:51=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:

(...)
> Conor Dooley (3):
>   pinctrl: mpfs-mssio: fix whitespace in debugfs output

Applied for next.

>   pinctrl: mpfs-mssio: fix width of unused bank voltage setting
>   pinctrl: mpfs-mssio: use correct regmap function to set bank voltage

Applied for fixes.

Sorry for slowness on my side :/

Yours,
Linus Walleij
