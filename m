Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC9046AA85
	for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 09:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792142077; cv=none; b=ZykXnMlv3HMdy6TIDSWsJniWIPGRGO6DmBJGbwR4q52a1nUqqWQvGOBk6aLRaudyEYEsq6iBIWTjIsUc1ZCLia6ZPdE42kU2jcNE7pA54IwOqB5mTkKJPtkq+7MFwHkQRLfpIU3ArLC77JC6BqwCWPslnJYzwd6wopUWVTiSYxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792142077; c=relaxed/simple;
	bh=ACUwmcD8ymquWOyprkNmgjfTWbNtwmz+62Luy+teC6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lR2/OmRVOOT349ybMsXtf7fksb10Yrihbgh1wRAqz9P4jUh8hHtD4RmafdX+Y5KETv90wcXqKeI69A724gMINRbY9eoNwJsvA7LYOttSiVh5opIkkUNrBSl1mrOsiTax5vv7aOqiX/PTteJv8kp23DW/XH6BloY6B62ZU3V6BoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XDtTE9iM; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XDtTE9iM"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ab9268d90eso3406530a91.3
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2026 02:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792142075; x=1792746875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=W3JiLMyreebWkEDH2QRZBGzUDxRg9+HMM1gDjRAjytg=;
        b=XDtTE9iMbuuOID3fm/f8N5m0NqHw7YrAP0+kICvTOy5Www7wiVdJMRYZiEv/ubMPe5
         SIe3X3csjycHEuH2MlW+Z0aocPBWxX15p7O8eX5iFVBiuOt2HYgBHEru1LBPpD7IfLo7
         gG6YI+DQFjzlVkpS7B3r6BvAmXQ3R94b3HhP3Wv2XFvI+FQeGVd3WRiYiIsHtTST6OX3
         gj3Jn0fp1tJnzfx92TRKpMF1x9MOht+kOwWKJG+ay37uumEtAglTaqPhbnlUycxG5ZyO
         sH3gKJWHfKymLyxjKU3VBLKIzZrixoro22DhDdDCm+Ur97cOBWlk9ExEoepd36YD+R5M
         2CbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792142075; x=1792746875;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W3JiLMyreebWkEDH2QRZBGzUDxRg9+HMM1gDjRAjytg=;
        b=0b1DNXfLtd6otsJIKNmufe0fKy5uUfEQsLqgSb+fXRjiprx1ZvPZnv7+jqWS6qWwk8
         VHMJ1Zj7jRyumuUGzR7DCBjP3lqF0BTC3LdlUlFiGWSMuvevJqlIsO+Aid6UJYb068uD
         BTdEY/0erdt6/6sFbpaxWVrToUJqVFCI1bdgRFalFD9wwXt4FKsQfenNYg9kmBCi8G8J
         Dsayy7wchXZIc7m1UKORMqh5Zlw/vGjIvAlpQrmgfdpdSIlMpKBUxaRKpCEIPkk19Ijt
         rrbj9h6w8O/e6gHkXA565EwzVZE59+XB6YixOyNASWM1+zetDXx9dyhWcignViO/TVmB
         VOgA==
X-Forwarded-Encrypted: i=1; AKwUvBzqxTapkR255jNr07gFnHzWTtGktVpEFWZQM3wKguvEfdtGVgd097u0PWkONa4bGWiM7MFAH5KzCe3C@vger.kernel.org
X-Gm-Message-State: AFq9FYJVzyQ3JVo4xVFSRVeBdd1nUp8Nv5ya9rXZ0hRKg2AO85bC9cAm
	TpYgpgzk2Py2ZXnBzuMyMpq23xxPL2KpvwcDpnGzohtxaORbOmKLmLrY
