Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FB72E719B;
	Tue,  6 Oct 2026 03:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791257320; cv=none; b=aXj+c9UZYsDM2hBlelQhmfKblSl+hDttjT65xMigavcCVdEvWeUSqkbzQY4pYYGdSOysOdGTc64FGKaOkep34AJfBAZOVPfzsOiBc6sVPMhioxx/IYklKE4hZzoFUlJ2UYdVmdeCcgfNJjk+FS2awOZE8cE+kVJ8vrUs7w+qEx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791257320; c=relaxed/simple;
	bh=5/xEe9ZY7LvDk12TJWB6eUs6yjUPa1o1k8kTJLBYE10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VjmCHp9cVRpYvFb7jIOEu4TAP1DQHMAP1zPnJGpWv2xPIl1d9rCA2ZppPyBtFnAYmwxj4QP0KksaGG+TcVgp6e62F+QhvO5+Yco9dNbknCEGVI1k92hKU8tCv7YaQiPnNq9m7ds+WTEsh1wVu3Sz0Sfpc2pRodd7DoT3cGGk6HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aByZ6N+Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aByZ6N+Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B3C1F000FF;
	Tue,  6 Oct 2026 03:28:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791257318;
	bh=+fFNT/jIRKqZt2GOjyGpl20xr+ofqYq34um4V5iP/PE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aByZ6N+YfMd1MiyIZ6/1T1tjY/eJ1fZTbSzo/IVLDJQMDO8GJDiCdje1+5mQxp5Ow
	 yYm7chlF3mA4BoO6CALulEVdLLMexr99QBUGZ80/MoHofmM7/JBRY7qaIYF6SWas5r
	 4uC1PhnR8+okcJc8d5/otaL4oDHINC36ZahDe5K4h4tJ0j9snR5LFatqdt4Rgh205Z
	 Y3hVgMDMfi5pSg1vPcJQKCpNgiflAVG54+yFF+LRqgjLZsc/CDPQDxlNJTXo2ydBUb
	 0qL6SIH8rwXndTfQgd5SLfRdqCIUmCO1Xxo5JOMSExil+YL4HoZaOHIPlN59qPVzUI
	 TOs5gRnyhatCw==
Date: Mon, 5 Oct 2026 22:28:37 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Andy Teng <andy.teng@mediatek.com>, linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v10 3/6] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Add MT6795
Message-ID: <179125731179.3556841.9854336212355847521.robh@kernel.org>
References: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925-mt6735-pinctrl-v9-v10-3-cc042983c565@protonmail.com>


On Fri, 25 Sep 2026 18:53:10 +0000, Yassine Oudjana wrote:
> Combine MT6795 pin controller document into MT6779 one. In the
> process, amend the example with comments and additional pinctrl
> nodes from the MT6795 example, replace the current interrupts
> property description with the one from the MT6795 document since
> it makes more sense and define its items using conditionals
> as they now vary between variants. Also use conditionals to define
> valid values for the drive-strength property as well as items of
> the interrupts property for each variant since they are different
> on MT6795.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../bindings/pinctrl/mediatek,mt6779-pinctrl.yaml  |  72 ++++++-
>  .../bindings/pinctrl/mediatek,mt6795-pinctrl.yaml  | 236 ---------------------
>  2 files changed, 70 insertions(+), 238 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

