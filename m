Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595628;
	b=d0XdiNjyOFjn45jpbMH5nyUYH32vO2Wmq7T0ELaCtG2+PXFRNzJK/WoPw5t6HcAkB8l9
	 SHPBwcaa2pr4N4hbu6xL/AWp1vA+p1lm2AEki43Vx9CeiQSzmFABPFQUS2p+SSE3zh1s2
	 3bDaKnfgR2Su9C9e2xpf5p8L8N9T47s0t0kymc5fv8JaNo1fSOcVi89MmClatZVLK6M64
	 PsDtiwjLm2xYs5DuYEB2EtrWeZ6KIuBtO/LNlTAYfrmNI/eIscoeZaIucRAJTs2ZYocVD
	 8mh0FwhwFPiQSS5v2wUJvfPkFhERaA9CGY79/tUz25zLIdPbkZsrRyGf/T7kRV++cuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595628;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XT0zzvytIO4H3CpKWXv+xGNfGei+5WGWs5aivBiZYBU=;
	b=mVJlzDVV2GqpuK6Pnm3yQhUmv6NTFWwwLpi2R2WwVTcO7lslJaDhvyejR4dspC7/2VVf
	 a/P9IbKQhfRtgNh9VkC/0Dd1wnlW9caakUIs8GeaHvOtVbdXNnOmxYu2L8HheiGwAH0pJ
	 jghHJxTJ+A/Kd9jd+bsKwHFYm0v/Sfscz4B1JBI69g6WDcP6/7NqsvkF6soeJtlSuwOpk
	 +0M3KiszEIhtZVq5ObsRCMRq8qgY+xpxIHxZ/h+i6jZtbvq6RcVBO1CMuYlcircf7/Wdf
	 GADF4tyXMGoty3RdZxcmf+7ButNs+deEBkqfqtQYUNj/NYsKnCU8K909egjZ6UP/H7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuPxSU+b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 30E34606A31E;
	Wed, 25 Nov 2026 08:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OuPxSU+b
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B84E01F000C4;
	Wed, 25 Nov 2026 08:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795595627;
	bh=XT0zzvytIO4H3CpKWXv+xGNfGei+5WGWs5aivBiZYBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OuPxSU+bewCYDd1OYpqvTwQl/jJa5r1ydQzRYynSncPE0s+bR2wSev0EoFc21yYpm
	 lIZl/k1ZkGQpihIgjQysM6gcHyd086CIAqZH2GZ3v5TjVKMQvoWv5Gqm5uCjGsQ4k9
	 ARox0LDStLmf58VxXC5gEz27NNiIYbjDEN8EJDq+24Fbbx/h8/mkFmo2ZOt79ZhkEs
	 zbxMIFXZuFU3Blkr2sitY0xcYrGtj/ATyYdbsJOOq1hWj3/m7nrxxkLEOtKuVJNapk
	 ANITUoMWm2gBPaso8CoZMt1k5CTGixvg2TrqODKueLCKWUq2WGmRmsymdBj5qAXWt9
	 s2n1OMdDkOpYw==
Date: Wed, 25 Nov 2026 09:33:40 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Ninad Palsule <ninad@linux.ibm.com>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Linus Walleij <linusw@kernel.org>, linux-fsi@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH] fsi: aspeed: drop GPIOD_FLAGS_BIT_NONEXCLUSIVE
Message-ID: <2fy6bcld3qnquytnfjnft2q7fab4jcxpmpwjbsgxfam2wqndi4@gghtmnfdry5p>
References: <20261103-fsi-aspeed-gpio-nonexclusive-v1-1-1fb040c59386@oss.qualcomm.com>
 <84bb623a-151e-4f6d-ba6a-a303838f4aa7@linux.ibm.com>
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
In-Reply-To: <84bb623a-151e-4f6d-ba6a-a303838f4aa7@linux.ibm.com>

On Fri, Nov 20, 2026 at 09:39:27AM -0600, Eddie James wrote:
> 
> On 11/3/26 7:20 AM, Bartosz Golaszewski wrote:
> > There are no users that share fsi-routing-gpios in any of the upstream
> > DT sources. Even if there were, the right thing to do would be enable
> > HAVE_SHARED_GPIOS for the aspeed platform as this is the preferred way
> > of sharing GPIO pins. Don't request the GPIO as non-exclusive as this
> > flag is now deprecated and will be removed.
> 
> 
> Thanks!
> 
> Reviewed-by: Eddie James <eajames@linux.ibm.com>
>

If there are no objections, I'll take it via the GPIO tree for v7.5.

Bartosz
