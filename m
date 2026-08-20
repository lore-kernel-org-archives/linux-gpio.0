Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA746D0BD
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 16:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787243886; cv=none; b=mirAVaxcfszrs0cGvIxYSHV7JzHFh8OGGksQsEnNJrpn1u9FEoV2ps+TmAPPXiZTId/Sf1rLVuz0Lnu2PcOuWlNa7hdb4eeM1eJBAsZxPFTgPiRYEdQL3XXt+35DC/6li9hv3xbKuuHUrj7l/AmHX9qQpa/LvBYqN4bwZj3LKtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787243886; c=relaxed/simple;
	bh=9VIAdGxSp2wAwONWsuwIOG0ANZNJMdmKrPjHId5rZqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcPiBYY+7RAteK6MGsXj29ESUzsv+8L3pqQrdxQ0I2n8kPBPKXgmoX/WA0swPPeyRl3L3Ql/AK18fF5lLI2W1a6a3Jwa9h41SXK0O0ouu+xnhRqDhNZ1hDxIPzvlqPw2AR9JncIG0BlTarjtmQfKx01A7DunGo4vlI9gPcJ7vLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F9xZQrrW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F9xZQrrW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEA731F00ACF
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 16:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787243885;
	bh=9VIAdGxSp2wAwONWsuwIOG0ANZNJMdmKrPjHId5rZqI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F9xZQrrWKxStF0Uisvz7ZRc5r5i9in10aN0BGyE2saPDTWjyK1fZWafm7GtFOvQkZ
	 SeMSygKcrGgseWfrVCGKKRp42bZfr+ZphUvAaHxwQ/jpfG5KnrvWEGB9QSmP7my/3U
	 +WBhTq9ZQBZY1/QVqY6OZ0NBlTEaxGPUXy1oUP1nlJIH2mMLTE/ttFUuygm61lhwy7
	 N1jO7Wg1wpz8e8aM2ce5ayyvlMJ8fohANocTsx6VhWfFpGsmSI/dMlOi2EN882fwzp
	 h+JWdADEi2AvV23jE3FSsNBxvc4rkWb3SNDHkN2lNdTmwXuPqLvtKySfbGFyK1/qF7
	 S8PlPeZiV1Lig==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebd52488cso30414e87.2
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 09:38:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqmqK/CLg/psi+/XtAJZG/axRDI+zOqaSAkAimfEg3x1WvhgS3Oh07uckU3GqxaS0LKi2yZdGuF8+kx@vger.kernel.org
X-Gm-Message-State: AFuF++lEmc9lvLECFFoxbkYe+IuU93SE+JL1asIQyAKbvr8YXA8cdkir
	HPid8DbpPQn74gwtZPJyyyRB2p462ouPYzGSGrgf0EEj0A/GNFaEAPOOdccyIKBdBE3I4NuXTKe
	52qyiUTIWuVNgrB4x276KJqkuT6//La8=
X-Received: by 2002:a05:6512:3da1:b0:5ae:b59e:aa45 with SMTP id
 2adb3069b0e04-5b478b6e385mr4801077e87.17.1787243883692; Thu, 20 Aug 2026
 09:38:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
In-Reply-To: <20260820-msm8952-pinctrl-v2-0-bf2b8b7b379b@mainlining.org>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 20 Aug 2026 18:37:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
X-Gm-Features: AcwNN1VIofihN13MO74vPgIKX8RfzOrO0BtkLko8hhZ6miZ8I36rRd39GndE8sQ
Message-ID: <CAD++jLnGGonfOxLHhM-uXAzP10J9o5=0e_cV9JM5r7SJawChnA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] Add pinctrl support for MSM8952
To: muzafferkadir@mainlining.org, Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 1:17=E2=80=AFPM Muzaffer Kadir via B4 Relay
<devnull+muzafferkadir.mainlining.org@kernel.org> wrote:

> MSM8952 has pinctrl system that is similar to MSM8917 pinctrl, but it
> has some differences in some of the pins and their functions.
> This driver was tested on General Mobile GM 5 Plus
> (shamrock) using my own kernel fork [1].
> I'm holding off on sending the GCC (Global Clock
> Controller) driver and initial device tree until I've resolved some
> outstanding bugs in the GCC driver.
>
> [1] https://github.com/kadir1243/linux
>
> Signed-off-by: Muzaffer Kadir <muzafferkadir@mainlining.org>

Bartosz needs to look at this series, he'll review and merge
it.

Yours,
Linus Walleij
