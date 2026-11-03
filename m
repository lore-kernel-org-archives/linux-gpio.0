Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737239;
	b=RAoyO4KxMNG2vMdxS9PY2SOkCyJa21z4zf0foUy3gVVHCmKXdcuI3rzsXsu88zPyaqJv
	 m3Bg56Gfsq4fVduhwOTY6t6W1OuH1heoeyI9s13sqesjWkDqezitbPuTsmWTvnsdvqyil
	 34cc9LwKe7ScZn0gSlf3YE5T0UXay9IF8sgEbrnC3tCwVt6p+OzcM0eRdsH0EfXFXDbBL
	 xLeQLUeTqEFCDaDUgIAU5FQU0A3P24uoMG9nE+TefxX4bkOL7l/l+AVovX+eOFC3JKbEK
	 VYf0geP/Kju5tPqFwgtyx9jrb0MjC3JjeiSnnEMME8Lnn1oWXLYfsqrKFtcoht5Zlew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737239;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=IUqvrTFx/K9gimEKml2NBPNOGsMG8AhbzuFakDXurYY=;
	b=Ql1uxXeXB5tPHiJJlJFvu+aMPNAKhn2+SAAAuuoQdj/LHrJfws2ORcKuO7R7t4KWUV0b
	 nYNQlrY3Paokzm0j43QmU6gvMixYCETnTyGkC3AfY3WRlhrcYuwiRZ0Pk50h3aN3yNWh/
	 tnHWZbONy1Jo62L4Yx4vc+mFKamZQuX0JqJQHX+ZDcnaebemXTt7AWRD/CgEDKKYrcD2C
	 PFixqhc1NiQGhnBW/LvzWvwegx0F5AsoLh6IxdAM30ZRJ3AxMgRRyYn7y9nhWpodaceq6
	 NGXcIxKMLAKbpNAITGzMJKSZzddiJwvDCAOTE8EMumtA1PbmP1Or94hZFnQeyUJg+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=M1WpxImR;
	arc=none smtp.remote-ip=212.27.42.3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2346F606A324;
	Tue,  3 Nov 2026 20:20:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2346F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=M1WpxImR
Received: from L30177.local (unknown [82.65.104.223])
	(Authenticated sender: vjardin@free.fr)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 2315113F879;
	Tue,  3 Nov 2026 21:20:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1793737230;
	bh=pWeUyM6RmTRIJwmZpWd83pWgMmzCsnHnooQuFRo17E4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M1WpxImRjmom39Ius3QyNuflJtzxPVkktY45SdPzp5AfVrM2zR1QFBZ9+kOKroJpN
	 fQ+FsbipAeSvkPm6++hiV6tDvNRbYbaKyI8rAi8OeKWPQo3bVgb6TePI0wRWC6Wci3
	 CmBhEKN3neytI33DBcfdw6KEdR0nBjh/aPUKl3vFBPCTuFBVS7OHQrSLfDoz2zA1s5
	 6qvj16NNh8s95DrL+1sHrXkJX1Z/tN0keyx/H08Mg/3DMllMZ3dQyH96vBh7xxPeUQ
	 vPb9el4sU0QAtFIyfOuwHLEHsc631CnpLd5iRFJtm7g23SSZzPBuOjWS48Md/7Bghz
	 /DCBEqK2p5hzg==
Date: Tue, 3 Nov 2026 21:20:21 +0100
From: Vincent Jardin <vjardin@free.fr>
To: sashiko-reviews@lists.linux.dev
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: pinctrl: add the NXP LX2160A RCW pad
 mux
Message-ID: <aupCBbNlYGFWc8Cq@L30177.local>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-1-3aad0860b984@free.fr>
 <sashiko-outbox-195824@kernel.org>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-195824@kernel.org>

Hi M. Bot,

> > +          enum: [ iic1, iic2, iic3, iic4, iic5, iic6, xspi1-data74,
> > +                  xspi1-data30, xspi1-base, sdhc1-base, sdhc1-dir,
> > +                  sdhc2-data74, sdhc2-base, uart1-soutsin, uart1-rtscts,
> > +                  uart2-soutsin, uart2-rtscts, irq11-8, irq7-4, irq3-0,
> > +                  evt4-3, evt2-0, clk-out, asleep, reset-req ]
> 
> [Severity: Medium]
> Should clk-out also be listed in the function enum (with a corresponding
> if/then rule in allOf allowing the clk-out group)?
> 
> The other single-pad groups in RCWSR14 (asleep for ASLEEP_PMUX and
> reset-req for RESET_REQ_PMUX) expose their encoding 0 primary functions
> (asleep and reset-req) alongside their alternate functions.
> 
> For the clk-out group (CLK_OUT_PMUX in RCWSR14[5:3]), the schema permits
> the gpio (0b001) and flextimer (0b010) functions in allOf, but omits the
> primary clk-out (0b000) function, which prevents a board from selecting or
> restoring the CLK_OUT function via pinctrl states without failing schema
> validation.

No: the LX2160 doc states that CLK_OUT_PMUX 0b000 is reserved
and then it seems it dropped its CLK_OUT section (per the revision history).

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr?part=1
