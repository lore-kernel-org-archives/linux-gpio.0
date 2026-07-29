Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748843921CD
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 21:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785358996; cv=pass; b=h0LFZQjgOmpjpJB0Q8MuVXfLC3CObIyD/eatzQLV98tE/plIb5uTlhyrqGO/We5RXv2utQnLYXcewRt93YdZM8clTI95Xn9+YYS+ydRXdZLjgRIJfF5ZLQdHGe7Rjy6GH0+79t13F/G54fKqvmOPKj4UWH9bI9LqMIfaL5NHgIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785358996; c=relaxed/simple;
	bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JO+w96xnubFynosZlI5jG+5PNEr7t9H7pWvZ7EOelJNIWViiCXXGm6l1J40IPD0xaClMr8Jgrn1Mj6Dxa1vH53C2GbYhmaCemQVvG88H/57rjGtrVyNkcS2CSwAN0Xa8VzfWz1ZZmtn2Mxy2YfZrX9Ri13p+AoR3egvmHhYaIqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhLEVgpZ; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhLEVgpZ"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso2031094a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 14:03:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785358993; cv=none;
        d=google.com; s=arc-20260327;
        b=Fq6j3F4rVXKUsgEqplZQ4Cv1NnuyK6wBD/Lx0jbwQhW5xifyM5uLF1EWYbTiJPE/rD
         egHrI7ofia+JBNCVplHFtnrlpoGn6Zws5UNZ0rmtK6G96KE4LRV8GSP9zP7PzXk7/K47
         KG6MPFyKNnVAzvT98ZzIh10zjqDBXgo/Bme05BTJ7m2sShM4HygibzZ9Y1YAPPzi45ha
         u8eNYBc6lZMgxkH1DyRAfRSpEq774FigpUlBOQs7EIjnOQgoxAXFmkex8brSUp5dJlSb
         zXEu4Vn0r/u9S7EYXL5aYBNULP31bhS9XYeERP2LkBFV9wBnN6qwIL0gh3+q9i96pH/b
         29VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        fh=toL+ItrCDfx60/Lc1S5r+WTmbeGTwLhswLGuzY6R/qY=;
        b=p49761lSzuRwi/CWR1lY6Uq3iby4EocPFL4XBTWF1hstHmPW99681spewZQzkrsKGu
         XD8XhKAR40h9DU/JRPtgJpQzRRSf7pW4ejP3jODg53EVUL4qhI2cLPbjYu8PxANXYr2M
         FuH+3vwSHTWu+iRNdcF7t87Q4xeI2MJhUnwQJFXeRA/GDkXmvru6L9Fj2MiPUUj8YHMd
         Y3hrQ61Xga2ScCBk6D7XJRjsfbVIrm52wg6J3D3jsGnETWvBWgdsrY0r8ZT9ZwTVSDm5
         EfxBLkffc36jgc58qOaRtpEnsBFHnxOFnQk+0fQmidLFP2GQ4A50YtSZLCuYDaH0otCR
         2cDA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785358993; x=1785963793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        b=fhLEVgpZEz8wXvNjb/K8L8hZq9GjIlfcTdIsbubqKv2jjsRhzPFuR80pdEpGZfOntJ
         z3jD7A7ke1nxhYxrd+Gl9Hp/kJlDP6K7gMGgD51XhJLBcRd/ZeYkxZIXavmLMC9MiqJu
         JHk1qphZDbwTJyomZL37deKroWdrR4brF0QJqc7NobeD0lI/N4pngWHl5hd5J61r+zDO
         P31nlBNX6JOWUyMcWpBVSipWZ0F/IXOm4Bfb0Bms+U64JU4ACde/H/cab/Ru347YLmJf
         mFaj0xLvAIBO3E7E+WJvzzhFqrHc69NGoJZT1mAABlovBZEAMJ9t2shBkMw6kdfw593E
         99iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785358993; x=1785963793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g318k4aTVUNemyX/qfEfcAL4FBNIpHVejXjEULHegwA=;
        b=czmRF54wOP9bsQ63+x/JApeG8C4Y3X0Kgefh4p2uB7hKni3zB90wXQfdPmHGCettJB
         3doa9keGbZTbZusu4zrHCaEq5yTyQTKhmaL1QYSebV2G5oPaf9Rg33xwRXUqHHX5sbdd
         OGmnzqtjEK1a7SJuQycebmneaJ00UxMKmP9+IbGD7qAwS/knrD3ZuwBWkuxGO/7J9R6E
         UNVhrrrLPWmD0ThfriujMWtGMBkMeP1CN7ugPq0cSpLS91aPNOXUMAIBJUrNMEq8oU+s
         dg6nJXCL47TnNDKzcfc/5nXrYTb5FWN4FXAa44wkbtE1L6h4DBNOzS10CSqre0mDJ9yN
         1DiA==
