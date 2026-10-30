Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368014;
	b=dYzclABZsxAMn+rmzN/eCzlt0xRZkQ26WRGQ2lW0x5KcGZW30tH8sCjOym/IfShbaWis
	 PueMKLe0Qmhq+yBVI9jz6h0xqjsUJvCNkg6XKJQNLbvdFPFgq/xm2d2aBmk07K7ZpH9Rf
	 wTzAtbP94JksVKH/JA8UE8ZKggKaxFIPOduDXEQRGEKxq+3sqrr5RMOZO22qbbYYU1QbD
	 CnIsxEDrkSJSfQLm1dqOCZ86OsoJVVbJDKJVDiAdZZVK/70X84yxBiRt4D9bA9+J0fyIA
	 yLPLg3BnXWIbDh06SayvWqS49g05ZzN+6LLRAsuvQc9DKlhRXlnujjYVz+a2DWJT4Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368014;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jpSzV26D6Rjz/NJkyTxMWgMImq37uaP+9bbwc82yg1k=;
	b=Xpo5o/+hkiUsjZeQSlRZfv/oFIcQ6DSUzrspdf360dXI/4d7191Oa0Tr0PqobLDZKxq5
	 +6S6VoaeybcZ3UqFeZMxJn+o5QRK6TC5vjda3wbOZHhk1HNNROysiN43uYcS+Btp6JUJy
	 9lKsytgc81P3BJUjzqSmE7kfgcMI35cRVc0ysi4gOXmdVXw6H3Ij5ZoLzRWvwLkK4WYdV
	 9M2JpCaBwwnsarhH4CDX9ck4B4QQk20TW4pLSDv40LnpRwvPZNl1wvrC4gLGdJpD9Oaop
	 lvGYcAZazKsTlpUQ4By6Ie3HJY2/iafm5VDBXm623cW09wrtx6Cusc5/GyijY2HfI3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEMVM9yt;
	arc=none smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADBF606A31C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 13:46:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1ADBF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tEMVM9yt
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc751eddf25so441845a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 06:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793368013; x=1793972813; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jpSzV26D6Rjz/NJkyTxMWgMImq37uaP+9bbwc82yg1k=;
        b=tEMVM9ytv4rWMJK8XQ+62+lBj1mX8zgGbbJCTo/Jk65iCKRvUVZnxa5aTEBTP6vDjW
         N2FpYrTBUV5Kg/wCqrS6mBJ1EL35JYfAToBL9Ipo/38Sve8mWYXWd8v2180GOzoRZDmf
         JVwsUF4OXmYd752CdtLReIlE4YOexd6EfptJSBQjg//ILWR7agYdbUQLskQAIslDRwcE
         RwWt3uJOG/rjlh4zAjAOFHLFk5FRVmRa5Y1rNX9CqIhXBrpyQ3+JExhEU2p62XmBg5A1
         tjpzaYDnZWZj/B6yjWrzO4uVQjPnYSWK7lSDrCFazUDUKcc2DHIP+FFvAhSU+zkUBAzf
         XHSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793368013; x=1793972813;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpSzV26D6Rjz/NJkyTxMWgMImq37uaP+9bbwc82yg1k=;
        b=Bz2x5h47+8zh6558b+UTD7NrieQ/UfoQGdOiKlD0N7wTq7L9O7nInoW6a6/d14j1VS
         oAuE2eEwJWtHUONn3UlyickwuMgWFTjeniP+xsolxVnsc3LZy5dTdOMyylo+9absZNgI
         W9RN2I+kjd1p3EhnEcCqyHoV+7YK4VpQQAJvbT3PeMvXBFKpMiqVGRUSho1ucoo6x+7x
         IvyTuhQky+rOzfHVqpCV9L8rguIpe4WJhBcojrj1TmusXNnxnubhpIfw8iKRoKN7qS8s
         OG23uLB7KTz7jj3qO257k5VPs28Zeo6s6Fgd+6m83L2JUiPoub5ycVfGAzQ7I3kSPEoM
         /+sQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYkHhX90nLhoOj6YYmQArGPpfkg9UIhRdNlDHFkMJgaL94YyVvi6ah/eGvS7ywqtc82dDi+tuv26Gd@vger.kernel.org
X-Gm-Message-State: AFq9FYLpZbSfEo5uATUGN6mjCjsbIiYAfQ+LKHlJYWYlO/1rA4o4Ofq8
	F5Le6FzyHCLK6M+Bb9AdvRpwK/V3Hg/LtXbn/4VfUXa/sj9w+oQ9bZZa