X-Gm-Gg: AYBFou0qqwz0dhe2c+vQsi8NUtf+pKAUKeC27XuIizbU0LNAIn2CqQWEX4lKjrwKnKD
	+RXMT2TMEsltb9LMj38yLMenvDBJm2oT1xUmuFLz+AKPMEm6+TdQoda5s4PTL3/O5xkUaLRbrrB
	N/6/NVnT63GuOUUKcql2qnuTGICmZyoSuGpLeXIGio8axWhjjKwcF9ScmqkC2vQCqb3jVuZ6FSj
	hZzl1tdaRHS18UmNhYaVafkJsNRE5BoWUHADicEX7hdfsPAhkRtv9czz9+/EKkLWLxom5uS/Prl
	k+ym8sWfTmWhKUnSDm0XARjppJIT9lxTlwgI0wegpscVLpYEgZIGoAHJ51jgVcXDi0X4hp/JQOB
	PtyDv3xS9HtO4pmuqhEk/SseownvV1Xi2h5HfIyIM48LptIW0dJImuozi/SUgsi8SOSNE3hQX0t
	gsyPyYGXjj5tC9Krr/ocsDr+Bbi+Jg3ub1rZZf5+Oe74D61MUeEooM1qhzwihiyhNgzVpnd2ojD
	Vt1g/YUaDwvz0snUA==
X-Received: by 2002:a17:90a:d44d:b0:3a2:bb45:d37b with SMTP id 98e67ed59e1d1-3ab3aafb452mr18372696a91.25.1792142075240;
        Fri, 16 Oct 2026 02:14:35 -0700 (PDT)
Received: from rigel (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd65497fa3fsm779775a12.5.2026.10.16.02.14.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 02:14:30 -0700 (PDT)
Date: Fri, 16 Oct 2026 17:14:20 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Adrian Ambrozewicz <aambrozewicz@nvidia.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] gpiolib: cdev: don't record a line direction the driver
 refused
Message-ID: <20261016091420.GA63617@rigel>
References: <20261012-gpiolib-cdev-direction-v1-1-aambrozewicz@nvidia.com>
 <sashiko-outbox-168233@kernel.org>
 <20261014043645.GA13991@rigel>
 <CAMRc=MeKQMiF8T+fb1TxUmk-GwF3fCwkB2GoVvEe_kcpbG6saQ@mail.gmail.com>
 <20261015153714.GA105746@rigel>
 <CAMRc=McOWzuqr9qcrbaL4U2_Y==-XfWYo44XVgTkB20JW_5EFw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McOWzuqr9qcrbaL4U2_Y==-XfWYo44XVgTkB20JW_5EFw@mail.gmail.com>

On Fri, Oct 16, 2026 at 03:23:24AM -0500, Bartosz Golaszewski wrote:
> On Thu, 15 Oct 2026 17:37:14 +0200, Kent Gibson <warthog618@gmail.com> said:
> >
> >> We can't protect the flags with mutex or spinlock due to the multitude of
> >> issues that forced us to use SRCU. We could maybe consider atomic_t for the
> >> flags field and that would allow us to use various atomic ops and possibly it
> >> would be enough to cover all the read-modify-write cases we have. I need to
> >> think about it and will also ask the clanker for help.
> >>
> >
> > I was thinking along the lines of reverting to atomic bitops directly
> > on the flags, e.g. reverting b7adfb6076ff, without changing the
> > underlying type to atomic_t.
> > Given that most of the time we are operating on individual flags.
> >
> 
> That's still two threads fighting over the flags effectively, right? Ideally
> we should modify the entire set of flags at once. If that proves to be
> impossible, going back to atomic bitops is probably the next best thing.
> 

Yeah, that change wouldn't resolve that conflict - it is just about
deciding which framework you plan to use for the flags.
The IRQ flag problem, and any other flag contention lurking, needs to be
addressed separately either way.

> > With atomic_t you could also use xchg variants for bulk ops?
> >
> 
> I'm not following, could you rephrase or give an example?
> 

I mean atomic_xchg(), atomic_cmpxchg() etc.
I thought atomic_t was intended for counters, not bitmaps of flags, and
I don't have any example, but I expect the code to be pretty hideous - 
You would need to READ_ONCE(), check the flags are in a suitable state,
update them, then atomic_try_cmpxchg() with your updated value.
Rinse and repeat if the try_cmpxchg fails.

> >>
> >> Definitely! I don't see why I would ever be against extending the test
> >> coverage. :)
> >>
> >
> > Ok, I'll try to give it some thought.
> >
> 
> Please also take a look at gpiolib-kunit.c. It may be a better fit for this
> kind of testing.

Will do, but I was thinking of driving error paths in userspace libraries as
well.

Cheers,
Kent.
