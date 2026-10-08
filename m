Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30273644A2
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 13:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791465305; cv=none; b=j0GhAF6osT6jLTJUCcxAkmWoiUDwTOUKUm2KLLLkApsd3wSzxpbTKElko4X1n9gYYK/+nHVElqq5YlCeahqlt09dLKEn0Ssiq8HvcTYR6TI7DuqPwiPpUDrktMdduRtG/xFP2OPpaqAUmRmGJH5MQYqgUn5/C4HKa/0fZ8XSi1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791465305; c=relaxed/simple;
	bh=yTofT82DpmJcttM9locWUH/CGDfyqTdkcuGtuaC6JuI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NeZ5vSDT/qjLianlQk4IzsVUa0qOpfMLLiTDmv6PXLoXJiO7RkGdaBrcqBHAyMyKd4uzH36jvMSotButsvOIFx2V0NnZEYM7IN67axryCmGeGgKT2SsLvs6A+4ZJCOVnoGoB0P0xCUxwnYzzlEGBRDqOyImWmzacPW2c+K9vTgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9IdgFCK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9IdgFCK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BD411F0089D
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 13:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791465301;
	bh=yTofT82DpmJcttM9locWUH/CGDfyqTdkcuGtuaC6JuI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=b9IdgFCKKnQoYKsDlAjeXupd56sljoXDJ92GlB617QRLCk0tBOT7snxViVWxxsIJu
	 aSqg64DisqjkAPlHsuOst43pFP7Ocerc1nRBasVfbPXJht+X6mzjCg7bge4q0YFlpd
	 q0M1FhtoXNyr4u3Z58Ehl30vw9qGmt2h6sT9ggwqcP8CDkl3tqNxTXVF0IMgy4eDIG
	 Ae/wUelIt4HUs76ba95Ek072AnqHdmqBnru17jKuCP44gTHGp2V0sctQj1Ns8ywMtr
	 9uh4cyDv2MB7ek0Ng6mhdTWosqsOkgC5JK1+KJrABTet9TtGJpg5MNIijMra2ihyjL
	 apRxihDtJgcHA==
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-4f6d98ff6c7so3097385b6e.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 06:15:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz3ecYh/OpGJ08nylfzBNy139ijYabFR8Wz1tjLlcjf9RXc7z+23JLBM9F2SWF55HUMziD0Z/VK8lef@vger.kernel.org
X-Gm-Message-State: AFuF++lhUXtRlqoa0HV9lwNp+Ci8bp3HSwedCeL2OYAG5BeYeBC290U6
	EQa9wxk+HFY+K2Vax0w+9GzzcV7YtzbMpBlQds/AZYBFAEhZ+4uw+PfHI3qMJwkJCTyOVHW2BCn
	MDbSw46PMpw+kP5C1/9GlYdYSIVQfA4g=
X-Received: by 2002:a05:6808:14c3:b0:4e8:e73e:e945 with SMTP id
 5614622812f47-4fc48b06569mr5033899b6e.63.1791465300416; Thu, 08 Oct 2026
 06:15:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260925133804.2231004-1-yaojiale02@163.com> <TY3PR01MB11346E0C01A9337A3AF4D97DC868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <34472b57.1961.1a0dd3dff12.Coremail.19888972804@163.com> <TY3PR01MB113461CE3C9EB4A175879F5BD868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <1186ef64.63b1.1a0e6e70a59.Coremail.19888972804@163.com> <CAD++jLnVna-E61Z1GiKKX9G0Q+1CMq4GYi8p7vjKzeEtroAFdA@mail.gmail.com>
 <ar9WM0ZtDJD2H5Ii@ashevche-desk.local> <CAD++jL=eGjhCM8Xa=T08rPSGpH4p5dsajZa569gsObJma3yZ6g@mail.gmail.com>
 <ar-FDqxMC3F-zkPB@ashevche-desk.local> <CAD++jLnia-GyvS57-q2NOTWrqXWC12-HDbU6qsUiWEqOgTPX_Q@mail.gmail.com>
 <asILHNE0iDP2jVVR@ashevche-desk.local> <DLYK485WJPQ8.349OCC3FOJNFL@kernel.org>
In-Reply-To: <DLYK485WJPQ8.349OCC3FOJNFL@kernel.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 8 Oct 2026 15:14:45 +0200
X-Gmail-Original-Message-ID: <CAD++jL=bYjRzGDs1ctiBzYft+Wh77Mq7GQGioD8gFtKVdJva7w@mail.gmail.com>
X-Gm-Features: AclHuK-uImMepRpSKrZxOdQ9gUXbShgsVia3-8oHHq9qpbNNnpEhyUEQTQplS80
Message-ID: <CAD++jL=bYjRzGDs1ctiBzYft+Wh77Mq7GQGioD8gFtKVdJva7w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: reject devices without match data
To: Danilo Krummrich <dakr@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Kim Phillips <kim.phillips@freescale.com>, jiale yao <19888972804@163.com>, 
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, ukleinek@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 1:07=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:

> >> What I don't get is what this is intended for. What is the use case?
> >> The commit says this is for VFIO. Shouldn't it be opt-in and turned
> >> on only for VFIO then?
>
> I think VFIO could use a different (less generic) mechanism that is more
> integrated with the corresponding bus to e.g. allow userspace to decide t=
o get a
> PF bound to a VFIO driver for passthrough.
>
> The existing driver_override is convinient for this case, but ideally we =
want to
> express that a driver can only be bound to the corresponding host and VFI=
O
> drivers.
>
> I think the situation for SPI is pretty similar.
>
> Unfortunately, it is a uAPI already, so we can't really get rid of it.

No, but we *could* make the whole thing a Kconfig option and have it
default n, and selected only for VFIO.

I have a strong urge to cook a patch like that...

> But I agree that we should be more defensive about this and make it a dri=
ver
> opt-in. Uwe already prepared a patch for this [1].
>
> [1] https://lore.kernel.org/driver-core/0f7446324f6a0c8f0153d6532d92a6eee=
cd6a308.1790612298.git.u.kleine-koenig@baylibre.com/

I like what I see.

Yours,
Linus Walleij
