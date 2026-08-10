Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D31439F188
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 07:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346615; cv=none; b=EyoF0Iduc4U6Pi4GhvdEpowdbkNVQ0ppouCzmZ4tPBihdxYiKnsbxJBMELNd2gTy8sJDL9g+Ytffz+jZCHqEjoeuHQJLQoibrd7c80tw77mQOFGp7NpmzNRSvmv9Bxca1F3im+dRSYHSchJU5jT6CJ1EguzGkakWgJbx2YulfEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346615; c=relaxed/simple;
	bh=WCowh7oPKQDKfddKouHpaByvNjhTD1qDX3l1ombbgok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+ZVEvY+6OcRIvDRqIYfB6Pp/T+P3Ck0pEdA5DsGBJ7TfGCVL3rYbP07MQuarVBA22XRdD9BCePysBu3UcfwqQkJQ6yyDq2HBpjmYRk5s8eu8RK9SdchmMbpislf4BuMKcF0/QvF6fKZBqU5dO9aovydeJiY+HF7WcIvvDKg6LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyc1PKjw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyc1PKjw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2641F00A3D
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 07:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346613;
	bh=WCowh7oPKQDKfddKouHpaByvNjhTD1qDX3l1ombbgok=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cyc1PKjwaddKht8k6fNhmwzBhRCSZiFHpzMlz90mU+F1+2Q/wOiynCTLCVs0+9XUq
	 f8sEP1kH3ZhPAqFqbgS/sOcj6i3iYkfGWyDl5BmFQIyhRCtgAkEyE2vYd5+TlHrbPq
	 PkIPbOURTLQhD/2DTv7vqrykRUCVanwC0kL6WRjH3agy4cTjCEgJeuKb2166RFcw4X
	 Y3D2zo99c3xRqJb04esgbc+RBJ1z+U0nsnC/+z+EHPFGt8B+UfivX36YGsiku8vNYE
	 h7UiJxgBvn1LAhzJ2h46ArMxodvKzw+HgIhsTNC0t1uZommeVySB254GrTjP2QJw/V
	 sHMOvmuRfoN+A==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b0231a3e86so1442472e87.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 00:23:33 -0700 (PDT)
X-Gm-Message-State: AOJu0YwasE49kmhgC88rNqYMjS2FcUvp0w89/7sxlcJvwN0FkhpnE/z1
	iBH97quRVX1rH1d9F/0Bfy3PAOVZNryYBUPLdB4E3XHKhQz3CSLXwssuFHCqUdTZQIo7LbJLa4A
	pczwJBTyqqIFNo7mDpwJMsyhcbQl+yLI=
X-Received: by 2002:a05:6512:3189:b0:5b1:5379:8b6d with SMTP id
 2adb3069b0e04-5b30b72c871mr2256251e87.23.1786346612692; Mon, 10 Aug 2026
 00:23:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786262697.git.naseefkm@gmail.com>
In-Reply-To: <cover.1786262697.git.naseefkm@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 10 Aug 2026 09:23:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
X-Gm-Features: AUfX_mzVkSbHAHgL9M7a1IoNBPEOmu4qBOswFPvdaIh1-PehrZuAw66Jtzg-62I
Message-ID: <CAD++jLkpcQkdN5DgCp61OANFhodoQyAUAb2WF4CyNYv=0xVsyQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] pinctrl: airoha: add EcoNet EN7528 pin controller support
To: Ahmed Naseef <naseefkm@gmail.com>
Cc: linux-gpio@vger.kernel.org, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
	Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ahmed,

thanks for your patches!

On Sun, Aug 9, 2026 at 10:05=E2=80=AFAM Ahmed Naseef <naseefkm@gmail.com> w=
rote:

> The series is based on linux-pinctrl/for-next, as it depends on the
> per-SoC driver split and on the CHIP SCU lookup by "airoha,chip-scu"
> phandle that landed there.

If we can get a speedy review on these patches I don't mind merging
them for v7.3 already, it's nice to get some movement on all the
nice Airoha silicon.

Yours,
Linus Walleij
