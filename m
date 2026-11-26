Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707334;
	b=zl6vhbfr0+WxgSdB/AMQu0K+1v0f5ctpjPrQy+e1uYeL4R2enxEx1ZVgLkZLfRfOehHq
	 I5xzShBuIL1YLvIWFuxw1l2l5EVJEjQP+1l21a4X94qQgL+LmRO1UAJlAkgYBzVhBAjof
	 Wcs7rZUYtSv3CKqJYoFBsMe+KCEt+bJidd9bBGxwolcUxpcFk6VLUX5br9jaRDmJmjPcq
	 rUPAlA3M1vO/XFkHvzpeKS9Fu3SRURcQ8YOWuy/pz7QRcw7H1VTf6jHfH1D2lwNuptZ3B
	 8ORi13PfhCHFgKv2xbAT50EcbZ2jJiioxs8UpljJvkh5TUynaXfMzT0Wz2M9xTTD0Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707334;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=MwA4FYJ46Bvh2A1wTVAqC8aenjVpDEYVSO+CQYzOzSo=;
	b=n9emfsXvMnfIpZsVKgkLKYM1Ff+mg1e/rEB1554azb+/4Kv+hyRZ5pNe6r1lIJbhbJFa
	 Ce5uGOGtiQbJcJQsuvKV0PQyRwm2tBGU73ZsFkCgqDQK87I9/MUO7q1Myqb0NEKPTivCd
	 zPI9Jd1WyO1MdG1S6bR4ifimkA0fTl1+0nSbuzAMwq79iTmhPyJ8iBDjB90gFfOXVrR0e
	 SSQ6uoqaS1IIoanpPrb+XKQ6/UeatWCfsywsJ+/Wl8krUznSrH58cYswAi8Br+KzmLFNB
	 WsxUkQDaDd+gkBnBCx3GYAuHf0QWDwN6UOxTgw9BI2y8HAEtrdFcrsUWDi9aFmQsHOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2QOa7+B;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A2EF9606A33C;
	Thu, 26 Nov 2026 15:35:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Q2QOa7+B
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 4995D1F000C6;
	Thu, 26 Nov 2026 15:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707334;
	bh=MwA4FYJ46Bvh2A1wTVAqC8aenjVpDEYVSO+CQYzOzSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q2QOa7+B+qovfuyD+t5Bi3rriYxE3uXEzuu/SlW0jK8qW/sfXcgsEA0Hdh8C48y4g
	 1D4nL0bcX12dtdW8IYppHrxgTf5yUNQcOLEYbG0jfjzMrL4l3Nc74POFW1DfHMzNph
	 Y/g50ZI2C5eJgZAh1lZ4iAuJ7tg7kQbLvN4woQMG2IKAGlznBGlZ/0JOw7deQNj7H6
	 eAFZcYSSd2CfTMRshOtZWg9GedH7krWlxfMvAnDtv+5xzm1l/XZ8JloBL2NHaeEUMn
	 0Cq0U/yh8ABWTABLi0ZmQ44f8nPpH2xfhapDuQWjWIS7JU5n9b9aCXjnMkDDpFitBZ
	 X3X1ZjXSQGv9w==
Date: Thu, 26 Nov 2026 16:35:30 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Alejandro Colomar <alx@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 2/4] string: Add strprefix()
Message-ID: <abtqjggbxtv5lr3mvfbesxb32l3uwfxpkldp46fcz53vnyaw56@yoyevtktq3vh>
References: <cover.1795695151.git.alx@kernel.org>
 <a688f0a1c20afadeed42ec4645b44de75874c223.1795695151.git.alx@kernel.org>
 <sashiko-outbox-235501@kernel.org>
 <awgmuC_BnyaEpTXD@devuan>
 <paz72vxna4f5kwp2a7waztsnywzwgbwqtpjxjgy6sm7j256bbs@lsr2jbx5paji>
 <awhLO8IijdM_tef3@devuan>
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
In-Reply-To: <awhLO8IijdM_tef3@devuan>

