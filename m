Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E373555C30F;
	Wed, 23 Sep 2026 15:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176541; cv=none; b=cVF8+2PBgdc9Rr3uinj2mdoZT4OBXXPfqNZKFVn7Cc6uqN/yxGqqW5YUD39RDB74uUAmqaS2WsCTlakrKtny0+I0uPS+9/Uu+G0Z5XzpSPQ77G141E0W+wQeAn2q5u1/7Yk8OFwRzzaPrekdtfTY8XzdFYGiZoGO4zFSEMFNVSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176541; c=relaxed/simple;
	bh=PSoTGgwxFO1uCvYDRzbcGxm/t8J0kz+SLJBinX5fy+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfkBQ6PEacJSDUufxvme0ezEO2LLd/4gNCR0rrbQgl69SoDJD0P9nvYQF+kGPgsDu8K36xT92LKZAoONu5gl5o/VSfqyieE8XrKRrNqzrbzHX3AoEp2NgP7K+eqHWRWv+k1tVtB/a1apDgTynyxzWr04D6v3PRvwgSSJSKtv1lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FgPU2hoo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FgPU2hoo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F611F000FF;
	Wed, 23 Sep 2026 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790176536;
	bh=PaGX3PY3xLIFNuvF1m4eTRbikorgJo9leVEOR5Sev2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FgPU2hoo4XtjoaYWhuTRw+nVRcqmOthcztcu8bVLLcDNgqcQyE+g5OHNKVl8FUhl8
	 ZrKOmxDo10BO/4Ht2lnXA/fMA+Cm+BsFauq+IRhzUFKD1fB7kNGSWxYiPe9tMU++1G
	 a8WyJaVPxPZY7u9BwztISjUeI3DySmetKDFeGjvZAqMfdlvOdeifkDV34noa4K91dO
	 7UgIj7MHv3DxWnTbo0icazxI8FE+0zZrWQBEVt5c5bFCuBulQ94c8S3KCwsF4nVnwq
	 OoL7RN1RIsiRKWl2Gk0pQjasRbFxVEBCJ/Ci8WrLZ0L7R2La3e6K6VwY5Dp3Nm1JN3
	 3RyPuaRACMK2w==
Date: Wed, 23 Sep 2026 10:15:35 -0500
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
Message-ID: <20260923151535.GF27237-robh@kernel.org>
References: <20260921232551.3129244-1-robh@kernel.org>
 <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV7D4RZ6zA_0jBqnCz8gee2=9bbNAXETbbNQxANhJ5pZg@mail.gmail.com>

On Tue, Sep 22, 2026 at 03:18:53PM +0200, Geert Uytterhoeven wrote:
> Hi Rob,
> 
> Thanks for your patch!
> 
> On Tue, 22 Sept 2026 at 01:26, Rob Herring (Arm) <robh@kernel.org> wrote:
> > RZ/V2M pin configuration nodes describe the I/O voltage with
> > power-source. Add the property and allow the 1800 mV and 3300 mV
> > values used by the DTS.
> >
> > Assisted-by: LLM
> 
> Dear LLM: please consider the actual driver source code, too.
> 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> > --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> > +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> > @@ -73,6 +73,9 @@ additionalProperties:
> >          bias-disable: true
> >          bias-pull-down: true
> >          bias-pull-up: true
> > +        power-source:
> > +          description: I/O voltage in millivolts.
> > +          enum: [ 1800, 3300 ]
> >          drive-strength-microamp:
> >            # Superset of supported values
> >            enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,
> 
> drivers/pinctrl/renesas/pinctrl-rzv2m.c does not implement support
> for PIN_CONFIG_POWER_SOURCE yet.  So I'd rather not advertise the
> power-source property in the DT bindings until the driver is fixed.

What A driver does, doesn't really matter. If you use it in the dts or 
the client(driver), then it must be documented.

The alternative is remove it from the .dts, but that feels wrong to me 
knowing that you will need it some day.

Rob
