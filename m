Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9916E51AEDD;
	Wed, 23 Sep 2026 12:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790166969; cv=none; b=gcXISdCBnTdR//7XUPXnZw4l0VXXoKolKFwIvhrIUmMPfPyW3c+bilCxoGFTjp4nevqVmeGKMZXs7IfhPB0+D5/fHhZ5vyMeKWZHClKB3aqJE7mWmLjKYxfLZFU1Sc2jmTfkL95KdLNi0h3V6tcXKk++NDeFr36XIfwk7n0ZO2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790166969; c=relaxed/simple;
	bh=1mVN+sTt73uxAIoPMy9/oGwoh7f1LdTsKh1JSH8kDpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AqDY44OmRBxTQMcDj/gA6Imge0IrLq2Zy1n4kjxpbshvHBWlw841KNdCDsZt8TmuY8+ygoY2Jb/Ro80OHB32WlsdP+UhGXsWdEGzio0FucU9n5vCoXrop832DD8g/c12+OVDM1qvRNktx/lTAWPLxar8Kiz+lXYx5eyvzzg0u4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lqMb1emB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lqMb1emB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D72601F0089B;
	Wed, 23 Sep 2026 12:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790166967;
	bh=0GRuXZmvci0InonxMov9+9NZjW0AOOHS1YgerdCn6CA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lqMb1emB7+Ut8hIz0OVrGH+VdOEyf3iDrHpuRML+6clnrV3JNJ6K0/fLMemtGprUb
	 Z/N2TMjYY5iOXCUz9PcysnzfmCbwSnIXuTGMgjW8Wg6Ztkqn6lzSFQ3AY4P8eCgwPC
	 VXgIccsSp0QbyNNznClGvdHbgrGpSP9wf+GhP6pR3FXnLqZ26KPJlul33IzmszZVvI
	 sR5iKsHobJacPvKOBasBrGvEqgZiOmL/hp2mVVdUMww4moYiQc/SWfICKnAgCVGURc
	 GGBRATc2rJBqOOzbLyyj/YTjnWbctOKek8QuQEiTTDlFCLTD0Gt5T3/eIQ8fLrvk+N
	 3eZLMT6VFcYfA==
Date: Wed, 23 Sep 2026 07:36:05 -0500
From: Rob Herring <robh@kernel.org>
To: Rodolfo Giometti <giometti@enneenne.com>
Cc: Eliav Farber <farbere@amazon.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Message-ID: <20260923123605.GB27237-robh@kernel.org>
References: <20260919171157.5502-1-farbere@amazon.com>
 <20260922103051.5257-1-farbere@amazon.com>
 <20260922103051.5257-4-farbere@amazon.com>
 <67e6d618-f94e-426f-aabc-304078fda5c2@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e6d618-f94e-426f-aabc-304078fda5c2@enneenne.com>

On Tue, Sep 22, 2026 at 02:46:40PM +0200, Rodolfo Giometti wrote:
> On Tue, Sep 22, 2026 at 10:30:50AM +0000, Eliav Farber wrote:
> > +    minItems: 1
> > +    items:
> > +      - const: default
> > +      - const: inactive
> 
> One observation while testing the series, entirely a devicetree call:
> dtschema derives maxItems from the items list, so this also caps
> pinctrl-names at two and fixes the order --

Yes, that's exactly what was said was needed here.

> 
>   "default", "inactive", "sleep"   ->  'is too long'
>   "default", "sleep"               ->  'inactive' was expected

Well, that's something different.

items:
  - const: default
  - enum: [ inactive, sleep ]
  - const: sleep

The common pinctrl-names schema should require unique names so 'sleep' 
can't be repeated.

> 
> I have no opinion on whether that matters for this binding, I just
> wanted it on the record.

We don't even require pinctrl properties to be documented. They are 
implicitly allowed, but good to document what users (drivers) 
expect/require.

Rob
