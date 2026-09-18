Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8290F51E44E;
	Fri, 18 Sep 2026 18:39:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756788; cv=none; b=kQN0jM603MH8B8Pp1S/KhJfu043NXb4t4NHL5OHsJQcmQJmq45Cx6nYGiJV8btHLdKDfoxwDOmkIeOiPVqOhXY1bvIIlWaVMWr80Bv0lT8d3GUyLy6IHwKgGU58Q1mOCuwtNC7hHpOb3XHWFtBnzOsCbUHwRWnNv60GOWN+9EG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756788; c=relaxed/simple;
	bh=fcA8bLX1QhDqNoSqZv0KvLN26qQxuiIUTVpAqJ7CPBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A4ScL8pMd3+mlSvhg2oRhJf7Lv3t1acHWzDTXTlus96gW2jJSncOQVoNra5+y27F7igKv/3vUM0SraxK6RLVlnTWn2PdkrJOip9Bt5gyvfvX7Iej5O0/cD9V1Co7SiTXlTRMJZAiHa+r2CZXrO6O2w75VJp9eRCftbV+sJoR1CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=my/kK6vi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="my/kK6vi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50AAA1F000FF;
	Fri, 18 Sep 2026 18:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756782;
	bh=qLvchs8DOtkt8/DKDyJuDenRq4BhZmyfJc9ZGNBj7mE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=my/kK6viCZdN9+2Qs8q2g66eL3pgSjRZhcq9W1g9KRRY2s4oMQ4WJRXmqIRbHq877
	 RALsG4QI+nZyMV2FYveiruUBGCCeALSl1e6KB4PbDVioEgO+iHOyf8MuCUi8Wp8/oZ
	 hnGo2IG13LyCek8TOTKuc1udPVdsbbq2KZeebiyGOS3pYPQLLkaj6wDw8My5vovYy9
	 48To0onJV5nWBwi/RFX2iaKKp+vS2tLLaKDo2Bz+0cOYr+3HuebxcNqO5RY6aRUT4C
	 6/gCwfKWbiwg9L8ATkRVHYKWptdZYY9oxw8ZCfhC2ccfMRBrf6gw2DazHzvCIJ1jC1
	 7STEp1y9GH/qQ==
Date: Fri, 18 Sep 2026 13:39:41 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v8 07/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys1-pinctrl
Message-ID: <178975662079.1338404.9092715281242899916.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-8-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-8-changhuang.liang@starfivetech.com>


On Thu, 10 Sep 2026 03:03:42 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-1(sys1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys1-pinctrl.yaml | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys1-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

