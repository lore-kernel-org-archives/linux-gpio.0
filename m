Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795529104;
	b=BQfhZaaXxoLI6x8BOsgzrm0HFZSdP0L93wfeXlR8i39NyYOM7pHBi05MC6G/iEZ70T4i
	 nIZrrW+PazJ+zRN4auF2OdX84T7IlzdlnYOR3FE+CBZKk3icNPXGqeCY5Llc26LIFRMu/
	 3sVxDOC34UcAjcIQOIdInPXvAXS19FBvrbBRBZaeDF0qxv50SHkTAPmTvqnERw5e7NSLC
	 hzSYp26tVVkNFQifdNkL2pzRtQV5fWQ3qHwesb9pHWxsEd0CbKCXENSy6gqXhLuThqZsm
	 3xYllhZvGA4c7knhWuQdm+nE8JWsu9VDvsFnDNR14uYBh1XHwLGuKgU30GMfVovny/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795529104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=qRxeIQVtFm0RG+YlFLd95lVJGB8ZwXlO3/rFlUGzh8s=;
	b=K3yGgYG0+j26xek5jZIBu2ovJlVc/eN3RaSkYD0QENR39/yxIWAzQpGFS/UgHQHfq7ku
	 hypzSmlxVp+HW7LCV8w9GqT3/r8rmdKIpZu6B30nAMs3S+GmHWjTVAmPIAx4z7+gdgPsU
	 wYxhiQ33VmL2svCxQoeW9Qp4ZAeR5hSn4aAuE7CrVXqW4LFdcqLvnOy7x/y0W/m++Fdqr
	 pv+ohoOo/Un+k7WV0DZ3Xy6sO6j/Yb/mxzyV99XZgDdp/RFrsMtS2OKPk6HShz0TbP/8N
	 ahTsep8OJxDuDmC2LG3t1fwoTeoi02lpnRb7qhX3MIxU03b9NhbG0fAIBfQxgb6JeGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bR+JMWeh;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFB960784A2
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 14:05:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DFB960784A2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bR+JMWeh
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b2f59de176so3562802b3a.2
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 06:05:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795529104; x=1796133904; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qRxeIQVtFm0RG+YlFLd95lVJGB8ZwXlO3/rFlUGzh8s=;
        b=bR+JMWehXBgbqMLi3u84uQem+5jCS5iotKKbd3Wxb5MsH2wa8wEzAKNE1e7xM2nBBd
         jquKKBrCNUJbeljTCMi+KOyIJDCZjUEehUY7ZchGMU99GQLtUxnOtSmquyRWtOLj8ko6
         FTWyXSamVK0ufrEu0gN9QmAM2EsyaSQ3iOvFmr+nk5/89V0L7DLjzkml4hf+Q8QwmBY+
         uCsh4REXWU2ZYu8S+bFimhZ9WUSS6gzxhUyZAv6upKZ9RGj/+fCS77gjrlIr/HMacxHY
         eM0LnkUCEhsSkXm25xPTlsB/qDQvir7gO6PO6Hz9IOzp6e84qtnBhgcI8smO3HrmcKkR
         HybQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795529104; x=1796133904;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qRxeIQVtFm0RG+YlFLd95lVJGB8ZwXlO3/rFlUGzh8s=;
        b=1jDFZicLt7IzKvFDeSScGOeA98SST9X6BKAS8eUuGTj8fphaN+e3jYbkDkBhAWb2ub
         8SrQB0FFMm05uHHQURW2eIQ3lBOJBieEeCV81kZLw1Ibj3m1TYjRxUK6mfgtLsQmm4bO
         UDFfLJgr+BLb0A6zBnytLm9yKDXU1d9GS9pWSUHJhLJHB1pMXryYji1ZxJubgWDfG3Rl
         UGAJ5JL2Nz1XpWJI0wsVpDk9z3x2roWbi/k6YBGoc2mHayAtR/KFektYEFBQC0vjXXFD
         J5LSZhs7kIboA1CTk5l5HW3mvP0tIN5W/81xgN09Cr3SZl4dSFbLnb2XB4kWwD9Vmv8b
         2q7Q==
