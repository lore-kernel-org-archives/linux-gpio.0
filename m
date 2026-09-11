Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA1D3B5820;
	Fri, 11 Sep 2026 05:23:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789104186; cv=none; b=A+Id5NMOI57Va2ewVJBJ/82cES9Z6hUMFV7g8j53L4izRxAeDGK5RwAfCUeIJjU56MM3NU5fYubEIjbDKrwK0oJpsLgfbGVEsQWkgHSBlEpVHu6DgojXP8jCLvwMjZf20JiIqpbUGs0+wZ6w+yK5s5/m7GGwrnoX1w7P45UFHXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789104186; c=relaxed/simple;
	bh=B/hPOaqWE6XFb9+eRznUGhtJSXrKImN3f0fMPB90IR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rLZaop6TexcEYp7xKXujFaM+uBa1xeL+KIavkjjp46lex4tJ2nz1qgmr16+y/PSEMS/5xE70jaUQV6Xl//k46vWvNFhSg4M1UW8jVpntm3Czy3soddba+/GOhzpyKtJJGpTPPXGEKw1ndRqi07NlA4kPoJIAteQF0EzLnjsq+SU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNd0ZE8e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNd0ZE8e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ED521F000FF;
	Fri, 11 Sep 2026 05:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789104185;
	bh=GwWyMMxaCtNDet1+YlRZ1iSBj+9uB0p8x9XQ2zZ2thg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BNd0ZE8eJp4NPkAUIq71VAEFFIa2WTMItObvLW5wdNsE7OMuzx6lMjdGo+0qqylX0
	 V6doJOg0wBEMYaA5iurgy5OniZTbR4VOJgZ2za6XnN+TXgIEONoIwrOIbnqQ296zZU
	 p0iiIRmcYUzBl1oqALWh72uiGsHyUfL8rYD3GY1TJBGnR1gCzXI5ZFQ0EhPvIUFBXk
	 3mjxtzeuIjkEsKd3Gzzl7nbAdA8suJ03JPKA2NfbloRPUiMlc8L/yeUcfY30ojhQpZ
	 nZ47D5eA8QAhP5QJC4yp9csofJr6TRNr3GPsmpjGtx67t03cGYbH6dXfY/rCNjpdLf
	 PxZkUWrrSg9Zw==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Qiang Zhao <qiang.zhao@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Christophe Leroy <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Date: Fri, 11 Sep 2026 07:22:49 +0200
Message-ID: <178910416257.316287.11748008875206660253.b4-ty@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908-usb-fhci-drop-gpio-nonexclusive-v1-1-8e405dc67874@oss.qualcomm.com>
References: <20260908-usb-fhci-drop-gpio-nonexclusive-v1-1-8e405dc67874@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=668; i=chleroy@kernel.org; h=from:subject:message-id; bh=JgI8yiblDDqh0RKocIkn7ftaSlBN5bEMR22YME0ulgM=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQtnqBzKnB/8sb9qptWf3i9IP/AzOeC8k+/Mk9YfN0yo mLxkifxvR2lLAxiXAyyYoosx/9z75rR9SU1f+oufZg5rEwgQxi4OAVgImJ2DH84c4O3JK1QYJ19 VPamddAKU8dTn/adb725Yn3iti/azy9JMDK0uTokr1SaP+OwQcMOdpmVfJdTVzC2Tq+72LBlftx VuTXcAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit


On Tue, 08 Sep 2026 11:27:46 +0200, Bartosz Golaszewski wrote:
> The GPIOD_FLAGS_BIT_NONEXCLUSIVE flag for gpiod_get() is deprecated. For
> actually shared GPIOs, it should be replaced by using the functionality
> provided by gpio-shared-proxy. The Freescale QUICC Engine GPIO driver
> uses it as a workaround to access the GPIO descriptor already requested
> by the caller of qe_pin_request() in order to access the private GPIO
> chip data.
> 
> [...]

Applied, thanks!

[1/1] soc: fsl: qe: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
      commit: 31d42d67c6eb66efc058069f426d69abb48ec0dd

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>
