Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794924398;
	b=xoEeo5G8bPl75LIAztoGedrQfnheTXWOUnabZT+OCf7RtxcEjuUOjjQ8cVGBi9R2LRTT
	 18lca2NDwyCCaE14EzJnfowLugRqWf5/Gkij1sEc/qhhWEi0/Ma5K2tExZR4NIJfe9iLr
	 cxfPHSzJXByoC+SWpUI/XZwJwn3uyNBPPTRpgYX2qJ2DcGysi47+5BzYyncwkHBjtrre7
	 ItLlaguvLEaB2P1BwaRtUNc7LWvWvnJ6vS1sbvfQGLhjbLzZiC/zwafGMxMMvxAZtOyPG
	 7hrd+BpjrRpbzYiY7YscnUSkE20C4xE4CSTK1HUGSa0r1eFBcDPVbXN8XAcEKIX47Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794924398;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=u4DWjIfT8KRVg4FASuV86OIAjU2csjxn1K0PicbuhrM=;
	b=5My2Xw2OBza0onyeBFNw9XsucOcEyN8pXOyLD+6AZQlijRs0xT8zY0dFenbXHIGZvVaH
	 XknT2cB57giRpzlvL4CWZubdUe2pQcZmGnDAVODw7gJc+pB/vfAHsEnIXzcQYlmCtSWV/
	 Jw7880nKD/oe9HH7Ulrwxmy/Gbu24lBLQdYQkt+zMN00WH5xxYbPAMzdKDapFzwR0rKw8
	 OtqpC/bdbkeyV3CasJjamkhiPQdDtAAimYB1kzwX1X0bAfR9wNjTXPlP3z1WIC7jKimLW
	 ggxYyU5fYGMo8F5aZrX7kKopZou+io+wt+wQH8+i9QuoeaUHwxzhQVryoqRuxtYA3bA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNhG4l0P;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA40606A31C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZNhG4l0P
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6755A1F000C5
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 14:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794924398;
	bh=u4DWjIfT8KRVg4FASuV86OIAjU2csjxn1K0PicbuhrM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZNhG4l0PhuvP8NHjII7K1OWgC7H4A0B/sgzCOiGt+BDXwLI/kJ8bbYUNQMD3TtaD4
	 KXAThsILUyBoFqmEDBtAPD1fiC8mr/9TOdfdOOzLIqJH3zMX24ermtwuE385kWqhm7
	 BD/bY0cgXnE1JbiJhwgVeevXQm8zzhsMJ9N5LQ7jLTkht26eH2gLOe10t9t9IXpakS
	 TxJ18PSLMVFfMloeF9YYRT6OhJC/rmQKBTVDc0NProVicUx/IFLavkefPZAepfz59t
	 7kx+Qk8w+HbcGwRtYV3c+Vs6u+Mz/OMhq6mJE352DF7vC2vXoEOkkpupAL/ko/yKMG
	 q4fk8CbQ7CwQg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5c1479a959aso3793181e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 06:06:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGI0yJMkT/QYiFc7A5tMvnL3vYz2k+21FV0oVh2s/13fq6MPg7dNjFcSFd/QMFrUjBZE56cdH+pMaJC@vger.kernel.org
X-Gm-Message-State: APuU4Z9ku8QvvD0bqFekxxe6R6/OccyK8MhXi31+jRJWWLB+MI1mPwdf
	vWGxeT8F0KMywdSTq90DgU21B8OL6DO8Z7I3o88KNcq+oDbRfaqZkfdvqfrHIKkAaNW8Du9xiko
	eeNx/DvW7acGxxh3p39ELK8KPbl12Faw=
X-Received: by 2002:a05:6512:668d:20b0:5c1:56f2:fdb0 with SMTP id
 2adb3069b0e04-5c1709ca3e4mr3590915e87.34.1794924397227; Tue, 17 Nov 2026
 06:06:37 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109-ocelot-pinctrl-irqchip-fixes-v1-0-9d2d8fcd58f5@microchip.com>
In-Reply-To: <20261109-ocelot-pinctrl-irqchip-fixes-v1-0-9d2d8fcd58f5@microchip.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 15:06:24 +0100
X-Gmail-Original-Message-ID: <CAD++jL=i2_wrKNZ9tRJL+mRsXcAR3dJXVdGCNKe_AbT1McnP1A@mail.gmail.com>
X-Gm-Features: Aa3M54r_ZsB77NFXbqKooLbzXYFq-eAsg2wrDFxQdC2OMAqKX36xkKlww51lUws
Message-ID: <CAD++jL=i2_wrKNZ9tRJL+mRsXcAR3dJXVdGCNKe_AbT1McnP1A@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: ocelot: fix the GPIO irqchip context handling
To: =?UTF-8?Q?Jens_Emil_Schulz_=C3=98stergaard?= <jensemil.schulzostergaard@microchip.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Colin Foster <colin.foster@in-advantage.com>, Andy Shevchenko <andy.shevchenko@gmail.com>, 
	Lee Jones <lee@kernel.org>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 2:50=E2=80=AFPM Jens Emil Schulz =C3=98stergaard
<jensemil.schulzostergaard@microchip.com> wrote:

> Two fixes for the GPIO irqchip of pinctrl-ocelot, where the irq_chip
> callbacks take locks that are not allowed in the calling context.

Patches applied for fixes, excellent work, thanks!

Yours,
Linus Walleij
