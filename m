Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A8F346AE3;
	Wed,  5 Aug 2026 21:30:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965446; cv=none; b=Ziw9pcELhhitHcpnBpak6dhydHsoPN091orLNfBwmJhwktfV3y7NzXTisoKhN3sUL63wXXClpbBHJ2b4Dow2n/5gOO6+tWoKKr4eiO64CubjNRl2xWa/e8N/HFhfq+qvG641AQUUAP/EOL04whvuAMmbOl1RCwAH2V8pA+WN1Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965446; c=relaxed/simple;
	bh=kd2h5IAXkNCOCJmIxmUIYLuCu91/W6q4X78upx0iz8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nNVYbFuuxihGauCMun6RMyF2FQf88yh3xUkSaWt+Xg3e9LoIFHue8nYhh3mRCvkf8bVqYeXvoaoPt6lYGGGcKA4i7QW3Ltsp8DV53mY9+HaBa9zKxYkWOz82sMFc3o9mBSvHgdF0+Fs8BBOG6ChDuBwBEABIJfrVtoZgwFxeYpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTL/64jW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTL/64jW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF331F000E9;
	Wed,  5 Aug 2026 21:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965445;
	bh=LIYuNqqsy52nkDWooad99ullowWQhLlloisZtkNeyTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aTL/64jWXqVC9Ac1SMFh4jfckzTR62V1iCawCgDK+dLarq8M3tAYYbnnwFHmWWK2w
	 0x/pVfefFZno1c6pia3Azkai5l7cighEPkHTpYjiQ2Wrk4p2sz+7OPu3d05I7dipCd
	 lYag+pZ9qy3NXRKgr4rMSet2KGOLqnALBtdYRnteJT3KjF1afsHuc2agc65ZlT39n5
	 WBRD0PZfDgTuc9ddxUailQPeSjOQROfDlXjfRimlQRq0awAkKUKduQ4r9Nmxv8Fm4H
	 Ye/GJos3gHvoAtKk3uR2hVOyRvteooIqbA+92CrTbMPMLOrCaIORbKiew0hM7t/A3q
	 L0bWI1dJLo+RA==
Date: Wed, 5 Aug 2026 16:30:44 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 05/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
Message-ID: <20260805213044.GA1808833-robh@kernel.org>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-6-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801072711.153217-6-changhuang.liang@starfivetech.com>

On Sat, Aug 01, 2026 at 12:26:55AM -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 176 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> new file mode 100644
> index 000000000000..80acc64834df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> @@ -0,0 +1,162 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 System-0 Host Pin Controller
> +
> +description: |
> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.

These all look about the same other than 'function' values. I don't 
think it's worth splitting just for that. I just put all the function 
values in and just document which ones go with which compatible. 

If there are more differences I missed, then perhaps the split makes 
sense. Maybe it's 2 or 3 different ones?

Rob