X-Forwarded-Encrypted: i=1; AHgh+RoS6YDcNxYarPoKY0RBpDgcp2TxxPjJDSe2XBcCrpCJfRiFSCn1EFm+fD9/FBd3mEwEiSij7CXYRLjC@vger.kernel.org
X-Gm-Message-State: AOJu0YzYEBAv+W2b0e8Fbd8Cv+Tf/i/wTgc1tINmDtu0ac/WJd3Bn4On
	oLbNeIwfSdingdUXUn4386g383LScseaD+dhXcuvwdqEznEJJOC9KWL7ef751pcQI+BKSYTvzBM
	u1TMA7QUKpmjfITLr9smoxFeGrnZBMjI=
X-Gm-Gg: AR+sD13IAiY0iUnImyzVkJYEgDRQp2GMfInM3T6ahjighhboJDwNDJHMQTV3hIhQn/h
	htHTi9q+DotlsggV1lmrtV5HK6TONl0DPIUHfVM/FDVcoFj/LMv45NiVxjEZf4V6dDyC8zDt5yl
	RRhI6cw/toL9bX2v6/MXOqmL6OJijkc9CcwJ7pz7Dj0BSAI9G1iLEHaYgDw4RzGmI67iRN1pvxP
	ZzY+rTRqwKkMEShHZtfoqp76yFqASObHn3K/h0UR4F0MTZVcLH4ZB9Xu/4Y+tVX3p6Q9obyrF66
	I/RLy4bborgVGir2laP9qh3nJAKlXPQOFd4G10IeAbHo6YsDEgoFvshcVCscqxr31ktoqwIEN76
	mq9euyRcDXjJD7ggWLytptNbnIXgoMxFynFDYbV4oASrNW1RMPtISaDmKlsAN+5fEdzUWyk3Qc2
	t6ACVhzPbU3KEtyOlWWteEKmuG/OV1s5RVBAhrpKVw7Ql5ax88j04jUEM=
X-Received: by 2002:a05:6402:51cc:b0:698:6084:db7f with SMTP id
 4fb4d7f45d1cf-6a07b7fc1admr21670a12.10.1785358992379; Wed, 29 Jul 2026
 14:03:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727194836.11689-1-rosenp@gmail.com> <a9a2caab-f93b-448a-b846-7e739c143687@kernel.org>
In-Reply-To: <a9a2caab-f93b-448a-b846-7e739c143687@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Wed, 29 Jul 2026 14:03:01 -0700
X-Gm-Features: AUfX_mx4flmj0fEXemuqhYXtdVH7XNcN1VvGWawpVJXNy6WEVYqTNmVDorddp_Y
Message-ID: <CAKxU2N_bPw+_Lw6mSYF9Bj1KT=-y7oJ-_v2rhPBmULjU2p5KyQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: samsung: exynos: replace irq_of_parse_and_map
 with modern APIs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Linus Walleij <linusw@kernel.org>, 
	"moderated list:PIN CONTROLLER - SAMSUNG" <linux-arm-kernel@lists.infradead.org>, 
	"open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 27, 2026 at 11:05=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/07/2026 21:48, Rosen Penev wrote:
> > Replace irq_of_parse_and_map() with fwnode_irq_get() for per-pin IRQ
> > lookup and of_irq_get() for the muxed EINT IRQ. The fwnode-based API
> > works with both OF and ACPI fwnodes and follows modern conventions.
>
> And what is the point of ACPI here? I see no point in such conversions
> of one call while leading everything untouched. Add proper ACPI support
> with valid ACPI tables with ENTIRE driver converted, not one call.
Avoids having to call to_of_node. ACPI in the description should be removed=
.

As far as fwnode is concerned, fwnode APIs are used earlier in the
driver, probably for the same reason. fwnode_irq_get didn't exist when
this driver was written so of_irq_get + to_of_node made sense.
>
> >
> > For the muxed EINT path, change the error handling to propagate the
> > error code rather than silently returning 0.
>
> But why?
of_irq_get can return -EPROBE_DEFER.
>
>
> Best regards,
> Krzysztof
