Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8506850255B;
	Fri, 18 Sep 2026 15:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789746237; cv=none; b=ejG4uh7WQIZ5neQXLHDK7cTt+WVlZc+HKOLdxFYsYq27H1pCi0GGHEvCUBIzFfWpRScBsLCq7/nybjtOh0mLWHDUyIQIvLhrr4nJKlb6lMtwJ8PRRX/p2vnq0lpLVK8T4fUlU8m6g6Om2GrBzqavWpfezD6nfjdIjEPZcDXjPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789746237; c=relaxed/simple;
	bh=xBxzDdY3aNVEWNE7Pl3HkthH7Jw/5hQ9PJG0qhQRIo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b2WAXsHfzNbFDoLCk1yx3G3+dBe8IeWF4+SzfT6+zXyrTIEBhPP6uAEggyta8jJKW+HWcnOkydsYTiKO6Xb3cLBAUPnEiiS4O3dc2XxCcQXvHqmLClyf4rxUso3Ol9SJy/3do92eO3nYwZjoTrwWVzECHrACkrSOjJnj/dXhMu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VePUKWlH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VePUKWlH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A985B1F000FF;
	Fri, 18 Sep 2026 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789746234;
	bh=sQfGDn9yyR3ZXb91yRMgev+vN7oB4VRZv+LNHP8T6Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VePUKWlHD7bUS9I2DIPpflWvvtLQ63sMvJX8/ex/pgsPwJKMGINp2walcskJbIEEA
	 kTPrjW42ZmVq9iM5cZrIJPIVctiqB7HanAOogxNHgAD4qzcqUNStS388ygtwUSZAuI
	 TmkJK2mBQYjKMBFbVXdCEEmlZkVr5Q+zw8bFPqx5Hs3/puoqxkp+lacTCHsonpqXnV
	 UTsngDJmyBK06WLHGsu/rKDwt38WaZhEli1ByD4fQs/SsQ5HCq4IJf4U6MMarkgXF4
	 CFeyGxiyB/69IZwqNqwvs7zZV9StdelW0FJi7BPp256jjzt0PA+LSoLsvkeaknSsdR
	 eY4U+iv1rlgtw==
Date: Fri, 18 Sep 2026 10:43:53 -0500
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
Subject: Re: [PATCH v3 2/3] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Message-ID: <20260918154353.GA4133751-robh@kernel.org>
References: <20260916182641.9768-1-farbere@amazon.com>
 <20260917075611.47881-1-farbere@amazon.com>
 <20260917075611.47881-3-farbere@amazon.com>
 <78b01d9f-5551-4bb8-8fe1-9a992f624810@enneenne.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78b01d9f-5551-4bb8-8fe1-9a992f624810@enneenne.com>

On Fri, Sep 18, 2026 at 09:50:06AM +0200, Rodolfo Giometti wrote:
> On Thu, Sep 17, 2026 at 07:56:10AM +0000, Eliav Farber wrote:
> > Document the optional "default" and "inactive" pinctrl-names and show
> > both in the example.
> > 
> > Signed-off-by: Eliav Farber <farbere@amazon.com>
> > ---
> > diff --git a/Documentation/devicetree/bindings/pps/pps-gpio.yaml b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> > index 383a838744eb..db6ecb17cb54 100644
> > --- a/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> > +++ b/Documentation/devicetree/bindings/pps/pps-gpio.yaml
> > @@ -28,6 +28,19 @@ properties:
> >      description: Indicates a falling edge assert, when present. Rising edge if absent.
> >      type: boolean
> > 
> > +  pinctrl-names:
> > +    description:
> > +      When the PPS input is muxed through a pin controller, the standard
> > +      "default" state selects the PPS/GPIO function and is applied by the
> > +      driver core before probe. If a state named "inactive" is also present,
> > +      it is selected when the driver is unbound or the system is shut down,
> > +      handing the pins back to their alternate function. The "inactive"
> > +      state, if used, requires a "default" state; its position among the
> > +      names does not matter.
> > +    minItems: 1
> > +    contains:
> > +      const: default
> > +
> >  required:
> >    - compatible
> >    - gpios
> > @@ -40,8 +53,9 @@ examples:
> > 
> >      pps {
> >          compatible = "pps-gpio";
> > -        pinctrl-names = "default";
> > +        pinctrl-names = "default", "inactive";
> >          pinctrl-0 = <&pinctrl_pps>;
> > +        pinctrl-1 = <&pinctrl_pps_inactive>;
> >          gpios = <&gpio1 26 GPIO_ACTIVE_HIGH>;
> >          assert-falling-edge;
> >          echo-gpios = <&gpio1 27 GPIO_ACTIVE_HIGH>;
> 
> I tried:
> 
>   $ make DT_SCHEMA_FILES=Documentation/devicetree/bindings/pps/pps-gpio.yaml \
>          dt_binding_check
> 
> and it gave me:
> 
>   pps-gpio.example.dtb: pps (pps-gpio): pinctrl-names:
>         ['default', 'inactive'] is too long
>         from schema $id: http://devicetree.org/schemas/pps/pps-gpio.yaml

I can't help you without the schema you used. Sounds like something 
wrong with 'items'.

Rob
