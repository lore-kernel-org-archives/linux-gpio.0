Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948C744A416;
	Mon, 12 Oct 2026 09:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796082; cv=none; b=lpQk7U1EgY3bC3syP772KZ/XVCYncfPwlp4MDAPt0kUy+k7olzrbYfz2H9cU/xDw+H7tZu10s2SCyMGk9wkw/wafPvNcYQM8NrhjEhWsrzIWk6WOUh9T8vw4HhDIaHh1sDsLAtcjetgf/5IyW/+HVEHS0mKrlCHJYGgbG1NXnJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796082; c=relaxed/simple;
	bh=goq+JeHIaRhlCLADmOhVfg9jBpIH59a4o5nfeW4t5k0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VptVpPjd+C0axpT4dyz52d2LKCE4XYNGmlO2ggxraHeQhEuXi9fYntaOTJ3KeDb5JGYKXt6nft/I2ERA3l6rGzL3Qdfy9swGTJCHctwytOpRwRioOzdY6uVj21hYPti4Rc6IfJn1gOYQWjjx/G1E9u8onbBHqgee1cbhmwmTxlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cFJcVMsW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cFJcVMsW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB5A91F0089B;
	Mon, 12 Oct 2026 09:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791796081;
	bh=goq+JeHIaRhlCLADmOhVfg9jBpIH59a4o5nfeW4t5k0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cFJcVMsWKwWrwG2WSeEddAr+C5puvHsl0QWEUiGCwGtadC23C7OeusX33uBRdc/Tp
	 fzIHdehL/zlfEvtyrVpFSTGkxz5VyM7Txn6jgTXIICH8d0EtxDoLnCfEpYNbbObgdt
	 UzyRMlWZeVegRPRS6LpEjua4yb9nqFnDJt7tb07eGGK2Y269QqMf7GHzZPm1cpeUw1
	 q/JYvNIr5kAbeSwmPO9L3VHa9wkuLtCyT2HxejVLvynm15H7dexZhkJgxl0vYaT9Sg
	 iBMZDlZkAJFA6IFKEpepWY0xRnr5YOfhMsPlzrkMTUolP2bZZtYbaK+Yx4+ui6tjpR
	 P9XPCbFMMdCGA==
Date: Mon, 12 Oct 2026 11:07:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Velkov <iav@iav.lv>
Cc: Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Rosen Penev <rosenp@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: pca95xx: add onnn,pca9655 with
 nxp,pca9555 fallback
Message-ID: <20261012-cuddly-pastel-stork-1d11e5@quoll>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
 <20261009-helios64-pca9655-v1-1-673ee4432650@iav.lv>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-helios64-pca9655-v1-1-673ee4432650@iav.lv>

On Fri, Oct 09, 2026 at 08:45:36PM +0000, Igor Velkov wrote:
> The ON Semiconductor PCA9655E is a 16-bit I2C GPIO expander that the
> pca953x driver handles as a PCA9555: both entries of its OF match
> table carry OF_953X(16, PCA_INT), and onnn,pca9655 has been there since
> commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
> pca9655"). Document it with nxp,pca9555 as the fallback, the form the
> comments in armada-388-clearfog.dtsi and armada-388-helios4.dts ask
> for. The I2C core tries OF matching first, so the fallback form
> probes; tested on Helios64, the first user.

Last sentence is redundant. Patches should not explain standard Linux
mechanics.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

