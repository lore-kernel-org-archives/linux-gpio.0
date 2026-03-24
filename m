Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E51AC3FE64F;
	Tue, 24 Mar 2026 14:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774361747; cv=none; b=KvVimnOQhY5jNx8YAU2tbsi4lZI5fsN8dIWDukPAVWOG2Y3fBW98BpKP2bCmlBbWRepbWx1PnBR05px6MmZvznQjjBXi5PXDrPNYsWH5n30qPDjVuFJ1fyA0hP42MtiVUyqrKyogwDNC8nyQ7Zkz49zC0IaQ2MLFpzjFls4kWXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774361747; c=relaxed/simple;
	bh=jw8ntTIimbfJ+IvMiJLRRZDjJvMJe6iL7ntFWSXBUUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nZlu72DnkurWwWYrPmGWeiN05W7SK0gQDLX4hakYvRCJ7HhISkMnNndsGL9vd2m6fQgt6KqDbuBobXg+e2ZVuSoNyu102vy5r5EUgJblI/N7AQkP6sLFWoe29WHYKJlnj8m/xf3b7g8yAxEFLZirK2370SorMQoFKGdDZlO8SGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1w52Mh-0001qo-00; Tue, 24 Mar 2026 15:04:15 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id C6A4CC0256; Tue, 24 Mar 2026 15:04:03 +0100 (CET)
Date: Tue, 24 Mar 2026 15:04:03 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Linus Walleij <linusw@kernel.org>
Cc: =?iso-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
Message-ID: <acKZ09NOFF59yZtJ@alpha.franken.de>
References: <20260316-eyeq6lplus-v4-0-bf44dfc7a261@bootlin.com>
 <20260316-eyeq6lplus-v4-6-bf44dfc7a261@bootlin.com>
 <CAD++jLmT+4xb3sfa3f1z0vD4qikeB+v0kC6yo6=hSU+==fZOkg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmT+4xb3sfa3f1z0vD4qikeB+v0kC6yo6=hSU+==fZOkg@mail.gmail.com>

On Mon, Mar 23, 2026 at 10:05:12AM +0100, Linus Walleij wrote:
> On Mon, Mar 16, 2026 at 4:26 PM Benoît Monin <benoit.monin@bootlin.com> wrote:
> 
> > Add the match data for the pinctrl found in the EyeQ6Lplus OLB. The pin
> > control is identical in function to the one present in the EyeQ5 but
> > has a single bank of 32 pins.
> >
> > Signed-off-by: Benoît Monin <benoit.monin@bootlin.com>
> 
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> I don't know your merge strategy for this patch series, if you want part
> of it applied to the pinctrl tree then tell me which patches and how.

as there are also MIPS parts involved and Stephen Acked the clk Patches
it might be best to merge via MIPS tree

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
