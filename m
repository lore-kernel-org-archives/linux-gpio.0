Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795368148;
	b=wdkblGb0Kh4xYrhzZvz1NsnCrWkr9ZiAHlKnhf9Jgm96gTaPrMEhgN4kJlWpS5Z43c3E
	 QmC4HZxtP8JQ9fochMAA7ircbCLJZNuQrCtiI1dRMZVMW073EcF5KvzmvJMHrdkCgHYv/
	 RoYmrsxLTItjgEqDz3gDBK4HyzGz3xNMOsovGXOHyHQMWTuaYzsaxdbAvJyYvCqigeU20
	 nu56vlSlf1ZdDU5MiwXnoB2/3AAw/thXNMVP/FzbMNe5PXqpIyONiFpXiHtky/PURDnBR
	 MptbBtpUv9p1sPwUAY/48vD4/HH25+FvJRHNXHf9NFmnD2kh7tTXC5odatR0cEx7Szg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795368148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
	b=zLKrgOhhTltwzwlSfWkVJNVQZ10xj1dKhHKpi9dv1n58qJWQw0Mt9YvjKbNW/N6L6SOn
	 To6Prmge07fu0bURq1QtJm6MstC9EL7lz7TsEw7YmGGNYU+wmc8MKgyx/ivTTkO/ahQpT
	 uI/W/W9t5ZI/piftrakJLAudhxVBjTUjjMJrRJ8zIbYCwbHx/wdFF/cbcct3NF0z5fwPR
	 DIn6IFf3g/JRLyxN+EO/tmhlfCS2YX/skzp9nD0/4atu6nSrWhfZ/kuUlK6sEtfXucfRe
	 it9h/y40BzNbmN+GfWMTMLEvmaPiwLH8G807qrlzWUgyK1oRR3I20GrCp/EHzn3qoAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0892606A33A
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 17:22:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0892606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XBAzZYcv
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f01f296937so19581255ad.3
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 09:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795368147; x=1795972947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=XBAzZYcvI0UAjxnxRcreZ2xa57tWzsBIk+xJyJfakPnjZQLRqB7gnVTc6Qn5CdjUbO
         xXTqI9r+rGRXSGvF5d9u/Gnt8cBL/N5/xf6tBndcQ9TnX3hHeuD9tSzX8sNkkbj7vhA2
         NeZPxacRSsaOBC0O3QO9DSW6vT50WIL7fgQmtZa0YNtC+iyBs2ZZbCtUEdbBWGXZZsl3
         XzMwvQ4v9H33vCd27VDcugFyzLDIPGo4nIjz28dfG3CtbzZTvpHODKvnyuNs3l4NIsgV
         rmrwLL0KqwTgCr+ubLcXoPp9NBBDnxFxRbDWkoQYlII4OMLRVrvsRiSieYn+T9Gsvdjr
         irPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795368147; x=1795972947;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bsJvZUqn+Bb7/gG6ywuV/4DLp7NmQEDZvD3R+5g2Jts=;
        b=gn7Zh3iu60sBEQpzDb+w+/aBGLu/pZ18pQupjmLhx6+8m4dBBsjwLnD5VcCFj5hA83
         32jEEuFzLy2KmsIuqtupKbkFd7JKDuo04IwJngVeRPObMk/DxDvKAcAXqHt7h6g+d+BO
         4bt8GpgBG4uqbvDPsdrqC6kmey9xEcsJow/YKzJoCgTaq1E1rvtBx9G+HNqLYR83hjlA
         tdfz1790Tm0vznddM9Ki4bknIoMbT0YewkpeJfIKC9LF553RdYO0MR/bTF3li8qwbnwb
         GyWkAXqlwFlRyhxgA/kyOPvjrPdREEG2YURimtL1k7aF05jhzOGWxGyAm+tR0WaC96BD
         jTUg==
