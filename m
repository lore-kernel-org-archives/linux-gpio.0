Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795238804;
	b=X1w5YcAMOgcUG5Wps+mcxNAwVo4lC5RjUDM95jsBKyXx3w/QuJiTYQ8+yuh1MQ2c0hcN
	 hgmKSIKU31iE2DZOa2shV/dYlriQkJEp4gOK+p/Nuhl082uHlYT+RTYtAMvUlgOKOx1+M
	 Q28IQEDCBJ4zv3G8GgrtTQNPyYaoHNfEeteT5w8j677WsswUQ5CvioKLvv7WWufacTRWj
	 lGyMYWhYBvD0HTatPReuKy578NyyEsJmE9ENRgIuItJWK1e4mRHqIylzoVERTTbrRQoaj
	 VJVmUVDCy6FisSDpEDVAwJ/Y+lLO39LNZEIiG9S14PnwBFT8T+/Yn50EiwNhbzBEgVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795238804;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=2mKaz/dqifKa6tvgIjKTsGu3wdsWa8OrLCV4/chX4LQ=;
	b=NQGCDZeUPKQ7AB+PR5JyCFOi1XA11ZtMm+uzy/yKq7f6qUvgo4uVAwRadzzqn1HOXiRk
	 HytIZVqSJDR7kxsVa/lFxkbN4SLBIPT2iQCu4Zer1C1ai5oINImF2Q0OBsd91c+0aYsfS
	 5pN0oV0Bjrmau26ZFt3+tonTi0X55KImt9C43czafWxGH6TE1/ZHir67l6exWcTEcWqt3
	 sdl6JIW4Y0ze0prQDQOi8+4bMUYRS9LpRoGzcrGUyFs0IRgxzyUctKyj7g6flWCKjTgNF
	 h19qbu/CKdQ7X7rMybW1A2lp7T0heprEYBrL3WC0lGSiFRz1EPKxV2veKNd6dpvU4Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMjvtjYt;
	arc=none smtp.remote-ip=209.85.215.181
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E612606A69B
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 05:26:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E612606A69B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OMjvtjYt
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cdba1bbde0bso690242a12.2
        for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 21:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795238803; x=1795843603; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2mKaz/dqifKa6tvgIjKTsGu3wdsWa8OrLCV4/chX4LQ=;
        b=OMjvtjYtuz/ck4cShSktGQWWBs+3kGP9qYEgUF7wDld3Qlmz1nB/udxsLsVhvf4yku
         tagAPNPBBMmGf6HpALhJATxoXyF7m56tSmsO/1BZx7j+c4VfFV3PMF2qARoVGL4gInzl
         WNLZOoAI5z98uwxlfrwSZFnjxujJ/SVpCepL2q31TpbpqOUFoFzZv/gpy71IdsuVJLWn
         a+K9NI+YH1uKUKZgjetD+Dmmo7zFUM1hosU7hAXftGbU6okW8uLQuQD2nFyt2GTYynpJ
         +JXzRyaPM7mQDk7mMteEOF0bNl34jcxAZwrmnC7TxbgWwbso3NGVH4HmV1CUZsbQ9xkS
         79FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795238803; x=1795843603;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2mKaz/dqifKa6tvgIjKTsGu3wdsWa8OrLCV4/chX4LQ=;
        b=NeTrOVYrwxDfy4eZoohksigyE8yKCCFbYNVypOAdzim0t1yZG1OEyiJLMQLs9s0OMz
         ktj1liWBe811XefLZ9xpRiA92ASvUHe1AvCwHWwMKL0rsOYs5jpNDimVFtxgleLi3JJz
         hhoJWs2U6y0TbS+AirqdpKkcx+t6P6jBIiT2bMXYZwHb8MWWzOrCsopfeGUZXEoxBF2g
         g4vGda9eRQqpVro1qrJryzuUsCaWvQ9rWHAfBUVf5nWtd4P6hU5SGBs0YVh1Rro833Bk
         lZs2Et7nO7tBhmMgPXTidvC++2tdHBnLRAjqa4PVpT7n14K1wquAkHPyae2U9Bp+LCXX
         WC0A==
