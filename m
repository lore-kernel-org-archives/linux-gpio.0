Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A3132ED40
	for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2026 14:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927621; cv=none; b=evlQ6MvFadU226kGHy3VIDR/BuVdkVIgokA8hgzYHtM/d2atP8Bk/0mDeBDKJd+Ie4ps3GjjNVkc0vLlPZ/uQ5TjJX2ipaOw9ZBk9fZBcl2yf5nUPy6Rm+xBUNMx2fZZXBpRFSH6dQwE67NCPxEweAC9oVW1VqyN7qYc7FxbOvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927621; c=relaxed/simple;
	bh=IbqMzrlz9jgGlgu5Uii9Ty2qq2/6s962gHem3A+myDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aokWxSNin37CLVUSSUFnu3N/hoFVphQYLYi3yUeCNFsjyz7PM/zjo/MYwei7JlxC7z5u7aXSlvajuoKL009Get6Pd/BSqOqsQHcx19QMHhQL9bhtwujGHROowlKmOCTs0IaaO+CxhZVFaPC9xSE9bw3lZHg+f5oijEOpYyVnIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6FFl5zo; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6FFl5zo"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cedda2ce6fso7128175ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 28 Aug 2026 07:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787927618; x=1788532418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7BQwW3MX7INivSrsHmDm9zXMIwP0LHR3yDP5aFEwWB4=;
        b=X6FFl5zoD9u4203ixJrDcm4jGahhapRqbV/ESud33cwo2Kp295JzvlRHWxE37Km3RI
         2j+WGEie+iR6kUclbnnTSvvE1CgX7RkokfNGHr51k0quK6HiKvSOKwgiJ89Ewt2OjIee
         2zYBf125URlpWHelwAspmDqWERSLK0y2WGMMsiKI0oe6wNbZOyIa0v+gxvAJVhD3GaUM
         bbqiW79hIQXxhKv28de+o+a47sqGMg2CxpekrH+8devcybbRrUvPZOMx4vQ+mN2YZqH9
         m/mFrqJWm76akxQqTHTGRVXe7fkMSalgeDWx7QX9up5oAhSHUEeiwH1Nx+b+MBMI5dHa
         kEMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927618; x=1788532418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7BQwW3MX7INivSrsHmDm9zXMIwP0LHR3yDP5aFEwWB4=;
        b=NrJ2d3lxhUtEeJ3eCiLuc15cEy/anuI8byo+DmZt/04urwJp9trtK61qJTJkdz70yA
         X9KlyzhaNfD9pLTDUHuCBhnujDSNteUPXl045XAf5/vnjfHOHZuSvjc4lU6Ui3BtmIbW
         6mChYo8ci4CKL2xD+Wnz7NJ9L51AbwX/MzG/w089o/2ElLmDixrxpt37Q5dOUyG3r1DR
         3g/Cgi7B7wNd4FA1zqQyfWCarQbdbF9kQCf9V94gPFlAyKqX6WKizTI1VUIMg2M1DPLM
         aOsoRSfGeREZrnvnt9lImH0sMcsUsln6pUF4QwdZJYjCNs4sfyEDM3ycr3kcaXX1vPkH
         YeSQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr69N7IwSUBbj6PRVTouvgNSINiy7zTkiPQkJjhon6l2Vj8TO1lkqnDAlbrORPCZ1YbvyWeoteXO8J6@vger.kernel.org
X-Gm-Message-State: AFuF++n0WyupD3VD+WNPwJzn3aDzzZpPI5z0Q/eWduF1BOgO5XByoRkb
	59xsXH1pej4R3ySC0mAOlSv9/eQCjOJYBpYh5UME7YclezoqzqyOkYdn
X-Gm-Gg: AR+sD11Fc7gb5tpNkGWanqw8Uvag3g+iyplUZRombA3T3w66nVLGPyoJvinqoUpOVo2
	5Pc7dJDxO/BizBrGNdQr3z0PAng2vzcmwN4YKCpGmYS9hJmIl+Yucf03CVrQ3TlpGmk2/eAZHLp
	OQ6FysLiFbiOGbBwH7ulGdntax9tom9+qyFG6XhKPXjwSwfO/E7zztV5EN14ChLbNa1P2RuWdN/
	cJsBykZG9Xlbkt6Spfh/7tIpLsMM8zEgDOZcKjdePaYku+/bT2eGuWTv40w9QP0d4uhvdjy0c3S
	9BMU8Lq2Of42VxRKXAp6EycLY7k5BVn+H3ISgtsjSrucDlwkCHJfgOp3Fe+EC7LpXy36YsPDlaO
	xukRok6gRI+36d9c0A3aKwIKOUWgKSoxcdgQ1i0DfedBaosmKDIiMtvM0KekfHsSzit3YF74SIH
	hvM6Jwi3+GToPjmuSS4wsQlvIsC5DWA8bP87rQqd3Dw1D3SVh94jGxDCtJyAnW/jE4JdjblRIce
	PBG/m4kBQ==
X-Received: by 2002:a17:90a:d2c6:b0:392:c80b:8eff with SMTP id 98e67ed59e1d1-396d0f6cb36mr15006187a91.11.1787927617279;
        Fri, 28 Aug 2026 07:33:37 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([157.51.225.221])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36ed6sm2793476a91.2.2026.08.28.07.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:33:36 -0700 (PDT)
Date: Fri, 28 Aug 2026 18:33:28 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>, linux-gpio@vger.kernel.org,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <apGcOAUpb6XZ2Iud@DESKTOP-TIT0J8O.localdomain>
References: <cover.1786262697.git.naseefkm@gmail.com>
 <7e6150b186c2d16820d7382bce065596a0854a47.1786262697.git.naseefkm@gmail.com>
 <20260828-adorable-bug-from-arcadia-fcad00@quoll>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260828-adorable-bug-from-arcadia-fcad00@quoll>

On Fri, Aug 28, 2026 at 08:59:57AM +0200, Krzysztof Kozlowski wrote:
> On Sun, Aug 09, 2026 at 12:04:59PM +0400, Ahmed Naseef wrote:
> > +maintainers:
> > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > +
> > +description:
> > +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> > +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> > +  registers have a different layout.
> > +
> > +properties:
> > +  compatible:
> > +    const: econet,en7528-pinctrl
> > +
> > +  airoha,chip-scu:
> > +    description: phandle to the chip SCU syscon
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> 
> If the entire address space is part of the SCU, then this device should
> be part of the SCU, e.g. its subnode.

It is not: the registers are split over two blocks. The GPIO, interrupt
and PWM flash-mode registers are in the block the node sits under, and
the IOMUX and pin configuration registers are in the SCU. Both are
needed, so whichever of the two is the parent, the other one has to come
in by phandle.

> 
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  '#interrupt-cells':
> > +    const: 2
> > +
> > +allOf:
> 
> This goes to the end of the file, before the additionalProperties.
> 
Will address in v2.

> > +  - $ref: pinctrl.yaml#
> > +
> > +required:
> > +  - compatible
> > +  - airoha,chip-scu
> > +  - interrupts
> > +  - gpio-controller
> > +  - gpio-ranges
> > +  - "#gpio-cells"
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> 
> "patternProperties" should follow "properties"
> 

Will address in v2.

Thanks for the review!

Ahmed
> > +
> > +    patternProperties:
> > +      '^mux(-|$)':
> > +        type: object
> > +
> > +        description:
> > +          pinmux configuration nodes.
> > +
> > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > +
> > +        properties:
> > +          function:
> > +            description:
> > +              A string containing the name of the function to mux to the group.
> > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
> 
> Best regards,
> Krzysztof
