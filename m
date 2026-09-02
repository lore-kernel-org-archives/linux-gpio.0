Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77023BB9E3
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 22:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387931; cv=none; b=AsgMMQu83FU8iJsVRpYqnmng8YGfvt1g8e+hZiqhGjJD9rLQJZFOck5eRvsPFr52EYpPtGB+GfVchn60ZY514X5vjgtdjHrz9vlkgZdkeGkDiU3FTdY/G4GjH9zd2OjqEtumgi+JR8Z6SJT1Q1NNqiMHfvBHTVELBwXsPBo8QuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387931; c=relaxed/simple;
	bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=taMNUfrZQ8gZOVgK6doe4Pu9Bpo8pqCOAgqRvMUn8VHRQD+kInivScXRQyeYxTXSF+diaWuAL8BLnTYSvbfKNPjg92ui1B1PPai+UtlKzfTEAkXY44O6WtQMPuAVYtzTIqHSsHwVr/H5jiW3n5tN2+WHauwyeY4j0+ZZWGOtbcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yb3Ayo9K; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yb3Ayo9K"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8ce9b733so12394875e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 15:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788387923; x=1788992723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
        b=Yb3Ayo9KHdIKe4V+rNGUL0qGvJHx9YBFlAjjC36OB/kyCg5rawY1Wr1W9U4m6D//YY
         Pxkfnpne3X4nD/2kalDcInPobDGDgSQMjVjWUWUPNvCTi3FWdaSD2z4ACZ3hOe0xfKKZ
         E3Mqp9hn+Qm5+/DzAiuW2BUDO51EBp9yq4FsGErFFdSPpcZU2e7IMk/Gu3+NkYOtVAaK
         yM18jTIZg22G0UpgTYQLosojkYDuqUq9+nPazXblvo095cT2RF2RQvhytfWHnS4DfNns
         8qPEi9noAtnvdPmtueBEvFwLjpclJnvlleluikP3JikvXE4ExFGeA/qrQU1FkmxRCX9I
         w5Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387923; x=1788992723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=szYdDO84PxRayQDTK6zsyyf+Yvx7xqhACB6SYVnCYkM=;
        b=FDy4RF/Vx85nZnF7/kfY6JbcOqAhO/82V4jrVShXBAdpEglECyuzT35MHdqCyZsG5u
         pRmqlOVsmau6HywrHFLXEssxCiwHuJTrxLvbXH6D1soWgXxodxKmIi0Onc6gZXttahsy
         lV0CMD2rVH3xxjH3yA8miiBEminUfDkHB0kaQuo6MSjrdr2Py/tGOjscQNhAi1jK/gjt
         b76H+AIumz1RrVtSnZkwk9W2dwe59vU4nBo/4gqBh/xWUwdQbuO8hz7M2u7Bs1utFKjD
         7KYTqxh4ezSeDnl4lVghD8qoZbwyKzvFS1bxfY0/YvIVk4rsa+1DOD6dOY7NRvI0RKrP
         WMuA==
X-Forwarded-Encrypted: i=1; AKwUvBwkA+7CYJLHYl19RMpi2hybq1jsCdhPmD5u2A7lgwKSHUWV1FKMqe6n2bu7l7KqEokQvCPELoJZv7NK@vger.kernel.org
X-Gm-Message-State: AFuF++mBKEzdm6rKe6GnAULnYvMALhl4p7IeBtkY5aaG21K4RmDBKXVU
	X7a2jFAWeBmNPW78gPpjlmduN/nmbRss+Fh/T4Q/8Z7Ji4jiEV/Tt1Jt
X-Gm-Gg: AYBFou3v91H0qILBl9IiaTfXIQ2elrVQgaSx0mYQy/r0e2LhywB/fHl0sHIuK8nWl8A
	TmTRXgqHlJrf8fjCh6MN9K9LITxIahTG7DxfegdcsNqmNOolPdviqgIyFCXiRrSyuPulShsV/R8
	vMNWgxjSgfl1yZvKncwR4e9kpHZ6RJMeHSdozKy3NPR7gqBeT1K5Y8VvdQoya3npsD46L7UELH3
	9FzveQlaFwtesDGuXzZTgtutozeL9xmhxEDUs2XAlNZbc6WqKOHpQ6uSeTEf45a4CkJcIHyuIqt
	IE8AovSMvnnA8Dirn49ECQucuvPvArLwyyAm0xAo/nKLUD1xwqP9b1kT3LH8L5lwxKLwLZliLYT
	q1CIDTU4mELpr1BbZ0DY5L2rdhdPUMioD+dBt0tuh3eAjynNCPWm9V46Uf/WA3TPNLc9v6EOjs5
	Q1mUttaud1VbMNUHgjN7IInJxl7BPOEJqP5nOKrscqRErHD6viTLd5mb5wTarczNeyGEAdhjV0B
	OZd
X-Received: by 2002:a05:600c:530f:b0:499:bdf1:7578 with SMTP id 5b1f17b1804b1-49ce55ecdf2mr157349195e9.3.1788387922631;
        Wed, 02 Sep 2026 15:25:22 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee6023d6sm20916915e9.8.2026.09.02.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 15:25:22 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: Re: [PATCH v3 2/2] gpio: mmio: track the direction of chips without direction registers
Date: Thu,  3 Sep 2026 00:25:21 +0200
Message-ID: <20260902222521.1752085-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
References: <20260902154525.4090276-3-mehmet.fide@gmail.com> <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

> What about just implementing generic optional get_config()
> in struct gpio_chip, implement a likewise generic
> gpiochip_generic_get_config() in gpiolib and use that as
> the fallback?

Yes, that is cleaner: gpio-mmio then knows nothing about pinctrl, the
same way it does not for set_config today. v4 will add the callback and
gpiochip_generic_get_config() as a mirror of gpiochip_generic_config(),
with gpio-mmio installing it for the pinctrl backend and seeding the
shadow through gc->get_config.

One detail for the generic helper: with CONFIG_PINCTRL off the
pinctrl_gpio_get_config() stub returns 0 and leaves *config alone, so
the helper returns -ENOTSUPP there instead of pretending it answered,
like gpiochip_generic_config() does for a chip without pin ranges.

> I don't think it is necessary to provide any consumer API for this
> such as gpiod_get_config(gpiod); as no-one really needs it, we can
> keep it as a private thing in struct gpio_chip for now.

Agreed, nothing outside the chip needs it.

Patch 1 stays as it is, minus the npins check I already told the
Sashiko bot was redundant.

Thanks,
Mehmet
