Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529327;
	b=EgwBPRH2l9mDSrEABcD/qLoji5iwE7dh//X5mITfVf9lYt5kXz6So2YPteFC+3PSZu58
	 cpqiT3NdG2eiQACMZXnvaSfWe20Ks74ho2nRPBNiQCXMetvu78KYtdrQeTAyhFfmvXkt+
	 rwPegDTorlr8QpDWIf4pnzwUg/pKogAKXqQT92Hq+GEF9xB41waU1aRgoIxjDUwvht4W4
	 3Paa6Cs1IVWMatJ63d+si0D8Q17hD1JSAh7ywUKheZ8+PBDQuZ1srDW9vVewYrq4hq9ue
	 FS9EjsHf2NY/owtFViK+UFiKvmeK9EazGeNMM+94UNw4pw5tUHFibs+xw3TkkXfbMoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529327;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=65FN/qF7JYjHCZlAD0W6fGx3RFd9NIZbin1HOjy26OQ=;
	b=RAOcC8pi12EuX2E77zdIboKv7ZF9n3v05M/Vnl1KWiKDYk9MjpF0yuuvYT7e1ItXUDVp
	 hZxyJqfcvfH7OoH8M998zu8YektTCHYF2sIGlEQ7FbDp7+l6txjKKmFATTjtJEDCfbOvE
	 i/tteeM3H0pelcLlfM8iYDQwzokNQNSnQk13+VyvPd/tm4ukVcwkLxeUSr05fXynXXCg4
	 b8a8J+Hg70U66QJpjvuy+WhGe1W1eFQevH2qmd+/y7EApshSqf+na1mdr+6pgfQbjxBEi
	 2pyCF3Up2Ww5vmNniHFLurJ/iEWgx6hrZ9NiEtzFhx0oEU1ck/m/4NPPIADHWj+EZLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytx4DMHc;
	arc=none smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9804606A33D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:08:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9804606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ytx4DMHc
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso6303263e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529325; x=1796134125; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=65FN/qF7JYjHCZlAD0W6fGx3RFd9NIZbin1HOjy26OQ=;
        b=ytx4DMHcZxycAV+eDJx4Bu9FSJRUaL2hVWbnAhOHg/0jmT0HlixKXzWeppFCO3K0NI
         GF/XkitXvfRzydG6JXRZEz2FNUyRcRtcctxElaWn1dKBZMkueGuDNQLqASSPVsfmBMCC
         0XwbgXDIxtqAeFPuUFN+vb4UmhsWVJ4/81jnPLDdPTtoFRIAIZmQLD9JzhFQAa9I/jVE
         8w13LqtwIkDCcTyZTgzsfjILXw/yaSZDzGspYPS0xKZ5sgDtivgBoKVtzYOCDmD43+Ej
         eUJ8RVKQVQD2RCQzt5GpNbHz6Sq4DpJsiuNhtAR/LVaeDQ+WDEpbMBtHtp3Kuz2Evkqc
         Lx3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529325; x=1796134125;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=65FN/qF7JYjHCZlAD0W6fGx3RFd9NIZbin1HOjy26OQ=;
        b=a8UWXi0sEJDzLczdYpX26KGt6gshPkeJBQx2PSyUfMIjjyfy/xCRf/ZZZHi6gbKPN3
         6XJzcirql3+F6WGB1yS061KXfrq28e4fH+O/XsTbbXF7BMg12Z+cNUWf5syhLV3gbqzq
         1Wi6DlKdfTjGcDCo10EXG03CmdhMmfQ5VOqkbQvQnzng1Y6LKM9TAWfecJHh0zdJ4zoM
         4rnoT5XEyViKlB/cY2Wq8Aiilm7Cpa7Vx+RQflQm5VME3auxhGRX8r0t4hrVXbb2XSnR
         wD7Pxwy3yC3XO/mzUj21J8T1e4Pmg2cGe/lgwEh97M7sdw9d/Ykhh/KPxFG7icmUaDbz
         MyMg==
X-Forwarded-Encrypted: i=1; AL+hErGWAUcfYrYhhbXaOHtbuTBBpd1R54l1NcTuy8pagf/mH1crwOTJzdWXJraWaOBi7U0RmxLg6WVgtb7B@vger.kernel.org
X-Gm-Message-State: APuU4Z+B3I24crxRClgM5FvCFqNBhBqdZZWFr3K75/9sx87/iTpkEqe+
	LVFMsz4qpKHtABDo1MaH5LpkFGeEfjpF8Ri4pwIMD8TQ6Cz/qDK/n+xQX0am3XBo
