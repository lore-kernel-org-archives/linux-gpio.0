Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8583E49D1
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784841653; cv=none; b=aOREaoMflAJhI5Oebx2HFUVyJfG+DwLQtxLmWIW6v6WRa8tRdcVD53VediNwgh9aFKgN3GwEkOtSm33MmSQq8hAZEAMpc/qXXCJrS67P5ATw552IeYPQfhtEpP0BBYUcuDiheApzsS6WrzmDkzO5+1tnFPknanSRDKAWTN/CE2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784841653; c=relaxed/simple;
	bh=rVHu1MArjutVseh/LgffkBjd4eU14JPypbLOkT1+yw8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JuqPKQqWjdfV7VLhI6QPsXwPESWFni9q+3dnlxEPFEty9euXAHHtpfgFaOdaBGnrmhW5U3FZTYAhlsdbUF7/6CluklyktcPPSJGzC8kEjvbgPuilSxytepfMRxVoiIn0PsE266oMsGPJsUHs7vicRCRZnAaQkq07GRvDIAb/F4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AC80BQrM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AC80BQrM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C6A1F00AC4
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 21:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784841652;
	bh=rVHu1MArjutVseh/LgffkBjd4eU14JPypbLOkT1+yw8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=AC80BQrM+mZEuEbTRDeEHKTd2K4o1FtgzmYWxV7lFZxddMJeWQLw5Ab3v4hiTou/o
	 s28xK1btB33mEEfpyG25JwMO47nrPvi2YZ9+69pJMqNJPP8haW6HKvRoG5iZqvrGOE
	 9ha61SfHC/ByikyByFo0UHvfTi+lEZyNhkqiJ5vx5q9UocAKfJN9VdlaX8OSZAtssH
	 2R2WECm7Adb7964k06xnaI+o8ZblKV7HUoVJQ3nyrAsOGlfL1Na/48HEidHR6jvb5f
	 h0abdo29MjZh/P+ZznC+W0nfYgZcOhzVOV2UAL+9YA2dMPcDvdLeHt0169TanoAPKt
	 ++HkyQhy7LFkw==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b0117d49dcso1041571e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 14:20:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqq/IbfhbMBrnortEBLrbFUv++d5lgybltWtfGJp50r9Joc4mLXfYsD3adhkxSgjZWL/Fu7dFOysEm8@vger.kernel.org
X-Gm-Message-State: AOJu0YzHuVfJiiufrBLROwK4SEPqU3qcfxr2O1JyKDKiZw4Ayvg0NiR2
	2EMKrsP1VhhrdUEejORws4SaV9XgRof4pYO9Ygr4aRxbMLQXaeiWpyRhUhttHGgHhkPB0LnMxIl
	TWk2/Ly/+t98ehJDmycPDqJopOuQ9Lq4=
X-Received: by 2002:a05:6512:40c1:10b0:5ae:c34c:aecb with SMTP id
 2adb3069b0e04-5b2b2f71273mr663306e87.41.1784841650927; Thu, 23 Jul 2026
 14:20:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
In-Reply-To: <20260713-mt6858-pinctrl-v2-0-1bd072e3206c@jolla.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 23 Jul 2026 23:20:37 +0200
X-Gmail-Original-Message-ID: <CAD++jLnP-f85taVv_Qus31Fmx453FL1dXuCzgV2_34YOyk6wcA@mail.gmail.com>
X-Gm-Features: AUfX_mzO1IFYAAzmWCaGdgClCyXt3fIPpy3GNEwr6OblEvy3QOAx8n-oSARvnK0
Message-ID: <CAD++jLnP-f85taVv_Qus31Fmx453FL1dXuCzgV2_34YOyk6wcA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] pinctrl: mediatek: Add MT6858 support
To: nikolai.burov@jolla.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Nikolai Burov <nikolai.burov+review@abscue.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 5:07=E2=80=AFPM Nikolai Burov via B4 Relay
<devnull+nikolai.burov.jolla.com@kernel.org> wrote:

> Add support for GPIO and pin configuration on the MT6858 (MediaTek
> Dimensity 7100) SoC.
>
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Patches applied, so we get some rotation in linux-next.

Check the Sashiko moanings on the driver and address with
follow-up patches if necessary!

Yours,
Linus Walleij
