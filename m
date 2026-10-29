Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284912;
	b=M4lRITpDZ+NpesHkeyf+jeT7SusdTEDDdWwwNl3F+hLDE7dpVqisDnKfk7pL0QoEp4Sh
	 nhG+oqRgc1ZqeZDSm7YzXXIMj5H2DFiqEHapq/zjUMb4Z5BZWVOO0r3ETUSbEsjpco16y
	 IX9a3sFhYBFy0KY+vbdoiEnSJsmb31jABo+sGIiQNIu6Fg44pt0zwyYCpCwIR0HEUMq+5
	 14cG5NIgUDnQ6MxNe8gMz9dd7wPNmZLxp1MDtExksu05anUPROt6lU1mWndaZuCQduoqK
	 aQKHBOBA6YMPRNPkZnf5rl9UKM91TBywP/llgYrs0594ULQl+22n3EwcGI4wHOImymQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284912;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
	b=IHtXkjpkAWtBMkk6UJV4icFouAJlVZi+r/Fxk4m7u3k7QcPw6zn9YG6qX3VN8/H35W18
	 ElvFJ+GMJdRfnKRqxdFsTLnqimEL1QWaXNrUVBO4uT8Jr+CaoSKk1/xk4y/CKq+CiZ3Fo
	 yspYppTaaZ8zJBpGcaRt/EkP79/020OdFLVevvYF2oRd0jMvwKItpmNK01BwrByY4wdd4
	 1c0Fh0PDe4Djb6meF6QioHtvC4Mws/mDdADbZs1dfxyRF8peQGltKKrQfDibVRDMjubPh
	 o24vkyzKwXGuuelG5oTrlMC5ixwi+TfGktkJzHCod1An0h9mRbppsXMmURVCT88moyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hghgDVpJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CE6606A31C
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 14:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79CE6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hghgDVpJ
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c315869241fso351314966b.0
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 07:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284910; cv=none;
        d=google.com; s=arc-20260327;
        b=UFQUODB8tuLqkbY9sXwqi0gYC44ExtG7i7ygYjxgXExafIBTdlGwA+OYLOh/zjDT9I
         KpVDVdiPnl94PrPjQU7s2QAEhhOjhqq0DrR0vORFNYCGNpwrB2nji1Gg2UbUonjF1rW7
         bnYO41gkxMyqiZ3ciGTI00fuXGnXfEvLYm2HQ9/D0FtTiV0MphNHY0J264iFnTMiJaEy
         fCdsk8WfJkeBODtA19GqM+Hn3nX2KpN1LaTqIj4xRcMtOMc1WrBZYMFFiUikFzQpLB6S
         x2kHMp+XeVlUkNDooFf98ET78fhFAIPLAlf1/TJGYtoXxqgajnwCSoMUwr57mX1H4uSr
         ESIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        fh=gNQyL+dxglRgq5g+kxvqa4HklmoPk3Zk7uTP1B3/HnU=;
        b=larawWKMPFVqP6TjVnkX7I0NEQCT1+jO2NV8i3rH/FwncvVh0MEArPFLacdDhdRMF3
         tzA5oYbTNG71kfo8adDUfCbIfMMJ/vpD9E+mtVJzley6iUczzQuY1b0alhOIRYH4Uh/X
         /y1Moz3LYnoZDVo0UXN4QtgYmpZDHM17akEcFsQufPlAX7IInh8MH4cidnBrh3nO6PcP
         0XnhciA12tdbqIcy4pKehes9bskHl6cjwKcuWMuyIsJ1I22yZN/j6iiJQiHrlmhrXBM7
         +tqdB3AfOmLNA/qDV4xTf7jF5lIAjTywshPl4mFz4cAi3R9Ilrulv81vWYw4XyAa126E
         Gx5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284910; x=1793889710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=hghgDVpJP1cXYyThMA1gZBdoGMjiVg+rqnG6FbqVfyG80atEPkE+cfMHmoIWezl/C9
         XrtJ3fiu/AY80LVVtY57ZjKn4y8UbkNImktFCWOyd3Co5HvUDG0Zgu7jwoa53114S6H0
         sQMxRUtrelRiRZw9bikrEPHMBNppKhTRXp7evQQN/7A66DZ5P+sf4Nft0PN+W56HvYa1
         6pV51HwyGHwt33FcOXYuLrtRybOk9jaLF32W6SgSIJ2b67T2J7yG0qeIyqKm8NBiLxy4
         z8QoX/bA3wt6/fPsTMAsIkQ1yTdyphOax1o3EO6z5sFUVJbWXgGJHl0EOWOEJMD645jT
         fTQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284910; x=1793889710;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vje8Css+WrS1hH7IK+aXX1zgPX6ZioiAALPyhZd+JTg=;
        b=Yd9LrtNf2aBfB16lVjxm1SJ/RY/tqE5Cagn5kIhTIxl2wcp4aDYG7yEU6pXs5bDA91
         rcw4Nnpo22rM21Wj0bfzhhps2rFqAABMKjmwHxokIYv5BeZOX28uQ0j9rUdvCKJ3hmeH
         Wo4nYS0o21pqD5qpl7EzOt9Fy5fonHTFkbabT9eb39Nd/LvQ6VNX1AH8LYMA4DCFJ06A
         7nkp0yLIQzyS4Bcy42xWSG7lDX2vX2Uot67+9It24p9x8uXHjS3lqx37pbGdZXSLk88U
         aO1wJe5lSHWJhUPXZEcnh00yeS35+k6D0igdDArIOQEmxA9DqPJs4laXTFf+/uvRIIxc
         oVoA==
