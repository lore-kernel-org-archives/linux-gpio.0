Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793800838;
	b=kD5Ilm+lajA/JIfsas7qujP2fZJ8RuyJPyIWT3txbxK4wFEMpI3zrxi5jbnvYql9EsG0
	 WbF/eEXicplUt6DN37kyXqjD9k3Qn9aiu/wsbaDji+NkvSfkSjrqhkYvqLxHuqL5bN8sg
	 s4pkfRnRjjvvwHe2ecSIke6I0Z/cbMl+xuX6gG6cQHKAeANalDSfQt+w+DS6Gp6ubXlpt
	 151FK/M8bwKwDeB0SBcl+6vxlMVfSr6qnDrwWjKy4QkCbkTAJ6utU7UOf4Uiyp4DwgbdC
	 YhqnQDElqVKnFZx+yqY3yKZn00bjFYiAhtLl8ZBzaLjOWfqmSU2x2FrZQKma0A9AMuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793800838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
	b=qlIfJGsnfhFmldAQa1mQlyxWoTauFRr5nciXj59YAN9veyylYXYIHbbC9KakT8gMqHwI
	 gB9YihFGcfIpYwk6hInAdyNv8ZVUxFNnXWjQBEtjEw+owhMcj+Y4FBw4TvhAfpQzIn6Ls
	 qzjrt+qxXfLmCqe4iTBKSMaQUxPpkcr8xBnpkXxKMasA8pXyplqTLnDBDhKSjx3+ajVUN
	 vtKMqkfe/nG8b/Y/CCLDAJq/p1orVYTbSmAfzT+RoV3z17bNT96fbSa2wu6kv/i1YvHBt
	 utZykXmYAYcdZY/0WggcFWk90alsrn+HPUoOQoASkz7kU8MYdMHN2XQGP1omDtJp3tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm;
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9E7606A337
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 14:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9E7606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVAYG9Bm
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so721211c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 06:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793800838; x=1794405638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=lVAYG9Bmc2hoKTJuJzSrH6J+IhryAyiDTSMdo0aYG9mfqjPS/ga8+3YK2Ad//sbXE2
         HHofzfmuuJ/nJx0kE/6IytFncp6WqXb39RvQM+YnlJNPVlx4UDFXx8nAXhQykpg/r9dU
         TTw9D3mrL7B/AtTF/tGzwS4DWBrit2U6UIDoeAg8Au1ygMhfLw7GRk8WtuLYUaZkwSTF
         aYRfMnD7tWD2+C7sh5TWr6OTrCzca5srbXzkmLr+/5fdNnNFJYIheqB8xKYVa8MXmxFB
         4bAPEVWyyZRmC6vgyn2/OYmqQ8nZ9BmRTU8WOS8FvaydjpnVOWQKGf91yFtKwUSqhNCh
         RSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793800838; x=1794405638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EK0JUgp8OCD/gxw0LjPEg0NrLddUOwjtQqQrgH4Zeuo=;
        b=ZN1U3bjdSH0mUTUmx8Nyl3GV//ys7h1E8wGi1oQbpaNIHtdaTgBp0EHFwiN9ltYKzs
         XtIXPSpd94YV+fxJG2KNC+W0/63sSCOAiq8erZzKi0kSS05ddrjpLOea3A7hdV8HsJWn
         OuARcBsh+Djp7n0XQHj4x3aWXhamdnYcXsyQnW9U5t0E1gUfoPbuhomHJrE6VIs2LuLi
         esgqcwPWRpQTADSkniwWYj25KEs4ANGlDEvsMtwP1Z/L8pSvC5DTjqYuc8eYLd/aBSJj
         eJLuRhO9mV5aEDYF1NqL1S6fvy+wb+nLd9UDO9nO9MxN1iNbql/X/OyAivoADLI+zM/E
         +CZg==
