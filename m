Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED4149158D;
	Fri, 18 Sep 2026 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758160; cv=none; b=L8uB1k11+Axb5vmXKmB7R34lmHZ7+eaziPfxOoVwXUpWkD4GpzDYnIrusJEezUYPAa7FzZCDOzRy1pZj7N5bUGRVItr0t+JR8huQYvOge6y/dKRtEjQmu8G92qEf4iG/r6E++KvsxzZFmlbFbObJCjCKSzbO0+qzup1k6G/W8qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758160; c=relaxed/simple;
	bh=KYC9hb/dOl6TnB/tT0d8zVwJgFKC4TTWux6/0uPShMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZTDiuLjb7YTtq+8QsyGpXBGSra45yXpI2G1NfBq4JNv7Qhpur7uo6/qwWwpjStnDD8gSUxG/cpfr6TQ976bctnAF6GzgHn73W+jElTK2TJO6H/r/nztj+XuYwk5j5Nf5zGpCzGTyESLiM0x7oM45YtSkL3Z+6hY3myQ/KdgsUl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cxcW86lS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cxcW86lS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FAB21F000FF;
	Fri, 18 Sep 2026 19:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758152;
	bh=DOEvh1ULfZUyvbXtw8svpyW+rKR5aBJAMnEeOyZ3r/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cxcW86lSs8Ef2aWhukeCN4JfW0Hv264u0jeA13gZUd8o0yI1tLbvcJDo7g8OcaE17
	 w2eDF2xRTg4wMXp3VtW8iAUu5jB/pkOchXL0urX7tOvXSlpgp3/7jYsXEmyGd8RI08
	 /lBvQB2wHOJChpVpS5PTUkk7M8F4JapsKlvPDb1Qjyf5gxnnBBmlKM2xD/FUfGfr3r
	 rLiMDgHnFZXH5xSAVOYb1ETlM7bccAkX5aUj2McARvEyZ7ovV1hC2r1/r+updkF3CJ
	 YyG349azk18PwuTDjeSdR2oC5eCX3daiECMjfRtIYjdPHKVOKjEiDSo6OLcFy0zOGi
	 lTD2gSdBQpdjw==
Date: Fri, 18 Sep 2026 14:02:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, devicetree@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: Re: [PATCH v8 19/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per3-pinctrl
Message-ID: <178975815001.1423373.14150592960268083432.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-20-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-20-changhuang.liang@starfivetech.com>


On Thu, 10 Sep 2026 03:03:54 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-3(per3) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per3-pinctrl.yaml | 166 ++++++++++++++++++
>  1 file changed, 166 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per3-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

