Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC2851EDF5;
	Fri, 18 Sep 2026 18:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756768; cv=none; b=DggLcX1tTmIF1ExjdnnZzA/O7zFIAwB1MwnIXS1sShEAxBUFQn6JtFL0eqy5sIEwz1p6ZIeQDk+EMy/KyF4eeIEDom5bAxy8oNWJcNXeuspQs9sbNxiUluih+q8WVdOgYbtXgkdmf5DzWstocCduQky+4si2Nno7tPPe6LV8bdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756768; c=relaxed/simple;
	bh=HcLGhNcRRek23CPxEg9HMMr5SvXvZUiQj90bQviyB/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rZCH2oq/crDMSx+yO7PPWztN5OCLAqNEh2RKgHGZB0jcjwjN47PPHpgEwa2L6PDKd86TNn7edjeoNmgiVTExjTPCxnelnWk/Ycp2bdymwXDAfQyIUq0QiU7nhMR8U2OsC+FO7xFufz+7015CpcTB3v4T3ZHd4NJ8rBh+EyHTM2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y/OQRWZJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y/OQRWZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4031F000FF;
	Fri, 18 Sep 2026 18:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756761;
	bh=tgCEktcQJoxCeJhLRkq5qXUfMLe9HnPT4SzjBVt4WRA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y/OQRWZJ7FlnbIjkfl0OTtQ9oLlmEVh1Zr5sjicMQXTBiEHl/dmql8zCOFr3GLm3Z
	 ENiTfVPF77aRZow5NH5uRfA3sjzFnrsu9q3uPXr2x3Z/6BaL/pgn9d+eNCL3mo7w/3
	 8kUR6ZYI1C3iv6wDOB1nlCiJ2LI3/qzFF2foofjcD57sjWLDo/a8TVlt+Rl14wXG7u
	 dyZt8nkQqQvm8OEJXIyBBS7QVq5oX11StZyCP2OS6SSvDjjAYM0h7yPvATaJQlBjMU
	 lV3n/vpDfMWZA9LKL6noDZW25IDxqyRoAsYUzBAsYFV1SnpT2jhOQRmg+dQF0nlHPU
	 PTrN3cz1QMWHw==
Date: Fri, 18 Sep 2026 13:39:19 -0500
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
Subject: Re: [PATCH v8 09/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
Message-ID: <20260918183919.GA1346263-robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-10-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-10-changhuang.liang@starfivetech.com>

On Thu, Sep 10, 2026 at 03:03:44AM -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-2(sys2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys2-pinctrl.yaml | 165 ++++++++++++++++++
>  1 file changed, 165 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys2-pinctrl.yaml

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