X-Forwarded-Encrypted: i=1; AKwUvBzfR782TTJQjKvQYV2rkRWBDzh/o4xfPZJB8o28DH9ZzlDuIlouzCme6/z5OcxR2Y6ZjRS8Vm0L/fdZ@vger.kernel.org
X-Gm-Message-State: APuU4Z9x5Yi9D24oAk2orYmxsKjxNx2csIbOGPZEtW7HeC4tOVRdmIpd
	jsu6vA0x9gmPwGD/JD2QGCoWqgJVIjazNG69ypIq93g8a/ZZFl7IRWH2
X-Gm-Gg: AYBFou1517UVV5z66B09IURLettFc8dxXMSSCNQczZ6tsPlLuzKS1kCM2NfUFy9q8BU
	akjnEcEHucG/2d1KwDkRe4wMdWoucpJi94NODm20WHi4TIZdg26NWEuqFcOKajNObAkllvWKmDI
	PwyEv77FMlRIJPPv3h+LCn2Lu3UtS2NKfFfzwPAgtShrS6BsTPKZzeSt8o6Tv3ecHaaxnh+w1hP
	3OcN7o/BvQ/jxUB6zTuJlhMRqt1+eeQAPvFFQ6m5aPYXJ+8sdD9cQv44y9vTok+lWe8+Qqc+Fte
	wIshb9ELtpFDfLgTe3SIOPqcRcllvbyBPhAtm5MmC7stDFp0iqk8CxiB3PKQgPFp0BB89nDoIsM
	r5zAOxqt71X+qJKYDY0UberowaC06WoO9jD/PC39Nwj+q1evbxsESNd0Af3PT72J4Btg2AT3AXm
	PGB5/xS1kgCMo8N+Pga3qYb4fNZfDgF43EC3kEuMrMadTV6yMPJ5iGOLJSYRvqZFQJvuoszk02d
	l7n19TpoFgDAJRA6hquCW8AyQeLbjmalwgNI67ITPNBdbI2LjxausmaBDt2emL/irYhMMyIpnAU
	CNM+kzUo9pLuY3n/tvYp0yKXMvpXasuurodvYKPQG9rWA7Q0bblrktCmkKNh/a89BWTXO4GVMUN
	3b80=
X-Received: by 2002:a05:7023:a89:b0:1a8:9857:2102 with SMTP id a92af1059eb24-1ac5f183841mr25563977c88.30.1793800837135;
        Wed, 04 Nov 2026 06:00:37 -0800 (PST)
Received: from localhost ([2.27.148.106])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c30521sm8553620c88.13.2026.11.04.06.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:00:36 -0800 (PST)
From: Han Gao <rabenda.cn@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michal Simek <michal.simek@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Linus Walleij <linusw@kernel.org>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RFC v3 00/17] riscv: add initial Zhihe A210 support using SCMI clocks and resets
Date: Wed,  4 Nov 2026 22:00:30 +0800
Message-ID: <20261104140031.1172491-1-rabenda.cn@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <9b99c531-1977-4bc1-8105-bd9c3e129951@kernel.org>
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
Content-Transfer-Encoding: 8bit

Hi, Krzysztof

On Wed, 4 Nov 2026 09:24:15 +0100 Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 02/11/2026 20:45, Han Gao wrote:
> > This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
> > and V2 boards.
> > 
> > The A210 has four C908V and four C920V2 cores, plus an E902 management
> > core. The E902 firmware handles clocks, resets, power, the PMIC and
> > CPU DVFS, so Linux uses SCMI for clocks and resets. The only new SCMI
> > piece is the mailbox to the E902. [2] explains why I picked SCMI over
> > RPMI.
> > 
> Considering how vulab@iscas.ac.cn is ignoring reviews/comments and spams
> with a lot of unthreaded emails, completely disregarding any tries of
> contact over last 1.5 months, shall we ignore all contributions from
> @iscas.ac.cn?
> 
> Maybe this will be the only way to actually be heard?

Apologies, I am unable to communicate directly with the team at vulab,
but I have passed the relevant information on to them;
I trust they will handle the matter appropriately.

Thanks,
Han

> 
> Best regards,
> Krzysztof
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Sent using hkml (https://github.com/sjp38/hackermail)
