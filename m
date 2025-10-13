Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3E572D0C8F
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 10:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760350942; cv=none; b=pxHLpuszT1qj7OOOICpAIQOM/vD526+92HvfSDeOxwwGU6ueCBTTfg2EdX3hk7qAWle871sWs9oy3lSfzGSuvXKaJpIKREZ/P1i5zc0W//YSbARFfk/LYCqmahn4+q9QfV1pfNJMHXHHZUDTOCDs+cCNSXhq2Bxk6kKGkWlLfDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760350942; c=relaxed/simple;
	bh=J0YVa95Ez3fXkjsDuSjMGBX3HxLIWmcP2kzWtuxN1l4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EQyz/JeqfWil5jCwaBganSxF60BeC5kcH1CtUUAKSgCc6Ld+gw6VGj90eko/TwqPkp+qcqQF7kQzM1u+CXWXCyKwTztvPTwzDbQJ3QWm93xKh18MGbmdytp8eyiiCd2gVVdWoaHV1otgRfW24tCVSTWEVcZXpBT1eLK1FcOF80c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Tn4AMXvL; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tn4AMXvL"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3761e5287c9so38003521fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 03:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760350938; x=1760955738; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0YVa95Ez3fXkjsDuSjMGBX3HxLIWmcP2kzWtuxN1l4=;
        b=Tn4AMXvL+mZhvmxc/MctQS9zlQk6xCQhCqtvzpuxU/9ieJ2oa9yoMddqOT3mG908Ma
         Hc38u8FRja6QHwDUI6OA+wB3FoHVFKH1PEwGRGAGq2LSdIM1hqQSyQvrTEbqExaEtZy6
         L+9MYT0pvVq9xb35emWfBlRQYK2aAHUTmxYwc9xS1+Pxyize+A3IxNBueGshakQ8pJXj
         quoI7BTb+B1FFLm3tMndfFRy5zkmOlmhR5g7ZGJSwBOJVfcX/g8OeBCuX9wAraefquBt
         q3oF3BFW9fIBZkXgbyAuM4FckYBYPJHe2ByFQTgcXCbdX3t5emfftvESh9pvp6YnA3zX
         rc9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760350938; x=1760955738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0YVa95Ez3fXkjsDuSjMGBX3HxLIWmcP2kzWtuxN1l4=;
        b=pF5UjGbnV00GPGr1td94L/A7TEvrRj+vGsai3ZmefMYWOgVFvP/dwxe9605b3VQVtW
         nCSgYsL1+DNXuCjWtRwtqK2S59+w799W7vOM+ZcHbt9nqlgLi3im9oJ3mufLX+KcYmJV
         23hCnMEmvvrJ67//xy6pTigxS9xITyiLQWoZsJiD8lPsyUwnJB3UEAVDK68gIPCkWLkO
         BjUf00HTOxHOABvvYEHdoYUGvmKJmQq3qTDtVfGc9vAoPs5y62JF+z5uN8yMS13bxkul
         WaR2asZ/g4suz3/CBzt7SUSsrZHJ09/efXexJULWz+G3wqPzHW1NSBy8m0tEbszz8/lM
         5tCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXxnYo34zcauBFdcbawkjPYOarb43L9ks/rCgOTxTr9OWosyyxvkncIofGo0SF6DAEJryMqD3dS/127@vger.kernel.org
X-Gm-Message-State: AOJu0YzA6CO/ULDygNJZW16zt2q+Q1W//d0bUq/hI1iTrS9qUOgDTFVr
	rnN0gRASPYQkVA7yS2FtfolMEh9IXSpaCzWzaJHqJoq9owtiRCTnVO9HLN/xGJ0kquZcwh+CkZB
	H6CKxweeQWS7mH+20Ahs+O/kgo/4by3Z3ryGGHr2ebg==
X-Gm-Gg: ASbGncvvAgUe3Ah4H7zjxeCZukpo6KZGdGYC3cXxv0SZQQ+Gadq/fU0o/zFcGLoYHE8
	KHHId0MNdtYE1diZqBR5SdG/UnyqBdR9yqw/gYAE7qppyh+DEhcKdi5v31qZzBJ4+5pIpevad6t
	GHuVAxGl4NZfBtPYggtG4jEME/SoDfZIOzw4SmXRJCOis8Ndr18Q/f+n/JXFnyZuhbb4xDMFklM
	BFRv0fiuiJTExnm7dgpT5HDRE65NEsxowc4iMG0
X-Google-Smtp-Source: AGHT+IENaEcC3/wZaVUeeDsXpBkIr3KX7viprB/pcczwPYsh26J5YtWYqjYpftNdfDJE/OvtfEnuPnKWez6O/cJUrSU=
X-Received: by 2002:a05:651c:254c:10b0:376:4320:e34c with SMTP id
 38308e7fff4ca-3764320eb7bmr17947211fa.46.1760350938409; Mon, 13 Oct 2025
 03:22:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250924223201.2952988-1-robh@kernel.org>
In-Reply-To: <20250924223201.2952988-1-robh@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 Oct 2025 12:22:07 +0200
X-Gm-Features: AS18NWBwORgIspwCI_5ukY34xV9cV74ksQiqXEWSRd7YtTs1Q41FvnzidRhvUj4
Message-ID: <CACRpkdashCu1Se0DofbtRbck54QE8nW666GvDitFT4LT4_2Q7Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert Marvell Berlin pinctrl to
 DT schema
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Antoine Tenart <atenart@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 12:32=E2=80=AFAM Rob Herring (Arm) <robh@kernel.org=
> wrote:

> Convert the Marvell/Synaptics Berlin pinctrl binding to DT schema
> format. The "reg" property was not documented for the newer SoCs.
> Otherwise, it's a straight-forward conversion.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> With this Berlin is warning free on arm64.

Patch applied, thanks for fixing this!

Yours,
Linus Walleij
