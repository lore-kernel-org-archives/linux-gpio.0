Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10FA51EDE7;
	Fri, 18 Sep 2026 18:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756830; cv=none; b=LBoE4FHJfuSHEVf+CpdGSh6v1BSlp71QEi9SLjWI9Qr3CfnPdGqHSa6CNIodIEu8DAkwWZaD4MYprrJfYJda6Hy2e8AeywwDaI1QAhHfYwjV0gKIA6/bvs8r0er1vICAraMaO6zmvf6IDXHE23Uvia1z25OfMHuqkMilXsF+BAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756830; c=relaxed/simple;
	bh=Zmg4oVHPgx7maldqzIAQsqpTNKmvF63bhKDnnginVGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ps9RoaBwN4TXIdcLUP+ZVuRJpb3LYy5s2drmqWJJEG3dhVImuFqyG4uPck3/ckgpcRVvhiLp813gjsAtR+eWjTfrSq6Z44mYcGhM8YbP2rY7+oKNjAguaJ5Fp9yjrcPZiM41SKd+bp+i6i5CpW1+7Mv9AUUbZcgZL+Mx94m2pD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvTdh+Wy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvTdh+Wy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D47311F000FF;
	Fri, 18 Sep 2026 18:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756824;
	bh=K4DKiNWT0z7bDF3x68aCW4RDAzgVquq2Z4NJk4qtB1U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RvTdh+WyjvcNSenF6Q5iW2+3UCDVfah7CovDAXfjC9ZqUgG1bajXwuHRfzLvwjUFd
	 ho0oulhMIx8ufdmsrYluvNahDyE/PEXOt35v1NlZ+PpbXFLDxs5iePiJjng9iwJVY2
	 8QJ2Cahd8z2KTYDb9thogDXKuByxQnrenKF/qtKkfxG+e3ZnjNfQDzTayBiKXm8K7t
	 6cYRCRKslNUgX3fV778QGMcZB2gohAR3csG+gDWzecoGDiQGpPy4abNV2AFaWUr2cH
	 W6LZWtmRVFO3lCztr/YPtfQ4dKoo5uNYMXIV6w2wjFJ8UWlkxDuJVgRKlVF/LHjRO0
	 B4RbGpuWWkdwA==
Date: Fri, 18 Sep 2026 13:40:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <pjw@kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v8 17/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per2pok-pinctrl
Message-ID: <178975682173.1350245.6591381351545703552.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-18-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-18-changhuang.liang@starfivetech.com>


On Thu, 10 Sep 2026 03:03:52 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
> (per2pok) pinctrl controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-per2pok-pinctrl.yaml      | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