X-Forwarded-Encrypted: i=1; AKwUvBxZlykX3SZ9G2mrd1rrkiRd1s6A9IAdKtgeKTyOBb1dH0f6ZKOIhmkdW9kgwVFAgd3pVA3k6IwA5cQP@vger.kernel.org
X-Gm-Message-State: AFq9FYINR31wNf/bUBYb1lDydOW+D/a6r8RcaXI73qSpa5k5atVDwnOo
	n8nQIHhHUAdnnY+JvYwJ6xpxW+u44hL9xB+y24z80JGJ4zR3Lv/6oz2qIz4okHrvSSIZUi2LYfY
	G4fAt/rUQ6aAz13ZNI8fdUXtPlSB0Sl4=
X-Gm-Gg: AYBFou1G3qr9Vy1SPqvWVItGV9z3YGAcVaPUPR2IwV9s0rVPNrq27Pb05NvmY+9e9rv
	JeP2fVRJBHk6iwcpxj+PayuJ7dAFmoseDBwkJzKi1+GGqd8dMQLvu+lNA7LSAg+Cs1Q5xkE+Hsm
	gqx4UWd47FrUmAjmbsnqsLVjDPJafwhlgxstJ0dAOHfNzO9eHEVqep5gNsGrVFsCNFy4GKU4v6C
	+b5Ysrsu3uA3jwbB/zhRcOS0X/eoWoF/Dk60r83KX7uCPJmh6q7PHPSqRe2Q6cQDXWCuSlalB0b
	FDdXuY7kAVwW7nXne6E6Ci0ef8WkPSGw/znwM8Ihp4D9RnU0M0CyVcJPhsq0i6reK3FC5xHOYxm
	RR2va45veTNNtUI+VrUsNeI0eVOUrZk/8phwfIRIxGNLOls2LORXK0um3CUl4MN25lRJv/3OQ9B
	FdViHUhBLePtUguiD/flh9EvNVCySxdDpvheMXNukD9EruwJWOxzw=
X-Received: by 2002:a17:907:a88e:b0:c46:6a50:40b7 with SMTP id
 a640c23a62f3a-c49bdf25ef1mr512176766b.10.1793284909657; Thu, 29 Oct 2026
 07:41:49 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-6-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:45:14 +0200
X-Gm-Features: AclHuK8IDt-muCciisOmWbSe4tpMQXEP57E_Zd-8ek8gdIf0pEg9SXZFYjLfJ5w
Message-ID: <CAEnQRZCT2ghW69zvZZHPb+GHVLGFO=2A2hGxjuM0Phqjve8xgQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] gpio: vf610: drop unnecessary wrappers
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:52=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Remove trivial wrapper functions vf610_gpio_writel() and
> vf610_gpio_readl() that just called the relaxed versions directly.
> Replace their usage with direct calls to writel_relaxed() and
> readl_relaxed().
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
