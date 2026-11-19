Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095750;
	b=bRYWKPW8lxwSRypE8L4q5aKxqfjQft32OxuzLrdQtMaEExT1XoCDWpGmFsTmnVY5yaRo
	 ai75XMUnK9oL2kyPtRu09xFVkhNEFyTyNnb63OLRfOPnxvZrx4pCb5StWpGR87oEZN2eJ
	 gJiMGhD/JDid+tEMy3+LgpnjQY3rkOv68k3uGBoj1Zs2txZFJxNaqVKoskKHPiwpovG/9
	 ynIZt7g/9TECFrUREiUrXxBP3X6O9lsDHWxFRC4BKe908Qs5q1crWLVdcvn+8lT88m1lU
	 DIHKfuNqRRCGxuXUBGUSEvKuqzfuzpu9MkSRpzMly3X5dWrWPsxife3YBZAuVYvuTiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095750;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=JNRjmvatIytyZx5eeAPe6e2dTWDCPb6wN/GsQvJbRCo=;
	b=1TpyMOhW3o52Jrq+MefbfqfZuibgySEHp7l+McT2sbWYhgJfKJez6Qo6XRGgIYN5NeWd
	 iDSM6GxPomFaVH7MpJd98+ErlU7xnedw9ip6nIM4i/SG9aZtWWsGNCdTjBlSH8IsoEosp
	 KVp4VcAg7rPT1PaBgJy0eOWCfqE2/xDZGkZIgKbyXSfcvrtx/gu9at0TdVww9ib97z2+n
	 ivkOK4G4a2SVV8kK1J3Fd7ZbYS1fTqVscF7qEifjvpBqK0INBD9kI+Y4JoPsmGoVOuotZ
	 MvW5uvdC317nIVia1E8rtFpS1w3pikC4uIESaxrYYmaYhtzqSVLFQLKSX42QBj6sdTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TR4vM2Ah;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 9170E60A2629;
	Thu, 19 Nov 2026 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TR4vM2Ah
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id A98571F000C7;
	Thu, 19 Nov 2026 13:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795095750;
	bh=JNRjmvatIytyZx5eeAPe6e2dTWDCPb6wN/GsQvJbRCo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TR4vM2Ah76bWIM3RBsjqn6+l6nJ7Ld5yGU+drZxatLmMholRuWQziHoyZ6fxCWyE9
	 vlg/EPUDAJAml67YcUzBYVOl93STL5Fu6LCOFhlY7AoR64egmswELnMN+vjWAnR/ng
	 QmieGIvNnmWPxaseOz7hJZCMAfJrGUC4ONBHR6obi5HHlR9dYMTF5VqZyJqWS5UWyC
	 vzgROzm2IJ4eDxxXUbd2bAnlGGDE/J9q7RsfALpBhm55MxHUrVihvGO3/C//uHnnjj
	 lc3kFsmVNwRJzVo3fnv8Zwi+Z76CH0khgBAt7on4xLO8tSNTBib+N3mFpX4LEWy3Vr
	 pG0GSSum9qCLw==
Date: Thu, 19 Nov 2026 14:42:27 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Fil Dunsky <filipp.dunsky@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] gpio: Add Cortina Systems CS75xx GPIO driver
Message-ID: <p3qjb3oncivinobxa5wvwwkql3xmjfujdwmxigyxczk5ya23ua@xayhbwbn35af>
References: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>
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
In-Reply-To: <20261119-cs75xx-gpio-v5-0-8d14f2bb614b@gmail.com>

On Thu, Nov 19, 2026 at 02:02:48PM +0300, Fil Dunsky wrote:
> The Cortina Systems CS75xx ("Goldengate G2") SoCs have five banks of 32
> GPIO lines, each bank with its own interrupt. This series adds the
> binding and a driver based on gpio-mmio; level and edge triggers are
> supported, both edges are emulated by flipping the polarity.
> 
> Each pin is either a GPIO line or belongs to a peripheral (NAND,
> Ethernet, UART, I2C, ...). That choice is made in the global control
> block, which is not part of the GPIO controller: as discussed on v1 [1],
> the driver does not touch the pin mux and leaves it as the boot loader
> set it up, until there is a pin controller driver for that block.
> Testing the reset button on the Securifi Almond+ requires selecting
> GPIO37 in the global pin mux before gpio-keys is probed; the current
> boot path does not provide that setup. The tests used a separate,
> board-specific setup step. The GPIO driver does not program the mux.
> 
> The driver used to be part of a series with the interrupt controller,
> I2C and watchdog drivers and the device tree changes. That series is now
> split per subsystem. The driver can be built with COMPILE_TEST without
> the platform series [2], which is under review separately. The other
> Kconfig option, ARCH_CORTINA_ACCESS, is defined by that series in
> arch/arm/mach-goldengate/Kconfig; it is not in mainline yet. There is no
> code dependency on the platform series. The device tree nodes will
> follow with the other CS75xx dts changes once the platform is merged.
> 
> There is no public documentation; the register layout comes from the GPL
> vendor kernels. Tested on a Securifi Almond+ (CS7542): the reset button
> (GPIO 37) works as an active-low gpio-keys input, and the SX8650
> touchscreen uses a level-triggered GPIO interrupt.
> 
> [1] https://lore.kernel.org/all/20261012-dreamlike-hazily-19bb60326f0a@spud/
> [2] https://lore.kernel.org/all/20261114-b4-cs75xx-v7-0-8f17f38821b4@gmail.com/
> 

The driver looks good but I cannot pick it up while it references a
Kconfig symbol that's not upstream.

Bart
