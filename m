Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.4.11.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851261;
	b=MAAROYE8AJiRdYvryT3bqQOvDOG8Nl52auQ4pBemSr/5ZPuXKLPE9TY/Lo3hr5gL373M
	 STLlBJQxIoL0DxIUCd+eQKYJiWD1QunCpApubvNCRLtk5FLrqUBC8HTW32xt1H8CaU9aX
	 Atwx98kmMDLq7d+nXrFDenFfcj2fhXhPya17e2KcABfcc45FPtHzfDww07GkWqR51eYiN
	 qJOoN52PnaHGG3CiZID62hBeWjEL4/5rasMUbermDGzNHL8hFzgrz46KFZsjpG6yffrKC
	 hetsB1y2qKf8D8t/TzKnHiBfnNFQh/AceSBSivcA2eS9/RZfBy//To0/Ko3C692gccw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851261;
	h=DMARC-Filter:Received:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=I5eMNskrWfHY+Ao3oKQAyIDWEN4eHpIvs0Mcs5jAu0E=;
	b=fX4zZMl8eRXlYTjOj6xVvV9+7Kx6vdq4nVat24ARl0Pf28ZZrmoNh5rFukXbljo9HhN+
	 jF8YXCOVYmTjF/1MGeC3qc5ZRsSHICGwoS8Qn4ZbBWjG60ljZeEypzIaBcvJL5eybJXKf
	 Pl6aikWb1ZLllJNHQqSccm90EEnkKow7bQ49G8K4rq6pm2Tzs0s7lzU/MbVO5elR8wq54
	 KJTFI2edUl3IbFSSAsJYbLUYLmX71AX0dt7PKl5o9xzo9/h5r8vRUP8SII08Yh4rlPF9i
	 7zhegy2c1YDRSG8nrgNVzJexnWThPjIYZCT6TrhI/pa2DAQtz9EkScbda93eREMnSvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=phrozen.org;
	spf=pass smtp.mailfrom=phrozen.org;
	arc=none smtp.remote-ip=46.4.11.11
Received: from nbd.name (nbd.name [46.4.11.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06C92606A334;
	Mon, 16 Nov 2026 17:47:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06C92606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=phrozen.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=phrozen.org
Received: from [2a04:4540:1403:e6fc:39d9:16d5:775d:5525]
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xT0ng-004GYh-1s;
	Mon, 16 Nov 2026 18:47:28 +0100
Message-ID: <b94ed5e4-cb80-4e05-9964-bb08a61aa1fd@phrozen.org>
Date: Mon, 16 Nov 2026 18:47:27 +0100
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] dt-bindings: pinctrl: airoha: add AN7589
To: Conor Dooley <conor@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Ahmed Naseef <naseefkm@gmail.com>,
 Benjamin Larsson <benjamin.larsson@genexis.eu>,
 Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org,
 lei.dong@airoha.com, Linqi.zhang@airoha.com, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mfd@lists.linux.dev, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Rajeev.kumar@airoha.com, upstream@airoha.com, Weifeng.xu@airoha.com,
 zhengping.zhang@airoha.com
References: <20261112185941.1316112-1-john@phrozen.org>
 <20261112185941.1316112-6-john@phrozen.org>
 <20261113-fame-smock-6ea3b8fadcd0@spud>
Content-Language: en-GB
From: John Crispin <john@phrozen.org>
In-Reply-To: <20261113-fame-smock-6ea3b8fadcd0@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Fri, Nov 13, 2026 at 05:40:42PM +0000, Conor Dooley wrote:
> As Lee requested, please split this out. Two patches, maybe even three.

Agreed. v3 splits it into three patches.

> Do we even need a child node here? If all this node does is
> gpio/pinctrl, why can the driver not bind directly to this node?
>
> What else does it do that warrants being a syscon?

The block also holds the PWM controller. Its registers interleave with
the GPIO ones. The PWM series adds it as a second child, as on the
EN7581. That series has a depency on this one so I have not posted it yet.

> Otherwise, there should only be one. uart1 and uart2 should have
> different nodes.

Agreed. v3 sets maxItems to 1. Only pcm_spi and pcie keep more, as
their groups carry different signals of one device.

> So here, maxItems should be 1 for similar reasons.

Agreed, v3 does this for i2c too.

> I'm also curious about why this goes up to 74. None of the functions
> have 74 pins, surely?

A conf node can set the same config on any set of pins. 74 is all the
pins. The EN7581 binding does the same with 58.

v3 will follow shortly.

        John


