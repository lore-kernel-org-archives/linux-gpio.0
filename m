Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448912;
	b=gS7RY/sifqK1rgyfcUx2CMuZxy+iv9yiuQvnFK9XEpXM4RQ3LOdRIiGoP9qqZZ4LrErx
	 oluXuRXeCJ/wydlVKHXnMuyezCO3ayhHkXj5JTRPQSxNG+tZikbbgm3RAg2Y3p5yM4Zih
	 ItK/03EWbJC/F3chwNzHVsd3ZmnaJ2v1YFb+qyz/SUvUVmLB6YnGLqJAv3FWPcVp9kxAK
	 Q5oP7rLxRB1xY5d3cmp2hlq/yAnl2lTIPla76mgCBCCP91ElBxlD3lNI06UPFX351U1IO
	 daRe/b1GdWqFn1VbvXo22mAw9pmzgTliSxrZYUpsRCaOEuVmcTWOyVRcOfFOfJEFyVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448912;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=91s2Sk/rHW1cRFWOhkojVeGnUiCIGvA4DnJ9n3PSg0w=;
	b=hOvlJlDsRTsNZ44c6JZDxjcHwnHYwTR5Y7/o7TrdMVXeHpjDPYm/ceL5vsT1Mgb8hSsn
	 KLHlX+e3Tq0RVoCGKYxG7I93DxkC4jlBtn37oKvt0jb0BUwMtO7vJUPFgPopMygNWQs35
	 INvIQHh37wLExrA4vvTEacfs4zQo3mHqtgp+axMt+TkdFVJBEfPmVnLsDhjSnGhIyxQfW
	 W8h1LBQpDg5czkGeE3RhsvNruHCG6Ivck9atipNWIDniyINCAVgTfl6vnHpsfLc0s4wQ9
	 lEJKOdhEqd+pM3fhdx+9/bHRGYLDiM0XEtsCrf/seelqj7leZa7f9iRpjMYsCR5De4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4MIkuds;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 3453B606A32A;
	Mon, 23 Nov 2026 15:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C4MIkuds
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 302521F000EE;
	Mon, 23 Nov 2026 15:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448912;
	bh=91s2Sk/rHW1cRFWOhkojVeGnUiCIGvA4DnJ9n3PSg0w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C4MIkudsqIabJSbvK/S13/P6d2M1UJlhEq/xUDGdfbShynsONS4DxHYoC4GuORjT3
	 9ZrI4W6D6gnCtDZhoHbOnYh5Wbv7xsyTvzeVn7XtGSPXtxNdd7DKNyUm43MvlItlW7
	 VdRMDN0buNvBbGFk/Kcbme/gULz1HriWiFGG3GUBee83C9ZK0+OuXpw75anqXBkoFC
	 eI8jadzATWGdQuUMvZ+ktlyt7jYVxPeMlczO8Eh4p76E/YC/uN+DMAmOdXdPt3PBZy
	 U/yk53fg1B65Jd9B5MhvaUo5fIN64zsbt6xvj9qPdzBrbixrxgWKW9Bzq7I6s1t1ry
	 gNiMiBngcPSLQ==
Date: Mon, 23 Nov 2026 16:48:28 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: longzhao@ambarella.com
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Conor Dooley <conor+dt@kernel.org>, Mika Westerberg <westeri@kernel.org>, devicetree@vger.kernel.org, 
	Long Zhao <zl020895@163.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v14 01/14] dt-bindings: gpio: pl061: add Ambarella CV75
 variant
Message-ID: <rvkdwpnypgxx3smfkqllik6vidzln3yg6nvshed3dtg7rtkq3j@u4pdrleymwrm>
References: <20261110-cv75-gpio-v14-0-e586aad0467a@ambarella.com>
 <20261110-cv75-gpio-v14-1-e586aad0467a@ambarella.com>
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
In-Reply-To: <20261110-cv75-gpio-v14-1-e586aad0467a@ambarella.com>

On Tue, Nov 10, 2026 at 12:32:26PM +0800, Long Zhao via B4 Relay wrote:
> From: Long Zhao <longzhao@ambarella.com>
> 
> The CV75 GPIO is a modified PL061. The basic registers have the same
> names and roles (DAT/DIR/IS/IBE/IEV/IE/MIS/IC). Each bank is 32-bit
> and 32 lines and adds MASK and ENABLE, so it is not
> register-compatible with the ARM PL061 and arm,pl061 must not be
> used as a fallback.
> 
> The AMBA core matches the PL061 driver by PrimeCell ID, not by the DT
> compatible string. These blocks do not implement the standard PL061 ID
> (0x00041061) in the ID registers, so arm,primecell-periphid is required
> and is fixed to 0x000e8061; the driver uses that ID to select the
> Ambarella layout. gpio-ranges is required because each bank is a slice
> of the SoC pinctrl pin space.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---

Hi! Can you address sashiko's comment about the missing vendor prefix?

Thanks,
Bartosz
