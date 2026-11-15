Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794727876;
	b=49kR3meR3cEUGjUdhqQdWsj45a0nqk/8riXNUDnzyUpKCgdJ438gDCcAu0J5do+DM3p7
	 BKAu7yn4wwUFMaCDsV6mm4BwOVfXTX+7T2ka1yd77lm4NWJ5GuigU9PJAHq/GWwZEiuE6
	 raoD6B9uap/v/7K1zmb+i16lbWPnGRk0q+g2AEtNHXQjToKAfjb75QQA4J4wcSYm8BQE7
	 Z+2K+uyEAYPtftNMkeYBDgiEiZ1KCbmOTTnUfTKrsXeODUnRgScdagZRJ0q2l2lhXVlDx
	 HiSmdasJa7Psom4OPk09ChLNFhVTN1bt3fLPd7g4H+Kb/JRf6hzkUuzKJMc0narsWlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794727876;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
	b=3t7nI2b62Vt0rQtFVZBV3nTFp0DoS3+fntjOlXghBSrxSX1Xhjdf9/R/1X29xNw/zr6c
	 6gR1DesKONespOwkVnztNqzLJay5U6kcaxH2uEn8/LP0OoSf65Ckn+u2fMXcwJHcyD1ag
	 6l+6bT9Im2Xb9Qhe8pQGV+3oKMga7m4G1qf8cwAK/xT+XiCM6Ln0QiF+dMzjWnWfwHeiC
	 5oFLNoIhFJcT0/IW9Ci7JB8tf7xL2gIpQh6AVeMcmAz2h1J5sTOwP2L+UO/dBAWSRMJq4
	 LCulyF/9NhauPiGwYg60St9wD5WaoA/Ie7ZR8CesRSswPeX6qcTsR/1n7sjgjrxMmsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C53D606A31A
	for <linux-gpio@vger.kernel.org>; Sun, 15 Nov 2026 07:31:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C53D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sfHX33b9
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491971ac844so2232585f8f.2
        for <linux-gpio@vger.kernel.org>; Sat, 14 Nov 2026 23:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794727875; x=1795332675; darn=vger.kernel.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=sfHX33b9HzNVq08BaSf4y0sViK/MK0chzVBJ0Q+gvrAe9T8wXjtDwJMVvfNxxjvT9l
         SEWTWE0sZtcsNwKWEFyXzvLZNe89AQsVdApUgEXQBL0TJsoj+jbScFkEv+3jRZ1lB8vf
         d/rISxDPp+F/K0bJHknHkk8CXnGYEM/127Yv2NeUvCKPhYO+eTU9rpQmEU6Dd62/EQvB
         fz0HUNzeHXC6U3b4kz52ODEk3D6rWUXeADFYBeeqPtDrSrS3EHKV1D44l3N4ZEbUKSDw
         GOdF9hL5WuF6stzHu5B4BcrufdthWBPcUDcNVZnPgxjB1MxYoePPvR2o1eoXKeb9bMzV
         K9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794727875; x=1795332675;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qI3xoqr08MTqFKH89OHdawFy9+IYpxgrM6eMy9hh1r0=;
        b=VJn+SRgzkkCn5UdkMtQhgrhDzr0BBLnHn8KRDmaX4Uj9fPB1eYJvWVtrqaSwDDtL4b
         pQ9z+kchX19f8V5trNc1lkOYtmxHP0TEgRC7MNNRuWiLhDNXAzY5XsD8w2kkN+KECPuq
         1Kimf0FUumG+Zwwxnvh458Bejy4YOo+l3CVqnUwTqePCRGqPxErosOyP2BHiZH41xuVH
         Cv2BF16eJCUCnbLxnx299jE5bKT34+oKBUe3oHVB2pzvNl0Gf1xxVJP5VGMGnQ6WcVtc
         KLjvTWsgz3DVGni8fNaIz3VNJW8We7QcklAhjwdlCw+XdYd6jM7rrd9x5TI6pFHDyoZ0
         aLjw==
