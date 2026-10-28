Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.231.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793219442;
	b=YO2XPVkT0LOf5avxB2eQUPt93ZLpSwA35AFzBimgABCKLAUno48aEpMBRljJrcrdVYxp
	 Cq7iQbLJHr367hUAxaZA00O5w0xdRXTN83/Us8c5Sc/7L4lvmPI6UmLP/LVKHavLBeOJe
	 Xsig5U6mZ1HUuZpq99HAxCtz/St7kUR1h3M9mDMpsBxrv1RsCJqxlxxaKjFj4zzhqN/DY
	 03FJOPnL66PGPSiguT+2ig0u5gBUHGrLarPCE9inhfGAkmCny1g6rJWofcUpNKRXdq/bf
	 +rvvrIB7MJHARjNay1u0duEmUiDtJbJGfngbCGrJop2vr81LqEmHUoDFlI8zpJQ6wCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793219442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
	b=Plc01ahrluwWYd5z4QS0bNopGOzEcbrPAPddXeF9xxZO9Wq5A5RGcOrLFvYiJgb3hVTU
	 6QsxXwLNcDyamHxyKl9rhS1TG7sVUz/8lN202iPqDJ0TPuwUZkoS+m/b6BFyCd5Rm0r7C
	 MIrgbtg2eU+55uUNJ6N5kUMPurmWa2ilrFgGFWEvCBDAy+SfF7Xi2Blj/ogLybmOnBMk9
	 zee4Ij2bxZGDP9PxxqQl4p/IOmyR5OZ7ETrYYdMceuSWg/2vMI/HNRmRU0V+BzNTxB0V9
	 gflvHfPyFArTY6pHwKwnCt0W7jhcthueEMOtg4d/Yntfz3bFapnDziErKeszY/g2Y8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEnI3XgK;
	arc=none smtp.remote-ip=74.125.231.128
