Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAF73FA5D9;
	Thu, 18 Jun 2026 15:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781795771; cv=none; b=KpicLOnFkQpWFuOVztk86FAuK/nEMW4rwlyPkvjs0aPGJL/J7s0wbVINfcFoZ6B7XyHlqm2sblAiEpcXM3iOP3LZPl5Q43u4zIpKBYwJzoUCd8QDZGsYoqD/RqHkZ7MKap980x6+FZDelhJv5ifIHY3W+WNIvWxcCatoNtT5V+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781795771; c=relaxed/simple;
	bh=+5jnX0e96vlTAOolv1k6A4ej1vfGLDGCkDqkFslWsJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Frw/z3mWD80rjzlNL+kW8as4NSBkOe5ZJIo6gAETEBunnaq+kPaH6vrB9MHxkhKIvmitysZHSpX1hMOCXwnIztuSx7ZxbCT7wNtiAM5tYF5AvMNZRCPXjDg/pHNXBJsJKOGm0Ltk5DwBg/P8vfcXf03lWVMk407Q0Yzz5tUNou0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=gzs6lqpw; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="gzs6lqpw"
Received: from PC-202605011814.localdomain (unknown [222.191.246.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42eee9502;
	Thu, 18 Jun 2026 23:10:55 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	runyu.xiao@seu.edu.cn
Subject: Re: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
Date: Thu, 18 Jun 2026 23:10:52 +0800
Message-Id: <20260618151052.3984665-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
References: <CAD++jLmW3vgTFryRAL24x2TbgbR1tbhjw-nFFH3askoZfSibaQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9edb49020703a1kunm36f35ee6a7202
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCTB5LVkhMQhodGElMGUJISFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkJKVUlPTVVJT0lZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pPSExVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=gzs6lqpw8qXjSYqQdjgrqy4UbJUPryJIoyVGglA1ZVZcfxCG/eIUVOAVIzPb5PEX59uS0mPyTnv6o/4XjgTHf/Unef3VNBtVqrOhfLKbT1oN8HKDRFW0BZYcDIX/q4WC4FXp8ft1FKnO30JP/iIeQmbls/QGPs2rAlGcLiH3oi8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=ysY+8CHLH/16Skn1tWHViitmkNPIIbvlsVj2rL0JMwU=;
	h=date:mime-version:subject:message-id:from;

Hi,

Thanks for checking this.

I agree that marking these memory-mapped controllers as can_sleep is too
broad if the only sleepable part is the pinctrl range lookup.  That would
make consumers treat otherwise MMIO-backed get/set paths as sleepable,
which is not the contract I want to change.

I will hold back the at91-pio4/stm32/sunxi can_sleep series and look at
the pinctrl core direction instead, specifically whether
pinctrldev_list_mutex can be replaced by a non-sleeping lock for
pinctrl_get_device_gpio_range().  That should also line up with the GPIO
direction callback case discussed in the other thread.

Thanks,
Runyu
