Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A273C1F22
	for <linux-gpio@vger.kernel.org>; Fri, 18 Sep 2026 03:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702076; cv=none; b=IHOWDsWXoaSPYCTOiCcLHqzPseubcSYcDL+gVRPB9Gv2xEEqGSuLRc0PaZA46AhTr252/F4nbjrFunuOLr35P1oUilvWG5f76bLoYdMUZSTlf+OhOAV/eYedx5rZ8zlxpu13AMgeyMcW1sYKIENKpdAA5Cmk2TTfITkfI8gqGhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702076; c=relaxed/simple;
	bh=M89qwos8bIa8z8siW+8qSaPS6+PF/il/I2qmdGSZc/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzhGSeff6E0LgID7FFxbl35r9KIOtjHR08ea3NbcNXOlvFeihYoi36UsmNXj77f7bLOIn4+4VA7z9n6iX3i+Q0UzdZoY1vREiyaeo2ce9ZXbmc9OCqC2rYWWfAWL6B8fjzanwXhZdqrja5l1mWMHwYqymICgMea7HCRzxQCHlbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JaAzE86h; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JaAzE86h"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-85469b2e1d5so306212b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 20:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789702074; x=1790306874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7ewbNB1JGp6SY0tvsl/Ra/3TEW7GOUpyzrYRK1fZD3I=;
        b=JaAzE86hd4M/t1jdek8fWLU3ScTLv1Q4sL8TAZBJX8zMAYZXInPgf0oNj/hp3Pto+M
         efRx55AAfHrM5fcDnSA7S9YLYteOouNTTV4oSgVp5fqUjlmsRhtHCMiWM9Wkrr8/ZpaK
         VG9b375X2wJ2YgqIgLjubkpghHJo6yMgI5bDyIsuD+9FHkezy4Pwmd+ZrbC0nKDvTd7l
         HcMlPQ6PVmhdnZ1sNUjtRxWCRaEwnzoZxyAcARWB5/47FUqQGVKw5DshctNbNDAUZ+8P
         ItV1PgzlJ1X3DRQprDQRMGdWBKB1ejgnkTsW2D/WhvmmsnTVBOumSqcnke+b74Z7CIuq
         ottQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789702074; x=1790306874;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ewbNB1JGp6SY0tvsl/Ra/3TEW7GOUpyzrYRK1fZD3I=;
        b=OYwBtevDHbayvHpH3ZbxC1Qr9qDvh6TdTqAnIqEiaE8x4sA50HuqS5vLJ0avFmBJWp
         4KreuBS2s5tOycsUgvIpOz4Pe6vkD16UpU2sER8f+S8Yro/mLOuNdXCaXxjOsmEGrdVa
         pHhZzUo5QDqNfosrT9ZiN2wXTb5i20OoRNHIeUAZ93nt1p7ehjpKJSQoodyUI420z1Al
         ntFsgiIWKA8GJ0x/cRzpH6SmLk0MkisWP5BQrzaX9iYitbYE/jjLuw+Dg+5bJWyc0FtB
         g5f2JszwOY0JTm7KnS76DwGR2BjYjGNI//gjTHbrejHGxQp5xBkuTj/Xxl61gXyzMIKj
         e79Q==
X-Forwarded-Encrypted: i=1; AKwUvBwnW48Iq5K5yHf8Okq6M8CMN6pAU3dsHW5gDNBRy+5rUDbDuHySiayq/adBdR8H1et0cXgt2OXg1AbT@vger.kernel.org
X-Gm-Message-State: AFuF++lCLD1nAk54Ae3/DGR4K8jKkoS5PWSInuNZ/1PDe16J7ppJhmzS
	2/cRcg0v+68TxynzkJ0unkkDBaeiP/JXobX9kw1PCFFAHCTLsP8JZTHI
X-Gm-Gg: AYBFou01jRQOwvBy3krRXKwNbHPwZl21TPaoPzPIewsPYbZ3JDZtg5SIvw39UcB8f45
	Wy1qc49L5Gq9qDgDcXrlqcCCIqNvYOF+sEU1u84XCAJEpuu3J9jZau1GlwLAHnP1p6AZNthOXHI
	IxtprNkF3i9OAWgRq4gz908nd9xd0BpPx7hq7gnXcaXPzvqfQzlp6k9ZfyIaX0E25H2xf93Yk5d
	ZrDFoc1Xm42TqO39HDuFnbUtjss58Fei3p31f49ZQ5TsEU/tqPoKTW4gmeX9+MpI/kZyshP0eaU
	EuXPLmYt0AuKQgJGP2moD78BYZmaFP/dg/JfLvmQTBll+Kryekx+y4XYnmflJrribCoJopjIL3S
	gqFSilmLamDHpnG77vxDf7cs57tG7rdWYY4+XQglJ8Dk5oVDJjXDVW0I2OXOrhyU0jRiWrfHJrc
	v1E/NxYIa/J7E3F8PiV58pAVMOGHI6We34bANjvx5GWkixFwIqtYsQ6cs+AlhQlsmZAl7LmltoJ
	wqGtbvF8tRWy3alUQ==
X-Received: by 2002:a05:6a21:596:b0:3d1:deec:9265 with SMTP id adf61e73a8af0-3dd8c3f2321mr2263948637.6.1789702073843;
        Thu, 17 Sep 2026 20:27:53 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc5c50aa983sm144304a12.12.2026.09.17.20.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:27:53 -0700 (PDT)
Date: Fri, 18 Sep 2026 11:27:43 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] gpio: cdev: fix kernel stack leak to user-space in error
 path
Message-ID: <20260918032743.GA29370@rigel>
References: <20260917-gpio-cdev-stack-leak-fixes-v1-1-2bb52879e49c@oss.qualcomm.com>
 <aqwEeLLuIC1AoLQ1@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqwEeLLuIC1AoLQ1@ashevche-desk.local>

On Thu, Sep 17, 2026 at 06:17:12PM +0300, Andy Shevchenko wrote:
> On Thu, Sep 17, 2026 at 04:39:05PM +0200, Bartosz Golaszewski wrote:
> > If we fail to acquire the GPIO chip guard in gpio_desc_to_lineinfo(), we
> > return immediately before zeroing the info struct we'll end up passing
> > to the user-space later in lineinfo_get_v1(). This may leak the kernel
> > stack contents. Move the memset() before trying to acquire the SRCU read
> > lock.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> ...
> 
> >  	unsigned long dflags;
> >  	const char *label;
> 
> It might be not obvious for a reader, perhaps a short comment why it's done
> here?
> 

So we should always add comments highlighting initialisation of return values?
No problem with adding one here btw, as we do it elsewhere, just
wondering if you think this should always be the case.

Hmmm, after some sleep and taking another look, what does bother me is that
when the guard was added the behaviour of gpio_desc_to_lineinfo() changed,
in that it can now fail, but its signature did not.
As a consequence, lineinfo_get() and lineinfo_get_v1() now return
empty/zeroed line info and success when the guard has failed.
Elsewhere when the guard fails the operations return -ENODEV.
So, while this patch no longer leaks stack, it would be better to propagate
the failure.  That could also make the memset ordering mute, or even a
trivial waste of CPU time, as it could prevent ANY line info being copied
to user in the failure case.

Cheers,
Kent.
