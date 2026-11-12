Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492394;
	b=kIa9PHykOgKnU0Ejiiv8fCedLkPqFGnY1wYAEc4xTK/4FoZSQVJ5gzRLJs01Ye8S7vu4
	 +s+arAFbd+ZRbngSgohCLR895gZ4rYL9hl6XGGMt9wX/jKo/ypY1fmtxzodhZJnACaTrd
	 lDoumYsvZmGyvmyTdDc6tsWIXRRv1pBIKSPwBziQ6FmeaJfU8wOTqokfaL3+LZwQ6ubNw
	 atmr3j2IQVT9ajKwwpIc4QOdwZ4BBminCMuJ9tdcNvupxipn5OmQgU3p+x36VRpcddtYf
	 RBgd2KsEPPuR/b1EDU7wj22rv2ZFB9A9b1J9Qjxlge64R0eWh/OIW1m2XSMSXfeDDnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492394;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zDCO7ouaSunkp4MTjiqP7UYNIy2OqoHg5A1S3F75hlc=;
	b=NLkBEJV9nqEvzOVypf4kUWg+IinuE1OzDiNwfbrk/wKnphIFKNE6+FQxRao+jUz8rRCj
	 hwg+WCB4Nzp1U6bcdW5jYVoxNG3hxV+Y4jkswEmK/4AsWpAOU+mSAVe/35pEUGKBEOAUg
	 fYBSJzzbLfTje1t8qUpX9QMwjgUr2wkKfzv/GRBz2dPeSRqcx0UTwXzKJ6fVjN0U+rg9l
	 FGmAtYq3dhKoc2zQZNaAk73T9YDX7q9cSyJ/2w2ocrNxc4wpTKg5gxrRpuxvAywCSs/EB
	 XMAIZNisiY83LqgBn67FG1a4IzXG+N6xXeTtC4Swv1GwgdTh5wEZ/pRyuz8T8UFUvzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enWojUap;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E066D606A8A7;
	Thu, 12 Nov 2026 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=enWojUap
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BFCA1F00A05;
	Thu, 12 Nov 2026 14:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794492393;
	bh=zDCO7ouaSunkp4MTjiqP7UYNIy2OqoHg5A1S3F75hlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=enWojUapXWF+uuEk1LyjRL+SktuIfi9mdASKnJVWCYVLR3DIrMwLFDJOITRKjpYc4
	 XZVu7O4GIApwBfjGBF2Ske6wooXRzWv7u/JWkhgKjf4WtRIXxWH/MEMJ0dlPbYRzFY
	 cXJ3UG95DL4J0UlFBPKTp5blKGaGWHEvVsfO0vfbdtm2BV4TBEzomuWLh6h+mRLC2/
	 2d+50yeoqvCWyynEqHbOZKewCbxifI8VPIz8n0w6H/yEXuLhZA1dg1+TCXQZbmPPgg
	 w8bkypeepEjm+UuJeTEYjcSGpAZXNHW2IOlSwtt1LcFHLVTXp4V9F4Gm7FYqOlYtTj
	 1eAyLCWa6S7IA==
Date: Thu, 12 Nov 2026 08:06:31 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, mfd@lists.linux.dev,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: pinctrl: nomadik: Convert to DT schema
Message-ID: <20261112140631.GA386710-robh@kernel.org>
References: <20261110-ux500-pinctrl-bindings-v1-0-a9f0e9d12d19@kernel.org>
 <20261110-ux500-pinctrl-bindings-v1-2-a9f0e9d12d19@kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110-ux500-pinctrl-bindings-v1-2-a9f0e9d12d19@kernel.org>

On Tue, Nov 10, 2026 at 10:58:34AM +0100, Linus Walleij wrote:
> Describe the Nomadik and DB8500 pin controllers, GPIO bank references
> and nested pin configurations in DT schema. Preserve the existing
> ste,config references and numeric configuration encodings. This adds
> validation for the pin groups in the Ux500 board trees.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
>  .../devicetree/bindings/pinctrl/ste,nomadik.txt    | 148 ---------------------
>  .../bindings/pinctrl/stericsson,nomadik.yaml       | 113 ++++++++++++++++
>  2 files changed, 113 insertions(+), 148 deletions(-)

Same comments for this one.

Rob
