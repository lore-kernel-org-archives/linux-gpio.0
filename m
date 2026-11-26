Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707426;
	b=TsrailSh0XasVNOot0okHQIdEQfRc2zoCxLJk/d1K0LQC9YIicVPWy/lvx7SHfKNjmcQ
	 Cj59MtpKRx3UH3pWEcBIDprrNSshPk+LqMdHmVhq/LwQjc2BhCGh2gyx9LkLUNxLpps6p
	 C83tVojqx6cREKtmzN5hVQ14uG332D2luDE3qW/puOJuAM0Ka6YCZ539ikAKMyAyRSyH5
	 TcqdNq91m4TXHCQGd6uLt6oXqblgOoCOZSoddCEIy+TSwUZf8eQYB1Rmwre0KKrakmvP4
	 5t5A1IILYbsJhzJh3Stg435iBzEVwojWu8q0YtBIT1LssEiZMgBBfkrHq6aqx2AOwmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707426;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GxX6GErs7QQNQqod0faT6hBpHKAJuPF4BZU8osTn3JQ=;
	b=ipUXRNRDgEx+2D7bLr/k8BwT2napGTVSRUJhcvnZkbGBMdf9GIWa4aAWZNq3BSR7ugzw
	 +VOpCCpSh38OLfYeZGCj0jZHWd0lkN463zn2YdI83/bCz0bSHD5ymNiMRv2NW39JpxYtF
	 RxB8Az1B0wxqmEJm3MGAHGLOqTEFLWKx6SQEguHfQsxvnBcltAf8Jkn/0z1A8ijcJ6+l6
	 X+WRLcxn41sp8z7uaZ8v9g/einStEyz42wYwfIfCZqPYVUwKSDE4WsA4m89b+ysEKO+W7
	 +WTilH1dxuTqaz2K7D8QdkKJNuI/P3pU1iwtxtxNwTothlhkoomalFXfeaGPVgPFjog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5l8uDp4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D3C606A32A
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5l8uDp4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 193791F000D1;
	Thu, 26 Nov 2026 15:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707426;
	bh=GxX6GErs7QQNQqod0faT6hBpHKAJuPF4BZU8osTn3JQ=;
	h=From:To:Cc:Subject:Date;
	b=B5l8uDp4yMH1IV35KDLPpI7URgvTGkwgfwMUbyLQkSOYHlQ2cEgQMGSBQln8+k3pE
	 RAQ8tlHMAqASocL2dgRaZoKQvO/l1dzFOy5V2i+c9dyMgN9sxVyD72/NkCyU6mB4eE
	 shan97s7H6xVowq8RRnlK30rUF/UD0K5PvrDZeI7GTWc1HHQyRHWWzE6nK/bebQntM
	 xuPXx1CxfCEbeJPItwsq6uGutTphaZJLhv1DJnZwwzfBS0gDnEH1BwJ75DM7MSKpN0
	 LHEpKQsTuX1mmR/HzV+OOPOjmzLiOMuNB98saL/enfxdLKPtDc5vxxlls1VqXuLGNQ
	 ThfnilD+gjsGQ==
From: Michael Walle <mwalle@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFT PATCH 00/13] gpio: regmap: IRQ domain cleanups
Date: Thu, 26 Nov 2026 16:35:11 +0100
Message-ID: <20261126153600.299724-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
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

The gpio-regmap provides two different variants to attach an IRQ
domain to the gpio-regmap instance, either via .irq_domain or via
.regmap_irq_chip. The former even has a small window where a
consumer requesting an interrupt leads to a NULL pointer
dereference. This also came up during sashiko reviews [1].

It turns out, that it is impossible to create an external IRQ domain
without a race while the gpio-regmap instance isn't created yet.
That is because it will already use the gpio-regmap provided
callbacks. Thus, with this patch series, gpio-regmap will now
provide a callback for the individual drivers used to create an IRQ
domain when all necessary fields are filled.

To move even further and cover the most common use case of having a
regmap-irq domain, gpio-regmap now provides a helper that can be
used in the .create_irq_domain() callback.

We need Long Zhao's patch [2] not only for ACPI but also for the
regmap-irq handling. If the IRQ domain is removed before the
gpio_chip, gpiochip_remove() would use the already freed domain to
free the remaining interrupts.

All the users of regmap-irq are switched over to this new helper.
Finally, the last patch, removes the old variants.

There is one change in behavior: because all regmap-irq domains use
the gpio_regmap_irq_{reqres,relres}() helpers now, interrupt lines
are now locked and cannot be switched to output. But that shouldn't
be an issue anyway.

This was mostly only compile-time tested. So please test. I'll do a
proper test on the sl28 board tomorrow, but since Long already
asked, I wanted to have this out for comments and testing.

[1] https://lore.kernel.org/r/20261123040142.48880-1-joseph@telaak.dev
[2] https://lore.kernel.org/r/20261118-cv75-gpio-v15-3-e3c563673fe1@ambarella.com

Long Zhao (1):
  gpio: regmap: remove gpiochip before tearing down irqchip

Michael Walle (12):
  gpio: regmap: add a callback to create the IRQ domain
  gpio: rtd1625: create the IRQ domain from the gpio-regmap callback
  gpio: axiado-sgpio: create the IRQ domain from the gpio-regmap
    callback
  gpio: regmap: add a helper to add a regmap-irq chip
  gpio: max7360: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: sl28cpld: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: idio-16: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: pcie-idio-24: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: ws16c48: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: 104-idi-48: create the regmap-irq chip from the gpio-regmap
    callback
  gpio: i8255: create the regmap-irq chip from the gpio-regmap callback
  gpio: regmap: remove irq_domain and the regmap-irq configuration

 drivers/gpio/gpio-104-dio-48e.c  | 31 +++++++++----
 drivers/gpio/gpio-104-idi-48.c   | 38 +++++++++++----
 drivers/gpio/gpio-axiado-sgpio.c | 64 +++++++++++++++-----------
 drivers/gpio/gpio-i8255.c        |  3 +-
 drivers/gpio/gpio-i8255.h        |  8 +++-
 drivers/gpio/gpio-idio-16.c      | 28 +++++++----
 drivers/gpio/gpio-max7360.c      | 62 ++++++++++++++++---------
 drivers/gpio/gpio-pcie-idio-24.c | 36 ++++++++++-----
 drivers/gpio/gpio-regmap.c       | 79 ++++++++++++++++++++++++--------
 drivers/gpio/gpio-rtd1625.c      | 74 +++++++++++++++++-------------
 drivers/gpio/gpio-sl28cpld.c     | 34 +++++++++-----
 drivers/gpio/gpio-ws16c48.c      | 36 ++++++++++-----
 include/linux/gpio/regmap.h      | 34 ++++++++------
 13 files changed, 351 insertions(+), 176 deletions(-)

-- 
2.47.3