X-Forwarded-Encrypted: i=1; AL+hErEbwFIuhD8Le4eUZMOAeXI2PQWUk8N7rBTX7qJYgf6m41yVn4riJu+IoyUU2z0ojn+hn4gWN94OR8h7@vger.kernel.org
X-Gm-Message-State: APuU4Z/W4fXDNtFscPSKSdCNwsErlYVFFDSMyxYIRpLHC/03jBmvprdx
	1JrPdCjyZB3nI0cQV2GqUdJOY+cEAeEaK4OEhNt3jPfDUpE4RvVW4vws
X-Gm-Gg: AZFdTZcsLJS5RNaRW5k7zhX5DmVqPA0EgmCCG4W81Q0nuel2ka+pp6LaeZKe5h/4Rbd
	qTIwQfp1w3Qz9sLZPdqMTpfG4ABO2B/lMXk/6PoBW3GPE6cfYlBwoYWXrbyihjBoB3it2CkHOk0
	qBzBnGaRv38oLlSPK/Ti+fvp0PWMgUcUJb1ZW2l1PnSAyuPZ1p6SdrwMoxhNcpkCRR/uOj5JKvc
	NVqwOzXVv5YG9ob27Xf5tOdXBLloCW7cGhzHwRQKJOiC0iqbAFN0CUt2BAogbQ6TNH+PSgKuxmH
	P2ZR3E2OdmHfNpddiQgcESSWAEsXaVwIhC0WnkGRVbf6md51andyKs1Ipxh7AxHAS1ZWyUHhIY+
	5oIWcXkVrqhuKuE5Z58ET+EKdc0L5SMk76Tq0GbxF5Ak+BpKFCuCqGD/MI6ChRJkGtPb/42qolK
	sRIsCw1CzODuuIFePQy+CTzPdBrO6oPbl6Vybm8G+Aj1wVjIIRVwRZLrj2D8+tkrdNGYacRV7+F
	vtOMuSmhL3v9quJEkfemk5exYh9OAtCErYvkbYAmDSizjUAHXKmgZyH+dY8WbcH+V3fwN8dFGXk
	Ht2IlucE1irVouSQhlGxFvn2LYL1eXGX8MV1p2saduYCjpueZxii81UXD4lQKvHDqZLU9esTgtp
	MGwU=
X-Received: by 2002:a17:90b:3d4d:b0:3b0:9162:948e with SMTP id 98e67ed59e1d1-3b41c905a3dmr8081661a91.27.1795368147033;
        Sun, 22 Nov 2026 09:22:27 -0800 (PST)
Received: from localhost ([2.27.148.107])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad0b2c4sm13471136a91.4.2026.11.22.09.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:22:26 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: =?UTF-8?q?Jernej=20=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
Date: Mon, 23 Nov 2026 01:22:15 +0800
Message-ID: <20261122172221.3552455-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
References: 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sun, 15 Nov 2026 08:31:11 +0100 Jernej Škrabec <jernej.skrabec@gmail.com> wrote:

> Dne petek, 13. november 2026 ob 23:33:32 Srednjeevropski standardni čas je Han Gao via B4 Relay napisal(a):
> > From: Han Gao <gaohan@iscas.ac.cn>
> > 
> > Add the main CCU driver for the V861, based on the A523 one. The CPU
> > PLL, the CPU subsystem clocks and the E907 clocks are left to the
> > firmware.
> > 
> > Unlike on the A523, the second divider of the 27 MHz output is a power
> > of two. pll-audio-4x does not pass rate changes up, as its parent also
> > feeds the UART clock mux.
> > 
> > Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> 
> Do you have any user manual for it? Or at least BSP code? It's hard to
> review patches without any of those references.

https://github.com/RevySR/linux/commit/bb06380bc2e5a02049cd01e0b10cb3c3c694b750

BSP code

> 
> Best regards,
> Jernej
> 
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

Sent using hkml (https://github.com/sjp38/hackermail)
