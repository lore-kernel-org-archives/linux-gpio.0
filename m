Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8DA48F02F;
	Fri, 18 Sep 2026 19:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789758118; cv=none; b=O7Ok32RpMLSV1DGiC1TfU3vYOZVggMulqmkF3OfNouord4T5mcYeknhqEGmToJ9WkXcHnKDxeLyDk1Cnz85WVr9ZK4T/oNETQQLUq8w/hsTs+odR1v/p+0B1Zj0HNOiin0o52atXYhd9OzoOXg1o9btAfEBIW9XITy7sUooas4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789758118; c=relaxed/simple;
	bh=nUoULNBiDyyS+mYiRwze/y94mkkQpmUeEKWvLU4H1t0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Obkxtu+jed8xzszgOAO/I7h+l+kwCsMGX9nzbw299YUeC823tMtDmuc4QDTRRzvME3Evw+thddnFm3oyigmMwkldKzy0UrS/S6C+2ayAtkrl5HTF56KvlxnRXCd7TD44i2SbWBWC1oxQO/cruEP7VbGKWvzntXrtvpeqrfpl0Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LnIJNjME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LnIJNjME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC29D1F000FF;
	Fri, 18 Sep 2026 19:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789758106;
	bh=PZtRe8/sfu+cFB2Kt87gZj0OEGNX4bKFhx1kTn2/Qeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LnIJNjMETsBBn6uxmN4f54V2RzEIPQ4uWwa9nz3pCQue/g53wpM94+fgOvWi/07vz
	 sgTNFsI0BVg6mzLKbK2InCg8dzWb02vEMArgWpHVQ2ySAjazMqEQFW2dJhUngl3clh
	 UW/JSxn2GOJhFKgVjt30HY27DJ5b3jzwooaQAQzs9gcNyVwY3hcbJL1GQCWLXUFMjb
	 czofJ+ZGCMwwNhyDVzinijUyz8oOKlo37/Ddr3qRWfxKLP/28gwoT9NMBsICuL5DGs
	 YkIATSkdzIyJ2ACYc3/ztFsoVU8vfk4zUplxTVsZ5OdcyDXu5l9CV6beTJVpfJp6Rn
	 oh2iULpVsspaQ==
Date: Fri, 18 Sep 2026 14:01:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: Re: [PATCH v8 05/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
Message-ID: <178975810467.1420737.16588227115480467397.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-6-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-6-changhuang.liang@starfivetech.com>


On Thu, 10 Sep 2026 03:03:40 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-sys0h-pinctrl.yaml        | 162 ++++++++++++++++++
>  1 file changed, 162 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

