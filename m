Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AEE18CC13;
	Fri, 10 Jul 2026 10:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783679297; cv=none; b=Ihej2kwColV1u9SyNLpBGnAWcnUZqjMg4cCdW74JoBZKT0xIYX9jalqXUq3PjtrXPYXFhfoIYCn+aenSdUGd9GLaAS9us43XfeZqB97zHiTyMGWD+WsfxIKNcQ/Tyemah1Mjk43rblxtkyHaLrOKqJcQCpdkY4d+WrQrYD7BfG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783679297; c=relaxed/simple;
	bh=WEYyzP3BKnY+B51R4z0JfgChQz0KAGXJFEt+nf+VAdM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=opg2u5rQjIyGiwtPDxNjrqmodBlcALBwmCiA5fruo+TdmPrrNTlYzWCBUmWKox5dP5XeH+CJuU6AaLTZj7Y/stFLgreW40LJCk7ZKXiEdh9sdRYMMKAOfcLKn8gwLqoiDuVnLuoQJE/BZHQXcNAfRKLiiJjL/EIyxsXZYrCWotg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E59VEGjD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E59VEGjD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD9C41F000E9;
	Fri, 10 Jul 2026 10:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783679295;
	bh=BdmbeR+nXP2QOTmJSL448JaWOhpFdJafXIzincBL+Qk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=E59VEGjD2WXB4bUGmJBQC7A1D/xBU5RjYM4hv1oGNHf73wKSUSUgQhTy1N4nDaoBX
	 BddUzBpETIjpA6lNNhR1qJN1AEWf2QBTyl4kyFEFrT9EO3NW7H+0TM2dTgp93U13nO
	 DNkMYFMJPkLBG1ezmd+ZFJ38c8HW/ylby25KSP9sMsmyc55zW8REh5t09dmnX3nDYU
	 2Giy5jGDIYrcBOCVI60C8CwuEttGo5D3aYIQiDgezd2qe9AygAwPJILlBaCVklIz90
	 23DTG35DsRTwPBotQQv5ENuLuq5JAN5jfOpdcdWGos9UMrdQIEcVm1w3D5y+nAEf1m
	 /CD0IiuhXfvEw==
Date: Fri, 10 Jul 2026 12:28:11 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: soc: fsl: qe: Convert QE GPIO to
 DT schema
Message-ID: <20260710-portable-thoughtful-uakari-4db7be@quoll>
References: <20260708-qe-pic-gpios-v2-0-1972044cfbd1@bootlin.com>
 <20260708-qe-pic-gpios-v2-3-1972044cfbd1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260708-qe-pic-gpios-v2-3-1972044cfbd1@bootlin.com>

On Wed, Jul 08, 2026 at 12:15:16PM +0200, Paul Louvel wrote:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> Convert QE GPIO devicetree binding to DT schema. The old binding uses
> fsl,<chip>-qe-pario-bank because multiple MCP83XX SoC has support for
> these GPIO banks. The best practice is to list out every <chip> instead.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../bindings/gpio/fsl,mpc8323-qe-pario-bank.yaml   | 45 ++++++++++++++++++++++
>  .../bindings/soc/fsl/cpm_qe/qe/par_io.txt          | 26 +------------
>  2 files changed, 46 insertions(+), 25 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

