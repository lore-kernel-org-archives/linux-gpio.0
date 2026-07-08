Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E13D3AB260;
	Wed,  8 Jul 2026 08:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498587; cv=none; b=scmZ3nnBeACnRx8sA50QFfZpXFgfsf2uyBLObjnO0pr4rBUQviRYTdGmYwW5N7BUABFpqajFxqQfx77aHSYxtenKTEbVWYwOMRDgJPN0j0gdF4zSQ78gxFMXbKGA2aOyn7dsrLm+vJQLdnMerQvIzRS2fz7wkCYKy/t0bUaWCSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498587; c=relaxed/simple;
	bh=Y2krJb7C0OgCA9sS5ptXPw6N84h4QPJRqHYbomv+/JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aegU76EXoeCZ2ZvGIyXUgIY9B0NUWzDqjCk+S+diJH7SCwFvz8CZdTfc3pYZPjs4SzO+ju6HgH1P4BdklOWa1xsrdAZvfQ8QWL3xHjGT0ZOdPkyIBeBPSIU9VdRItOz1rD1IXWS/Tm1h2T12LVddQKkTzvmW5M+y7YveBHIApyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n0MFymXY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n0MFymXY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5101B1F000E9;
	Wed,  8 Jul 2026 08:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498586;
	bh=hoiMUfefIhO/22z4j/RgowkVzpgWaSO743dDSJkhiCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n0MFymXYZZ0jS7v+5t2t+hCR/lXLM4YqFOLdgP/saTZo6cFSxmGXL1WcMxAjYan1S
	 7CQH17anrzKsY0JUZ9rpJD2C4Tmel7FZQmxCDAFWmL2uOA3axxRRjDr6cnzt2r8jTR
	 8ghLgWPSXkztRp0Kk4ToF42x6QEUAkCSr46WYXE/woToUFsEdB4KCzJMuL3iU+R4OO
	 nJnRzOd8ZtTwTYpoZgWFa0dDYWfO3MX45OcACsOhqMAE4SsaSBlUfQKnxRlpC0YlcV
	 UId3uIo5PXmjAJ00OuFNzyuvJw/hk6Y7Tnl+VC0eXhA+rwMgArAis6nlVHpdNW7PKE
	 Rpu/Vcv8rsGzg==
Date: Wed, 8 Jul 2026 10:16:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 02/12] dt-bindings: soc: fsl: qe: Set #interrupt-cells to
 2 to support interrupt type encoding
Message-ID: <20260708-spider-of-hypothetical-refinement-f7fbc3@quoll>
References: <20260703-qe-pic-gpios-v1-0-6c3e706e27dc@bootlin.com>
 <20260703-qe-pic-gpios-v1-2-6c3e706e27dc@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260703-qe-pic-gpios-v1-2-6c3e706e27dc@bootlin.com>

On Fri, Jul 03, 2026 at 03:30:10PM +0200, Paul Louvel wrote:
> The QUICC Engine port interrupt controller can be configured to generate
> an interrupt on either a high-to-low transition or any change in the
> signal state on the related GPIOs.
> 
> Update the #interrupt-cells property to 2 so consumers can encode
> interrupt level information.
> 
> Signed-off-by: Paul Louvel <paul.louvel@bootlin.com>
> ---
>  .../devicetree/bindings/interrupt-controller/fsl,qe-ports-ic.yaml     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