Received: from mail-oo2-f0.google.com (mail-oo2-f0.google.com [74.125.231.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8ADA606A31D
	for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 20:30:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8ADA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zEnI3XgK
Received: by mail-oo2-f0.google.com with SMTP id 46e09a7af769-84e8a9fae57so563678a34.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2026 13:30:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793219440; x=1793824240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
        b=zEnI3XgKSmZ7ym4TvvdVW/FQ4Ns6YM20ButMPZOOPcWn4yf/bd4BVlqaZt5xLJHWTi
         8wdCpR/vggun8Hj7TcbCDjA/SIVNnS7xHYJkJKb4l5IvXUuJhEDcrNyCfiFr7V60qQSI
         S1s6Sz1p/tB1dD7fuwPtLRznfar0fCvCEsCdQv/IVrcjK3ezFILmTYmUiETTnxGd9q+g
         d0Dx8Dx6RMRj6AWZ/h1FqlExVz8PRMqtiVVTJQX1T0QgobO4D6vgT4A7Tvn94Gh/AQpS
         e/qzIq/DMuc9ph9k2dmcJ0YVOHNBi9dqOmepSUnaBmWxVKV1qxxC3zNpFjWq1Tj0ve57
         1GXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793219440; x=1793824240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SagG7hnlNkBMWrHHVXZ8fa/+eusWUEksklF+xlNh03I=;
        b=sngTS02/nv6f9VRyIZ4JfbjCa4asVJ/zB5TxeqCnwiWhvVgeySHuqYedwav61LJi/Y
         vji9gkihO/EGCovsB5UxJ+v9tM+HVXXcv4CEK1BBA7gadGtChodfvqU1IuJAwbUMEgWX
         PHoYgdzV2/xlVev/i6KtdGwnqYRG5uU4EewcEyr3tBeaL8ImG/Fx6yAxTbAQ1+E1fyhg
         cMNMFTxpP8FQyOmCtlyPXBt6d8Wi5vjvejN3ClWiz/DsEeNxtLKS0c27uR7gf2NK532O
         5CCPDuIrAIa7NLaVq/4nwTeG3H0lH7zivuGldlCATS1S6Mmqp+NOCgL9dzNAyP5qteqT
         lTWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxv3RrHsA/oR0/O7+2p3QUoCkgUcnOysD7cps2wSbLwAReJH9DKii7O0o8Df+TdkeVi2NIh0YF2oyWA@vger.kernel.org
X-Gm-Message-State: AFq9FYJox5/aXYloO95URswz8M17weqcud7crEscWB993wcTGppmsBVK
	z6EjB/OwTppCzduOJ1dir89iyvrP5Z7KCyNYvjP9zRawara6ME+s5cmf
X-Gm-Gg: AYBFou1Brq5Tl/VdrZvCfIT3qQNWGVRlisiAWeBJP+pwP0AdJBqvFpFsP6uEqcB2iPE
	kA2rj8krNKJOMFL6Q/LPU1K8gUhrZeKCo2ibRuwSYYsjcRLkJ+G6NceaurmXXUaurHCfqYHX/Df
	vwrrls+3iSsFD5Mt0s2Na+1VydqcQPctC6oRGeY7XShbMTx4YFcL0R77B4T6jYqs5v7arz/s9sV
	5ucBd3HuXMGdLWHKlgUNGhs/5qtrXSIRHfSIlKo7mBaEcAqS4JbP0jjiY9vmguawKXtn/SHCkiW
	bwQ/S4gFpBMsjbZpaA3J94Mn0j5P1um7I7/dexzGJSobOd42QyGLBTFLz0XdZnfLzviy18Gz5QY
	xMKN5DZeh+H2cGDd5szZYnJNNA0T7uQ6WbALuHu41U8rD7QD3fnkSS9JcfFM4m0xgRI9NljSXDk
	KEteE6zyUQ6m/9WimSqZB52E71vPAXwdgDavOsb1v5q+/9IX+engTNxx6z4Rj+2XGtj1IOZYwtz
	EZpN4HrDQVwfRmNp6BV0FiJ7cLBfpV6kNo+UYo4R4LaD7P3BOugrndH0t0MoEH2CLguGLqzzHkh
	iKZmIe6h4wDvDBmhhVE97j6oNz5Za17lAFlPqRpi41ayJ4jzGVDMboyBRCTbwqx7c80Q2VJ6YqH
	WFkJy5uvByiycSW+0oH8FyS7VVatXsH1RbU4waTYQwQ==
X-Received: by 2002:a05:6830:680f:b0:81c:a8c5:633c with SMTP id 46e09a7af769-85ab7b0d6b0mr3330153a34.17.1793219440535;
        Wed, 28 Oct 2026 13:30:40 -0700 (PDT)
Received: from [10.10.121.179] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1d363390sm2618813a34.1.2026.10.28.13.30.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 13:30:39 -0700 (PDT)
Message-ID: <7981f7c6-c949-42e6-ad53-15e6530588cb@gmail.com>
Date: Wed, 28 Oct 2026 15:30:38 -0500
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: Use a raw spinlock for the
 pinctrl regmap
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Mark Brown <broonie@kernel.org>,
 Lee Jones <lee@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Bartosz Golaszewski <brgl@kernel.org>, Clark Williams
 <clrkwllms@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Hongzhou Yang <hongzhou.yang@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rt-devel@lists.linux.dev, mfd@lists.linux.dev
References: <20260929-rbrue-suez-upstreaming-mtk-pinctrl-raw-regmap-v1-1-db92943f42cb@gmail.com>
 <20260930080609.dnK1-Uta@linutronix.de>
 <CAGXv+5FssQL3Go3VDFbLAT6HP12RS3U3OgxhYOeapzs64QTdUw@mail.gmail.com>
 <d3d3e7b3-eb8b-456d-9a2c-116334e86c14@gmail.com>
 <20261020073236.dDVmd3BW@linutronix.de>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <20261020073236.dDVmd3BW@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/20/26 2:32 AM, Sebastian Andrzej Siewior wrote:
> bulk writes could be a concern. The 40us delay is within the lock
> acquired? If so, could this be done without the lock? I assume this is
> part of the init sequence so nothing should use the HW so the writes
> should not be interrupted by other writes to the device.

Yes, it's under the lock. regmap_multi_reg_write() holds the regmap lock 
for the whole sequence, and since an MMIO syscon's regmap can't sleep, 
the delays are udelay()s. The PLL's enable runs that sequence (13 
writes, 40 us of delays) whenever the PLL goes from off to on, retrying 
up to 10 times until it locks.

In practice it's init-time, though. The G12A USB3/PCIe PHY takes the PLL 
with devm_clk_get_enabled() at probe and keeps it on, so it runs only 
once. Nothing else writes the PLL then, but the lock is the HHI 
syscon's, so on RT the other clocks in that block would wait it out. 
Running it without the lock would mean changing how the meson PLL code 
writes its init sequence, which I wouldn't want to take on in a pinctrl 
fix (unless that were preferred).

> So it would be safe for now…
Yes, that's the trade-off with the second option, which relies on the 
DIN never being written in a multi-step sequence. Nothing enforces that 
though.

I'd like to send a v2 after -rc1, but I don't know the best option for 
the fix. Still waiting on Lee, Arnd, and Mark to pitch in if they have a 
preference, or any option I've missed.

Best regards,
Ryan Brue