X-Gm-Gg: AYBFou1UI/A15+4ONmDRPTwzWIqOr4zEvHHw30Gav65lLcZTfCfu8bNBDxiairlrZ7/
	HYtnxmTB+xmsDCo4SBAAvAH1GWnbnxcMTYKM6R+ZerKx0P58WuhvF7TuG9Xhf5THrHt/tAXLurH
	etQeuMJYYtSMaFiozwwoL65+TLvF+uKbHIr7pY8dKdOXJ9i1kaSlLXXqdS82Z11hIClCOsqLTIJ
	WVisoPn4J8VR12md3FKVli9kPlmGAp1+auuHnX619xyDcMYgIczU1FKzXPghU5ONq+UL/ZArrc1
	bSc3hc7uCsW1jo9BuZfsptYsbgFRwOdYLeWegX5dzot96qRleQJ57n8i1vDMocNYqmbnyqJPNWz
	hwwziU4XGfsCyBfDGzgisoT49VUvCKCpBTFG3atYHkoiJ5K9Urjy/1DwEXMMnVcfChmc/WASvZK
	6HSZZ3gLmorsw8+9nd3Tbd7CErtBJOroSSi1d/OOsQVCrrxK69C+OMQsF/nSAun3U/jh4roAt2J
	OMAZm8KNTjHkibvPAsrre8XjVDzbzcCgQQXVEs+BXKOiobA10RceWpMjwhi5vFD75/6BMwOiUcz
	wUs7OSsP+7ZACEEwg40gX2m7kYreR62OMMldHyCYA7M+xSSZ/g==
X-Received: by 2002:a05:6a20:2583:b0:3e5:904c:78d3 with SMTP id adf61e73a8af0-3e928aa2158mr2405789637.69.1793368013382;
        Fri, 30 Oct 2026 06:46:53 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a9eef96e53sm791024b3a.20.2026.10.30.06.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 06:46:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 21:46:39 +0800
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
Subject: Re: [PATCH v4 6/7] gpiolib: cdev: don't report a failed line read as
 an edge
Message-ID: <20261030134639.GA94733@rigel>
References: <20261029-gpiolib-chip-removal-v4-0-aambrozewicz@nvidia.com>
 <20261029-gpiolib-chip-removal-v4-6-aambrozewicz@nvidia.com>
 <20261030111435.GA76958@rigel>
 <20261030123109.1935475-2-aambrozewicz@nvidia.com>
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
In-Reply-To: <20261030123109.1935475-2-aambrozewicz@nvidia.com>

On Fri, Oct 30, 2026 at 02:31:10PM +0200, Adrian Ambrozewicz wrote:
> On Fri, Oct 30, 2026 at 07:14:35PM +0800, Kent Gibson wrote:
> > > Fixes: 61f922db7221 ("gpio: userspace ABI for reading GPIO line events")
> > > Fixes: 73e0341992b6 ("gpiolib: cdev: support edge detection for uAPI v2")
> > > Fixes: 2068339a6c35 ("gpiolib: cdev: Add hardware timestamp clock type")
> >
> > How did you determine that?  Those commits are where the associated blocks
> > of code were first added - not where the problem first exhibited.
> 
> From the hot-plug case in the message: a driver's ->get() error has
> reached these checks since each was added. Removal is newer, as you
> say.
> 
> > The failure mode you are addressing was added by
> > commit d83cee3d ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU").
> > Prior to that gpiod_get_raw_value_commit(), and gpiod_get_value_cansleep()
> > and gpiod_get_raw_value_cansleep() that wrap it, wouldn't return the error
> > that you are handling.
> >
> > Could you bisect to confirm?
> 
> Confirmed: with gpio-sim and delayed IRQ threads, a falling edge
> during removal reads as falling on the parent of commit d83cee3d2bb1
> ("gpio: protect the pointer to gpio_chip in gpio_device with SRCU")
> and as rising on it, 10 of 10 each.
> 
> A test chip whose ->get() returns -EIO gives a rising edge on that
> parent and on gpio/for-current, none with this patch. pcf857x and dln2
> already returned such errors at commit 61f922db7221
> ("gpio: userspace ABI for reading GPIO line events").
> 

Ok, so the driver ->get() itself may return an error if the physical chip
has gone away.  Hadn't considered that path.

Could you update the commit message to better describe that case?

> I would use Fixes: 61f922db7221 for ->get() errors and d83cee3d2bb1
> for removal. Is that OK?

Not sure - I'll defer to Bart on that.

Cheers,
Kent.
