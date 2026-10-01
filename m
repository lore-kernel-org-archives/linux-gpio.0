Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67963485937
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 20:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886748; cv=none; b=IV+1Q9cBkUXEeYR+vJ2d/mu/92Xs0WbGcMiHQF41GHvufsDA1wtlvbRN7dKUIjNvZKlHhPtEPX+C5h3iT2l9owlVhno/q0qt0ASSKP7PbO02EUjokGEs/WAfl4U8tunNZKteqwYrdxUMWiOoHt7atS7q5TFcHvhPzMSaoSWbz0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886748; c=relaxed/simple;
	bh=qcLz5VIqrPLxxts4VNciRIChNErXev7IuXl2T9sRc74=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Eb3dwJCemkm6kBdxZR2DuBQq1y/C4gsXUBzPseYJE8rMYntvUAwvP8mNUgvz3cSg08azcA3zkYjMdL0DmyUsSF96JvenLY0DVy/Q3Syy26ScLe529oHszcOGoHvWAW+5gU4Fq2HSJ3JccQMqKk1Moz5zD1rSEgbZ4rG0AWIRLE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtAcjmb4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtAcjmb4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 120C61F000FF
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 20:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790886747;
	bh=qcLz5VIqrPLxxts4VNciRIChNErXev7IuXl2T9sRc74=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JtAcjmb49+9CVJKKEKK72AUjiANdqcGzX2MyKefsSjb3idsWueBWake18fQhfv+Ai
	 7/HGaw6z/l17lppNHZUzLHNDaVA0Le7pliiWzs6eID4bzAUrk693H3muNWG2nSuwxE
	 8gUDAvtEC8QiyQ8rKVrT8T0st+ZtH5ccJ5hXwJi1XLqTpjaXaB4LD17BFIIoy/JM25
	 9n9unR3EOj8sIhaqx1ql7NLYBRl/K+Vy2gUDti0x5zcdPdbit/gOezlSf44Qn0hlWF
	 58UspUPrIgJqol0cvVs8KoLKL7Fiswt9akIMA1ydEays924kiPFib7sLx/qEhcSvmT
	 3kF8NnRtWu4zg==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba42939bfeso1632592e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 13:32:26 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxjJR0o+OpuBjwtA6rFWcHxfxQVg8x8TtglLXQ8vnffY550MtLbfxPWfDb07nfJvUs7dq0XJQtFBHSB@vger.kernel.org
X-Gm-Message-State: AFq9FYIV/3SFpDX1uJtOfb1xAMQb3ZCm3MFT7cz+vj9MfS5maimZn625
	+N3cDhwBlhtX0ZKGxoSKE2NXIVJTb0ad0WbLM3yZ7luGd3zaQuob1nrzzCLpG/zttgsLwLkBzh7
	zjzFusxVe/jr+CctqUvdl/NXdHxA4Kgw=
X-Received: by 2002:a05:6512:3052:b0:5b8:edbd:60a4 with SMTP id
 2adb3069b0e04-5bb9bb145c3mr112291e87.43.1790886745879; Thu, 01 Oct 2026
 13:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929194035.496244-1-marex@nabladev.com> <20260929194035.496244-3-marex@nabladev.com>
In-Reply-To: <20260929194035.496244-3-marex@nabladev.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 22:32:11 +0200
X-Gmail-Original-Message-ID: <CAD++jLkCT=hHQnrxqX8K1_d-ige-LTR2SeCa1ETqE=2gr602zw@mail.gmail.com>
X-Gm-Features: AclHuK_BwtELP-F-5UZURmutq3weQqdSW_tv9x3rIhlaIFQbzeU0e-SvQ-dDFrs
Message-ID: <CAD++jLkCT=hHQnrxqX8K1_d-ige-LTR2SeCa1ETqE=2gr602zw@mail.gmail.com>
Subject: Re: [PATCH 3/5] arm64: dts: st: Reuse sdmmc1_*_pins_a pinmux
To: Marek Vasut <marex@nabladev.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>, 
	devicetree@vger.kernel.org, kernel@dh-electronics.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 9:41=E2=80=AFPM Marek Vasut <marex@nabladev.com> wr=
ote:

> It is perfectly possible to use sdmmc1_*_pins_a on the DH electronics
> STM32MP23xx/STM32MP25xx DHCOS SoM, the only difference is the slew rate.
> Reuse sdmmc1_*_pins_a with updated slew rate on board level.
>
> Fixes: 9b584c92f94f ("arm64: dts: st: Add support for DH electronics STM3=
2MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
> Signed-off-by: Marek Vasut <marex@nabladev.com>

That's neat.

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