X-Forwarded-Encrypted: i=1; AL+hErE7G9Tfnzy6T9kJZHzLG0hMPQbwx1KnCGW9BMiH2eqexUb3iX6UVU5PC2iDhfMaYljTVpQymA+HTq87@vger.kernel.org
X-Gm-Message-State: APuU4Z/leel1lzhAXeiUZMMEST+/7bM+77ia7f4NEFIJbdHto8pK6uE6
	2L11+oOnx2b1Qyulmon4NgRWQTi/sMsGfUuhlOQc4r2zy/RNbWfoq06G
X-Gm-Gg: AYBFou1fRYBiorDp4op31IYQqVz4b46Ti+tp+ksmvOVRThgh2bHTqZsqImsNgStT+n0
	ResORHYRhplO5nIy/6CphHLwscAwJWZjIbgL24KqY82xeKBYbDVOnojiOIR5xa4EBK5XyuUd66p
	C94y+ZEzz4mmAvh6wNJOss4gi2+L2g+Jyhm3xIltj949lMz98aFG7m1e6TD4jr83fOXXsGrYSJ8
	GLodOpZDEx71lVKWhgggqUacR8sVnb7MS5/YA9jt9dg3VvcUddjd/JBFZ3q4tgqf7+SVPEuwYl/
	cT/+dU2Wf/V2P2QCO7sKHYuLT9wVfABrJsmsG/Vmiv1SXAt31k9htcXM9cakEhkWPFW2IFEeCEA
	uO+sbn3g4IQmZG+tt55XyVEYDTMQLuWHGPlKOOQLlVwwTAOr3Mntg+1Q2NMp2E+EEUsBClFdea+
	iD+sWzD/FieAkN4NgVD9vbUnGDb0fPEoYFPCvzwX1rGKAplW2IeQIF1MZMIjQs0lZvwjFUCkXVp
	gsa6SiGXEgJkgqysrdr3eIlCikGVinn1KwxIHLndUZV7vcbU6Ivgub9XbZk7Mk1gmSmgAhpYH/8
	kRBwpGX8VN1kSAZ8ze9B/fSLHIYCEKq3YUvLaEHZW+qPp7chvXUp3c6uCMgfrsdHXRRzF66Wp0k
	c/EsRU3uLW0ifxuVRJgITf2KeQ5V40wZ1Eaizn6eWXNOChkbO8Z3k0BKe7N6it3QeqT3ObjoW1u
	tyoJ/C2sXqJ14PYO0c41pnpj8gWqFF/WzKeg+yjH0o3EYaqHmN93xmutD5L/ngNbBOg8MstMUnB
	weGG6yeNSWFxkXExhmET9bP6g==
X-Received: by 2002:a05:6000:25ec:b0:493:803e:800f with SMTP id ffacd0b85a97d-49c725e5749mr15660384f8f.29.1794727874441;
        Sat, 14 Nov 2026 23:31:14 -0800 (PST)
Received: from jernej-laptop.localnet ([2a00:ee2:6a02:9300:bb69:6bcf:1b11:e85b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e31sm12992274f8f.19.2026.11.14.23.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 23:31:13 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
 Samuel Holland <samuel.holland@sifive.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Han Gao <gaohan@iscas.ac.cn>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Andre Przywara <andre.przywara@arm.com>, gaohan@iscas.ac.cn
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject:
 Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Sun, 15 Nov 2026 08:31:11 +0100
Message-ID: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
References:
 <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
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

Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni =C4=8Da=
s je Han Gao via B4 Relay napisal(a):
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> Add the main CCU driver for the V861, based on the A523 one. The CPU
> PLL, the CPU subsystem clocks and the E907 clocks are left to the
> firmware.
>=20
> Unlike on the A523, the second divider of the 27 MHz output is a power
> of two. pll-audio-4x does not pass rate changes up, as its parent also
> feeds the UART clock mux.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>

Do you have any user manual for it? Or at least BSP code? It's hard to
review patches without any of those references.

Best regards,
Jernej


