Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A24A49A0
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 09:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400483; cv=none; b=A9J15QRvA1ILIKHQphWTi1g6ABZ5gOGea3TAG0mI2M9lkM2SG95YD09Q4f2pgt3RnBKSmXnwgrZjdNGxNinbNwRItgmiQDWv9PnCkFLA5dPzDOuEo6m5uWN4Pr0M5KA/Wa0lit9Gj0ixT2J49vrYybjw+8duWtxNnxmb1SOnmeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400483; c=relaxed/simple;
	bh=WLWwWzeZBOSKp0C0wY8LsKsrti3WYaCx6yssolyVc20=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aGHOJY+QErJuyePjm+c1F+OAYnaRLmuuQ7jPRzbPnXbuLKbKtg8xFKwQNMh4wJuY4sTwiUWxX39aTFXnQmT1BM8mM7w1E2Hp3tvlF5xF7qluOinm86qIEkW1oTqppUrddaISKfAfurW0/q90nQxUFFE0uD795bmRwx5SHkz6F34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UL+ENG4D; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UL+ENG4D"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so602456a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 02:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792400481; x=1793005281; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vybmS5BYak1w5heTo7DTlFP7z60krqMLtPatgKuV1rE=;
        b=UL+ENG4DQGJypialzcokFBbH2hNcqkiklUgduMttVl/6uw8zMl7mHACrAXIXHTR5OO
         vcirIIG84nBTUYsTaXAR8AjlRRSWg7LPm9TGemx6R0+KtBrW/JW2pCAUMi1+QzsGcXrR
         VeTxqHMoeSKx6L5/POgD5MevOXAei04SgH+xa0FsbAIi2NOlJ7UDpyeSt72InRIzXPIQ
         6WKZ29nlT9f3xae/YNrfefeFary1xpB2WKr6KCgKJD0sbi0pVzkw3hx9SZ1Y8PVLuLP1
         a6cuPxIxkca399ANA9Oi2gOguTwPbOMA9nSTGtmS2gnrgV2YJE/m1qREufbd5RxdWggX
         Gxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400481; x=1793005281;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vybmS5BYak1w5heTo7DTlFP7z60krqMLtPatgKuV1rE=;
        b=tsFjg0FIesmB/QH2SP64Cfkvi7IB2cMW3UQPOaiG8BbOz6GkLNlJ8s8TeM7J9AqCpo
         zZQ8vfOi20uaaJ9LD/gtcLkygP8iPuE7p/85/Wc6+C5PzZtv100O/6/0bf50WzW4+1ow
         GPeUV8hbPVi6AbkEDy2puhAMgOfFcsun/VN+KGJPfE3VPdZ8lfU3Ym+GcYgdGlPmUpzO
         nIerZpwcEpjYl9//cQqEMrqb/XT5vfrKI9R+PP55TGvD8sgkTD7hnHw+7X28a8zrU2Ri
         3/N8EOTdA5NCe7LK/GQHlYxl1zWKiLwFZo6jGWcXnwoZBu7BZCBwAhofEzwKU0v2SxcV
         kRuQ==
X-Forwarded-Encrypted: i=1; AKwUvBxzHrIJpty1R9pusjrZQ9w4UuqN1tKNjfejqylMjgVb4dmt7Canm2nPW521Ja5KbYfY30w2UqCggvxR@vger.kernel.org
X-Gm-Message-State: AFq9FYJCrwjsSLmDl4g6EHnmR0gNDkuACmF91HzX+j8Rw83+6N3UhAnI
	b2/QbU3EXqo7M9IgIXj0u4uxmmvgt1vudRtI3A9+/F6G5BQCMeOjsjsm
X-Gm-Gg: AYBFou1wPpGZpbDB/1mD8sHFDQYJysTTHCksd7UWxwzK3hPtDL4JHqVy5ao/EyDY2+w
	LpBqn1dnVicfnM3z909R8cWGSXW43Ae66vsBEArPHqoXg6zVMJPeKHJ7nQPaHDHdllBShxpQpYh
	rniBjwjTNM1PbRJfyrFuB2ava9HDPeYz520EWwNomYp9bxWL0xn1jE4kUDdC+wQ+IIkKeeLEfNP
	nbU8ExOGl9VTyhwNmL2pKye5KEc5NEvH7qIy9o6/RcO5U0FsqBzGsDOX13R/K6nXn7JIqUBPrZ3
	0DgxhW2ufRhJoRcrRxX2ZtPja3buDeGZPnaH0PQVRgOzfV2fM8rnvR39hSd2+7LD7dKpTakTuLZ
	PdGSN83kBO36mhLcrsiShxt/yvF8zbuZNDJd3FHXQkya2KZdUM0oFlN6bqeETGzKVkLzOglM7rg
	+nA1X0eLDK6/JMp/Xxf7K4dmdByCjG6R0qLXlzbkAj2i9SQlSEz0UnYIwpNO8uevaqobIyim4P5
	vxYCUltny4Snv9erMw=
X-Received: by 2002:a17:90b:1a87:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3aceec26e88mr5914108a91.25.1792400481075;
        Mon, 19 Oct 2026 02:01:21 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3acc9d266d6sm7618163a91.1.2026.10.19.02.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:00:55 -0700 (PDT)
Date: Mon, 19 Oct 2026 17:00:13 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	Jia Jia <physicalmtea@gmail.com>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2 6/6] gpiolib: let the character device free its IRQs
 first on chip removal
Message-ID: <20261019090013.GA29798@rigel>
References: <20261016-gpiolib-chip-removal-v2-0-aambrozewicz@nvidia.com>
 <20261016-gpiolib-chip-removal-v2-6-aambrozewicz@nvidia.com>
 <20261016134003.GA155960@rigel>
 <atXXi_EA6iROhK0C@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <atXXi_EA6iROhK0C@ashevche-desk.local>

On Mon, Oct 19, 2026 at 11:40:43AM +0300, Andy Shevchenko wrote:
> On Fri, Oct 16, 2026 at 09:40:03PM +0800, Kent Gibson wrote:
> > On Fri, Oct 16, 2026 at 12:23:38PM +0300, Adrian Ambrozewicz wrote:
> 
> ...
> 
> > > +	/* Called with gdev->chip already NULL, so gpiod_to_irq() can't be used. */
> > > +	if (gc->to_irq)
> > > +		irq = gc->to_irq(gc, gpiod_hwgpio(desc));
> > > +	else
> > > +		irq = 0;
> > > +	if (irq <= 0)
> > > +		return;
> > 
> > Perhaps I'm channelling Andy here, but how about:
> 
> It was in the previous version and I suggested to move it to the above. Seems
> like we have an opposite comments. Can you provide a rationale behind your choice?
> 

Ha, so it was, though your suggestion was not quite the above - it
didn't allow for gc->to_irq() returning 0 and it set the irq to a
negative error code.

> > 	if (!gc->to_irq)
> >         return;
> > 	irq = gc->to_irq(gc, gpiod_hwgpio(desc));
> > 	if (irq <= 0)
> > 		return;
> 

This way is clearer given gc->to_irq() can return 0 - the <= condition
there is purely because of its possible return values.
Setting irq to either 0 or an negative error code, rather than just returning
on the spot, are both more confusing and pointless.

This is my preferred form, and I obviously expected that you would prefer the
shorter form as well, but apparently not.

Cheers,
Kent.

