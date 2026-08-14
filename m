Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CFE3E5EDB
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786691607; cv=none; b=UdoI+HLMqyLDy4L40zu33KscsxL02qj9RSodxqSdGKf2YZUv43fhNbKEx8qoerEqthkqhA2hQjMQBejclK6qldgPhQknxYStnuiYhaywXMovgUbGFU3HjTN5Jwm1UbC4K6wzb/lUWFJfe9usS7Krjj9+jConzBzq2AN6OMr0PRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786691607; c=relaxed/simple;
	bh=WG5j3DmY54M2zsyy4epXTXCRXkE5LeniIG0zsq81RtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rv7XalProDrRXQ80VJeqaadUMZ3zmrkyBl3QIhBGp8t3WNLG6GqRasNixHWMGg33LK0tChlcyw/WbSRPzsse31/hswdY2pDZm2igo0SjeB5cvGFu983SSZ7qWNBcTdOqyVC5A3ljMPolSn425vqW2Bgkeq7J64t1b2RFtbAi1sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PeL61BwD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PeL61BwD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B04651F00A3A
	for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 07:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786691595;
	bh=WG5j3DmY54M2zsyy4epXTXCRXkE5LeniIG0zsq81RtA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PeL61BwDV75P+u9eA/i5Q+sTKF+zNL9geHSVGfjBMDNv0ufP9YRbNMp3eDwlhpZcS
	 aeVgEmgiJ+Uw3N4dule9Z7A8ehB7uzpXUzBa0QCdMwieJt4hbIaEHtKJ/QK687r5IU
	 mRdUU22x+ISQf63VkdnVhlc4VOy6Ycn4si8C0qcklvhFJWhMAe37N8u53vK6BUsjBo
	 99pq5yJKiE1Ce2RvEMFqkFd1GrplZrCqwutaNKYjWyDmS3lAeY8INloZ7OzxaWOmLf
	 Cu4VD0MQ1Ti507aDoLUEnm63Cm9s2hR6R5BvV1VT/VrWB7C+o8cWNhNl/U4wcOdt9A
	 k9Po2xGFgm/Wg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so884398e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Aug 2026 00:13:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqyhww9oBKQnd23I67wAX+lIbpLcn3DcaxTiCdXN7ITOiEOvkeq25iarDRZE3jwzI2zWYoY675AcGok@vger.kernel.org
X-Gm-Message-State: AOJu0YzqARgxcG+c14Ospem0hufV5yR4jJmR9/smNN1IxEYVpJ3x/MeP
	dKHe6+5fcW7FhFazrTz2VshCbQN+UM8aBRk8PE+835UqV/8Au/PWox+CLGZw3o+Tdoq62c1LAn+
	6S7hZUrxn20YXJ8000er6FIc0r8I+v8c=
X-Received: by 2002:a05:6512:8041:b0:5aa:6e86:55e5 with SMTP id
 2adb3069b0e04-5b459115ffcmr357656e87.13.1786691594513; Fri, 14 Aug 2026
 00:13:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731174551.86367-1-challauday369@gmail.com>
 <178579584771.736715.6031577704790719107.robh@kernel.org> <CAAj-GBmvcG62NddVS3UMEK6tQ2UKBr+=KCXe15jhCEtB+JWXKQ@mail.gmail.com>
In-Reply-To: <CAAj-GBmvcG62NddVS3UMEK6tQ2UKBr+=KCXe15jhCEtB+JWXKQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 14 Aug 2026 09:13:02 +0200
X-Gmail-Original-Message-ID: <CAD++jLms=ufSTgUo1jm2o02MWfU=vWQEz9Hbj4EoK1r2tuOj8A@mail.gmail.com>
X-Gm-Features: AcwNN1U8PXigGeNQ8o9kh9fYFdQSSUwCakTvhUUWDDUJOQiB3i0iebtic0u22qo
Message-ID: <CAD++jLms=ufSTgUo1jm2o02MWfU=vWQEz9Hbj4EoK1r2tuOj8A@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] dt-bindings: pinctrl: microchip,pic32mzda-pinctrl:
 Convert to DT schema
To: Uday Kiran <challauday369@gmail.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, conor+dt@kernel.org, me@brighamcampbell.com, 
	skhan@linuxfoundation.org, linux-gpio@vger.kernel.org, krzk+dt@kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 13, 2026 at 7:30=E2=80=AFPM Uday Kiran <challauday369@gmail.com=
> wrote:
> On Tue, Aug 4, 2026 at 3:54=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Thank you, Rob. This patch has 2 parts(dt-binding & dtsi changes).
> Can you also please review dtsi changes?
> https://lore.kernel.org/all/20260731174751.86819-1-challauday369@gmail.co=
m/

The MIPS maintainer will deal with patch 2/2!
The binding maintainers usually don't need to consider
per-arch DTS(I) files.

Yours,
Linus Walleij
