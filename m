Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B41047F3B2
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791373032; cv=none; b=HZENJVbBm35ibZotXGlC3SABkXKBNFyNl0JHlFkCFNzeHLI5prU0LKjTsydQ7OvN6jKHlKY7oSZxU94QUTKF7U8vrbAghlRedJOkshrKU725hY6ryT1DdzD23Lefr1tYK2IR1kRNPOoYlFwLglZPynHKcfTUQUYC32tvMgLcgrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791373032; c=relaxed/simple;
	bh=TBxpXoaGQbR4eb5uSSham19NGk19XqmEGsKTZDgSljk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f8QpWfT6ODb0j4WimLzP2SwsiaiQ9cmPIhmil1pQuFC55SK9HeR9JlkNC4hUDcTtlF65JfwP/05pTImQhseKvsD9nTCRgmmZ2/hintfac4R22THcf9AR/+uC+O7fMvDJMeMy3abhqvYKq4BYWtI4z5lOQJxml55qfVOZOq/IirU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZqIzr2j9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZqIzr2j9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F30731F0089E
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 11:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791373003;
	bh=TBxpXoaGQbR4eb5uSSham19NGk19XqmEGsKTZDgSljk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZqIzr2j9kbE/9eBn0CzV0lGbA+Bu956qDFOMpLdkA2NmRIJEdUKmvm+zPT8P/haIH
	 5isvPHdqgW3GxDOPoObQOgDp0e8ImA4zrK/oBqKZit1ECZ1rqZmcPUXGYPIyFI5xo8
	 QDnBk9GRsrkg3U/PWJIHfhazDkfBr6KKZXFiB2dYGmdtZeQYVXS0iSzPgY1iT3B2hW
	 t3mAZPKvTb1bEbL13K5pUNf82xHt9n2K8Fe6oZzj1AqcXRj5RtePvLQXo3eK0PfeRJ
	 TlwyP/Hojb2RZLPtV3yQRrNNpeZjyW7PNtlMb9IHr8ZikVTXDJSPtb/2TUYfuRXivQ
	 skiQLiPYjtvUQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-49e20441e45so1305366fac.0
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 04:36:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzQHp/3E3D9ISFtyMwFk3m8lNKe6biZZWF6MX4BzkYhQ9U2iKMKEuYQAW/fQqsf9SBL/x81VzAFS2ZX@vger.kernel.org
X-Gm-Message-State: AFq9FYKay2oHlM/8WwqEGD6CTMt6zE0dv8MksDlmSewjgwCDlAztciLC
	mnQg+BSW3rx94jAfVk7xseWGpLTJJ4X42aRCfGrnceP7EAg6VZMMQc4LattcZqx02VnMO1Oib2r
	G9on2BkkHDISn0etezqsShISX5Yw5hMM=
X-Received: by 2002:a05:6870:568d:b0:470:e97e:8f8a with SMTP id
 586e51a60fabf-49f4ef2bc33mr4625121fac.26.1791373002343; Wed, 07 Oct 2026
 04:36:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260930-rtc_s35390a_int1-v10-0-e7b1cbc50a7b@posteo.de> <20260930-rtc_s35390a_int1-v10-1-e7b1cbc50a7b@posteo.de>
In-Reply-To: <20260930-rtc_s35390a_int1-v10-1-e7b1cbc50a7b@posteo.de>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 13:36:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLnoZF3OPE-XB3UB9Lt=1gq4Ofm1Xkp49HM9DnMuzbEA3g@mail.gmail.com>
X-Gm-Features: AclHuK_d0kcEVyhjiUf_VzWqfX-gVVSvbp1U-AR1wppeZzPfDg4E1ifmWd5pWUI
Message-ID: <CAD++jLnoZF3OPE-XB3UB9Lt=1gq4Ofm1Xkp49HM9DnMuzbEA3g@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: rtc: Add pinctrl for S35390A
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Michael Langer <michael.brainbug.langer@googlemail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2026 at 5:31=E2=80=AFPM Markus Probst <markus.probst@posteo=
.de> wrote:

> Synology NAS devices use the output pin for interrupt signal 1 to wake up
> the system.
>
> Move devicetree bindings for sii,s35390a into its own file.
> Add necessary properties to configure the individual pins via pinctrl,
> which allows the interrupt signal 1 to be used for wakeup alarm.
>
> Signed-off-by: Markus Probst <markus.probst@posteo.de>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
