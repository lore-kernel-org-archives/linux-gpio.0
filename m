Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F39D9495537;
	Fri, 18 Sep 2026 19:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758137; cv=none; b=u6kXYu+r5l81gmPmL//I8wIZteutlTCldhtQYeEV+2jQSGTrhrOX5hCZVU7smDrVzS1OfOfTk4QViYaTpHNQ1+cpWF6FxzriefIwytM5h8AoE026AEDhi6j/p+sgeqGIF7fzno/WvB16lnAKsBuHgE8eUaGWgoOIenUBCV5770A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758137; c=relaxed/simple;
	bh=Inx3HTqZMiIn9AJTuq5hHrUjYVp/0SHyPjhi9Bwn4n4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bruwYUbkqAF3A4nLBbyZq7xgCqWwpdDffQW6F6TE97xV3E/UK6MmXH6KsXrUeQu89yjVpczs2HaFkhH30QmYjrZOWEv0eCnHBCEQnGsSjdDf1j3YcpgBHeluYbwWFcBlmnnGWvSWfa63uM3BLM9LZHPzBVHenpjiAnqJf+Nnzr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIbvS22/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIbvS22/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 025E51F000FF;
	Fri, 18 Sep 2026 19:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758130;
	bh=/5AcKAoOrP702V56tOl34K3wrnnLEnVo93rgYLxlkIg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UIbvS22/habDODgupl94qm1y+kJ/VkjiXfQRR0oX18uQo14moQJ/Rjo5neGrnn9Mv
	 S44qTH3OHovBWFHASvrR61wUMOjDRc13Mz39f1fKH2CknNnDkZKmu/iXr56kfs/Bl1
	 w32yUo3fatPrkCJvpG6n+TSesB7TmaBKjNJgIWR2MvxtU4XYel729EBkGa6X33vOTr
	 x9nelFdBXmSSYhWYie6nUFp5Sp48QdiBvaOlJBC/KS9GnPXC8WHODt8e1wpwju+zaH
	 p+6ICnk+LQP6b7l5UMeBBFBtREd0hBPT2DMS5kodp8Xbs7tySFmcYkIItJW9PH1iC9
	 ggVA0TfGzFC2g==
Date: Fri, 18 Sep 2026 14:02:08 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>, linux-gpio@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v8 11/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per0-pinctrl
Message-ID: <178975812799.1422072.6248117956128284886.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-12-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-12-changhuang.liang@starfivetech.com>


On Thu, 10 Sep 2026 03:03:46 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-0(per0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per0-pinctrl.yaml | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per0-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