X-Gm-Gg: AZFdTZdGzYxVGuKi4lgdw2bILiySSi0m/TBEKqK7aYRHlfwpUTF7YUsVVGeHN+ZffrQ
	PAUjqQJOTm8De/C73qP96MQNO4kac/vUBZz8L74ARe59q7rkym7iIcowcN3OHQv/hORtCDSt0s8
	eM9HEGhTcQiTo8KVf3fzoC/7ZFEHmqD0pe3hgmH2webem4K5lcWfCZdPouaE+uOdvHHwYBUJRth
	QW3FF84jHsvByPJ6iyOmdoGkVZh+RcNX0GechaH/jx7Sv8R04XPuhpMYpRyaUOo3T0hsy/pFTen
	gppsqXre20ZfDtICEqEl8fdJb2zwUOUpa/14KFWqMNAjCwVHRHPzcTkd000jBNgAUK3H/cQOc1f
	Q7fOz1HENH52ZiUnPEOY2s6OYkmWGZ5KU7MVucLI1Mu3f1HT21s9tVZbKf8alIEoo7egT1fDPUm
	cNAn2I9QVHosLqd8F/ooEnfe2i3xKTpaXbbW2bLax+OABoHv0NY72fZaaJoHviWeyHy6fY67cdQ
	0me/nHxC0cJgIBl4M96IV137waLo4zrHFCnwQ+osbv2gEdvIFSfIzj6NUKDtMrxbhKO20xyTbsY
	xmJ5gAfSr64MabiNZ94tw6wxKE0GudHMzMzgldYbvnIS/isl
X-Received: by 2002:a05:6512:3983:b0:5c1:5704:e088 with SMTP id 2adb3069b0e04-5c1bc80e60dmr4523995e87.47.1795529324771;
        Tue, 24 Nov 2026 06:08:44 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0171d7sm3750789e87.30.2026.11.24.06.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:08:44 -0800 (PST)
Date: Tue, 24 Nov 2026 22:08:34 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 0/8] gpiolib: fix chip removal with lines still
 requested from user space
Message-ID: <20261124140834.GC48187@rigel>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <awVfc9xLPXbkAov-@ashevche-desk.local>
 <7mppll7rqj6425pqxktqcve44n6mxwc5rot3nk4njf762csaqf@vbqqnxu5mar3>
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
In-Reply-To: <7mppll7rqj6425pqxktqcve44n6mxwc5rot3nk4njf762csaqf@vbqqnxu5mar3>

On Tue, Nov 24, 2026 at 03:02:17PM +0100, Bartosz Golaszewski wrote:
> On Tue, Nov 24, 2026 at 11:57:07AM +0200, Andy Shevchenko wrote:
> > On Tue, Nov 24, 2026 at 11:20:31AM +0200, Adrian Ambrozewicz wrote:
> > > Removing a GPIO chip while user space holds a line request, as when a
> > > hot-pluggable GPIO controller goes away, leaks the line labels (patch 2)
> > > and IRQ names (patch 5), frees IRQs twice (patches 3, 7 and 8) and lets
> > > a blocked read() stall the removal (patch 4). Patch 1 makes
> > > gpiodev_release() wait for pending label frees; without it,
> > > cleanup_srcu_struct() can warn, more often with patch 2.
> > > 
> > > Patch 7 also affects in-kernel users: their remaining IRQs are freed
> > > after the chip pointer is cleared, when gpiod_*() calls fail. Patch 6
> > > drops edge events whose line read fails instead of reporting an edge.
> > > 
> > > User-visible change: a read() blocked when the chip is removed returns
> > > the queued events, then fails with -ENODEV.
> > > 
> > > For stable: patch 2 needs 1, 5 needs 3, 7 needs 3, 5 and 6, and 8
> > > needs 7; patches 3, 5 and 7 fix a 6.13 commit also in 6.12.y, patch 8 a
> > > 6.19 commit; patch 4 applies to 6.12.y.
> > > 
> > > Tested under QEMU (x86_64, arm64) with gpio-sim, a shared gpio-sim line
> > > and a test chip on the hierarchical irqchip, with lockdep, kmemleak and
> > > KASAN.
> > > 
> > > Prepared with Cursor and Claude Code, using Claude, which helped analyse
> > > the bugs, write the reproducers and draft the patches; I reviewed and
> > > tested every change.
> > 
> > Bart, this series seems contain two parts, core and cdev fixes, the first
> > (core) fixes are being reproduced and tested in our lab and they are pretty
> > much ready to go. Can we at least have them (patches 1 & 2) pulled rather
> > sooner, please?
> >
> 
> Do you have any comments on patches 7/8 or 8/8? This version has no
> sashiko comments and only the two final patches are not reviewed. If you
> can leave an R-b under them, I'm fine taking all of them now.
> 

This version addresses the last of my comments, so I'm happy to see the
whole series applied.

Cheers,
Kent.