X-Forwarded-Encrypted: i=1; AL+hErFQ7gRKLlOtpgbAdDun+AxzGGTJY0q/vxTe1yi6s1m85q/34la90R1D1GWM6aMgtmxiVQ+LKaHrctXk@vger.kernel.org
X-Gm-Message-State: APuU4Z/w+HN42ZWPNpQU13Byd0oxarcxO+UAwKyRXK9qlPjXKBKayauA
	b+8G3sidxTKviphqcCLrmF5wH5N+KbKAIqlqLbO6PGFLU+ux/0UOaCkb
X-Gm-Gg: AZFdTZcl23Arrqruh9Vf4CqpFvHQxFVKhR713aglsOofjB82iGfU/eggjvsEmV7Mr3i
	xMxs0j8WczmFcvzgOEFAAbJ0eXaK/S0NxOSc1Vty3GB+oe5fF8sItqLiR+jV8GbpFyir1L2XzK5
	DfE+WUluOLhY7FgwUtKx9R4qFtIyNUpu6rddTA2ylhkCECJ2uHF9/1MTiAoYvzuS6muhPx+sZFu
	AXzd0oAvajlE556pA7aRjaljLuEswqLn+fUGkaW8VHw6HJCtv3yknZtaFQGijX9IQRGNv/CdQSs
	x1ruVKeBmZ3Y0HG5cId0A67HZPsOkbcWuFc3jZ7+SB//rih2oATzPAH/0dPEDwTErC55IE/KLrD
	zYpTgMqmXT9/g+rqGt9XVnKnuQ2pg8wuzhzwfwqxdEItIYWh32IBRMysYCZjogFcZY81rzk+Sxs
	JGLHRUTLtl5ub4Hngmw1EugbfdxGr2yExPRabneYueLA+dvwqqgQPYb6lTn13CqFpJkMPvxmrWR
	mQkOFMuNywbRnfG8Je+9LXCr5k2vH+WOVUbC/FlKoRfWqlWMcY5Wfj/p2xVrH7tnxC/Dz2LONq/
	bfIsW93ewEFImfPjS6/iMyNu/w9PGcGiZDILNBU+8ZjlrkWq
X-Received: by 2002:a17:90b:3890:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3b41c97deecmr5244247a91.56.1795238803409;
        Fri, 20 Nov 2026 21:26:43 -0800 (PST)
Received: from rigel (106-68-220-184.tpgi.com.au. [106.68.220.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b7c6513sm1223708a91.4.2026.11.20.21.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 21:26:42 -0800 (PST)
Date: Sat, 21 Nov 2026 13:26:35 +0800
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
Subject: Re: [PATCH v7 7/8] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261121052635.GA32792@rigel>
References: <20261120-gpiolib-chip-removal-v7-0-aambrozewicz@nvidia.com>
 <20261120-gpiolib-chip-removal-v7-7-aambrozewicz@nvidia.com>
 <20261121044657.GA17013@rigel>
 <20261121051900.4118973-2-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261121051900.4118973-2-aambrozewicz@nvidia.com>

On Sat, Nov 21, 2026 at 07:19:01AM +0200, Adrian Ambrozewicz wrote:
> On Sat, Nov 21, 2026 at 12:46:57PM +0800, Kent Gibson wrote:
> > > @@ -1690,7 +1697,6 @@ static int linereq_create(struct gpio_device *gdev, void __user *ip)
> > >  			return -ENOMEM;
> > >  	}
> > >  
> > > -	mutex_init(&lr->config_mutex);
> >
> > What is the rationale for relocating the mutex_init()?
> > Looks like a gratuitous change, and if this patch is going to be
> > backported then it should be kept minimal.
> 
> It is needed: linereq_free() now takes config_mutex, and __free() also
> calls it when linereq_create() fails after allocating lr. The first such
> failure, kstrndup(), returned before the old mutex_init(), so it would
> have locked an uninitialised mutex. I plan to say so in the commit
> message in v8.
> 

Ahh, I overlooked the __free().  That makes sense then.

Cheers,
Kent.

> > The lines removed/guarded were added in patch 3, so note that this patch is
> > dependent on patch 3 in the description[1].
> [...]
> > The line removed/guarded was added in patch 5, so note that this patch is
> > dependent on patch 5 in the description[1].
> 
> Agreed, I plan to note both dependencies in the v8 description.
> 
> Thanks for the review.
> 
> Adrian
