Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A339A06D;
	Tue, 31 Mar 2026 13:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962929; cv=none; b=srjV8E0AWxxuyxHROInaO7uFc8QlSj2TDRGK9eZ1qAE/axRrjgV7awZQh7n4bz1Ut5+QoAtLvVBFUEYKl+fzBckAtyxwhJdJdn90qKcIUPj3KbAEhd6+5NU6vH2J1Omf2uOojfoj8eUjsQYvnR4NKOQs4P+6o8bbWs0AkEiFUds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962929; c=relaxed/simple;
	bh=N9U9Gngl2zsYLg9hbnhmxsUnpHqzZ9ArTNxcIheBEMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tgEXH6GLfG2Bkbd51l1jRWQKnmhuw/rT0oB0YfhUwsKAcCMV3IwJmXuZ6s1WFu8Opm/iJ6qL98ThlFgfKfdOlA/6l54eJ1qd2o0bR9BTBlqym1XHUM/y2Ki2M8lLgEmYkpeSW83cUcYfv4iAgcILSDzNUjCw1b4C6AGUI7LUp28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d0/Mp2KD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d0/Mp2KD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CF33C19423;
	Tue, 31 Mar 2026 13:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774962929;
	bh=N9U9Gngl2zsYLg9hbnhmxsUnpHqzZ9ArTNxcIheBEMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d0/Mp2KD1+SHhoVMmrPN7U0nPS3F0FXhLKOS51MQIBpNEs56cUwq+TeQEtmlygyQ+
	 DJ3zr2CpPvwUmg0UCIqwuG+HfsTk4+GzxclYkcPVpZMJc5bexA/1AU2MzFoayWqrD3
	 qCzf8WTfD7Ruzgwp6x3AZcfTOkMI5Y116/bZK6KmdDK5rcLz4vDACGjymqnw8yIhlP
	 feN1Qot7CeMRe0BcM+wTI6QPuBQ1XYjvEvNnuQO/ZAC/t3sGoiwXCYJn7URmQR8OUK
	 71OMK1JEAzkD+pACUks2m+NvWKTsL0xiL3NzTSqBrkH9uajFshQKTIFLvymSDsBrvU
	 lN3vEKEBLDHog==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org,
	Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>
Subject: Re: (subset) [PATCH v13 0/5] PolarFire SoC GPIO interrupt support
Date: Tue, 31 Mar 2026 14:14:45 +0100
Message-ID: <20260331-dominion-conjoined-c87ec5bc7db2@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260318-gift-nearest-fd3ef3e4819b@spud>
References: <20260318-gift-nearest-fd3ef3e4819b@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=784; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=La/xA4DusqX4r/5LF/aVUUmPtgQGBCIF7OcFbPPMG+Q=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJmnTxw5+OC3SizjVmlzhoLCtucfPfkFH//arGZYeIo31 mbLsUCvjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk+hmG/8m2+VuqLtxNOVF3 UFnw4EzGrYZGZpktV6frTLty/eLaqTcY/gedUD/iOK21dPvmzM962q0Cb4O0wqbtlen4GJW8oen hHkYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit

From: Conor Dooley <conor.dooley@microchip.com>

On Wed, 18 Mar 2026 11:04:31 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> Yo,
> 
> Here's a v3 with an extra patch updating the gpio binding from fished
> out from my old branch, fixing the examples and setting the permitted
> values of gpios for the controllers on polarfire soc and the existing
> binding patch's example fixed.
> 
> [...]

Gonna interpret the ack and lack of response to me asking if the gpio
change was mine to take as it being the case.
Applied to riscv-soc-for-next, thanks!

[2/5] gpio: mpfs: Add interrupt support
      https://git.kernel.org/conor/c/e57b53f0f36a
[3/5] dt-bindings: soc: microchip: document PolarFire SoC's gpio interrupt mux
      https://git.kernel.org/conor/c/5f3575cc73dc
[4/5] soc: microchip: add mpfs gpio interrupt mux driver
      https://git.kernel.org/conor/c/bd34cdd6d214

Thanks,
Conor.
