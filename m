Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AAB43636B
	for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 17:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197817; cv=none; b=XUDud8YtEKhkFpAhfkQOIQb7Nwnef6UaOoNIMBMgV8YmFoq8O7hqFYU2t5CML3TEGNZ7Te2+vndClh/wj1zvKmOhBSo6HFjaIssyamk5k1sxIQ7C5ljmK+WLe4uEYybMYQMsItM3bFfny2R1bLIN/2T4NNi5PfgBB545kRE/8wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197817; c=relaxed/simple;
	bh=/wO7E5QKaC15lAhQpA1j94hiJjjlZvvf10RtNmDaFJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhiqpY4owNP5ew/rLql7vA9s+/76M0hR7k2nTGwJE3kXIIXX1zsPrt84fiKF2uoaOoU3DGEANXvOBx/5W27U+ds/lt5kI2ldc6zdKh5VVk715xOIGDhh6JQDIXUSk6IzfwDakwkjXQzXHf5P0r9ME8GL5fT7480SGf46CiAD0Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bai50qPi; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bai50qPi"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d5cad1a6baso35827165ad.3
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 10:36:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788197815; x=1788802615; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M+OTxlGaSoeTcGnz71CmZviuhIa8naVJEy7RHcu28UE=;
        b=bai50qPi4jTkYF9ttGPHkK6TrqiTkn6sJDFGf3AdGJ/ELU7bOG+eoJBYbFh2pvr935
         jGL6XZx9P4RvPLNVu1pC9S0X36IM2nTTFBgE8ctzjKX/HBvPcu3reeAyQ703FKFxYQ+g
         Bz7D5US8BAVQwKZQ61zkViyHazQ8ArFoaSBytezckS0rOCIWD1wFr4MnGokaqWDOzsxQ
         tYzZAM/y1Of+FrCZJmP0IFByyL1tyyhp4pCptL+HKgVI8ULWld1z8gKUGzfPBlwgH9Di
         7HYQb4+kLryvWrusZMD9ypZfmTScHFim/ZF7SSauRalBhwItMU+85AWGdxhXUonBHcO/
         WqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197815; x=1788802615;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M+OTxlGaSoeTcGnz71CmZviuhIa8naVJEy7RHcu28UE=;
        b=LTr25G7/sP49aKq5cszpckEFtRq5wvmp9QdxnzPxjsGA7NlJlKygYCUoaiPUQmKhA1
         09rJx5uFA1a2XWEy77hxbORd9kuHTCFMRsW9c76W7isxsfAlIKqKtWcUpN4dN2tYS6bd
         8FJtGReYZhwIhGYo5ZexZ2Nx8Pma8Ahzt/cHNWfap2oSkhrpnz6L6zpawLiOGimHjbca
         YDoMrMgPqjsBrxfQRGnzVs+B1liQ3+mD507Ww9VHzCogfQNDSTDkRhYflLG2kfGcVj9p
         rcAi6/kNHyq1cNT9fFjT03zoDDHTE70S6dlv58FpEjooDvjOKLBL9TJQFkLyjEzlXdsk
         EQ3w==
X-Forwarded-Encrypted: i=1; AKwUvBxHP98B0ubbNwid+qzwimVwa2d+1KYc1CKMbHWAm2PdqsvJlj8hZe7Y/d6NNEMh9/0A0b37thZrh8Qt@vger.kernel.org
X-Gm-Message-State: AFuF++ncedbRf/FWCtFSyF//XY6bmT4cFByTGpMog+g2iBInkbGSHwJr
	5bSCnJ92xan5uxEynSUSCvlU4/1M0O02G9O1BGr4EsIkidVl/tHabIK4
