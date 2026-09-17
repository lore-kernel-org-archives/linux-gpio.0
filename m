Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA464E021C
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789657413; cv=none; b=Ri6VjYRjyyUQeB3buJNLFxDspTJeyBeBueBpH8/2s/DUAv/7dl2EQDEUuiHQZ8krHgWvSWX9Wv0ADZlcnpaUfEPBgq9dqM4t6TsfDuKXcIhp+ernkbB37lC9RCYPWWd6Xae+h16j9TmDaUyMR3a07/TZdVSYnSxl2Wylsa6fk+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789657413; c=relaxed/simple;
	bh=v8TIQr+q1avK5K0cxXPV+I4INTDPrErrKq17EaY7bGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p7Sl+yEc0+cTp2gGR+QnMga02SHouwtKoAEYxNqGCGzt9za3DTk7xu/MZ3hw54ZUd7QZdTZbKbyROe4M92ZQLpSdXN05OwqJwOrYNei4gpwkLeImzbH6Y2GwkXO1Yrd2KoqrR0bWc1ftB+IghKxq3MKnzcP0dOWiLyP76GPzEBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlwCsd7M; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlwCsd7M"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1b846so1190902e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789657397; x=1790262197; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AvQ95HVkZu+0oz5n/XboAcTGYSXdTRCXA3Bat1fmPR8=;
        b=FlwCsd7M5C0BEFxTJFsWbRmx655fiLCSqVkpyrjQWKsjEIYQJOGOXa0SVLQKsTWoAG
         PYlsO3IkMzfOXYm0GnxpUhzr7zXDlwRtp9Ngt1oK92rVzFGaz6EE5CsL3e7i7xq5xvam
         QVSSpyGm6otxbUB7e4V/bDTjQH9Mvk5i8mwOWr3fMyz7kmFiYGjRhVnwrkvolsvPCrDH
         anwWz2B/qpJWhKd+0gF7uUpqZPn2jUdPLvUI+Qz0Zst7VYOB4Dh1xZnBtE5peJiaOD1Q
         Wswq49FuzRKpGrncQoF4WK1xB0ggyC2aWyQjFa6TJ/bKsxOnWwwsnZQnJm7Q/I4+dsGX
         P0Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789657397; x=1790262197;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AvQ95HVkZu+0oz5n/XboAcTGYSXdTRCXA3Bat1fmPR8=;
        b=IrmFwSHaSp8WoAvjmUus7dR7qAKtV88ktY03THescBjuyEI8C6YOg2+p7kPFx9Jk8H
         cJfBkIeiH+fpFPNikP7AuhTqVDa6j9jx5tOnsylbI4cCYPtEDJtZ7UumnIv4epO6m6aI
         K+DX2UmKr9+HuujX9mCr+2kGDJ6G63+8P4mi6x9VKsBNp8SlcTvzQpbE1GSiMMdTpBGj
         Q2mTNo2ImKldIMM8d8UmJlyREYma9Rrd7m/ncTr3tJZLYws81t3eg0ufYqUue6ABis/0
         p/S+eXTeUhOsFj056383TTPvFKQtVO6V/KobLXRLURTs/6KAKDkxeiYcP43g3o8kJCqp
         zjQA==
X-Forwarded-Encrypted: i=1; AKwUvBy6RXra2Y9iul2vBlhgDkCLh26i7R2bC3zUoSB8/vweg/eUiVnvVC/I7nXykE0z62vyM5yykrc6fMF0@vger.kernel.org
X-Gm-Message-State: AFuF++kFYPDeq2rtB62KeBDApC+DkrsrFAk9er7IWUcUk45AplhTAuZ3
	WDRU3QjkEd6fEJ7AXLr7TUrWsVYkCe7k9L1WOc//PL8XY38Ju7VFB7/z
X-Gm-Gg: AYBFou2iQ4Snr4XSP1ZfNmAhpn4zN3bTbJm96M+nECopo49Hqq3pyh/KgCpj+MPGfVp
	+gKQe8RBaOu/pfEIzRnTgeu1Y67ndvkyPpCwFfnTVEuVaRG4ZsKt1GueWhj4voc6IHknh3OBcc0
	i9iBolGinRQvAFFqYdXrdnBdcd8J7//ymQh/2zaR7EyvMy5VoBqfxKtR6U+YF4T3uorzK3OYmVv
	S+4qY7NguM3tSKKn/u3GJjCcdIf8w0ahdV+T5QbbxhRyDk2tm+Nygtdh8n+FebX5f+k780TBCTk
	3KnXIzNcgeigm/S5Ss8vmSauRx/hQPMqG8qX+gMbdVkCm1xdazW+P1Do7+hs13XreasPQDqgrrG
	bYA/o0S1X549j1uksIPmixymfgPGrhWRvPopuwV4r5sogO8NzwsQWzUdjHX+/hCQ6V8kDjrH29w
	jYTLcolhPWBdgUuHU+WFXz9J62D/KumZBk8ENnM2Gv6OaEx161PA9LuaJHXE7xWk3BOJ7yxm3hh
	zLovK3eb6dIC8cZcA==
X-Received: by 2002:ac2:51ca:0:b0:5b6:1a7c:aa1c with SMTP id 2adb3069b0e04-5b8b664e438mr2177419e87.52.1789657397222;
        Thu, 17 Sep 2026 08:03:17 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8b57897dfsm1951402e87.3.2026.09.17.08.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:03:16 -0700 (PDT)
Date: Thu, 17 Sep 2026 23:03:06 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpio: cdev: fix kernel stack leak to user-space in error
 path
Message-ID: <20260917150306.GA131235@rigel>
References: <20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com>

On Thu, Sep 17, 2026 at 04:39:05PM +0200, Bartosz Golaszewski wrote:
> If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
> return immediately before zeroing the info struct we'll end up passing
> to the user-space later in lineinfo_get_v1(). This may leak the kernel
> stack contents. Move the memset() before trying to acquire the SRCU read
> lock.
> 
> Fixes: d83cee3d2bb1 ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/patchset/20260912123529.7951-1-tzungbi%40kernel.org?part=3
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.
