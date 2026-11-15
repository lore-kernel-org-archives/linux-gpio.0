Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727926;
	b=ABB09dtz2W8I2MzDAfLsghJ219yPbkayvBbYMvOzteXK0Ixvbr9UzC/p2TDQJctVO7OX
	 n0vRq3iNaKMF/yCpbxALbse3q7yGPELcLmzg6OPFqk4P1D6aaxlNYdpb2HaYuwmz8ff/2
	 V1U8kITm+zaAV9g/NgwhkRXGUYeW5zKOoeTfTECH4xV1MiEznC6jwd3GZdfoJ92TeFAjY
	 iHhf+RTdPlmJTfRTWuM+tmlRajgLcXx+koTBNPrlPuT7Jhu55xNrdVbuPttqQQibiviaJ
	 aQmXdDOEXEtAeLEmUes7AmZA8uJNd6uZE64Zl6/9BASmNYa1Gr0PFWXhvWqE04p7FVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727926;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
	b=LlyWcjaxnsoKGUPJFjSim/9HcOICRiFerwVFSgRsrP0LoRTPZirB5iZdI/kESJpwzxqo
	 RkQFR71vUM0bIIlo6dHgztKaILBqNSqKNrIBPA8G7heEI7AAs8OKcH5qlFRLtb29S6Tls
	 anslO39pHhBNsZKuiKPxof2elx5OioTIpm61a7B1xPduFQdhvPWgAYHGVNh3XuZCw1meb
	 GrZroCIsyUcinjjeEXOaekI3DyXFaGTNMTCGehbRE7X2Enn2YJz7fdt4giZ7op5qB54Vq
	 cqyGrioxBpyIbvYC7r+VcNtSY+589qWozSQOvNAsOY8ehyOC6GvCuHwyP/jNo/2O8uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D9606A32C
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 07:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E9D9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zGLp07qN
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a210470b49so18775485e9.2
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 23:32:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727924; x=1795332724; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=zGLp07qNJvhQ6+u0soNSdE4zISfLgteQxFDtiLB3+MHdU5R8cLNayQpDOu9z6E8HsN
         cokgnkhAr/wayCMP5a5YNMbrz8W4SjZLOU5BRZvRdWywNx6ylkAud+eGM9IO9xu5mMW7
         vNaai9gq6sOgHH/Plv7KLPJqtlQ7SNQhP8MwbOsiVY9oebQhNkQHqvTKMcZy20gw6VyG
         k7ZCwjq9cWqbqhlBhjXQDv7h88lCfGgbi6MypmIx2cT/mMVK282PdLi8Wwi9Md6f2p2U
         0P0GPJt+gXIMzGs33ytfrKjlEGV7t0Pg95zZC84eG54l5hQ2KUyeWmzxrEwtZdsEBCOn
         OqLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727924; x=1795332724;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WZJNoA9PE/aFpJtYQV1Avlq3zZ1+tFwplbGmb9pSnGY=;
        b=Wqpbz1EJq0HQmyo8Twn1oYGeq+vh3cnvhEVAL4gsvXKWAN5U7LF3h6lP/II3nH4K1X
         8MABwZ7SJ1MqHqY9e6AdcH8loeM+zcju5CKcX3cIZ4BJZIRbIPwFzbhSDFtC1DmEW/Hv
         A6CCRZDU4rcVx7pdaQyGLFIl13DLzf1J5kIHhqpzRGDv8bykIc7l9152/JCyZk2bmWks
         QiDc0zKVvrzBSSzv3nZqbDhAUXuSljsqtOn2uMiNVjso7Eg3/HJEXQ3YuyJWBtgQyeRK
         lJKIuDQPcX8OaURpmH/3uvbwmvfJyc+GKkhE+rYYOJDyOLcrVrU+/oaHxFtAEIeReDFc
         FmTg==
X-Forwarded-Encrypted: i=1; AL+hErFkAcWW2QaIIh5G9aBNtkTWq8ejYFSvzRCVBKAG9pzaOOzcsk+ABWU+a2o1Yraone/QNpJRPTz0Elb2@vger.kernel.org
X-Gm-Message-State: APuU4Z/SCcNxlm2nQ4mMRRM7zBwREhG2CQTPATSVc0nr0nR1+j+AYPcx
	egg+mpTLbORl5j+Uz5pNqgiPrDF76T54n9/YhzAwsR6IhFpbgiRvncEw
