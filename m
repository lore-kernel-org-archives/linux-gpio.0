Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F8B27F01E
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774013801; cv=none; b=swIt7HzxRDgJkqEyEv7Z7C/EsiRBRaKknUir76WgaCkjmEn8cCx7+xynid634Bn1IaJmyFtV0I3c34p7Yu3KErMNSaZrHtnROq8R9RCnaM8NDVYpss+80kmOtHWdFraMNVbs3+2xBWrS1ewL2lzikXDSvPWhaNv5iGo8RYgt5pU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774013801; c=relaxed/simple;
	bh=FIBI8PY5yYFqZrUwTkEODr86axeBjhoPnLU0TQWsWKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j7PfH32CLXRTo3w+yBUYHvYj/EDAg8vuqcg1DuK7YGPQyqOchj2FsMyPDS+ej4eKJnjWWqNIwt2HDI/sc/nUirhhPEkbH/92A6WpAh6c0+NDs3adP8hiWe1k2MdlFHBKMMK7x/eESg0/Ycxc2PqVXT5QkvIWvOG/fylw63a92zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SsCrO90W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SsCrO90W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2362C2BCB4
	for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 13:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774013800;
	bh=FIBI8PY5yYFqZrUwTkEODr86axeBjhoPnLU0TQWsWKA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=SsCrO90WaSDTZ4trSKqMon1aYsVeOParDmkk5H1AvhN/gP5vACsKDKAMNB3jG8CoO
	 b5uJmA91+adoPQP59VHuhnWjz3THVuqWxkVrdG2aR3GybqisEr9g8zte080oTMi8aL
	 tqEmA6HXe0IAteoBxGy/vLSUzbIsgcXd9ZOyOCOvvjDpcdW3ZZIEJHSsLrFRclDOaz
	 R6vhdJVsigeYKXOoalMN3dvLg6J3AGvxjPGWoSWuRmy0NiXZEC5pkd5c9c9tShkmdq
	 +Ct87If8N2D5MwhW2kDqLRM8b/sFtSNEmrevVXqu5H0+JWhpQJVqgy7SG9rUq3xihH
	 i16LDSK/1Tj5w==
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a5ad7cc52so21686537b3.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Mar 2026 06:36:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsM+M8BLAM83EeSWLaJzdF/bfDSs/+Kc2ibFvEsFIaLexp7wEBoMp10PqjWtSDZJIFwGQ900GMjoOg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8P5FSY1xqkGt0/jt9aLh5MVNxh3c6QcWBzx7anpzcsNeiJb95
	pF8YHJwfZFtf6pPCTovGsUgm5xTsKjguqT70jnFoD/TIE9r7/i9yf7sjHVPJaNWyYR1rISKRF3z
	2AXN4og0OGrur6hvXjoOJXJACUTY1/cw=
X-Received: by 2002:a05:690c:22c5:b0:797:afeb:de93 with SMTP id
 00721157ae682-79a90ac353emr32341657b3.12.1774013800019; Fri, 20 Mar 2026
 06:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260319141515.2053556-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260319141515.2053556-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 20 Mar 2026 14:36:29 +0100
X-Gmail-Original-Message-ID: <CAD++jLmt+J3Lj=NuYAYmCks2=gkrc5PVbsj+ER8=Rs4u-_3Y7w@mail.gmail.com>
X-Gm-Features: AaiRm51N-cLrG692swxMqBzAQuKlCnVnf0ehYtOBP_oA9f1qkrzSaMaqyrmsE9A
Message-ID: <CAD++jLmt+J3Lj=NuYAYmCks2=gkrc5PVbsj+ER8=Rs4u-_3Y7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: renesas,r9a09g077: Document
 pin configuration properties
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2026 at 3:15=E2=80=AFPM Prabhakar <prabhakar.csengg@gmail.c=
om> wrote:

> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Document the pin configuration properties supported by the RZ/T2H
> pinctrl driver.
>
> The RZ/T2H SoC allows configuring several electrical characteristics
> through the DRCTLm (I/O Buffer Function Switching) registers. These
> registers control drive strength, bias configuration, Schmitt trigger
> input, and output slew rate.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Yeah exactly like this :)
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
