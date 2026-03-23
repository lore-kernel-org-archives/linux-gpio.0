Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A941C3859E6
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774256724; cv=none; b=jVnrGL8a5XVrIxGCH4ancMVv7pWJewZBws8nnvmJzjGqlqe6CqoImFV1PhL21gM7qOLq53QSw9Qup31HtBntmwvWl6tLf2JQrOqlFydmnb+iIccYmRINxnT0KldMq5AnlvYzvfwXOlGJ7sCwJLG4YYHTnSThgsWaK2CudNQLTx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774256724; c=relaxed/simple;
	bh=2T6c3S72ahQY8xybcAngPOvZa9iNFlrMEfZwRXlS7Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FWyOmiaTY8oRpj68XmIpww/TekcDhUrCZhTwmPWoHfl5adje5OYsBh1AD5jc5vgB+snn5ksVMNCwBQjoh51uDFr7F8iOJ7YNk8RPJ5LXdGs7TDSMdrnMBIcZjPy4g+sX1mFBh7xJUtyZu/nWwJJWSl4U8zgiX2NYnc/NqFZeVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TAWP0Jd5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TAWP0Jd5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 506F0C2BCB5
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 09:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774256724;
	bh=2T6c3S72ahQY8xybcAngPOvZa9iNFlrMEfZwRXlS7Ys=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TAWP0Jd50+wA4bct6nWl0Eo/e9MYBgqRB/moFc29zFNGTSNiftQQtD+bQgdXDpkQg
	 Bihy5MvZR4R1pvm3iDZIW7tH7CffFizgyMfTHR2za4yZmw2R2I/hwODK622Sy+t/A4
	 6hJ0NcGEFgKbDHI8s1xE9ejKvjIZD7meu9BvpQuP49AQZSl9AtBG/b5Rqp2WNfh6N8
	 W28tB8Hd92jEYsAjTmw38EbXcTzalNcMTm4/uin07leljwQXBZ9JpR/NMuUwRw9Uj2
	 0uc937HF8DGvWvNdalJhPaGzUn5CvaWLV9lWFlJud4wZ+0z6PD/N1J3BVg73SFA8xY
	 B+BO4s56wTqEA==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-79a46ebe2beso33307167b3.2
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 02:05:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUEJZ2rad4vquehXFO3G2fQntNN07l63UTRk9psfeAxYZrUQctpYi9PiOop+ihcFCx3IvS/cpU7oZrf@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+bS/SSyPpZ07XVRQXAFlb/vrUAfCEhdg/7ozLB+YLMAgTKDrI
	AE1tkyJ91snTFDy4p8M3ofk9IDw6OTmSsqDwun4nCPgRPYM7uiaWZYqeBcY7IKJdufo2Jes4vVZ
	ad09aXrL91hrECrMZC1U8M9F6Je1zjQo=
X-Received: by 2002:a05:690c:2612:b0:798:1637:fee0 with SMTP id
 00721157ae682-79a90c05e2dmr136862067b3.52.1774256723603; Mon, 23 Mar 2026
 02:05:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com> <20260316-eyeq6lplus-v4-6-bf44dfc7a261@bootlin.com>
In-Reply-To: <20260316-eyeq6lplus-v4-6-bf44dfc7a261@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 23 Mar 2026 10:05:12 +0100
X-Gmail-Original-Message-ID: <CAD++jLmT+4xb3sfa3f1z0vD4qikeB+v0kC6yo6=hSU+==fZOkg@mail.gmail.com>
X-Gm-Features: AQROBzCPE1B6frTZvvI1ONusEll1hYYlE5t57wp0l2RUDUVexg_OieOxm5rH708
Message-ID: <CAD++jLmT+4xb3sfa3f1z0vD4qikeB+v0kC6yo6=hSU+==fZOkg@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
To: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>
Cc: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 4:26=E2=80=AFPM Beno=C3=AEt Monin <benoit.monin@boo=
tlin.com> wrote:

> Add the match data for the pinctrl found in the EyeQ6Lplus OLB. The pin
> control is identical in function to the one present in the EyeQ5 but
> has a single bank of 32 pins.
>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

I don't know your merge strategy for this patch series, if you want part
of it applied to the pinctrl tree then tell me which patches and how.

Yours,
Linus Walleij
