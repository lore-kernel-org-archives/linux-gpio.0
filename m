Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2165827EFF7;
	Thu,  9 Jul 2026 13:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783603732; cv=none; b=HUYg6juiy/ktL9xMHYglFaQ90EIGBC7SII+eMP3HgXzKM+7bTiCXTXvwF2irgw7e+170xYmH3ucYQnURpUB4Yt/L5SiksU78Jpn4m9kVq5qfyswX1H6RnJNe/wNavn4ZM1apIN3JXoLOPKx3LZhcey977GR+ppkm7HHOQEnAjck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783603732; c=relaxed/simple;
	bh=yWwu9Dw0bgklg8rEYYCg7rN641JKgjBzviJJuvZGWOE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfmhEZhlsIMy4OsxE9dLx+YfH4FRjv+rvCn/gC102e8/S7CvytWHVtQeeAVnNH9vpzB3pvYlpEUHay5zruhM0xtf4AYT15UAGfCrWZk+PHJCzg4Hi+iw+CFDjeuRZrfdJSbKF/0cMgzA7fclYReHt7YiGiVgPNJ4TfEuGyTiqaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=oxzQRURG; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="oxzQRURG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=X4P7u3dFDEDxMv/k3ihz5ZANOLlFAGouyLWQu7Kao38=; b=oxzQRURGkAfeNtSpZjPAwD1tO2
	h5SvlL7tHojTOo7sZVQTjSbSngWRPuZh4IGhDLfV8q0L5TAPsgVsX2mHQBvTega0TBAa7uSqyrRlM
	p6DNlVqxtfXgbcZTNXiG5aHjSDHO9t0XLe0HX4vupD5tZ2JDp68xEOkOpg2MFfqjhCA0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1whoo2-00BUzy-Dm; Thu, 09 Jul 2026 15:28:46 +0200
Date: Thu, 9 Jul 2026 15:28:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Rosen Penev <rosenp@gmail.com>, linux-gpio@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Ralph Sennhauser <ralph.sennhauser@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] gpio: mvebu: use devm_clk_get_optional_enabled()
Message-ID: <1a7344ed-0ed7-4151-99dc-76f35860bd35@lunn.ch>
References: <20260707230651.1138887-1-rosenp@gmail.com>
 <d5a86921-db3d-458e-b826-b0bac370832e@lunn.ch>
 <CAKxU2N_aMvgOwEnmGbCB33k=KOKnk8=-RPK_aJCwV7tn3GcHKw@mail.gmail.com>
 <CAMRc=MeOzqqv4+zRdhEXo8x=8G+zuz7n_5wLTpKHVth7_kzjHw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeOzqqv4+zRdhEXo8x=8G+zuz7n_5wLTpKHVth7_kzjHw@mail.gmail.com>

> So is the clock optional or is it not? The answer determines the correct
> clk API to use.

The Orion5x family does not have the clock. As far as i remember, all
the other families using this driver do have the clock. And for this
line of Marvell devices, if the clock exists, you need it ticking,
otherwise the hardware just wedges if you access registers with the
clock disabled.

Also, as far as i remember, the Orion5x family does not have the PWM
extension to the GPIO controller. I don't remember the code well
enough, but it is possible the missing clock check is dual purpose, it
also detects an invalid DT when Orion5x has PWM properties when it
should not?

       Andrew