X-Gm-Gg: AYBFou0yyjHGzjE6VmyopHPV8pWn9lNcr0vs/eDotwQdv3WSLTUU2fJOjfhpST/jqSR
	nVKlQsUiyHdKCrdJG/6vYnersrWxfexul2vAahz1g759NDpU9MgN6kSmCqm7TET5Wy42PkMc7aH
	0b83nAatZxTZKlf49WcInnK4XXnd1mUFExZfbN6crwRC7hzf4fjisdTLA6NyXwsr8dLb0Ouz86D
	68OoALsx64VOEHlDcC7XvVpdKCj5Li6Ro9P8CQBCBRmMYRFY21MhLsX5QNSLU6XUFm4YNk7Qe0W
	HlZ4LtO6FKJl/oEEvjDXIVTO1tqEDtHm3J2B9ScDu1d3MbHmdsoNoUBsDhRwBqephRO6/j4Dl3N
	EFyeKLTYsDL7yTR6PPPkd+M/qcclDtsWwfJzs35lcNLQxdCUdJ9qa8K3Zc76tq1/0eBvcBR0OQb
	EcWSyCszZGcJD8g5qeN4n+00wAPcshVkAEYkSrSsw191T0kPAaXZLJ+Y+8RSpv3OwZUbNhAbRA0
	YBP3A==
X-Received: by 2002:a17:90b:4e88:b0:398:a145:5d3d with SMTP id 98e67ed59e1d1-39907b17a4dmr3439777a91.6.1788197814521;
        Mon, 31 Aug 2026 10:36:54 -0700 (PDT)