On Thu, Nov 26, 2026 at 04:08:15PM +0100, Alejandro Colomar wrote:
> Hi Bart,
> 
> > Date: 2026-11-26 16:06:56+0100
> > From: Bartosz Golaszewski <brgl@kernel.org>
> >
> > On Thu, Nov 26, 2026 at 01:32:17PM +0100, Alejandro Colomar wrote:
> > > > Date: 2026-11-26 12:27:03+0000
> > > > From: sashiko-bot@kernel.org
> > > >
> > > > Thank you for your contribution! Sashiko AI review found 1 potential
> > > > issue to consider:
> > > > - [Low] string: kernel-doc parse failure on strprefix() due to
> > > >   __nonnull_args()
> > > > --
> > > > 
> > > > commit fa176bccb75ab1dcd9cc8e153bcc5112c790bc7c
> > > > Author: Alejandro Colomar <alx@kernel.org>
> > > > 
> > > > string: Add strprefix()
> > > > 
> > > > This commit adds the strprefix() helper to return a pointer after a matched
> > > > prefix or NULL on mismatch, along with KUnit tests.
> > > > 
> > > > > diff --git a/include/linux/string.h b/include/linux/string.h
> > > > > index 9b3e578d9aca1..a6a1953c52e35 100644
> > > > > --- a/include/linux/string.h
> > > > > +++ b/include/linux/string.h
> > > > > @@ -557,16 +557,34 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
> > > > >  	       sizeof(*(obj)) - offsetof(typeof(*(obj)), member));	\
> > > > >  })
> > > > >  
> > > > > +/**
> > > > > + * strprefix - string prefix
> > > > > + * @s: The string to be tested
> > > > > + * @prefix: The string to see if @s starts with
> > > > > + *
> > > > > + * This function determines whether the string pointed to by @s
> > > > > + * starts with the sequence of characters
> > > > > + * (excluding the terminating null character)
> > > > > + * in the string pointed to by @prefix.
> > > > > + *
> > > > > + * Returns:
> > > > > + * *  @s + strlen(@prefix) if @s starts with @prefix
> > > > > + * *  NULL if @s does not start with @prefix
> > > > > + */
> > > > > +__nonnull_args(1, 2)
> > > > > +static inline char *strprefix(const char *s, const char *prefix)
> > > > > +{
> > > > > +	size_t len = strlen(prefix);
> > > > > +	return strncmp(s, prefix, len) == 0 ? (char *) s + len : NULL;
> > > > > +}
> > > > 
> > > > [Severity: Low]
> > > > Does __nonnull_args(1, 2) break scripts/kernel-doc parsing for strprefix()?
> > > > 
> > > > CTransforms.function_xforms in tools/lib/python/kdoc/xforms_lists.py does not
> > > > strip __nonnull_args(), so kernel-doc mistakes __nonnull_args for the function
> > > > identifier when processing include/linux/string.h (included by
> > > > Documentation/core-api/kernel-api.rst), emitting prototype mismatch warnings
> > > > and omitting strprefix() from the generated documentation.
> > > 
> > > As said in v7, I don't know what to do with this.  Any comments?
> > >
> > 
> > I don't have an answer but my clanker pointed me to commit b6b0adb6c845
> > ("docs: xforms_lists: support __nonnull_args()") as the right fix. It's
> > in linux-next so you can add it to b4 deps and sashiko will pick it up
> > and should stop complaining.
> 
> What if I don't use b4(1)?  :)
> I guess I can just safely ignore it, right?
>

You may but then you can run into maintainers that won't touch a patch
until sashiko issues are not addressed one way or another (fixed or
commented on). I prefer to include dependencies and b4 does it nicely.

Your call I guess but b4 just *is* the better alternative to manual
git send-email.

Bart
