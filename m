Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9F227AC45
	for <linux-gpio@vger.kernel.org>; Sat, 14 Mar 2026 07:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773472158; cv=none; b=F3tC31AebXIt5fyTL2QPOAHczDc1qrFIl/d3MQzVtL4G2C/L88wOf3HBCy4oNwGHn+p9oRVITds/KeMp2nWr3n1tlPvt7F+TeLBUKV0f+Z25i5Bv4PAhvRS4ZpF3tPrpvA9a1kx9IrCVnu1dfIBFPSbLu5UnjCPxSYf+UaENXLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773472158; c=relaxed/simple;
	bh=5jXR0m/ZBpmNbRznNyJbwCMzJU13ks+8266sT6unD5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFOSOCx+8R6ttul8zy1mtsCjobi7yrKhQqV7Fk1uBEbNDRy2tqIcL4sYDeJ7DpphxikfO9vNLEhZckAWZsWcQoJ/uCV4owLRukoI3RpZxEo7YOlUOLWsY8UNc4PFoYN6MvaBs1f8N2R6wN4zA5hdDxO8RD+w7ahgnTCvWPuxa+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1w1J7A-00044G-V9; Sat, 14 Mar 2026 08:08:48 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1w1J79-000D2L-2F;
	Sat, 14 Mar 2026 08:08:47 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1w1J79-00000001SMc-2MkW;
	Sat, 14 Mar 2026 08:08:47 +0100
Date: Sat, 14 Mar 2026 08:08:47 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
	Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>,
	biju.das.jz@bp.renesas.com, tomm.merciai@gmail.com
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
Message-ID: <abUJfy4aqJhwhKcl@pengutronix.de>
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de>
 <abPqGvy5FqJ0a0ug@tom-desktop>
 <abQMQAbbvV60bV2j@pengutronix.de>
 <7b1e12b2-f55d-4e70-9cb7-ecfa9d82ebdf@bp.renesas.com>
 <CAMRc=Mc4x0SOfoxB9Fv4VUmNjJLjdBnMSmFG=Y1JvLih6cODww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc4x0SOfoxB9Fv4VUmNjJLjdBnMSmFG=Y1JvLih6cODww@mail.gmail.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Fri, Mar 13, 2026 at 03:35:34PM +0100, Bartosz Golaszewski wrote:
> > With this fix all is working fine on my side.
> > I'm not more seeing the seeing the RCU stall.
> >
> 
> Ah, I sent this patch upstream for v7.0. I will tell Linus to not pull
> it. How do we want to handle it then? Should this patch go together
> with the rest of the series?

Yes, better let's go the slow way. I can't guarantee it will avoid other
regressions.

Should I include updated version it the next patch series?

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
