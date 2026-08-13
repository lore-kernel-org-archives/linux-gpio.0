Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4154772A9
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 13:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786626453; cv=none; b=oxPQ+MTK8F3LmNcaSpBFcKHmLwkQlZ28dZW+2qcSEeF65ACm+dm2ZdlasGeFd17rMY2BzIIscJ1WeoyCC6E7KY5IfncgyWEGaI/gSAITBcP0bl+RdZ/mJlePrBjLVKgWZf0PU4RgacZOIndJ9CNuUgMbdGO5Q47V+BDEx4KX+sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786626453; c=relaxed/simple;
	bh=2V4LbzxXVRL8YYXBVPJDpy9FMQZDKpcQI4DTiuPtGRM=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CRV6Zo10mb9SPC9jw2SvpVYEo/SG3DVwQAotxt0Bq+ZPgWVFRd4XfJs8j6G6NNlc9H3GQPFResCN/ppREvYv/MGPeBgQsysIXV+h57XbvxlDChwYGxlGcehNO8XSQEsxChTKTdToYYI2S/NUUm9vwTmSVRQQQ8Nyxq/0EqAGnJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GUpPSu/U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GUpPSu/U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BC4B1F00A3D
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 13:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786626452;
	bh=2V4LbzxXVRL8YYXBVPJDpy9FMQZDKpcQI4DTiuPtGRM=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GUpPSu/UDE/kbIl3BJ/RVc2zcO5J8CXe7S3g8U/E8CFRWUd65fm/utkAv0QMeMT/p
	 ZJ+7U+K0KRvX3PZ+OV3qYDcot7EpMx9kYntOvtt+M6Iid5u0EFHTuO5EsNFunUFP//
	 /qW1GGzsH9GSd8aw+b4QB5vHcbgK2eDWQ+UZasKjtJxB5WwtIU0V3IHs0gRki6spxI
	 sd92oaskWHWei4+MpVeTLqmf+wWeJq/EHfT0tSATMu8panJoqzOrUaNkPG7BvBrfPh
	 QrB8jSJOiGkZi3bVCoPkfwUpPOXY+mPxGL5bg/I5NiWMbUtn6KrpkkW1OV8ktNJzo/
	 A683Pjtj8eBog==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so17820181fa.0
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 06:07:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoofqINZDBVVg8R7mZwexZGkF+a+mXWZryTmGU1ePdqW04dhwgAsgjEoS+jY89HOySrwLHgpEgpYEDx@vger.kernel.org
X-Gm-Message-State: AOJu0Yze3WiepRRpNdLoYNbWu3V+fuUNd+Fg9W9tJ1V837lo9JTYU8w4
	zz5chhTkif2nxNF3vzq0KXcswq5fSftUkvtsaQsBCtQxBUzswkziqNfdN+8X02i7o6LW24He5+x
	Cy1t+QD4q68iABkA5eSuedNTJD05d4v90cQ79VYqaYg==
X-Received: by 2002:a05:651c:43ce:10b0:39c:6d1f:2f13 with SMTP id
 38308e7fff4ca-3a11a5d087dmr5683661fa.13.1786626450893; Thu, 13 Aug 2026
 06:07:30 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 08:07:28 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 13 Aug 2026 08:07:28 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260813-cv75-v3-b-v3-0-1d82e18da09b@ambarella.com> <20260813-cv75-v3-b-v3-2-1d82e18da09b@ambarella.com>
Date: Thu, 13 Aug 2026 08:07:28 -0500
X-Gmail-Original-Message-ID: <CAMRc=McWBqz3YyN8GUMLd6aZjvZ=wT2y6oUu81MgrpR-Dc4hWQ@mail.gmail.com>
X-Gm-Features: AUfX_mxQDHzznFCPjAFUr94xSbRi553VA-Ghe8BBzZsDyOuS_FyJt3JeSHnfmKY
Message-ID: <CAMRc=McWBqz3YyN8GUMLd6aZjvZ=wT2y6oUu81MgrpR-Dc4hWQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] gpio: pl061: add Ambarella CV75 register layout variant
To: longzhao@ambarella.com
Cc: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 Aug 2026 12:19:37 +0200, Long Zhao via B4 Relay
<devnull+longzhao.ambarella.com@kernel.org> said:
> From: Long Zhao <longzhao@ambarella.com>
>
> Extend gpio-pl061 with a per-variant register layout so the Ambarella
> CV75 GPIO banks can reuse the PL061 driver instead of a duplicate.
>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---

Devicetree bindings and driver code should be modified in separate patches.

Bartosz
