Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779975;
	b=ejTum6R1NmjEegv5OTACsFmmq4wprPtYHn0kT9dOijzPkA6waA0ArqdGO9Jj3CEZVoEI
	 DUCwKOeadGvFLA0BvfarhYnQTgLaPBUqonWllRtXkr6ia2xtjwCnH2K1Dg0go8RBqhMZ3
	 enUyzmF0O6KpdFP8DAohXUvrsbDvM96c8M4N8eeicK2zgh3gUZjftBJ3Sn6+qHmk87o6x
	 KVO3cjaH98usLOfMgJuWdziBYDulti3mSr+ZTKwuak4Sy1txTDPXJZwwXNqzbtQTbUdXF
	 OGUAd2KWbiJs34mI8eUy9DQrTTUM6eXUsj0Bk8JL4gINJ096dUDVk8rw66Lur1GbfWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779975;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bSzK5TlzBltb+pOY5OWvPx/UiScbb37/iKI+Uoog/W4=;
	b=L2Oxdm7lZy9z9Fd4WUFDQUeGGzkJXy/MATy0Gg3OgKt05HdeBTt9b0tFfFOM4Bd/lNw3
	 iOMWoyTst3WrJUue3ogwOUrhsUD3hJSH2sjDrJiixo6cIeowx/EicJBSik0+Wmnx3cq1f
	 0+pkI+bFtFk0frd94aW5pRX58BVbajBZ+S59LqJn1XyYxEYBbHL9Iv3w0uymcZvAtCK8B
	 TrNNUaHolpjWnO4U5DFqVVmwzZJiwEyLrK1kwhHI7eEpX6aOTyyzU/5ecRnx6JWQXw+/4
	 39bH0Uswv7Vqot9SbS9qM7j4lOILjRFPWlB/Oek4g+sI2f1bVJ7d8y6NBpghcsegudA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwbgcQr3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 4BD72606A32C;
	Wed,  4 Nov 2026 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lwbgcQr3
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 469701F000C1;
	Wed,  4 Nov 2026 08:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793779975;
	bh=bSzK5TlzBltb+pOY5OWvPx/UiScbb37/iKI+Uoog/W4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lwbgcQr3OZUVncumQal3BFjLrG/uEOSeYGgmPB6u7714eWcbRQ7pXfz3KJHfzqyV7
	 WfVuV4O/lrI++TBUkIoQVoA8e5V/z/IEJqebLNi/G3G3gJzwGNDFgqsmVTQsgTJVt/
	 xFEwc9PtcrV2++D3HvWITBlaMQ+QfFh0/9vqmoTImMFVe6U1EsJIPKo4e4AWnH9cZS
	 kGGOQ+BzisUn/XkHMDGJ7AapqbgQaDEu9zhv/yKmQKHxfbTfjZXwTYPvKG3JvPYMWk
	 NJDYKDS+Kamtic4h4bamC6e3L+v8ecrWMT8CIVR8+7Mhojo7TyLRWgwRb7RZ0n1CEQ
	 hqHOchOqjm/Mw==
Date: Wed, 4 Nov 2026 09:12:51 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: joseph@telaak.dev
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chuanhong Guo <gch981213@gmail.com>, 
	Qingfang Deng <dqfext@gmail.com>, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: gpio: Add Siflower SF19A2890 GPIO
 controller
Message-ID: <fc273wsjhyvtoqjnuiipramnvjvti4n26yxgvr23neuawnz2zp@krm4cfn6pfkb>
References: <20261104-sf19a2890-gpio-v1-0-45e463c48728@telaak.dev>
 <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev>
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
In-Reply-To: <20261104-sf19a2890-gpio-v1-1-45e463c48728@telaak.dev>

On Wed, Nov 04, 2026 at 02:21:37AM -0500, Joseph Telaak via B4 Relay wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
> 
> Document the GPIO controller found on the Siflower SF19A2890 and other
> Siflower MIPS and RISC-V SoCs.
> 
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; Joseph Telaak as the binding's
>  maintainer, GPL-2.0-only for the deprecated GPL-2.0 SPDX identifier,
>  example indented by four spaces, commit message, subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---

If you're a co-developer, please add your Co-developed-by: prefixed with
a list that looks more like:

[Joseph Telaak:
  - did foo
  - did bar]

The above is completely unreadable.

Thanks,
Bartosz
