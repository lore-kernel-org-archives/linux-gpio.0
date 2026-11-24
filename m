Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531250;
	b=sU6r8SexBD+SwQDmPDDA9Zs3Xjew2U48lTRcq8WZUzkUmoEuv3cDYuFDDUcZAHTqptT8
	 g2DmKHw5pj9O1TFJDEu2DMGOehih9z75OKffN0py+Qt42FAX5oE4ds1jk+vW+bvJ7Qubx
	 6NlmpxZhIRkkEEBHEukF9fxIGHX61cK+Y+QUsmjc/J0mjlF+7k/etXvr7uU9Fk6Y3yy5e
	 g33AyhSikGP8DIAGHJELGyqwS2WZdieMP6PgWV9RlsntkkVD+hsDfQlUc9MKxhykfghnJ
	 a/8FDt6+L0jXxZ/yrpGxVQ4czhUvYLQQJ6b+Zz/dLJK1e4gN9ZR8WrlFLOB410nbJxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531250;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zqZg55tG7HmRXe0VWnHdVXiUT5lskPqtqFF64uFZuDI=;
	b=h7P7LP3IHeDSPTnlImIa6vNz1qGlDImM203LTXyOOx8Et+eTL0QVMkCVA+e2JHxdZI3y
	 J9CihH9nj2B+QOTYN/0U3XEGLG9S9XK4Tcceax2aJ0LtjhDtKJFgiiAcKr3NJ20vO148d
	 1ViIwU1ctyjHjZTHUl3CGRDNinKtCg+Jb3XmoqFc7DjpTQDHiy6ptUOOnC+LQ4jfvWH4D
	 YJw+NPAjRqwZ2LBLiE1TszztLMKkohapNzaYvBGA+0oisZtmDAWN+O31avzIZterKDh+b
	 2QTLpmbRnIA7knELxMe1H3/H0ec7y4KhEHVPDW1PgIl5Vnbl3GuBE6gdDVIX5NnDFLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASIwlRxO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 302C6606A31E;
	Tue, 24 Nov 2026 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ASIwlRxO
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2234D1F000CF;
	Tue, 24 Nov 2026 14:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795531250;
	bh=zqZg55tG7HmRXe0VWnHdVXiUT5lskPqtqFF64uFZuDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ASIwlRxOu5+j4tSVNddP1h5JEiYyNhC1AUQ8QvDVZD2+ZSYgNqv6TUmDVd8wYe6wL
	 LUFF0zME1mXJJRmijzQ3Ec5e7HTDTPRf/JzBdio1armRlZ5mloOl+3gaqhyrvM/uLz
	 ATR7hfUKjfoknYTkwb0nuOKpd1gxcalC54ijFKUtmoBNi1Pldr1nF/iHxN+dH/yQ4W
	 aET5FXZiFKbgjhqJXcDO8dZuT2THn75rjtq0CA6F0js4M7yujd7KekQldRnn0LXNs7
	 4I66biGOQHIZzE7+ZW5YsikrPdjJRauT5m7meYiewSigh3AYuZrMvxQVOFKOeLl9vo
	 ijR08jEdaF5zg==
Date: Tue, 24 Nov 2026 15:40:46 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Kent Gibson <warthog618@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Jia Jia <physicalmtea@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] gpiolib: fix chip removal with lines still
 requested from user space
Message-ID: <2ym2vuhlp5x7bkp77aib5xuljjo4hniclzsmhjsql6qoi5zqy7@yvptgfvuocdt>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <awVfc9xLPXbkAov-@ashevche-desk.local>
 <7mppll7rqj6425pqxktqcve44n6mxwc5rot3nk4njf762csaqf@vbqqnxu5mar3>
 <20261124140834.GC48187@rigel>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261124140834.GC48187@rigel>

On Tue, Nov 24, 2026 at 10:08:34PM +0800, Kent Gibson wrote:
> On Tue, Nov 24, 2026 at 03:02:17PM +0100, Bartosz Golaszewski wrote:
> > On Tue, Nov 24, 2026 at 11:57:07AM +0200, Andy Shevchenko wrote:
> > > On Tue, Nov 24, 2026 at 11:20:31AM +0200, Adrian Ambrozewicz wrote:
> > > > Removing a GPIO chip while user space holds a line request, as when a
> > > > hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
> > > > and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
> > > > a blocked read() stall the removal (patch 4). Patch 1 makes
> > > > gpiodev_release() wait for pending label frees; without it,
> > > > cleanup_srcu_struct() can warn, more often with patch 2.
> > > > 
> > > > Patch 7 also affects in-kernel users: their remaining IRQs are freed
> > > > after the chip pointer is cleared, when gpiod_*() calls fail. Patch 6
> > > > drops edge events whose line read fails instead of reporting an edge.
> > > > 
> > > > User-visible change: a read() blocked when the chip is removed returns
> > > > the queued events, then fails with -ENODEV.
> > > > 
> > > > For stable: patch 2 needs 1, 5 needs 3, 7 needs 3, 5 and 6, and 8
> > > > needs 7; patches 3, 5 and 7 fix a 6.13 commit also in 6.12.y, patch 8 a
> > > > 6.19 commit; patch 4 applies to 6.12.y.
> > > > 
> > > > Tested under QEMU (x86_64, arm64) with gpio-sim, a shared gpio-sim line
> > > > and a test chip on the hierarchical irqchip, with lockdep, kmemleak and
> > > > KASAN.
> > > > 
> > > > Prepared with Cursor and Claude Code, using Claude, which helped analyse
> > > > the bugs, write the reproducers and draft the patches; I reviewed and
> > > > tested every change.
> > > 
> > > Bart, this series seems contain two parts, core and cdev fixes, the first
> > > (core) fixes are being reproduced and tested in our lab and they are pretty
> > > much ready to go. Can we at least have them (patches 1 & 2) pulled rather
> > > sooner, please?
> > >
> > 
> > Do you have any comments on patches 7/8 or 8/8? This version has no
> > sashiko comments and only the two final patches are not reviewed. If you
> > can leave an R-b under them, I'm fine taking all of them now.
> > 
> 
> This version addresses the last of my comments, so I'm happy to see the
> whole series applied.
>

Good, LGTM.

Bart
