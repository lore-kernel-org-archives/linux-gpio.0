Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A966332EAD;
	Wed,  8 Jul 2026 14:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520851; cv=none; b=jDbVtTsn4RkJ6LJWxNLkCb67sDrk9iS39Z28caujM1jTjvmtZGEl/rNn7Wp0JEzrbtwDC66rr8mkag/NYRxdffHXlw4m0YwCYq0jGI4IzENZofPN3dcp5hY8+/fZNyftGm1i3pv3ePWMWRezSdukw103RQMbqg/9k9NXZBUuSIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520851; c=relaxed/simple;
	bh=BDTkYssvTknQoqtApt00wHmdoK1C5z+MZC8I4FteFmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i+zKcwOnr5CgE0V4pw5ls/W2oBdBd/P7GFFsFGp+00iPzr+6WNuJ+HnOg7mHHb9rkZmEZ5IlHryFE6F56xPQSlHEkZFqvXiNsbTQDzKouJwDehMmagAP2QVBP1WPYxYACFz13c2Z66OBw4waITqmUGAI0yjGo+bv3bITE72v4CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=goo+lzrK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="goo+lzrK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XjLEcVuwaI4MnUxp5uY7rBAYU48YgAOMhOomi/gJhuw=; b=goo+lzrKNgLE7nYdwT6VymMosj
	RG2Uq1vd2ClYczdDWjaS5ICdPcljORo99p0tsAf3J71oWkgL9ortaPb3jj7jbdEDXzyW2cVe2AoHA
	HklJrEal57Ac0x5CRW4C3d18RAF+GrOOA5FqJgpWTXAdT+Ef34k8YtAvHEiynHFcqn2s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whTFH-00BKpd-LB; Wed, 08 Jul 2026 16:27:27 +0200
Date: Wed, 8 Jul 2026 16:27:27 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ralph Sennhauser <ralph.sennhauser@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: mvebu: use devm_clk_get_optional_enabled()
Message-ID: <d5a86921-db3d-458e-b826-b0bac370832e@lunn.ch>
References: <20260707230651.1138887-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260707230651.1138887-1-rosenp@gmail.com>

On Tue, Jul 07, 2026 at 04:06:51PM -0700, Rosen Penev wrote:
> The clock is obtained without doing any sort of cleanup on remove or
> anywhere else.

Given this is a SoC gpio controller, it is very unlikely it every gets
unloaded. There is no remove method, so is it even possible to remove
it?

How did you test this?

> -	if (IS_ERR(mvchip->clk))
> -		return PTR_ERR(mvchip->clk);
> +	if (!mvchip->clk)
> +		return -ENODEV;

You should not replace one error code with another.

This driver has been in use for over 14 years, without anybody having
problems with it. The SoCs themselves are EOL. They were used in NAS
boxes, which do tend to have a long life, but i doubt there are many
left still running a modern kernel.

Changes like this seems pointless, and just waste everybody's time.

	Andrew

