Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794950539;
	b=KVpt8Ya/WtkiULqv6e9WTW6qlV6Dv5Uscd/8zLl2FTci/PxRavTlCRIrJvID93O7oSba
	 c6rQaJXeLc0xMQnK8MIKUUk181mfQLeENK35qbg+bksFeG0T0qQNnkGbhXD64BIrV+eI2
	 fyy4L0LlmAOf2e4xe291aUXt2R8ERPQAo3Ixj/wYrvgaafgk65dFhsyCNuiGvTm5nAwF3
	 o5KoTZ/6AMdQecsPgrWGjFuE7nJbYPuNd7qbIi9qEwOG/sg258ckj4ybL8sE7k3n9WRAG
	 tcjR01GoYH0PvzMs8EGcR6ytABp1XEEmmJaIBilC9bQEM5l0lAO/xD3rKnhR3rKQqlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794950539;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hR8zqcaVFufUZJbz6TpjpMzsfZXJTBa7dHfRmHijjs8=;
	b=RBQa/EqJZVlnF3CpOln9PQSaR5NKwzd5gB6Fk72M4HiAzppAvIKZkmrcSlewXlSwYFWZ
	 AbqjoNeqmz2/dVNDmIRJpNMyBsC1bpecWkD1iFJLYerB6qxsncL1G0UHQMG+WqWSWM10a
	 mxnqUHYFTxTrCoaZCpMTpcqYXTC1TLFAMmz3NuJOBo6ofsEfXRaxfy/ZqI4kmIZy+eF9+
	 I31Nd3aYveA0tlR1kgkLQk9QYnsWoUOf2y+QWTNrFGU/yNMcpIFkFL7EpBbM59sOc3ycD
	 iBsKNCer8TdSDGerESDTRtlU0A/MHRkUAYNeGUm8Yxi2gkXk2Bk2WZXiXncDFz8wMDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A25jxWUP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E33606A337
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 21:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A25jxWUP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17E071F000CF
	for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 21:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794950539;
	bh=hR8zqcaVFufUZJbz6TpjpMzsfZXJTBa7dHfRmHijjs8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=A25jxWUPYHW7w9VYVoXlbomo3G8mmdvm53v0mBIA6oJcnerOOTb1O694kNsIJo4Qo
	 OtIPA4HjRXIbNWszJbAkgvwU84Or8LXV/cOCKbcKbw9iknTM5+MeiSMeEj1N5hQZ+v
	 SZGE8pAYBcaynJogDCNSo2DI3Xkl7/r/Kg0Vbz3KyEhaIEwr5+GTF7yCHA17+AmcQG
	 ANKiZDx7/4hnEB5DmsnI2eRCipZSBtsI5vt7glB8emqQEnMAN27lO263KYQD9hDl+4
	 NZUojAPT9nAhPj/9TGeDo3cJJKLv0+eORTjHfyHWzPbV3XuzhiGuLWTu2fhk6jjX4M
	 47/cwY2hq3FAg==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so169172e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2026 13:22:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErH9KvBRoa6sxYCQslNN7YxhAOg7O2bIUql/Ogecom5b9BL2x+GjdX4xJK5k6uoDxUs/BNMoZq3imC1A@vger.kernel.org
X-Gm-Message-State: APuU4Z/izCxqz4uYdLFZ+cIK0pTqcmskb980cHtyx83jjzIIDxkfM3a6
	gUd6Z+QoDCBHhiFjwdd9zm1uSvMrFS/ace8hsbmuLV/HBI7gjMTxGXLHAKicWV6QeRR5f7YReV8
	SPiU3+3VUpsW4Gbe2YrEkjTdtK4/wEtg=
X-Received: by 2002:a05:6512:4014:b0:5c1:5b12:1f87 with SMTP id
 2adb3069b0e04-5c1aa2d4048mr95529e87.26.1794950537809; Tue, 17 Nov 2026
 13:22:17 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn> <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
In-Reply-To: <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 17 Nov 2026 22:22:04 +0100
X-Gmail-Original-Message-ID: <CAD++jLk0HkzOUR_1aa8e-Ybt1cjQyVJnjWDoLW8fbT2Uyj5J3Q@mail.gmail.com>
X-Gm-Features: Aa3M54o5CUDu839zFyLh0vC4KsKZyd2Q82HQWkF6_lEO4Q3vIMRJ5Sux77Di6k4
Message-ID: <CAD++jLk0HkzOUR_1aa8e-Ybt1cjQyVJnjWDoLW8fbT2Uyj5J3Q@mail.gmail.com>
Subject: Re: [PATCH 4/5] gpio: brcmstb: don't turn platform_get_irq errors
 into -ENOENT
To: shao.mingyin@zte.com.cn
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	geert+renesas@glider.be, andrew@codeconstruct.com.au, wbg@kernel.org, 
	opendmb@gmail.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, jelonek.jonas@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 9:12=E2=80=AFAM <shao.mingyin@zte.com.cn> wrote:

> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>
> When the "interrupt-controller" property is present, brcmstb_gpio_probe()
> maps any platform_get_irq() failure to -ENOENT.  This swallows
> -EPROBE_DEFER (the parent interrupt controller may not be probed yet),
> so the device never gets retried and the GPIO controller is permanently
> unavailable.  Return the original error code instead.
>
> Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source supp=
ort")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