X-Forwarded-Encrypted: i=1; AL+hErHMjkv9077JdsGZYMgy4Qy1v37N1JpFdYujduPYS9LN9EyssOqIQJ8YSLQYElbQl6YSneeLj7RuTSCc@vger.kernel.org
X-Gm-Message-State: APuU4Z/89zZHc5PsyGA9u/FPf03fYAFl4sTTLE+Nl6WX31Dy1ukwOKMF
	eSES249Qfq0CSSD38SprKAFSggRcjpEqFeOFONPrjsi368EWy7pNIKDX
X-Gm-Gg: AZFdTZeFQc/RXOL3uKeYe0RXPKKvpSZrY26U/XYPQ4FKo26qTcoLcEyMFLF4Aa2+qJE
	cwQQzXr0hGbkemDNchCuXYjF7obgKLrzRCW85du2zDiVrQoCes3/ywaNgxnEGx2sWuUUMRaDZO/
	dZnoFzxk8Q9Y9jckFA2QB8GU4OyxECkSdl76FgY0CERXiTN3c5Md2UV8HRiGzbF7gcFbtbQiL+s
	O9EhbOW+SLphf4r8owQmWPU5fqMOw4zOdd4/49TqTMCRTatddXhaR9YvyCCMrnDCLeMS5Hl9TM8
	ZSs7NeYfT5701tzBSIXsVimuvcowsJDlIh1+lc99VaE60oSVivlbPG13PFiw3faX0b65gmKDg04
	wSQhStya2gFrVor+ntOvOjs8ojffBPwsJy92/ZXIYN1aWvfJUgC+NLQRZf2RB8hY+KpL5V2VBpk
	VOqcRfjC4dMxAq1jP0L49PeyCXj7WZ0m+A3kgvLytcdAZOKP1V9gDDc0fil89DA2fmhmk+Xpz2A
	OUkBbpzEh96Se4uDITBwpCozDACW5S2ADfRYt6kgIP7NJzME5PZ0AtNPW7d21ZNgOPOxo9okSJC
	UN2FbHD2U2f6+xlzfkUzSxtQUAVcXckIkDXwe/AnALf/zsC+
X-Received: by 2002:a05:6a21:778b:b0:3eb:8ae3:e1a8 with SMTP id adf61e73a8af0-4014ee5082dmr13456271637.72.1795529103728;
        Tue, 24 Nov 2026 06:05:03 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077bff6sm7287946b3a.3.2026.11.24.06.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:05:03 -0800 (PST)
Date: Tue, 24 Nov 2026 22:04:55 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v8 7/8] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261124140455.GA48187@rigel>
References: <20261124-gpiolib-chip-removal-v8-0-aambrozewicz@nvidia.com>
 <20261124-gpiolib-chip-removal-v8-7-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261124-gpiolib-chip-removal-v8-7-aambrozewicz@nvidia.com>

On Tue, Nov 24, 2026 at 11:20:38AM +0200, Adrian Ambrozewicz wrote:
> gpiochip_remove() force-frees the remaining IRQs, removes the irqchip,
> and only then calls the notifier on which the character device frees
> its IRQs. It may then free an IRQ it no longer owns, after its mapping
> was disposed of and the number reused, or from a release racing
> gpiod_free_irqs() and gpiochip_irqchip_remove(). free_irq() then warns
> "Trying to free already-free IRQ" or uses a disposed descriptor.
> 
> Herve Codina first proposed calling the notifier earlier [1]. Call it
> after the chip pointer is cleared and SRCU synchronized, when no ioctl
> can request IRQs, then free the rest. The release paths now free their
> IRQs before unregistering, under the lock the callback takes
> (config_mutex, or a new mutex for v1 line events). Initialise
> config_mutex on allocation: linereq_free() takes it, also on
> linereq_create()'s error returns.
> 
> IRQs left requested by in-kernel users are now freed after the chip
> pointer is cleared, when gpiod_*() calls fail.
> 
> Reproduced with a test chip on the hierarchical irqchip: both races
> warned in 30 of 30 cycles; with this change, none.
> 
> This patch depends on patches 3 and 5 of this series.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
