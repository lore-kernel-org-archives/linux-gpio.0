Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE29E379C5E;
	Wed, 23 Sep 2026 18:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790186680; cv=none; b=QkXW0OliDuhjSEcsB4tz+j7og5l2uJSxk4HoRPWbY+iFJTT/nKc1rn3tXTFnhVE/7AMuTYF+P4vHCnA27NGtKbkqkErDhiLx5KLR91CB5XYb+itw/yAdlnDYK8pq9JoGF9yYUaRZhzRQDHkJWDGdILgtW3Ft9kjwKs6zp3GwYv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790186680; c=relaxed/simple;
	bh=ofdyPXsLgs+T9+WKwuhrOGwiwt+CbxtaQLPSealxX9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gbli1AxmMAshkFOdVDVdbmlbtfUq3LMg2KoNg7/Gyv9X7+3sEGvMtvbajtlfbhFEFlnpAkO8vJhETGHczTYV6IHHo3GzitakElsOSGBBuhCJJvxc3KMzvbLqCItn6mnabmlluNdDLVm914VODscwcUKieUhqmVGZ1kqF2qN8D6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mOEAgZeg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mOEAgZeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61DF41F000FF;
	Wed, 23 Sep 2026 18:04:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790186678;
	bh=ZAbPirmrwj2PdFd5OMlgTpZCwRlW/yPZlYy3jnHYY6Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mOEAgZeg/sZnGkWDQV4n2ahj7BWIDiRP1s2CFBpju63kkO9dI8/XkuWJAmuvem+pI
	 gNMN5Md8iPSwW39PxzwNWg2VC81ENpL0uIjhq4fi8Jjh4neA4gChDRQrYsMwFdCeDt
	 hY2JhpTQA6o/kAMDlLZdE6yo0HY71RPVpHi+wd2GCKFyDXEm2uTIlnVhtuLqB6pqUW
	 2Ss2MDA8U5iPDLJxE20l6k5qTzmjY5Q3SdaxNfkge8LdW9LQCGlTceo5kH+kGFDf+4
	 dhSuyPtwFa45T/UNpQBLTRDBjJYr+vV2UZJEfvZ0t/CoyWtcUtReXTFijJYoFAX/HK
	 ARvKeKf4s0V0g==
Date: Wed, 23 Sep 2026 13:04:36 -0500
From: Rob Herring <robh@kernel.org>
To: "Farber, Eliav" <farbere@amazon.com>
Cc: Rodolfo Giometti <giometti@enneenne.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/4] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Message-ID: <20260923180436.GK27237-robh@kernel.org>
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
 <20260922103051.5257-4-farbere@amazon.com>
 <67e6d618-f94e-426f-aabc-304078fda5c2@enneenne.com>
 <20260923123605.GB27237-robh@kernel.org>
 <BY3PR18MB4722A1298789CA9897B834F4C6822@BY3PR18MB4722.namprd18.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BY3PR18MB4722A1298789CA9897B834F4C6822@BY3PR18MB4722.namprd18.prod.outlook.com>

On Wed, Sep 23, 2026 at 01:13:10PM +0000, Farber, Eliav wrote:
> On Wed, Sep 23, 2026 at 07:36:05AM -0500, Rob Herring wrote:
> > On Tue, Sep 22, 2026 at 02:46:40PM +0200, Rodolfo Giometti wrote:
> > > On Tue, Sep 22, 2026 at 10:30:50AM +0000, Eliav Farber wrote:
> > > > +    minItems: 1
> > > > +    items:
> > > > +      - const: default
> > > > +      - const: inactive
> > >
> > > One observation while testing the series, entirely a devicetree call:
> > > dtschema derives maxItems from the items list, so this also caps
> > > pinctrl-names at two and fixes the order --
> >
> > Yes, that's exactly what was said was needed here.
> >
> > >   "default", "inactive", "sleep"   ->  'is too long'
> > >   "default", "sleep"               ->  'inactive' was expected
> >
> > Well, that's something different.
> >
> > items:
> >   - const: default
> >   - enum: [ inactive, sleep ]
> >   - const: sleep
> >
> > The common pinctrl-names schema should require unique names so 'sleep'
> > can't be repeated.
> 
> Thanks. Just so I pick the right thing for v6 -- do you want me to
> change patch 3 to that form, or is the current
> 
>     minItems: 1
>     items:
>       - const: default
>       - const: inactive
> 
> fine as-is?

Yes.


> This binding only defines "default" and "inactive"; the driver looks
> both up by name and does not use a "sleep" state, so I had deliberately
> capped the list at those two. Your snippet reads to me as how the common
> pinctrl-names schema would accommodate a "sleep" state in general,
> rather than something this binding needs -- but I would rather confirm
> than guess.
> 
> If you would prefer the more permissive form so a board can also declare
> "sleep", I will switch to it (with unique-name enforcement) in v6.
> Otherwise I will keep the two-entry list.
> 
> > We don't even require pinctrl properties to be documented. They are
> > implicitly allowed, but good to document what users (drivers)
> > expect/require.
> 
> Right -- documenting the two names the driver actually consumes was the
> intent here.

I have no clue why "sleep" was added to the discussion...

Rob

