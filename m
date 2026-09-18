Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0B951DDF4;
	Fri, 18 Sep 2026 18:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756537; cv=none; b=o59SJuTmNDKcaQp+dOcd6rbXLeurpNlZp9liu4tbC7pUcYboo1Yq2INSYtMoizeNmBmgIAsfIj76IU8iDbTHj9HmzZXVI0rnmwLKKd0DiIxHxsIol78t7gAgs5lGYtbaVhdoi58uNJhuuvONbfSOZ6cysrc27lfzOjUTMyMqSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756537; c=relaxed/simple;
	bh=QMno9KKPDPhvcpIBjVhQ1ViQib8xi+nRQ20CysC5foE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+TSkUO/oyQpjXDrZF8dlDRkdUqNAzIdD26mNPwleeYgVRmu5Xhc7v1slmkX3UpGnvtzqaapiqSW3UT7EG35gPiN5oaXL4i3nZyu2lvD/P/wdDbc0pDYc2KamLdDMnW3qMwVjVvqf+iZfzcEyxdwE3n8+kZLwTMeZ4f72PgJ8Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O+aaC1Eh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O+aaC1Eh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6336C1F000FF;
	Fri, 18 Sep 2026 18:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756532;
	bh=zL3zf/Mxv25j31UU57durVN7+v90+sc0FJoRGvW0bLM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O+aaC1EhcNhwSVV6edxB8w7RjETC+qhUgcUbhqETv1XF4VnvSt22MYjSZkh4W2PnF
	 ++bdTsPpa2BSkhqIQAIkuZv3miG+fwxi33gbZyv9vdtgil8GTIopbAnFSpD9G+8GLJ
	 EMPM4TvwIvTeaqAacnKCs31+x9SgQVkj6PklT1NK2ghTud++y3nPQ4ajJB4bs2wrah
	 7kPfDugWq/2nTH6ysSmdIF5Me/dbx2Lcj/MrbUtGarWhZaC2wMxE62l+4+RsOnijOK
	 MauJY+TyCxZnyeXyr3dHIZzj84MPibUg7B8Gtr41ia5/b+HAuKv0Vg9WuTYiabca3H
	 mTe7xvgb0UTrg==
Date: Fri, 18 Sep 2026 13:35:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-gpio@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>
Subject: Re: [PATCH v8 03/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <178975652969.1333472.11106750466244695151.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-4-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-4-changhuang.liang@starfivetech.com>


On Thu, 10 Sep 2026 03:03:38 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
>  1 file changed, 164 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

