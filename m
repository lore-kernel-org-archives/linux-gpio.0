Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFCD3F58E7;
	Mon, 10 Aug 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786372814; cv=none; b=GFZhUE6SjipR1bAPOTYmhmwLPr6fEvmKKluyUzI7jYW0CTsWnOKP7Y9KUBZuhlvlrBaijoEY6JHe7Z126uvDK4dHWr9oU9iisky2ehVvyeu/Z7cT4r4wDUKyiBvvKpncWN7YMNHZqutUhCb4DfoHMy7B4ap6y3n9BTwBsuwfg+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786372814; c=relaxed/simple;
	bh=mE+bt9yP0cV9E0MvXVLJRrkCjP3FY5wHKsLet1szNWU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uqVgmH+quqtAbaJ1DGhkmOph1+SyXKyG0sIm9fwrhjuzA6iJT/CByeC9Uo3yvNlhbrQk8kMI0mgNDlQf0Ho0AxXdDC9mdmUmhn3/icXbS/c0ta41UfUE34Hzy/Fpr8qjh1s9eTHJX56UJ8jCFFo4iCcRG6icqqybF42/xf4Qkp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieceNF4m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieceNF4m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1571F00A3A;
	Mon, 10 Aug 2026 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786372812;
	bh=8feQUfAa8YgzcjKaeXHGn9dNOOz7m+wLPxIS5k4j/MI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ieceNF4mq+jG+Dn9poFV2sy4oGAKPx+7xU5KtivSxNxEmRn1XyfdINcSY4N6yMzzA
	 EFhnOsszlCm2mN8SbX+9LWyQu/gBZzJ57kceLRojqU3dsSSG5mqjwHzJ6ttxB7YEDp
	 ZSC/V70qwoSxt6wjfPZ4P11zyFosdSFhHUtU+A5SqCs3peLgKTkrloJmWINeNRiCTE
	 Xa2JoSEgM1Yy4qC6AA9MTEzafBq7WId9xtEHWW0qUlvwSGF+C2YGEcpNplVdtf15+r
	 GimqrKhAF4LFM5O4KazMYbr5Gake3e9yYsqNrZ59FGQYGvsfn5POi4mdxbpmqB97zE
	 uVrll3d5171bg==
Date: Mon, 10 Aug 2026 09:40:12 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
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
Message-ID: <20260810144012.GA1574021-robh@kernel.org>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>

On Mon, Aug 10, 2026 at 09:51:07AM +0000, Changhuang Liang wrote:
> Hi, Rob
> 
> > On Sun, 09 Aug 2026 23:36:32 -0700, Changhuang Liang wrote:
> > > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> > > controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 164 ++++++++++++++++++
> > >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> > >  2 files changed, 181 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl
> > > .yaml  create mode 100644
> > > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > >
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.exa
> > mple.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl): gpio-ranges:1: [4]
> > is too short
> > 	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See
> > https://patchwork.kernel.org/project/devicetree/patch/20260810063650.23
> > 9303-4-changhuang.liang@starfivetech.com
> > 
> > The base for the series is generally the latest rc1. A different dependency
> > should be noted in *this* patch.
> > 
> > If you already ran 'make dt_binding_check' and didn't see the above error(s),
> > then make sure 'yamllint' is installed and dt-schema is up to
> > date:
> > 
> > pip3 install dtschema --upgrade
> > 
> > Please check and re-submit after running the above command yourself. Note
> > that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> > your schema. However, it must be unset to test all examples with your
> > schema.
> 
> Hi Rob,
> 
> Regarding this link: https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/gpio/gpio.yaml#L71
> 
> It seems that the configuration to support #gpio-cells = <3>; has not been added here yet, is that correct?

Shrug. Based on the description, gpio-ranges doesn't depend the # of 
cells.

Why do you need 3 cells? You haven't described the cell content.

Rob
