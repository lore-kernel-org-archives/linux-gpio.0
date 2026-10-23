Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792760633;
	b=XiLthP+qRJpV52SoasYrkMo+k3ktezNLw65VXYc85zfKsLv5HGLZ7ItlZYVI3KJV2tBE
	 1JPOmsk4yNmot4IV+PTGrW7n76W87SFpdxWTWcN1saD6tl3EzDVn6WrVdNiEwm74Uyn4j
	 YKIWNtZ7vBfg/aaYdTaHo7O14a/BgNOT9u2US7x/8baSL+vEXEag6hVNy16BkENaQPNJ9
	 LScKjY8OTDfc7balThQy9Fotjofro4DjMlMeDcuZqU2LgaPsK5c9bbuJNWuiVoX8WFDNY
	 2cEe3+nOet2GH2OxxnG0fgSvfuuOsVj50qM8RgyKiffhSvgZH/3yd/RvGIfsDU8u61w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760633;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=1Qd8+/zcaU6lUIWBoHhrtf6NHTiDvscHf2rquHPumkQ=;
	b=fN8HMpvkP6EXHRNSvBkrtAOokwAwQmLLIo3rXF563Ml7jx3s/GagbfPg/4bsRwjm06sV
	 8uPnHyvgOITiA1B2JwqwJel41kTD5u7cUkUETAHeQhnBuVqC0iP1psoHiqgntLLmK9rdN
	 BuGjQGQKo9tVzEXKyE4AQe91dW1yWauAlnVaIq8SGsMGi7LMCYzBS9BRggqaBhEFWeAKa
	 aEdA01+zNSWRttWGiWfg41zxWShFZYqxHqKXetCAA8GoRKd49YUuv6lkG2w71/nWJ/uBe
	 1I4JwYaYKR7+XflsHL/V6MZRlgXCBO9OdI6RmRczepixQjpyUGQHD3kosfagyzfbz6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D934F606A325
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 13:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB131F031E5
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 13:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792760622;
	bh=1Qd8+/zcaU6lUIWBoHhrtf6NHTiDvscHf2rquHPumkQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=JSZkJ2uzIuTfEaBGTLvPIL/dl1pbZDbWZAezlVdRtlZY2vKnlxtf0ZejrbBO+2jyu
	 c2R+nfzfUf3E5MWKxHV2JhD4Zs9/KepBo58GPoB6K9cLpynB5YLu2qKzxHJKmP9w9t
	 c5PJa1ptlZ3GiEYhQ54EZU/0zIs9msBP/bD96QjPequ6ZNdF6sw79Mu/PJ7IP+zas/
	 MmvcApFa9LDhANT8A8yOV6VNrRC5VP1fF2G0rXDIGUhVGtUz1A1C2EYw4bJHqEnA1b
	 IscvcWfUwzNNlOFtdHTMfpJdr9Wvkr1E2748lT5p20xqp29wtCBAYe95mM7ubENtsI
	 uRulAKwh7xibw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so707150e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 06:03:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByihxA5voMd99Xl5OP1ENeBu/38XZ/LJlI1V+WilCaE1sSqFDjuncKu/rXjkJE50b2BGzrUnsl5bi9j@vger.kernel.org
X-Gm-Message-State: AFq9FYIY3ht7PcPiCvMFOUK4+/7j1NIGjA5vvLV8oynYx0wiQ6ane7dp
	HaGabGvof7c8lBxjpox1nG8vLLnL2Igg+pg70OlNbxitE5Gzc3p9YmVg9MX7KNBTTRtau9g2ep9
	lvikBboBW+ZtoGfE6qkcocg94CO7l6Gc=
X-Received: by 2002:a05:6512:3da4:b0:5bf:b5cf:6729 with SMTP id
 2adb3069b0e04-5bfb5cf6cffmr41829e87.0.1792760621193; Fri, 23 Oct 2026
 06:03:41 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com> <20261017052534.115203-6-changhuang.liang@starfivetech.com>
In-Reply-To: <20261017052534.115203-6-changhuang.liang@starfivetech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 23 Oct 2026 15:03:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLny5p_UNj0BYPy-tU8aPrS2MvpaxS04jKyPH=fWtO+okA@mail.gmail.com>
X-Gm-Features: AclHuK8P-whVEy-AVwIMg7ybsCadTVl7aUKiOhmVqu3jLuo_uv6iO1uHmuCl03c
Message-ID: <CAD++jLny5p_UNj0BYPy-tU8aPrS2MvpaxS04jKyPH=fWtO+okA@mail.gmail.com>
Subject: Re: [PATCH v1 5/8] dt-bindings: pinctrl: Add starfive,jhb100-emmc-pinctrl
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 17, 2026 at 7:26=E2=80=AFAM Changhuang Liang
<changhuang.liang@starfivetech.com> wrote:

> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0,=
 per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "emmc" pinctrl domain.

I noticed in the pull request to Torvalds that this is a first, usually
the SoCs have one pin controller, or two (like Qualcomms TLMM
and LPASS).

But this one has 13...

Your silicon people are obviously thinking differently from everyone
else with this distributed pin controller model. If you know something
about the thinking going on here I'd be curious.

Yours,
Linus Walleij
