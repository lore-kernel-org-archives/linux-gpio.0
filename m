Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793724061;
	b=wegWEZ92hjTpGrRnzMLGwfIMg06A7k/Qn+sjd2bnISKZPVCzSEz98CsFGY0amx1bq+zs
	 EE93IWB/HsIzNpSQOQF3FDPDN+aW3tE6WytJ7ywWHdnHtZ9mHfHpZYfrvHITHGT/Qfi79
	 ZQKGCr39yd4ihTe4OPGZ5X5dmP6NlwceW5vE/IPOrDMRAl5gHcOAzPHY4KHYjdyxz5/tL
	 brRsDDNhOTYAI+g5PPGdrU6QGmWuJCwPejQ7nOlJ++nR2ofMaxgyRB9doF7LwNv5+1E84
	 pVX+LcO45LM7Rm1gFilFAarFd3R+hAgoy6O8Hz+QwAUvRPixdytcV4Deg80o7TsQ1qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793724061;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Shr2teq63V8P7ushHBYXKFTTJfhpOja4aluMgZ/Uw+A=;
	b=M9OzkPtvHmJZqYIgFEx3NcidXV8hJOaSRBJK1Kve3Z/kHz3vnCRe/FvaRP7GwcN+sLF4
	 H7yVIryfNaBVP0ChbPk1Fd/4PRPMR5x2C5VuL73woCldm2r79HHBRRWn6uOCIA+XeoBsW
	 FLEJIr6lOro8uvrC46GdUhpz/6UjgmW0/d8MhsYdaybsLe3fnEln/FK3pUQyyrrtFmZ8t
	 zr5JmQ1Sgw9b6r/JLGloUE9ZRD2r6V0ZYzIJe2NjsIvO5RBRk8zf1GURbs874PiVB6ve2
	 aJl9MhexCIqZ1BQmUnrpPZyS+nnX4An528xyNhAJXyo9yoi0mYJpdOgMDOQZwLM7DnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=MqjfaUek;
	arc=none smtp.remote-ip=212.27.42.6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67A6082BDB;
	Tue,  3 Nov 2026 16:40:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A67A6082BDB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=MqjfaUek
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4F8F4780395;
	Tue,  3 Nov 2026 17:40:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1793724051;
	bh=hIo5wKJPZnjho62FTKebqDa+KdYP3W8K2TKY9Ek4sYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MqjfaUekQFvuCKTt/CUf1BBopp/kcg5M3iZ87uBtd/nRtKnBJfAp02aoxBl7fM2h3
	 S9tspLtn+2miYvL3O33DMvrKkdk3IixH/NZrAhZFJkJa9lEUDrc3klMlJ2Tu8fPrqP
	 hyG0EmOouYs6CWYUmATZ1eGbbTdIieM0rWBoegQDVorc8DPHVETgHgH1D832uj7jLv
	 4+JPhBMpxsfYp2j/i51/WozlNaSJVSJ3drk3wC3RGqqle3g35vXJCr+ux9j8XjEqzJ
	 eYK24F0ZHgsKICSoFTbPEbbj0DYsIkfrxmMu5K8DKbZ5z3NUcNUkluqP83Epb/BPzS
	 kEIgfY7oOzMvw==
Date: Tue, 3 Nov 2026 17:40:27 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW pad mux
Message-ID: <auoOe2-9wZhAad87@L30177.local>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-0-0a61a9837744@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v1-1-0a61a9837744@free.fr>
 <aun5TzN6kWdkr5x-@SMW015318>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aun5TzN6kWdkr5x-@SMW015318>

Hi Frank,

> > +      groups:
> > +        items:
> > +          enum: [ iic1, iic2, iic3, iic4, iic5, iic6, xspi1-data74,
> > +                  xspi1-data30, xspi1-base, sdhc1-base, sdhc1-dir,
> > +                  sdhc2-data74, sdhc2-base, uart1-soutsin, uart1-rtscts,
> > +                  uart2-soutsin, uart2-rtscts, irq11-8, irq7-4, irq3-0,
> > +                  evt4-3, evt2-0, clk-out, asleep, reset-req ]
> 
> how to know which function belong to which group?

ok, I get the point, I'll spread those into their respective groups
per the CPU documentation.

For this v2, I'll try to be inspired by the
mediatek,mt7622-pinctrl.yaml and the airoha/ralink bindings:

    allOf:
      - if:
          properties:
            function:
              const: can
        then:
          properties:
            groups:
              items:
                enum: [ iic3, iic4 ]
      ...

best regards,
  Vincent
