Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793705209;
	b=toHurYKxRydkDtCNHVvzeVIv8EMRBQZxJzaePTVMB6/XZiAS3U8DklQYr/5g2FEjW1hY
	 Af8ajEvCtYYuf0X0+pNaPfafZkh8MnbE+0JYSjO74cxqziGTbRS7WouQXHInkO3HpV5lR
	 H1LNwZGRPK48mi35DcMl4FWYVBWGN2Ohdc0H8vwZQk3DL6ml2/DQJMceRQN9RZfnbyJZ0
	 CNmJMnHhur09sWEUmQHlqWODvsHaXlBpypYgs4LolIa4OxmPRWOp5kL013WekJoCYplOU
	 vn9Iu06t+EUhmJexYwRtTTEoW0mVLaL2+/W7V/U5T0HWyEK66sFBqpYH02tSP7zZpWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793705209;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=ln1Gfx2C7OvWYG5rzrLZ5qKFGoKJuGTOe8+ucqxorGA=;
	b=AaAbvgolacgfpiy5Wtswz1j4qz/5OuiyXXINylcjcHBcgtCJJObHNleFoiUoIt/Rt2dk
	 1Needm6q7Xu8QLrw8tFhXYbv4CCczsFLPwtaOYFicx88p4L8l35KDaVZYV+QWMQFAfflC
	 7xJMdmlTsyVJDfRlTAQR/w1SralAIzEBu2ZyHwMntbduBr42ewyxjmxyN6iFdrTWfZVtU
	 acg2NPpBZsb75xBxHnKcYY3z3fE6lg8P+OWn1XVHEcbZzeAZTQKlIkfaJlFfN7hXodubU
	 pwHIjJh5rYC65rai+3E1gAxHZ2tRkZfKLfOpg5qo4/EdWfU2TRmi8n4eYAwkgLDcXEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HQZTGIja;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E5B606B12A
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 11:26:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23E5B606B12A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=HQZTGIja
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 962121A142E;
	Tue,  3 Nov 2026 11:26:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 68F746046C;
	Tue,  3 Nov 2026 11:26:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0539F10328267;
	Tue,  3 Nov 2026 12:26:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793705200; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ln1Gfx2C7OvWYG5rzrLZ5qKFGoKJuGTOe8+ucqxorGA=;
	b=HQZTGIjadwPVfY6+SbWjaWIYTwLe2OtfbC92/TwdKkPq1C2Gs7aEdVQQOIHSpHeD7BOwpk
	TRMTLnZdA75OoB7ZcAnFa78BTkBUzvSQHyD5jDVNLO4R5HlAqjfYHw562qE+UOv+sSiBGd
	ZDsW4SAWn5EGT+lBMTWipEEbAfAEvQnDIHwoJ6+PcqLOeaPiwsUP68PDKqARQseE10tsJr
	KnuEyJmD6mM4Pj9X5b+bZVEL7gZ0h+fX1mqKtgyWkiBSbTci9LaQOw9lrX2On4OC9qI8Bt
	AWAsUGJai+T9Rws5uFJTuLeboJj6pglnT6IGfs/YOeaCxl6kyhJQ2rsgEKqgAg==
Date: Tue, 3 Nov 2026 12:26:34 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <bartosz.golaszewski@oss.qualcomm.com>, Kent Gibson <warthog618@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>, Jia Jia <physicalmtea@gmail.com>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 7/7] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261103122634.6badd16e@bootlin.com>
In-Reply-To: <aum82qe3S5W0FvK2@ashevche-desk.local>
References: <20261103-gpiolib-chip-removal-v5-0-aambrozewicz@nvidia.com>
	<20261103-gpiolib-chip-removal-v5-7-aambrozewicz@nvidia.com>
	<aum82qe3S5W0FvK2@ashevche-desk.local>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Andy, Adrian,

On Tue, 3 Nov 2026 12:52:10 +0200
Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Nov 03, 2026 at 12:32:40PM +0200, Adrian Ambrozewicz wrote:
> > gpiochip_remove() force-frees the remaining IRQs, removes the irqchip,
> > and only then calls the device notifier on which the character device
> > frees its own IRQs. The character device can then free an IRQ it no
> > longer owns: after its mapping was disposed of and the number reused, or
> > from a release that races gpiod_free_irqs() and
> > gpiochip_irqchip_remove(). free_irq() then warns "Trying to free
> > already-free IRQ" or uses a disposed descriptor.
> > 
> > Call the notifier once the chip pointer is cleared and the SRCU grace
> > period has elapsed, when no ioctl can request IRQs any more, and free
> > the remaining IRQs after it. Have the release paths free their IRQs
> > before unregistering from the notifier, under the lock its callback
> > takes (config_mutex, or a new mutex for v1 line events). Herve Codina
> > first proposed calling the notifier earlier.
> > 
> > IRQs that in-kernel users leave requested are now freed after the chip
> > pointer is cleared, when gpiod_*() calls on the chip fail.
> > 
> > Reproduced with a test-only chip on the hierarchical irqchip: both races
> > warn in all 30 cycles; with this change, none does.  
> 
> > Link: https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/  
> 
> No. Either make it Closes tag (if appropriate) or add a reference like
> 
> Link: $URL [1]
> 
> and mention [1] in the text, otherwise it makes Linus T. grumpy. I think
> I already told that.
> 

IHMO, "Link:" instead of "Closes:" according to this reply in the series
pointed out [2].

[2]: https://lore.kernel.org/all/20240923150522.66b418d1@bootlin.com/

The history was:
 - [1] (the link in this patch) proposed a fix
 - It has been rejected and a improved one has been done [2]
 - [2] has been accepted and led to the commit ec8b6f55b981 ("gpio: free irqs
   that are still requested when the chip is being removed"). This commit
   is already mentioned as 'Fixes:" in this patch.

So, IMHO, in this patch:
  ...
  takes (config_mutex, or a new mutex for v1 line events). Herve Codina
  first proposed calling the notifier earlier [1].
  ...
  Link: https://lore.kernel.org/all/20240227113426.253232-1-herve.codina@bootlin.com/ [1]
  Fixes: ec8b6f55b981 ("gpio: free irqs that are still requested when the chip is being removed")
  ...

Best regards,
Hervé