X-Gm-Gg: AYBFou0jS1WM0r7oJFlw7vDXhkux5n4DWsAB747p0IyuTRwCXFgJPQl+GjUEbAUfqPx
	+mIwRRzQiasQBj7IfZ1iLSGLX6//qzcY5vXy6pCC7VzgPYkqx2yPWm/QhkNW4SmBGYXuHhvVFYA
	g/NX7Lu7pCi1khj+rNpjnGKgzp8XbfQgsfL408ry1h4hLKSA20WAIbyFp+skP5D35tg4tKqyETI
	hWuxq8CbLEDnUAVbl1bovWl00/yyNn7oWd8DKidI7R5SoQFjdvnoXk1uyweRfMiEqcIDYl/Wa8v
	DT3Qmqw7UkQ+DRpv37lrBerll94VEMp1YZEikMiOmttlOqwYlpV2+ZHBx5jVtQVwVntokyTkQfi
	LfoKaHGBYyHRTQxNfut/ngb5d4g1CghWT5hWMPucxjmf7qAg263vYO34J2jAIUC5EbUdw+lNZHd
	yx/HEUGkqokP4p8L37z4n5lZD2F13dnP0+OT3JATM0jpBJ91R4kB9dAHv+DtFGKypWdNRkmBUR5
	76Jbl7pzByl7ijBXbb6v9s8WWwAtkK0rxHSDeXsUoBFpjB8CrEs2mndkfg0Lk+qxdrcIJXe1Z1Y
	8wJPB4VgDhfGJHx+c1TogbmahMnfQ6Ubd+LcS1w5Zc10AUa82o2IUmMuqFaQ9D/h7sXI6B090M8
	1QTccPpVObe+Q5oZg68MStcqpTSCwP7ue4HpGjhdh4Ons8a4ZnjoOWuXUiylbUUkeaWotmma6L0
	x1Flv1KdVuEiq1QFsW4mzcdnN6gGQ+39jHby6CxPgIx8VPsW232sOjr6DVCL0kzfdG3bnHOodcP
	eMcrigghuS2WTgAOwtq5+gjzoX1dv+Pz2fpebwlFnQb7YY=
X-Received: by 2002:a05:600c:1f90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb55ab281bmr146703185e9.21.1794727924403;
        Sat, 14 Nov 2026 23:32:04 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571cfa2esm183982925e9.2.2026.11.14.23.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:32:03 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: gaohan@iscas.ac.cn, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, linux-sunxi@lists.linux.dev
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Subject:
 Re: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
Date: Sun, 15 Nov 2026 08:32:01 +0100
Message-ID: <G7_h6i47RcuqvaGeHxw_dw@gmail.com>
In-Reply-To: <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
 <45f41ca4bcc76a6c5d0b9180c6492308ec3e85c9.camel@icenowy.me>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 15. november 2026 ob 06:11:31 Srednjeevropski standardni =C4=
=8Das je Icenowy Zheng napisal(a):
> =E5=9C=A8 2026-11-14=E5=85=AD=E7=9A=84 06:33 +0800=EF=BC=8CHan Gao via B4=
 Relay=E5=86=99=E9=81=93=EF=BC=9A
> > From: Han Gao <gaohan@iscas.ac.cn>
> >=20
> > Add myself as maintainer for the V861 bindings, clock and pin control
> > drivers and device trees.
>=20
> I think traditionally sunxi do not add maintainers for specific SoCs.
>=20
> Maybe you should patch the regexp of "ARM/Allwinner sunXi SoC support"
> item instead.

Usually no entries are added at all.

Best regards,
Jernej

>=20
> Thanks,
> Icenowy
>=20
> >=20
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> > ---
> >  MAINTAINERS | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 93abbb315065..dfc300dc1eb2 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
> >  F:	include/linux/irqchip/riscv-aplic.h
> >  F:	include/linux/irqchip/riscv-imsic.h
> > =20
> > +RISC-V ALLWINNER V861 SoC SUPPORT
> > +M:	Han Gao <gaohan@iscas.ac.cn>
> > +L:	linux-riscv@lists.infradead.org
> > +L:	linux-sunxi@lists.linux.dev
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-
> > v861-ccu.yaml
> > +F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
> > +F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
> > +F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
> > +F:	include/dt-bindings/clock/sun252i-v861*.h
> > +F:	include/dt-bindings/reset/sun252i-v861*.h
> > +
> >  RISC-V ANDES SoC Support
> >  M:	Ben Zong-You Xie <ben717@andestech.com>
> >  S:	Maintained
>=20
>=20




