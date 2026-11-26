Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795705620;
	b=IDtjRja1Zi/ZHxWBRtu82w+yw/+DaDPu2rdZWabJ23zofX6uYxeM7/r0jW4sDFOh1Laf
	 Bx8dnYAJ97svIQpSgQgs+f1ZwjG/Sg/HSRoRy11QsHmSQdXMAQwnROhRJSPxq/uPhrkZ8
	 ueKyVxqgYGYxZflwwqbx0I6zs0/K+bD79m37wNb2yMbJx0JFS9OxjwmE6MX1mnp8epRiw
	 JeoxuVtHFBrUVIFvXEVd9kz6IWieNR+doDBQyM1mbX/RgCX6BXYP87Roiz8/VVCKuFS6P
	 hE0g7Nwb9xd56Zdgh5eVe2fVzblswRx8uswImOIf87jEyQoVUi1pgx7Op3M7cpYfDvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795705620;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bxM5VILBAKX+kc9GUgzJ731d9LxHWM8/8rHJEkvAc+0=;
	b=1oeDhxtqJzd/xffTIXUAY56dubLA6QJOon2tX//D4IYctfFO/AGYKtOsSUy6OvpbInXZ
	 Ye//yyKnjj55DDp/hwCL/E/2gt7DR7704JkIDscbMEB0qobS6O+43kymPesS9bvQb2ZN+
	 mLIZeOqoyxQxdlWaNvgigp/VPRu/vDEDRA4DqRPN4faLkqwWkEAhWDhGun+GHe8vLyzrF
	 LF3ATub14ulUfusCQcS5lRBHA/PSsaOR0Pt7CkT9pU3iLnWCQ2golPOI2fgvUyzxfQRO/
	 sTxJQkLjHR+IrtsJUy5VwV2bMOEmdMs5LvL11zGhvcFc42u3cYS/mO29BX2DSn1zBfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQhamSem;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7462F606A321;
	Thu, 26 Nov 2026 15:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cQhamSem
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 0CE2A1F000C0;
	Thu, 26 Nov 2026 15:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795705620;
	bh=bxM5VILBAKX+kc9GUgzJ731d9LxHWM8/8rHJEkvAc+0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cQhamSemz+rQWa3ZnZZg4FbnUyMUCqT3iFKeZVQCoQI0C+AxysdNh9mn+sRDQ0mXP
	 e7EsHAYsMRT3qMqYSa498FC/gzc+fy/qGZiS63KOziRCJVZjpKou7Q4RnisaPvyUP3
	 XDmgRKoMKV0zqUwdFIGeUy1GF2tc91INf1yBdWl3Ul4PpIqWw6jGgGi+jj4Jgu30jV
	 KlYTCgbcVQM0BsjOHRBIr03Q23ymYlC9SDwjIk5vJ31/aSe2bl6EB96EhvYhjUepu5
	 5Lv/MLKUnlQkbNUlbPnGUDWMQflWnYDlKiQgVp/8v+0fC2F5DZpX3TKHCBLeqQiyEa
	 HSY3U2LGiOXKg==
Date: Thu, 26 Nov 2026 16:06:56 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, Alejandro Colomar <alx@kernel.org>, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v8 2/4] string: Add strprefix()
Message-ID: <paz72vxna4f5kwp2a7waztsnywzwgbwqtpjxjgy6sm7j256bbs@lsr2jbx5paji>
References: <cover.1795695151.git.alx@kernel.org>
 <a688f0a1c20afadeed42ec4645b44de75874c223.1795695151.git.alx@kernel.org>
 <sashiko-outbox-235501@kernel.org>
 <awgmuC_BnyaEpTXD@devuan>
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
In-Reply-To: <awgmuC_BnyaEpTXD@devuan>

On Thu, Nov 26, 2026 at 01:32:17PM +0100, Alejandro Colomar wrote:
> > Date: 2026-11-26 12:27:03+0000
> > From: sashiko-bot@kernel.org
> >
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue to consider:
> > - [Low] string: kernel-doc parse failure on strprefix() due to
> >   __nonnull_args()
> > --
> > 
> > commit fa176bccb75ab1dcd9cc8e153bcc5112c790bc7c
> > Author: Alejandro Colomar <alx@kernel.org>
> > 
> > string: Add strprefix()
> > 
> > This commit adds the strprefix() helper to return a pointer after a matched
> > prefix or NULL on mismatch, along with KUnit tests.
> > 
> > > diff --git a/include/linux/string.h b/include/linux/string.h
> > > index 9b3e578d9aca1..a6a1953c52e35 100644
> > > --- a/include/linux/string.h
> > > +++ b/include/linux/string.h
> > > @@ -557,16 +557,34 @@ void memcpy_and_pad(void *dest, size_t dest_len, const void *src, size_t count,
> > >  	       sizeof(*(obj)) - offsetof(typeof(*(obj)), member));	\
> > >  })
> > >  
> > > +/**
> > > + * strprefix - string prefix
> > > + * @s: The string to be tested
> > > + * @prefix: The string to see if @s starts with
> > > + *
> > > + * This function determines whether the string pointed to by @s
> > > + * starts with the sequence of characters
> > > + * (excluding the terminating null character)
> > > + * in the string pointed to by @prefix.
> > > + *
> > > + * Returns:
> > > + * *  @s + strlen(@prefix) if @s starts with @prefix
> > > + * *  NULL if @s does not start with @prefix
> > > + */
> > > +__nonnull_args(1, 2)
> > > +static inline char *strprefix(const char *s, const char *prefix)
> > > +{
> > > +	size_t len = strlen(prefix);
> > > +	return strncmp(s, prefix, len) == 0 ? (char *) s + len : NULL;
> > > +}
> > 
> > [Severity: Low]
> > Does __nonnull_args(1, 2) break scripts/kernel-doc parsing for strprefix()?
> > 
> > CTransforms.function_xforms in tools/lib/python/kdoc/xforms_lists.py does not
> > strip __nonnull_args(), so kernel-doc mistakes __nonnull_args for the function
> > identifier when processing include/linux/string.h (included by
> > Documentation/core-api/kernel-api.rst), emitting prototype mismatch warnings
> > and omitting strprefix() from the generated documentation.
> 
> As said in v7, I don't know what to do with this.  Any comments?
>

I don't have an answer but my clanker pointed me to commit b6b0adb6c845
("docs: xforms_lists: support __nonnull_args()") as the right fix. It's
in linux-next so you can add it to b4 deps and sashiko will pick it up
and should stop complaining.

Bart
