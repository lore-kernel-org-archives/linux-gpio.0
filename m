Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793802604;
	b=DsLsKpEGjIv/nQHwEGMPSpmnTdG6gOz6No08+Lvv3VVsi3j8qbWz00hQCvZ+8B/zLvc7
	 SraPiC73hNQEjvhcDrqHTvU0zOBafG2GQer1wtzq2ds9Am7mjWpIeAzxlCRDpaxRMhp+H
	 zxfPVz3EtZ7BOwJY3NQjpQQmVCgKGyRjxStf3m8cWF29b15gHq6eiTAJtLXkYvWpIIrp0
	 L48PQLL89k92Ihibh9UXeCc2oSgiqu0Z2nFliW0HwiccMIIw/eQ/eTeFarZZI9RXN4Z2+
	 sl920gA72q2A8wVFBrcWv26cw8kk+qhl0XO8Nsm6NLP0jmypxX1skM72w38Vt1LaGGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793802604;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=5v62ksGx5GHpG318HAnyj25tdwQuxFeAGyjbxM1E2Zc=;
	b=YISKjp+S3cxpiLIFV7sIrm8okVwpc4+8X6S7MGYMNJHCoay0chl9b6hF8M766TADN7Ih
	 FYKjN9+Lkg98BEwjRiNmLazghUz8hUUmgALTDzA8uAP33P4UScFTf3MCaDL3kUTBTryWv
	 DHXZZaIo5kk+Tgrj/ymgmKFJ7XMLWnM9xFrfMue1I/RuuY9AMwOJDGvP+sKfOrF7kI5Gq
	 XnVG/jJSnOfQ/Qb19kmURotvhk/jrEYtuDsvxCYunk0SYb7ODc5+f7mZwbMI0cgtidepB
	 LQQdFUr820N5bA0JbUKrLZA4W+Dzj8Ki1mg0F+AWt0xiRWIBwQgGoPHgwhCwftzgN+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOWNIIUK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id DAB8B606A329;
	Wed,  4 Nov 2026 14:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eOWNIIUK
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id AC4D11F000C1;
	Wed,  4 Nov 2026 14:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793802603;
	bh=5v62ksGx5GHpG318HAnyj25tdwQuxFeAGyjbxM1E2Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eOWNIIUKPY8fkmGOQ2WD9uIfSdD/W5gsPDRNnNG5hZI+JkgrMwz9snZC6EpLxGNct
	 4N41V42BfcHl/IGr4A2FKopxRr7/CnJtZm4fysgt5OVlqHyn2JL+RHxXSy9ZKWQcUH
	 X3Qmh76e23KwV6VqISC2C1JvkgzDMrU3aGPVfapsyKVEP2IK0+QUFpMYm+2yS5eS7q
	 lxv8FlvIFHQ3reQ4L8oOboy7Br08TUK2sgwEoeYL7UBevzEJx+SUMoqg/JUopK/GWG
	 pVw10OMMjkGdM1DAonP3uuoTx95K29V2r6EyBUDcSqRCsoAxAoKs8smDHwyf1eGT7v
	 Y/EW0MjJ9eLbw==
Date: Wed, 4 Nov 2026 15:29:59 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Samuel Moelius <sam.moelius@trailofbits.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bamvor Jian Zhang <bamv2005@gmail.com>, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH v1 0/3] gpio: Introduce helper to dispose IRQ mappings
Message-ID: <p4w7cg56cfid7i6nokc6ftpjl4bcb5ncgk7w4553egjxubnmvz@ehewj5eprezv>
References: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261021204654.1001101-1-andriy.shevchenko@linux.intel.com>

On Wed, Oct 21, 2026 at 10:44:42PM +0200, Andy Shevchenko wrote:
> I have noticed that a few drivers use almost the same code to dispose IRQ
> mappings. This series to deduplicate the efforts. I only converted a couple
> of the users (there are potentially more) in order to stay in the same
> subsystem.
> 
> Andy Shevchenko (3):
>   gpiolib: Introduce devm_gpiochip_dispose_irq_mappings()
>   gpio: mockup: Replace custom devm_gpiochip_dispose_irq_mappings()
>   gpio: sim: Replace custom devm_gpiochip_dispose_irq_mappings()
> 
>  drivers/gpio/gpio-mockup.c    | 15 +--------------
>  drivers/gpio/gpio-sim.c       | 17 ++++-------------
>  drivers/gpio/gpiolib-devres.c | 33 +++++++++++++++++++++++++++++++++
>  include/linux/gpio/driver.h   |  4 ++++
>  4 files changed, 42 insertions(+), 27 deletions(-)
> 
> -- 
> 2.50.1
>

Linus' responses reminded me about this series and I realized I don't
really like the fact you hide the call to devm_add_action_or_reset()
behind the new interface. I'd prefer to keep devm_add_action_or_reset()
and add gpiochip_dispose_irq_mappings() that can be independently
scheduled by each user.

Seeing a devm_something() makes me think, it allocates something that
will be released at unbind(), which isn't really the case here, we
really do schedule an "action". I'd prefer it be explicit.

Bart
