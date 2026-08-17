Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0414C3AA9F8;
	Mon, 17 Aug 2026 13:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786974441; cv=none; b=KClfJu6xeDyu2GOTtY/pGKj/A3VhrT+iTrYaBeSppOUk5HBDbAYLI3kHrhOygzr1TgneotbEsn6Zcfv9PONZCvVjQA1nhBwOBOqozDHXXopP14BchfiM65G0PlYzzXEhIh02an6Eee/FA08GPK9/2wxUaecN9Ssi2RMXpPAowOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786974441; c=relaxed/simple;
	bh=EY68bNvZhTLk87juN/MjNhsH+4xSzpgiX8cqB0ZQZ3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K2oFfw5E2g3FfIZEScVAty4TWkdSdbHhU061z63oNGqukYdUh8NX/yDgQc/11IMwQ/X7lmylax24neZw8Xg8MhkyFExndw2COHWOk9YokhSNqtBW1/ddAPncjxdwOOglpd4cyTisoVQdRdZU6eq54oB4dH0EyYnhbuR62CMMg6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PWP+K52J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PWP+K52J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43F9F1F00A3E;
	Mon, 17 Aug 2026 13:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786974436;
	bh=k1VQX/8T6qmRuZ70T/Bkc+hmL8lJxIvhiMcXNK7f0Wo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PWP+K52JNw7DpfYOStdKQ13D7jDg2yHZka6RQR4sVeVo0dlnOEtbo2pmcEnywnu/P
	 y73eS+NGv9M3qLuRCRrfszkFSdkK4yOcXRYMXw4FtE+L1XISeHkfYZIuJnzqbcpjkH
	 vlDOhnnKmAq/0S0QHZmRnUdjz4APXxt452ayoMJp5DftMZSR5dHmN1vQaa6Hk32VDy
	 7v8EqdgoAFWA+sS6z2doecA7erhDUGpkZPAYL+laASsqFrbwYwk98S4gm3T4wUm/hu
	 1jebrM5m0TkulYnXjlJYLI7A1SY4Hz1CPKunuxQbQBdWt0uBKi0BfT3oBhavOC9Cb1
	 ZvaqGNj76LwbQ==
Date: Mon, 17 Aug 2026 08:47:15 -0500
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260817134715.GA18207-robh@kernel.org>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-shapeless-onyx-pronghorn-d423a9@quoll>
 <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>

On Mon, Aug 17, 2026 at 02:45:22PM +0200, Linus Walleij wrote:
> On Fri, Aug 14, 2026 at 1:22 PM Changhuang Liang
> <changhuang.liang@starfivetech.com> wrote:
> 
> > > You still did not explain the cells - neither in reply nor in commit - thus start
> > > with that. Why do you need it? Multiple controllers have groupped pins or
> > > GPIOs in registers, so explanation "every 32 GPIOs correspond to one register"
> > > tells me nothing. Why would that matter how many GPIOs is in one register?
> >
> > Since every 32 GPIOs correspond to one register, Linus suggested at the time that I could try using:
> > gpios = <&gpio [instance] offset flags>;
> > gpio-ranges = <&pinctrl [gpio_instance] gpio_offset pin_offset count>;
> >
> > The advantage of using this is that in a GPIO controller with more than 32 GPIOs, every 32 GPIOs
> > can be treated as one GPIO bank. This way, in the driver, converting pin_offset to gpio_offset does
> > not require a large number of /32 and %32 operations.
> >
> > the following is Linus's original suggestion at the time
> > https://lore.kernel.org/all/CAD++jL=tvDBWJHRGGJw4nnox_kcJKn5hwvwz9zxadMRedyvRhw@mail.gmail.com/
> 
> Just copy this explanation into the commit so it is clear why you
> need three cells for this.

"Can use gpiolib" is not really justification. Neither is avoiding a 
shift and/or mask. I suppose there's some h/w attribute here to justify 
it? 

Rob
