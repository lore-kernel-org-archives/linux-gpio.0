Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016560;
	b=YhAhMk3mVqR6ATEahEdEU9vwDw/pAp19KfRCXUAGFF/j9mZR7Kc1UZRfQ00aGENviH2M
	 77AHZwUbFA/cICMHE1nh53Wf0+Xr99Rr2eA0RORNwe48lTWSpZonlIAwHL3goAxS/JWv7
	 OJ6aCj2/WeURBG7/sF8VITGtF4ckRjC7OV3suikNuFKqJjt2Enh2NmGYZFge6dPLycr+w
	 KemYfn62mSpca0zX0Zp+SlZTT6m7qRtYpvC+oHutLCLrtMp+NLrozDbvRgYVofRNye27K
	 RxkM/AgEGoT/YWNrb6jKfn1SjTTtRckMC3XbbsI8YSrUHnVv5pmAEENI1YW4J1R5Wog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RKQbSciVgm6q6OZuo/dZsxr8jfr4y3IcbTHmuYz4xRo=;
	b=v3ZfE/4Jcw+tS2wl9R9m5VFinA4LYcwpI/6L/kK7u9Zr4xRB3RPWLcs+sedrOXq0Bn0E
	 cfL69wxz/wtOVLqE1fMNAVDtjmCcgHVj8qB0dLn6PXTsmW2zDKicigObthC9hERvz1pnb
	 ijagjFK/Gw2AIxR9LnmDIjgbvTB7vQswQwmC18f66nGu19oF0gVuhtjKm7FU1YD0KfTOF
	 JwSMrdBYBeP4BcFuDeBQm3/uP1gmkJIZpQMIJu6u2hmJ/k0q0k82s5oCMsnviOFu/Zvo8
	 MXWrIJQwUxP/xCpSRABfXHL3Iao08DizKXkMGeg5AobGGk5aeREHyznUmtB+c7LmIug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eXLibT/q";
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5306D606A336
	for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 15:42:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5306D606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eXLibT/q
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c15956ce07so1972325e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 18 Nov 2026 07:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795016558; x=1795621358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKQbSciVgm6q6OZuo/dZsxr8jfr4y3IcbTHmuYz4xRo=;
        b=eXLibT/qYFd7DQjxErpIUzZgYn49p6J/2rXvi1eenyjCr3QFswsL4rc5SfIIfFHC5D
         M8YYkzzmaAyOtRqEDzDA8z0pqP5cHILcIbQ+mdYrK1zwURohpC7vZkQrZ/XzlHzQdyTu
         Cqeb2TqSQBnwvVFAqvwgv4dbX1PYizJnVwdc/k4UlfiIBpADUrZXYbHLdZOzkX9k/NFl
         jzOf7d95kF9171GJnVs1GwerQ8WWTMu57mBlSynbufpCSYC5+ucFcm3JsdIq3+Uf1z7x
         Xpo4/5Fw5iDrOBm/wIcOXnc4415Abe4tUOBJLHzMRxU460QIOVPoCGNdggNS4ifs4wjT
         T6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795016558; x=1795621358;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKQbSciVgm6q6OZuo/dZsxr8jfr4y3IcbTHmuYz4xRo=;
        b=1TgxVnaZ/z82bFVgySItj5aDCv3KcaTJHwpC+ZkO21JB2Bw0NgEqh13edx98/PvMn/
         AITKPX2K+fO/JAorJGU6aYkmkzodaf6PPDtZvWyhyjrRuJYvCTHMkmB0iJ27f0TN0A7Y
         oQFXiWaFEjcDfV4xguqX3MPRh4NUmStbz1vhtKLhoxuVW5Yi63P2smTJamFcD1dX/4Th
         LFb1stP/S97jguixMQrOVVE5zXIJn55qhrk140dZsYGwpLJ0OOeaEWr3e9eaps9aQiMk
         Qj1z8GtDKquGuaxLyiZomNtqd3ivhnKDrgVTGdqqjH6FRRdYgwO+aq9jEa9kkhu+/5bx
         7gxw==
