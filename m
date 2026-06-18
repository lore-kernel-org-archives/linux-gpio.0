Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37E219DF55;
	Thu, 18 Jun 2026 05:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781761329; cv=none; b=u0jxNw2wSOGUSWGFsEQXk2+IXM0LLx/M+P1b0XnmJ6s/OLb0hUZJ5nEXsMxWPwcXxj5qlGD05fmzG3chVi1pmSqGh5wNCjIz3EQ6MxakBm594+BOBVIwcjJTKQaGvs/2iKdmW8EHKocyU1HQ3qK5OOb2NTQjHLx5AUrSEjj0o3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781761329; c=relaxed/simple;
	bh=5qOb9IWAaRBR5l+Va2I+ttKTJfL+J0FF/ljlGF0C384=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=J0xnGgqp0XHubIRjXgU06jvsZ3YWYCzM8Q7M3dcYfRxjKriEk53w5sr09wyT4343KpUygwECCb6TC+uuEtf0G8HfEPvOnHLnaj2tTXUB0vm0/NNs/3AneNnsiYskGzjFNvoZOd7xpimY2dXoMHJiBk9nxrUc89irXIwHj5LHJLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=ZJU1b9W4; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="ZJU1b9W4"
Received: from PC-202605011814.localdomain (unknown [58.241.16.34])
	by smtp.qiye.163.com (Hmail) with ESMTP id 42dcad3f6;
	Thu, 18 Jun 2026 13:36:53 +0800 (GMT+08:00)
From: Runyu Xiao <runyu.xiao@seu.edu.cn>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
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
Subject: Question: pinctrl-backed GPIO set_config and gpio_chip::can_sleep
Date: Thu, 18 Jun 2026 13:36:50 +0800
Message-Id: <20260618053650.4053352-1-runyu.xiao@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ed93b770303a1kunm888aadba902f5
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSU1DVk1NTxkdHk9JS0hDHVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJT0pVSk1VSE9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpPSE
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZJU1b9W4Jh98QqUhr1aQzw8XNGLQ4YZLglW1cb3o2xMn/gzwQhTHfDJQ7OHctmOMGtnvoF9o0cnjREuuH6PYHzw1f9E5w0EY0vBQ2mKCGWNepb0uGRZyoU13fa5S0ltRw+W51IGzgwKuWGgRY0QrC0I7+f+BcqxaDQ1um9KACK8=; s=default; c=relaxed/relaxed; d=seu.edu.cn; v=1;
	bh=dri7msVJ02+jPQSBZnSYMVmIqcPBpOQbQ5XfzTRxPCY=;
	h=date:mime-version:subject:message-id:from;

Hi,

While auditing pinctrl-backed GPIO chips, our static analysis tool
flagged several controllers that expose gpiochip_generic_config() while
still advertising a non-sleeping gpio_chip.  We then manually reviewed
the findings against the current tree.

The path we are concerned about is:

  gpiod_set_config()
    -> gpio_do_set_config()
       -> gpiochip_generic_config()
       -> pinctrl_gpio_set_config()
       -> pinctrl_get_device_gpio_range()
       -> mutex_lock(&pctldev->mutex)

If gpiod_cansleep() returns false, a GPIO forwarder or another consumer
can choose an atomic carrier and call gpiod_set_config() while holding a
spinlock.  A minimal Lockdep reproducer preserving this carrier reports:

  BUG: sleeping function called from invalid context
  #0: ... (&global_shared_desc.spinlock) ...
  pinctrl_get_device_gpio_range
  gpiochip_generic_config
  [ BUG: Invalid wait context ]

This looks similar to the Meson fix that marked the GPIO controller as
sleeping when GPIO configuration is routed through the pinctrl-backed
generic config path.

The local draft I am considering marks only these controllers as
sleeping:

  pinctrl: at91-pio4: mark the GPIO controller as sleeping
  pinctrl: stm32: mark the GPIO controller as sleeping
  pinctrl: sunxi: mark the GPIO controller as sleeping

The reason is that all three expose gpiochip_generic_config() and can
therefore reach the pinctrl mutex from the GPIO set_config path, while
their current gpio_chip registration does not set can_sleep.

Two other candidates from the same audit, bcm2835 and keembay, are not
part of this draft.  They use gpio_irq_chip::parent_handler, and gpiolib
rejects chained interrupts on a GPIO chip that may sleep.  Setting
can_sleep there would therefore break registration instead of fixing the
contract; those cases need a separate irqchip design review.

Does setting gpio_chip::can_sleep for the at91-pio4, stm32 and sunxi
pinctrl-backed GPIO chips sound like the right fix for this set_config
contract mismatch?  Or would you prefer this to be handled elsewhere in
gpiolib/pinctrl so that set_config sleepability can be represented more
narrowly than the whole gpio_chip?

Thanks,
Runyu
