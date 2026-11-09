Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.29.241.158
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196544;
	b=Xylpv1F/0YoC89ZE1F9xc5Ul0Gk9GkROcpGXLXbcN1XvyGmuxKERtNTn3xMaVnchm8jH
	 vZLkBeIF+oWx1DcElIayZDojVOn0ZoPc9dPrey2u1+GW6A5GEPvDrbCjP8ch+8FaaclbS
	 jgJETsWz3dEVfaGW6w/kkclADnxLg91j+y2aZeMNlHGrZaFYUMD9C98U6mibqufG+9hOx
	 OzQgrhGdZ5KxQLSXeiMbi4zVUsJym9QdvbI82nGpSK5qKbDmwjQc//mIJQfALhr51l5Pm
	 uqjOSttaLmDnemOY0yPSYhVHK8PrH3iM2+7wTSLABGG0MscBKKrNEzKVMfPkuw2Erqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196544;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=2Zljenr6taHTWjL3leu6PLVLHJqdixh9zJXxP5wHrfA=;
	b=SowaYbU+KUH9JBtfWjkHjuAtwDj6trihD4AJ1XdUB2+YI4ZnEeBnHYc+N/ifPT/5cbgK
	 LVwCe4TFdNN78WQnYS9YndQ9HvH8ODgGoGyfu97xGki7N+XtAmxq1PCel5V5QpQsS9KXa
	 6CC44eymS00grAyqfC5UzfzA+7U3vRjrKBR7MRZkdJ7Z04ZoY+lhX0HFXbYJ35C5SOA61
	 tnb8ZlYNIZCI0/0tceVT0/+jN6Q8J63lBdOSQr5zEQiW1/D+Ukp3lcEaoF73GUbKAoFKk
	 R5oN/KV+TfljDQiaPTtCaol3j5Zc1Jc20YGkW8Kk+EUgvjE3oSu1+sofJ5gd/THWjeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=codeconstruct.com.au;
	spf=pass smtp.mailfrom=codeconstruct.com.au;
	dkim=pass header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T87VTSAe;
	arc=none smtp.remote-ip=203.29.241.158
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B86606D821;
	Mon,  9 Nov 2026 03:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7B86606D821
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.a=rsa-sha256 header.s=2022a header.b=T87VTSAe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1794196541;
	bh=2Zljenr6taHTWjL3leu6PLVLHJqdixh9zJXxP5wHrfA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=T87VTSAeudzRs51DvBAQruzVQKZXmY8ZpKF3M/14j73a5aiVQfAEQ7wg0E5YpDMHb
	 ImakN3xRymJhM0fJR2pfk92Pmtt0nQsc/ZZvPSx1E3YVpSpXPJoSAhkxkKE1DRPa9R
	 XzbirKrhOOdm+oM2sLGirfrKd5Kd1Q/8m2bySi48Ncp3hIRZPn8H/Bf7Br8T4pmgYJ
	 7QRpok1X6yyIhr0lj+H3SOagXNZYZf5ZkEm11NgGxgiMR2tyJ2XjfzK6dbB0UBJjf5
	 CzJe5Dcy747AZg6sz9jX7C8pinZoxjHOwjnLgFNDHgay3dglGKhzTfJmgGyweue8s+
	 IDky3LfgB+H3Q==
Received: from [192.168.68.117] (unknown [180.150.112.139])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A8E8A64952;
	Mon,  9 Nov 2026 11:55:40 +0800 (AWST)
Message-ID: <bb201e889665f2b5c9ac356674091b183de06aba.camel@codeconstruct.com.au>
Subject: Re: [PATCH 2/5] gpio: aspeed-sgpio: propagate IRQ setup error in
 probe
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: shao.mingyin@zte.com.cn, linusw@kernel.org, brgl@kernel.org, 
	linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, geert+renesas@glider.be, wbg@kernel.org, 
	opendmb@gmail.com, florian.fainelli@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, jelonek.jonas@gmail.com
Date: Mon, 09 Nov 2026 14:25:39 +1030
In-Reply-To: <20261107161254042rp3ZKRkQGz2jfH-FBrmtg@zte.com.cn>
References: 
	202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn <20261107161254042rp3ZKRkQGz2jfH-FBrmtg@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, 2026-11-07 at 16:12 +0800, shao.mingyin@zte.com.cn wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
>=20
> aspeed_sgpio_probe() ignores the return value of
> aspeed_sgpio_setup_irqs().=C2=A0 That function returns the result of
> platform_get_irq(), so on failure - in particular -EPROBE_DEFER while
> the parent interrupt controller is still probing - the driver carries on
> and registers the gpiochip with no interrupt support, and the deferred
> probe is never retried, leaving GPIO interrupts permanently broken.
>=20
> The "interrupts" property is mandatory for this device, so propagate the
> error from probe.
>=20
> Fixes: 7db47faae79b ("gpio: aspeed: Add SGPIO driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