X-Forwarded-Encrypted: i=1; AL+hErGpOCe0saJ9OksC1y76s0rbMkSxVMFSr5d0TU+y9ByRKHyiw5ilqbWqRQJ4NhskfAhcz9aNUS7YSfOp@vger.kernel.org
X-Gm-Message-State: APuU4Z+eiu14HIhI0MLwxZGfAoe8g/KpqUOY2Ki2LTQSe1QtLkNTIeNP
	ftLZWu+mc/UXTn0CBdb0ERJ7RJVL7IIR4TTe/b83/VJFqCpVZekQ13Qr
X-Gm-Gg: AYBFou2cb7ifiLKc85QX4UOExvCsGuXNEq6+TQCvRaEu61vgtcSPYhR2fDCyTxk59ib
	oi9k/XQ0I0HszxGSsbNOIcnHSUkVCWGjHxnmYH4Ty7M8/rZC9IbUTpiEDdUyaI0/MzwoDAH2GmF
	u+/26WSorhRJDy3coWz9omEnSybvHbD4c6bATXF8oY6ShZQZUElwUFWFCMKOvZRGx/8tRTVyNjx
	e5ZaPr3n8sSCmmSskldehA4fLsIMwv7MBS+nCzc4M6yOuU51BKeUk8enivQHWa35pPo/oDqKm6V
	SFs2ALNzx8k9B4bTkWOweEF+c3V6z4OHVCtThwswnjWMPkiPxRPh4OgFIPS8AoPcsBqSf9PJE16
	FeuS3r+qQGsmZTZN6eFbZ3AjQVj+8F2RPKAxQ308jjKP18laPXvJlsUIz4eTtG8vsBIwoB3Brs0
	tWbhRTJABfWQweEhYnotLsx4/20BXyrXthRh7moHbVax1Y/zmTZ43x62czzS6GJ62A6aqAAFtFl
	TIVCwEsrIOzWHegYU4Wma19z7/bM/sXdszVPNXJDedwihc8MjW2uEWfvi9GYQR6q/MBRTJf7iQn
	vqxAaSK4aHsfxg4Uex8ueaYvDqyDfuKCvoc9Cf7jqX1URBuSsw==
X-Received: by 2002:a05:6512:32c9:b0:5c1:56e4:c705 with SMTP id 2adb3069b0e04-5c1a0e434b5mr2331156e87.3.1795016558031;
        Wed, 18 Nov 2026 07:42:38 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1aa76035asm631034e87.27.2026.11.18.07.42.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:42:36 -0800 (PST)
Date: Wed, 18 Nov 2026 23:42:24 +0800
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
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v6 6/8] gpiolib: cdev: don't report a failed line read as
 an edge
Message-ID: <20261118154224.GD46152@rigel>
References: <20261116-gpiolib-chip-removal-v6-0-aambrozewicz@nvidia.com>
 <20261116-gpiolib-chip-removal-v6-6-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261116-gpiolib-chip-removal-v6-6-aambrozewicz@nvidia.com>

On Mon, Nov 16, 2026 at 03:47:09PM +0200, Adrian Ambrozewicz wrote:
> With both edges requested, the IRQ threads read the line to tell a
> rising edge from a falling one, and treat an error as a high level.
> 
> The read fails when the chip is gone. A driver's ->get() returns an
> error once its device stops answering: pcf857x when the I2C transfer
> fails, dln2 when the USB adapter is unplugged. Since gdev->chip became
> SRCU-protected, the read also returns -ENODEV between gpiochip_remove()
> and the IRQ being freed.
> 
> Drop the event when the read fails, as debounce_work_func() does.
> 
> Tested with gpio-sim removal (test delay in the IRQ threads) and a
> test chip whose ->get() returns -EIO: both reported a rising edge, none
> with this change. The HTE path was compile-tested.
> 

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