Received: from DESKTOP-TIT0J8O.localdomain ([49.47.196.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-398a661a0ddsm4840917a91.3.2026.08.31.10.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 10:36:54 -0700 (PDT)
Date: Mon, 31 Aug 2026 21:36:47 +0400
From: Ahmed Naseef <naseefkm@gmail.com>
To: Conor Dooley <conor@kernel.org>
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
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: Add EcoNet EN7528 pin
 controller
Message-ID: <apW7r6IdVx9Cmk4G@DESKTOP-TIT0J8O.localdomain>
References: <cover.1787931313.git.naseefkm@gmail.com>
 <c20005a81b4069f3ff68311629ff7d4678fa92dd.1787931313.git.naseefkm@gmail.com>
 <20260828-chaos-recovery-c99d547ee1b6@spud>
 <apLGtCRjCP1j0u5i@DESKTOP-TIT0J8O.localdomain>
 <20260831-sibling-isolation-3849a5e4845f@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260831-sibling-isolation-3849a5e4845f@spud>

On Mon, Aug 31, 2026 at 05:57:59PM +0100, Conor Dooley wrote:
> On Sat, Aug 29, 2026 at 03:47:00PM +0400, Ahmed Naseef wrote:
> > On Fri, Aug 28, 2026 at 04:51:27PM +0100, Conor Dooley wrote:
> > > On Fri, Aug 28, 2026 at 07:35:14PM +0400, Ahmed Naseef wrote:
> > > > Add the binding for the pin controller found on the EcoNet EN7528 MIPS
> > > > SoC. It shares the IP with the Airoha pin controllers, but its IOMUX and
> > > > pin configuration registers have a different layout, so it gets its own
> > > > compatible.
> > > > 
> > > > The CHIP SCU holding those registers is referenced by the airoha,chip-scu
> > > > phandle.
> > > > 
> > > > Signed-off-by: Ahmed Naseef <naseefkm@gmail.com>
> > > > ---
> > > >  .../pinctrl/econet,en7528-pinctrl.yaml        | 190 ++++++++++++++++++
> > > >  1 file changed, 190 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > new file mode 100644
> > > > index 000000000000..3ce1a5309d09
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/pinctrl/econet,en7528-pinctrl.yaml
> > > > @@ -0,0 +1,190 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/pinctrl/econet,en7528-pinctrl.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: EcoNet EN7528 Pin Controller
> > > > +
> > > > +maintainers:
> > > > +  - Lorenzo Bianconi <lorenzo@kernel.org>
> > > > +
> > > > +description:
> > > > +  The EcoNet EN7528 pin controller is used to control SoC pins. It shares the
> > > > +  IP with the Airoha pin controllers, but its IOMUX and pin configuration
> > > > +  registers have a different layout.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: econet,en7528-pinctrl
> > > > +
> > > > +  airoha,chip-scu:
> > > > +    description: phandle to the chip SCU syscon
> > > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > > +
> > > > +  interrupts:
> > > > +    maxItems: 1
> > > > +
> > > > +  gpio-controller: true
> > > > +
> > > > +  '#gpio-cells':
> > > > +    const: 2
> > > > +
> > > > +  gpio-ranges:
> > > > +    maxItems: 1
> > > > +
> > > > +  interrupt-controller: true
> > > > +
> > > > +  '#interrupt-cells':
> > > > +    const: 2
> > > > +
> > > > +patternProperties:
> > > > +  '-pins$':
> > > > +    type: object
> > > > +
> > > > +    patternProperties:
> > > > +      '^mux(-|$)':
> > > > +        type: object
> > > > +
> > > > +        description:
> > > > +          pinmux configuration nodes.
> > > > +
> > > > +        $ref: /schemas/pinctrl/pinmux-node.yaml
> > > > +
> > > > +        properties:
> > > > +          function:
> > > > +            description:
> > > > +              A string containing the name of the function to mux to the group.
> > > > +            enum: [gpio, jtag, pcie_reset, pcm, pcm_spi, phy1_led0,
> > > > +                   phy1_led1, phy2_led0, phy2_led1, phy3_led0, phy3_led1,
> > > > +                   phy4_led0, phy4_led1, pnand, pon, pwm, sipo, spi, uart]
> > > > +
> > > > +          groups:
> > > > +            description:
> > > > +              An array of strings. Each string contains the name of a group.
> > > > +            items:
> > > > +              enum: [pon, sipo, sipo_rclk, uart2, uart2_cts_rts, uart3,
> > > > +                     ejtag, pcm1, pcm2, spi_quad, spi_cs1, pcm_spi,
> > > > +                     pcm_spi_int, pcm_spi_rst, pcm_spi_cs1, pcm_spi_cs2,
> > > > +                     pcm_spi_cs3, pcm_spi_cs4, pcm_spi_cs5, pcm_spi_cs6,
> > > > +                     pcm_spi_cs7, pnand, gpio0, gpio1, gpio2, gpio3, gpio4,
> > > > +                     gpio5, gpio6, gpio7, gpio8, gpio9, gpio10, gpio11,
> > > > +                     gpio12, gpio13, gpio14, gpio15, gpio16, gpio17,
> > > > +                     gpio18, gpio19, gpio20, gpio21, gpio22, gpio23,
> > > > +                     gpio24, gpio25, gpio26, gpio27, gpio28, gpio29,
> > > > +                     gpio30, gpio31, gpio32, gpio33, gpio34, gpio35,
> > > > +                     gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
> > > > +                     pcie_reset0, pcie_reset1]
> > > > +
> > > > +        required:
> > > > +          - function
> > > > +          - groups
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +      '^conf(-|$)':
> > > 
> > > Why is this needed? Why can you not tell from the group which pins the
> > > config applies to?
> > 
> > Not for all of them: i2c_sda, i2c_scl, uart_txd and uart_rxd are in no
> > group at all.
> 
> Why's that? Are they just fixed output pins?

Fixed-function :  the dedicated I2C and UART pads. The only registers
they have are bias and drive strength, there is no mux and no GPIO
mode.

> 
> > The spi_cs0/clk/mosi/miso pads are only in pnand, which is
> > 17 pins wide, so no group names them individually either.
> 
> That's easily resolved by breaking up pnand though.
> 

Not as mux groups: pnand is a single register bit, so muxing a
sub-group would still switch all 17 pads while pinctrl only claims the
subset. As config aliases they would add nothing over pins.

> Devils advocate thing here might be to say that the dedicated
> configuration node should only be for the things that are fixed outputs,
> and the muxable ones should get their config from a combined
> pinmux/pincfg node. Personally I think that presents a nicer interface,
> where someone doesn't have to go figure out what pins are in the group
> they just assigned a function to to also set the config properties for
> it.

The driver would take that as-is (it uses the generic dt_node_to_map,
which accepts config properties next to function/groups). I kept the
split mux/conf shape to match the other four Airoha bindings on this
driver. If you prefer the combined form I would rather do it for the
whole family as a follow-up than have en7528 be the odd one out - but
can switch this one now if you want.

Ahmed

> 
> Cheers,
> Conor.
> 
> > > > +        type: object
> > > > +
> > > > +        description:
> > > > +          pinconf configuration nodes.
> > > > +
> > > > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > > > +
> > > > +        properties:
> > > > +          pins:
> > > > +            description:
> > > > +              An array of strings. Each string contains the name of a pin.
> > > > +            items:
> > > > +              enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
> > > > +                     gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
> > > > +                     gpio14, gpio15, gpio16, gpio17, gpio18, gpio19,
> > > > +                     gpio20, gpio21, gpio22, gpio23, gpio24, gpio25,
> > > > +                     gpio26, gpio27, gpio28, gpio29, gpio30, gpio31,
> > > > +                     gpio32, gpio33, gpio34, gpio35, gpio36, gpio37,
> > > > +                     gpio38, gpio39, pcie_reset0, pcie_reset1, i2c_sda,
> > > > +                     i2c_scl, uart_txd, uart_rxd, spi_cs0, spi_clk,
> > > > +                     spi_mosi, spi_miso]
> > > > +            minItems: 1
> > > > +            maxItems: 50
> > > > +
> > > > +          bias-disable: true
> > > > +
> > > > +          bias-pull-up: true
> > > > +
> > > > +          bias-pull-down: true
> > > > +
> > > > +          input-enable: true
> > > > +
> > > > +          output-enable: true
> > > > +
> > > > +          output-low: true
> > > > +
> > > > +          output-high: true
> > > > +
> > > > +          drive-strength:
> > > > +            description:
> > > > +              Selects the drive strength for the pin, in mA.
> > > > +            enum: [2, 4]
> > > > +
> > > > +        required:
> > > > +          - pins
> > > > +
> > > > +        additionalProperties: false
> > > > +
> > > > +    additionalProperties: false
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - airoha,chip-scu
> > > > +  - interrupts
> > > > +  - gpio-controller
> > > > +  - gpio-ranges
> > > > +  - "#gpio-cells"
> > > > +  - interrupt-controller
> > > > +  - "#interrupt-cells"
> > > > +
> > > > +allOf:
> > > > +  - $ref: pinctrl.yaml#
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    #include <dt-bindings/interrupt-controller/mips-gic.h>
> > > > +    #include <dt-bindings/interrupt-controller/irq.h>
> > > > +
> > > > +    pinctrl {
> > > > +      compatible = "econet,en7528-pinctrl";
> > > > +
> > > > +      airoha,chip-scu = <&chip_scu>;
> > > > +
> > > > +      interrupt-parent = <&gic>;
> > > > +      interrupts = <GIC_SHARED 10 IRQ_TYPE_LEVEL_HIGH>;
> > > > +
> > > > +      gpio-controller;
> > > > +      #gpio-cells = <2>;
> > > > +
> > > > +      interrupt-controller;
> > > > +      #interrupt-cells = <2>;
> > > > +
> > > > +      gpio-ranges = <&pinctrl 0 0 42>;
> > > > +
> > > > +      uart2-pins {
> > > > +        mux {
> > > > +          function = "uart";
> > > > +          groups = "uart2";
> > > > +        };
> > > > +
> > > > +        conf {
> > > > +          pins = "gpio28", "gpio29";
> > > > +          bias-pull-up;
> > > > +        };
> > > > +      };
> > > > +
> > > > +      pwm-pins {
> > > > +        mux {
> > > > +          function = "pwm";
> > > > +          groups = "gpio30";
> > > > +        };
> > > > +      };
> > > > +    };
> > > > -- 
> > > > 2.34.1
> > > > 
> > 
> > 


