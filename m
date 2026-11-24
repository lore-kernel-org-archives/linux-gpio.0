Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795528941;
	b=JdjNq7hJAkp+He7adFDC+pRp9EODFdopluY5Y675xqMd/r2NwcA+2B9Qz8hsh4U1tLVV
	 0vRfoFSkQt4bvD38WuVmLsf94N8LYDTelL6IgEUoQmqvzrqoy6PDSkSp+xmcRsfHIZI1h
	 FNjRHvVcoUgaUuUjD5UYHO6IQCNy4tkhKMDmLFZqMPEwUobZkYpEH7un+nNNU3N6qCJXM
	 2J5yn7xLVXSeFVitsxhL3d2wVYaC9Yb1ZtuJvJUUm0t0gItjhPOPyAcS+BE/Vi4Aox+CX
	 XfmFeP9Hct8tfupYxue1hQIaWR4mM2Ronpm3tBm7WkXFSP8RIufMKXyfoXR8EMOowqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795528941;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=KuEkyFbbbLF5BxseyTxO3xITxrQU/BsswbiSDiXizy4=;
	b=OvR/CrmHVhiV4l6m+JzffjrerACOM+v0dC6Xzzl/cMu2rfSmSJ5NFmpDx854GfITgrRt
	 wRNsHWcDO/rn7oVkRw/fiARHJU2Y721ZI6TPkqF2sedslTMmhaIsLs7Lz1mh0i6fXRX5R
	 2J2sU45zpX1YDxwsx1R9vtr+sLOgNOyZbsKbKvCEvZFsN94YqcDrNZV51mxIOebGCK6Bb
	 ga+uLtr7IaeQ+hujA/JaUdgk4/YrIFntMsLlAnKWJ8dogH48cir/LnkF6aVJw8/lTwvFN
	 k4KMzG8katu/G252mwjsgoK86mTnMJimEpRBizeKYz7BZ2DvSqLhak2O4lOoJ432MWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="RX/I7Xwp";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id AA6C0606A331;
	Tue, 24 Nov 2026 14:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RX/I7Xwp
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 304121F000C6;
	Tue, 24 Nov 2026 14:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795528941;
	bh=KuEkyFbbbLF5BxseyTxO3xITxrQU/BsswbiSDiXizy4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RX/I7Xwp5qoteHFMD8MAomYueBAvVL3D0rP0eUiIJtuHiSrfsVzFbLRZzZWBc6BQC
	 ma1uk7m7IqPBhDk/3SC8YWUmQOkOslrNcAg4mTWaA+vO8+V/ytbdpOxgNBS3yW6zHb
	 WdgkF+70AxA1yJlYA/XeUV+JodymzKSRoXpcc/LOoBfLtMzgGysOdJH15OT536ygcg
	 Ie+f+JWq5D9qUMxZzAI6z4xEVVYjmmVTWE4ZnZXIvF4sufjE1ghIgElPQFb68ZMQHp
	 DPlbE+R6VG9AomwResLVG0H5ObRUXw1mX5Ezs9fNpPaCpTeJECMPO/wKe5geo07BQt
	 2Dc1udusp9xSg==
Date: Tue, 24 Nov 2026 15:02:17 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Kent Gibson <warthog618@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Jia Jia <physicalmtea@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] gpiolib: fix chip removal with lines still
 requested from user space
Message-ID: <7mppll7rqj6425pqxktqcve44n6mxwc5rot3nk4njf762csaqf@vbqqnxu5mar3>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <awVfc9xLPXbkAov-@ashevche-desk.local>
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
In-Reply-To: <awVfc9xLPXbkAov-@ashevche-desk.local>

On Tue, Nov 24, 2026 at 11:57:07AM +0200, Andy Shevchenko wrote:
> On Tue, Nov 24, 2026 at 11:20:31AM +0200, Adrian Ambrozewicz wrote:
> > Removing a GPIO chip while user space holds a line request, as when a
> > hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
> > and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
> > a blocked read() stall the removal (patch 4). Patch 1 makes
> > gpiodev_release() wait for pending label frees; without it,
> > cleanup_srcu_struct() can warn, more often with patch 2.
> > 
> > Patch 7 also affects in-kernel users: their remaining IRQs are freed
> > after the chip pointer is cleared, when gpiod_*() calls fail. Patch 6
> > drops edge events whose line read fails instead of reporting an edge.
> > 
> > User-visible change: a read() blocked when the chip is removed returns
> > the queued events, then fails with -ENODEV.
> > 
> > For stable: patch 2 needs 1, 5 needs 3, 7 needs 3, 5 and 6, and 8
> > needs 7; patches 3, 5 and 7 fix a 6.13 commit also in 6.12.y, patch 8 a
> > 6.19 commit; patch 4 applies to 6.12.y.
> > 
> > Tested under QEMU (x86_64, arm64) with gpio-sim, a shared gpio-sim line
> > and a test chip on the hierarchical irqchip, with lockdep, kmemleak and
> > KASAN.
> > 
> > Prepared with Cursor and Claude Code, using Claude, which helped analyse
> > the bugs, write the reproducers and draft the patches; I reviewed and
> > tested every change.
> 
> Bart, this series seems contain two parts, core and cdev fixes, the first
> (core) fixes are being reproduced and tested in our lab and they are pretty
> much ready to go. Can we at least have them (patches 1 & 2) pulled rather
> sooner, please?
>

Do you have any comments on patches 7/8 or 8/8? This version has no
sashiko comments and only the two final patches are not reviewed. If you
can leave an R-b under them, I'm fine taking all of them now.

Bart
