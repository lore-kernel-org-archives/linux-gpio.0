Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910197;
	b=MP+sq+aAE2TE+XzScrs2wCYp8MQcLdsLCx65txHtBpzwh5Pa7uqvCrjqv3de4ppaExr7
	 QCI4RnMvhVKs/SHN5SnQryWdbfVfacrDW3pAx06zcACqTIhnMqKSScVdWcIM7lKieaAl0
	 I9YEEfSQWDygVXSk+O6xHJZrA7PlyW1opByqSB146cLQ19kIYXo+U3+C27ErOveHC4i5a
	 9mHv2j9/ZGMa0M29Xdj2SEhJySZhklrEDJ7xf0TtfPVwzTuD3MKTNHL6qlU9Z3oKeg2PG
	 C3quEjfz5Kz/jjiIGARVuHTmb5EZb5XMhObGDklTRV/jf5CHe/yFGzUKoSwwjEth1zg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910197;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Zijtj8oRnUhmq8nJwvW4RuvRSCE2yvzPezhEDKGNnBs=;
	b=q1PGnCn86UsvjfUb9RszORZdrRi/h0C0832RBwL84lCBySi+q0KGfdNmMoTnzo7N3Lgi
	 0ew5Q1BFFVtltNS/eIweEMjTuD+nKG5+OWPg26v8uigGgwi1Wy9nz7yLjZnyTNttAbErc
	 QP7fvxHcArGl8KRIqx7zNOji6y9rmIpen4LGaLRpbrUR5PHaYflkB8/pzDCsWbi2ji9L9
	 ZhCgch1GBxqTBJARSMxQhBkMTYlm5McLfjLRvpvHYBiwD+mUIiNQWIKpFtaWeN3on1j3x
	 Wy3bh1o9mFYddMzLGxPieh0t3XuleXLAeYI1JjmrPOX+g1T6m2Uj/ONqgGoMJNcUkCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZryeUptg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB75606A32C
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZryeUptg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31C021F000C8
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794910197;
	bh=Zijtj8oRnUhmq8nJwvW4RuvRSCE2yvzPezhEDKGNnBs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ZryeUptgE+CTRECXG6PaFFIo2ynUQLFGJoEd6SIe0bh6T+R/8Ylgar/c7UC7XvKKC
	 RboUXutefAjs9UYoNbZHAKOaTW5RdZ5zVYtKi0OfrOVqV6O15XplMzPAJsgewCr4HB
	 jYy1L7eKdJ6jhTQiiqJPM67KFcuQlnIrmZewUg0LJp8wECWmle0XH2HTiWC1acvEg3
	 MYnT4y7Fn62BBVq1IiXmI2aahHYNKiTgJnPAsemi0K9G8QGaSJp9BMSiJVdz3A2V/W
	 vjdvoLdHPWv0dWGgHsG+gw8ftu2pno184/1QGkhwvlTsaCs/wqp6SdJ1kK2zoj/VIm
	 ggZq9GRKBJJsA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso755036e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 02:09:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHjn7KjbzwH1/O5Vn3tCQZ8A9uVenJhc0ImH+cGpsTuDILpBfX/Ok9WAz5E5uvLbYwY1AQ1l9lDbYnz@vger.kernel.org
X-Gm-Message-State: APuU4Z/KOV8osH+XhMADMqtKXrpdSoI6rD8Jm4AVoiM8KHB+9NEuToFZ
	hqJfQ7/2bV8Dv+PIbVOKzlmc8mpM1aSGQy/aamjfqKmkg/YqCXhsE9cMT2SV0+AqogTZBUUP0wk
	2yNi1uGPkumQ27GxDQOmsJRqWUbHXlo0=
X-Received: by 2002:a05:6512:3e10:b0:5c0:91e:a95b with SMTP id
 2adb3069b0e04-5c17077e429mr4781706e87.14.1794910195950; Tue, 17 Nov 2026
 02:09:55 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-apple-m5-initial-devicetrees-v3-0-cee55de54b2f@cyberchaos.dev>
 <20261106-apple-m5-initial-devicetrees-v3-9-cee55de54b2f@cyberchaos.dev>
In-Reply-To: <20261106-apple-m5-initial-devicetrees-v3-9-cee55de54b2f@cyberchaos.dev>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 11:09:42 +0100
X-Gmail-Original-Message-ID: <CAD++jLmvsXAZwb2ak4vumXqZTPgGNqm=fdgWEgw7VqqzvU83WQ@mail.gmail.com>
X-Gm-Features: Aa3M54oq4YzlnIadSqNmPikBx7uA231ihP8lcXU-Pc_buuhnmKKyHs_C06WfytM
Message-ID: <CAD++jLmvsXAZwb2ak4vumXqZTPgGNqm=fdgWEgw7VqqzvU83WQ@mail.gmail.com>
Subject: Re: [PATCH v3 9/9] arm64: dts: apple: Add minimal t8142 (M5) device trees
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Hector Martin <marcan@marcan.st>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Sasha Finkelstein <k@chaosmail.tech>, Mark Kettenis <kettenis@openbsd.org>, 
	Andi Shyti <andi.shyti@kernel.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:24=E2=80=AFPM Yureka Lilian <yureka@cyberchaos.de=
v> wrote:

> Added device trees for the following devices:
> - apple,j704 - MacBook Pro (14-inch, M5, 2026)
> - apple,j813 - MacBook Air (13-inch, M5, 2026)
> - apple,j815 - MacBook Air (15-inch, M5, 2026)
>
> The device trees have a minimal set of devices limited to CPU cores,
> interrupt controller, watchdog, serial, pin controllers, i2c and
> framebuffer.
>
> Boot-tested on j704 with macOS 26.6 iBoot/firmware and the latest m1n1.
>
> Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>

Looks good!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
