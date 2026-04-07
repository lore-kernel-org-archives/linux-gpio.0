Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56C233A718;
	Tue,  7 Apr 2026 18:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775587257; cv=none; b=jJmitEt4m5ejeN+cPwpjpkAfDABHHENGRj1J6AbKQEZe3LBwvyjQZhVhrhJJ2+6wLKlZMHtav0Nx/Deb39lSsS/mZoJln5UvO+qxrvO/gvF2g8+5rOMyOWiEnRgaiy7jT8KErOcX2rMiKgjAWj6/YeqXVuy37LVJQ8zwlFREjbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775587257; c=relaxed/simple;
	bh=ctBJBNAL2sZVwDJhXMphkJ4Ne0SfUaEL20su6jHmPpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=br8oIp4UdY+/aQw72CbwbSRMp3BoS+NOupN+AmbOPV4iXJiPi70YPRSQdWPpFP23mRJWnJv5afDOrTI+gkCYfzUtsQDzQoH+ZGtACElcbAwFDuI5yy3rz0qosDDk/tX/j99UAOQECVXeRP1rDJfHcAq4w8dUXq7l9ZDixXA2JQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sI/mLUzr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sI/mLUzr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DA0BC116C6;
	Tue,  7 Apr 2026 18:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775587257;
	bh=ctBJBNAL2sZVwDJhXMphkJ4Ne0SfUaEL20su6jHmPpQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sI/mLUzrYB0p0h7F+qggqo+B7Iixi3QUIFCsUfYOUxnIZWiwOZgq7ZpCn339TFSkK
	 /Bh2Vxl6Ng5B8rBSa7tzwXMlVhRi7hjYXswf7R7EHaz2nIvV0fNuEvc/AbusGP/y5Z
	 9c3TZdbLIIDHjOYNTGyTt4Rx6zte92EOWG+3mssFLmsgbzu7+UhULF/innTCtcaPkX
	 OznSjTzMz2iwVcW5IICmamnUgnIMPjy87/mqyizz+/U7eoWymD5sbqpL8dMZBNbDYh
	 zFpClBRqO00vxOHRu2DZyvpCjlwNyxQWuLHoeEhS1p4r1EmCZeFwUri8Ixtmza/hrn
	 6NnjaEZ03aDRg==
Date: Tue, 7 Apr 2026 13:40:55 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: pinctrl: sun55i-a523: increase IRQ
 banks number
Message-ID: <177558725508.3367275.431498004414263153.robh@kernel.org>
References: <20260327113006.3135663-1-andre.przywara@arm.com>
 <20260327113006.3135663-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327113006.3135663-3-andre.przywara@arm.com>


On Fri, 27 Mar 2026 11:30:05 +0000, Andre Przywara wrote:
> The Allwinner A523 SoC implements 10 GPIO banks in the first pinctrl
> instance, but it skips the first bank (PortA), so their index goes from
> 1 to 10. The same is actually true for the IRQ banks: there are registers
> for 11 banks, though the first bank is not implemented (RAZ/WI).
> In contrast to previous SoCs, the count of the IRQ banks starts with this
> first unimplemented bank, so we need to provide an interrupt for it.
> And indeed the A523 user manual lists an interrupt number for PortA, so we
> need to increase the maximum number of interrupts per pin controller to 11,
> to be able to assign the correct interrupt number for each bank.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../bindings/pinctrl/allwinner,sun55i-a523-pinctrl.yaml   | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

