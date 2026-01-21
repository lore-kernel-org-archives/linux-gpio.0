Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27212EA168;
	Wed, 21 Jan 2026 02:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768962580; cv=none; b=mbZkuPLMONA/v/qsHQxBhdQFOE6uNcqo+zmGSwp88lZ+fOmdixPjf3r4JX9jNNNrNPI/I73QG8x7TOmBFCvRWbangBhaEl7ln1EnkAgg6cXNxNkrrPWvFN4oRj965uA4kHDhnD/MAylVhKhybw1wPULdXcHDoDgx5E4YCE/CJtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768962580; c=relaxed/simple;
	bh=3lC6v7ujAzRgIyKEbWMlVoEHJi+BKzKTq/eIu/NT1dk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Afl9aWXKoGhcfyVU8uISuWisiblRV7Mo7IaKWBoJHTs3byNqDlrs2xlzzp6i2IhESxNnzTFE+hzgRwzkTgF3zn1/yMeU+LZQ5ge0yIhbghCacVHjm4wqz3nah5FDKcdu7UTtHC1SK2oaBwRjFjS33PgxWv+6nkufNWl3rxLDr9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sICbYdva; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sICbYdva"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDD9EC16AAE;
	Wed, 21 Jan 2026 02:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768962579;
	bh=3lC6v7ujAzRgIyKEbWMlVoEHJi+BKzKTq/eIu/NT1dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sICbYdvaxi5YfqkJrmwsCVnvj/92IXQPhOKdNNuCoEzpwKXlB9w45ytNrf7nNu5cV
	 jJNIuSGNQTnqYMX25AAR3MLtiTwxIWxlVFPYaQ7NloxZ1u4JF6D+qL4Wlb8cGA3r+o
	 O8YXkQihujjm+ohlpLMpCZPudV0hBMX8D2Fo7CZ8BowGTRgzdUe/XhqOLUPrd7UOjB
	 w2TrPiq3U5zcl5L1zXG7RHBCyemgNe3JYv8dYlXRXJKGxLMjNoxvQiDrnxTt2YYJlX
	 Ljv31NuFoVn5j+dM/zi7E87SDRhTY4rz23XlfU44TRP531obyWNwco4cPsME2x85kf
	 dwa80dbfI2oCA==
Date: Tue, 20 Jan 2026 20:29:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linusw@kernel.org,
	Valentina.FernandezAlanis@microchip.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v4 3/5] dt-bindings: pinctrl: document polarfire soc
 mssio pin controller
Message-ID: <176896257768.1835066.8192982391842226399.robh@kernel.org>
References: <20260120-elixir-salute-dd6ec3d9f5fe@spud>
 <20260120-crewman-unmapped-27c32b5d3163@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120-crewman-unmapped-27c32b5d3163@spud>


On Tue, 20 Jan 2026 18:15:41 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On Polarfire SoC, the Bank 2 and Bank 4 IOs connected to the
> Multiprocessor Subsystem (MSS) are controlled by IOMUX_CRs 1 through 6,
> which determine what function in routed to them, and
> MSSIO_BANK#_IO_CFG_CRs, which determine the configuration of each pin.
> 
> Document it, including several custom configuration options that stem
> from MSS Configurator options (the MSS Configurator is part of the FPGA
> tooling for this device). "ibufmd" unfortunately is not a 1:1 mapping
> with an MSS Configurator option, unlike clamp-diode or lockdown, and I
> do not know the effect of any bits in the field. I have no been able to
> find an explanation for these bits in documentation.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../pinctrl/microchip,mpfs-pinctrl-mssio.yaml | 109 ++++++++++++++++++
>  .../microchip,mpfs-mss-top-sysreg.yaml        |   4 +
>  2 files changed, 113 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/microchip,mpfs-pinctrl-mssio.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

