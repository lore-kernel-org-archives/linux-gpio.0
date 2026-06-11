Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B711233921
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179464; cv=none; b=cN/Kqea30gUmBj34IDjQRRaRZxnTZVVv6c3PxZvyeuvGBKb87AfyczDSZfstL+JU5gUO4mBLTD8gHetKoJhgzB6DkQ3eoIjDWtE7+eB5OnuP+69MvtnIzrLIShLOVcXYE/6UzUA/IwbQqu/L11g+459tKn0my+KiDVEw7LbMAig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179464; c=relaxed/simple;
	bh=ROPHg9VN1Qhr0+agsTuMoXUjyKJkHv25AxjLVLVB9ek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UJmm6lcHxUs0An5tcf7UvYNZbjbJ6nsPRmBLG2ZSToQEgQKIbyGfb1ITxRZwiMqoCgCWTMrzG86dw1S3k1HVJehRDK3lzV69KSVn7PLuxMr7f9B21AMSedCJHact9OEgaolxoyrj1LVwMs+bIK7cWoNXOj08JNKrKFLE8NIvUZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WqNzIICo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WqNzIICo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DAC1F0089C
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781179462;
	bh=ROPHg9VN1Qhr0+agsTuMoXUjyKJkHv25AxjLVLVB9ek=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WqNzIICo+obv4DW2P/S4zWisBI95KJURZs6ph0420I4hs6fEtE9JnZrkxyRzdDlle
	 rKjJTwduhcu56ZLlQGbbJAwR+6FIv/Aj5dnnWmPGFCvS7zZuklnAVb5jrZ2HayX2dv
	 taLnJH837+n2iaTXsaGgjCMLD7FAkK9i1+N1Lda3gmp1cL/GeSosO+Mwg+H/vqAyPW
	 UVVZu8dePgI+IEbvMBCX4Fz07/XJRjPEXjHCc1Gd+oUBflk32eSz7vF4sefbxHBiIF
	 oXsiVA2oRJxqUkJrTovKyDy0YOh9zPJDcqPlXYaXtA+Z2FuCdxjtDfKOHMg80f79Lf
	 pNXsSsGgRJp7g==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-39664fe2dd8so64695461fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 11 Jun 2026 05:04:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/ne5AhSFtz7pDbwiLD1Jrl5VMZrUg2NezaS/6x9gWiOm1OgHjxxmB4j2TGESqp97wHcWzNLSXtNxQE@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2F1m1hlTgdmzUFLIIsW/QlRaW+QR12/+/RFFSmJDUUj6AA6kT
	OVIf5/SUnz8Cp5X8htrfv+MPJFyiKyGEukawsFsME2eq04Sg7sPlKX1atUpemTHWY5jJDRY4WVT
	ox87Pfb8qsWj0caUDDPmgMoSXz4dzJvw=
X-Received: by 2002:a05:6512:124c:b0:5ad:bda:4e87 with SMTP id
 2adb3069b0e04-5ad27fb6a9bmr780946e87.30.1781179460707; Thu, 11 Jun 2026
 05:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608094122.1245189-1-pshete@nvidia.com> <20260608094122.1245189-2-pshete@nvidia.com>
In-Reply-To: <20260608094122.1245189-2-pshete@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 11 Jun 2026 14:04:08 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0FwBGrzdFp2dqXnUg60jnma6BCKNDyirEO4BFZh6Yzw@mail.gmail.com>
X-Gm-Features: AVVi8CcCDaOf4-MRCZfqSOQvD3MxIOCKTrbjtHNT3eOWDtAlzq1F4eMyJsM7JZU
Message-ID: <CAD++jLn0FwBGrzdFp2dqXnUg60jnma6BCKNDyirEO4BFZh6Yzw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: tegra238: add missing AON pin groups
To: Prathamesh Shete <pshete@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 11:42=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com=
> wrote:

> Add 24 pin groups on ports EE, FF, GG and HH to the AON pin controller
> group table (tegra238_aon_groups[]). Their pin arrays, drive-group
> macros and pin descriptors were already defined, but the matching
> PINGROUP() entries were not present, so these pins could not be muxed
> or configured through the AON pin controller.
>
> The pin arrays were not referenced, so the build emitted
> -Wunused-const-variable warnings, and commit 119de2c33d96 ("pinctrl:
> tegra238: remove unused entries") removed three of them. Restore those
> arrays and add the full set of PINGROUP() entries to make the pins
> usable.
>
> Fixes: 25cac7292d49 ("pinctrl: tegra: Add Tegra238 pinmux driver")
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patches applied.

Yours,
Linus Walleij
