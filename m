Received: from s106b.cyber-folks.pl (s106b.cyber-folks.pl [195.78.66.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881C8C145;
	Sat, 14 Mar 2026 08:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.78.66.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773477957; cv=none; b=ZCzU0l0xPCulq2HHyaoB9RsbJ32Ald57OaqgITNJdsbCioMID+oOz2Hc/kZ71Mte/T8MGlcFqzM9giAPJUnJYbrVEqjhEU4HnvhdwdJppTCADPl7UieFX5cvKmE0EBEiyCApFBBhoOg2crM9bazyWNSq1lEr4iuuLXWhhD1dkFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773477957; c=relaxed/simple;
	bh=zPkPI1veKKVGIV7jCwGwVXXMUM3/6U7Y3nLOhBoCMXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3cox9bsZM0nRbxKuMz2zUg2JWNVgdkeWKpEB5UckKrE0LV+/rL7h1il/8TLbRNNRJjGz6vpZ3DZrIv1RWlg9/hsAOLm1RYu6+11TsrCI8C6H286wEPF3TrBb0jGADKjqCHrfuXm6RrVf9YVgxfrKvPX6o+Wsa6G12AxsH6zpQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl; spf=pass smtp.mailfrom=mmpsystems.pl; dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b=Mt5lNKJe; arc=none smtp.client-ip=195.78.66.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mmpsystems.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mmpsystems.pl header.i=@mmpsystems.pl header.b="Mt5lNKJe"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mmpsystems.pl; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9G7QiHXpxmHH4C6Nxml7OsvQ5dLKhj3eSSSnkxHngmw=; b=Mt5lNKJeYn3j4izThdejaY9AVb
	Bpjbj2BpETkq0aglrJT8DDAAOmq+3HELbFsj6qUaZREMWwjiIOl7JcKa7lAy4d6beYxT5PK004dSS
	L9rmi4oED2kAfE3B0ZGZ9MpGhVROfQHCef+duccDykZQVHKSnVVrnNkdpsVXBTTCelS5Z1r7mp6tN
	ajJxm4AOeQgsfRBzbgPN7u2XxbyvflOFFnbC9pVr0SZcsdYvuzQ5tDMfFnS3O/0BlHUMNSz9fgaw1
	0qUdxHBh+wYFrvf7OlL9GAuedGpJbaIvKyg6QuKvx6ydBRLapCK2eaXlDzfMdKceOi2m937QXauPK
	cqcGflqw==;
Received: from user-5-173-16-20.play-internet.pl ([5.173.16.20] helo=localhost)
	by s106.cyber-folks.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <michal.piekos@mmpsystems.pl>)
	id 1w1Kd6-0000000Eq3d-1G9O;
	Sat, 14 Mar 2026 09:45:52 +0100
Date: Sat, 14 Mar 2026 09:45:51 +0100
From: Michal Piekos <michal.piekos@mmpsystems.pl>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pinctrl: sunxi: fix gpiochip_lock_as_irq() failure
 when pinmux is unknown
Message-ID: <wil4524ca35bcrqutlip7mzi7xlwa3xrauym2pi5a73vlkohcl@zhd3hczj6e4u>
References: <20260314-rc2-boot-hang-v3-1-0b48221181a9@mmpsystems.pl>
 <CAGb2v67ZYyQ13ttMdzskHNTYxqYfEB_kVsMqsY9ZJhRKRQTigQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v67ZYyQ13ttMdzskHNTYxqYfEB_kVsMqsY9ZJhRKRQTigQ@mail.gmail.com>
X-Authenticated-Id: michal.piekos@mmpsystems.pl

On Sat, Mar 14, 2026 at 04:23:11PM +0800, Chen-Yu Tsai wrote:
> On Sat, Mar 14, 2026 at 4:10 PM Michal Piekos
> <michal.piekos@mmpsystems.pl> wrote:
> >
> > Fixes kernel hang during boot due to inability to set up IRQ on AXP313a.
> >
> > The issue is caused by gpiochip_lock_as_irq() which is failing when gpio
> > is in unitialized state.
> >
> > Solution is to set pinmux to GPIO INPUT in
> > sunxi_pinctrl_irq_request_resources() if it wasn't initialized
> > earlier.
> >
> > Tested on Orange Pi Zero 3.
> >
> > Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
> > Suggested-by: Chen-Yu Tsai <wens@kernel.org>
> 
> Interesting solution, not at all what I had in mind. :D
> This fixes things immediately for sunxi, and keeps proper pin lockout,
> i.e. one can't use a pin muxed for other uses as a GPIO interrupt pin.
> I was hoping that the maintainers could provide some guidance as to
> whether the core could provide helpers for this, but for now:
> 
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>

Thank you.
