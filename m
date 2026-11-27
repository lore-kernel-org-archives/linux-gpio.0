Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771053;
	b=mMUf7UUzDOoAuEJAK/7nnDNgGmyBBSu3Pq8rc/+aO2Y8MVCA8XvMDxITB1w9TVurYUqF
	 XEUGeSWWgVGznm/rvXdo3Z8Fg83rCBux1EcVQPASWWmCRMO7UWIAPPX8L/qRrc6T66GTe
	 uRkN5dGDGqihH81DnEMrE2/YHUATB1sxTdbw4s8HPY2zWP9MiBlRo728ePfUd6jfQ0dcT
	 h5+WONLZ3lvO1VNr04BNxhmnGlurxlLGNYotSOAqN6ObKRsrQzdlVprYKDOwQXURLpyKZ
	 ujrrfTVKR4ygEu4NBBroQaLnShq3+jr4t2YixmF8hZixK3rzwLVprmTwKBQEHC0D0Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
	b=GIrH22BKqb9bI/1+OMA1f8lMamhotD7tdY4BpeGzYBf+USw8S1XxfLiReLzHnUqKj6eq
	 xEoHuISuPibqMPljCsArjWpqLYBZUOscXTmtwx/NGvw/dZ5RoXmwx3lyRA1m+AEn2u6uO
	 cSk+Wak9dklx+hC704EqAYLLI3IYy5MO5UouHJg8SWCYlJzYB0qTUYl+CZqi2AVuS/DZy
	 aYSgHiB4+vvHqj3r+9gWoEVX5Z1E3UMp8qkbO0pZdYzuytmcjFCPBo9BL3KjD1zKET2b0
	 DAF6XbokjZ95LXOa33q/PiU3dUyajCGAg8WLMTHGWdmHa11xHkRIDCuiFxOvxJo3E2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D57606A324
	for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 09:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D57606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so45688675e9.1
        for <linux-gpio@vger.kernel.org>; Fri, 27 Nov 2026 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771051; x=1796375851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=aI0lqB3aCQ/4qBvwVRrDv3T2pKd7GIXvwQaW/Zh+LDPEWa17gOnnrr1BRlBIiBDLGi
         3xPfRxJaZjTyG/xvFc3dneK3xD/vNNrfe7lzCHKDtGApXlb18j3sVqNfkNpyZlK6n953
         YXQWqBLq6DgnAMebNL03Z+0dRUS7k1lzTKtoLXWxp18A2ag/Vuu/j9v/pXqDglpge3+U
         0aSVeDRd0euIBB0pClkJqh+3k8ujN4D7hiwgn+JHi6wQmvh/EL4Kk4CFcoCmmj/IueNy
         dsgWcm41bUvXD8zNf1yL+83BWKY+VC6T4IQuzt9lZYBAlNR/nIKXUaaUworjOtwk/D1z
         Ktag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771051; x=1796375851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=VzafO5Mgv067GdJ57SDqkq25sbfBrVxZPCXQKs0LxDR5/7amMkjzrm6OUdR3L2kiY9
         Me5RCgUnSqjsc381CKFVnI0BnmTmmF+Ws6XtG4usuqtYySBsjNdaenb3Arl4PigiENBw
         1j+JaVDhem/dsg1/dKATVokTe2AXyDh+otaUpPnPVutQOVhk3ZCcGZwqymdy382MXrb8
         sz5/OnIy3NEHWIgYyWEMlhROgE1sVxdMgzOBfbVGk/FLNLrY4krDeFXJcZw5KEQ/j58g
         EGloxDl4el0XxYXPGt4MhtdJip2goWHc2QYsZokfyWZKCSxdWBexdyqe6655LWJXAqsG
         XOog==
X-Forwarded-Encrypted: i=1; AL+hErGLef8/cjYWPysFTrNxgG6RxQ307GhnqMnZMPnk8XqcUqgEw9R1zhlh+vjdBpqOkE685nUbdYacnwXd@vger.kernel.org
X-Gm-Message-State: APuU4Z8PqzN3kayLyhsBWyUROPjb4N2aCkFKvyialvrLV2gm7V6t86CF
	POAcXkY8BalE7VOFfNTUNAEo52twP221Eq4LkBDxqqfFHF1VeI3EEhVZB2YZJLSMZYg=
X-Gm-Gg: AZFdTZfbPRIecZHJZYfEc6q3CP9enninr5sHKEXIK+XUr9w3ullA6pDMRwDkhiGeyI7
	DbCGEo0IP1/n8n5mWd2IEdl4asz3DYQrTb2TZtdvjTTmgp5askwcNeJVq8ycImhjRZoe2mddXwf
	5eqPw7Y9aUAgJsTHwCUtbe02mRyGdPL0cGnBTr0Pc79mIbrKXtngMjIcLgq4/oKrF0/Xaic0r06
	DseTOdonjYHzZ4rGI70e3yL759kFzIpRv6Zy/eLRqypoETDigwhaGC4GVivatKiwoUymOzYI5DF
	sWKl6fvNogUHBTE6o9QoDIS9ePY63cBiJv1oE6sNkWUhoEoVB54MEl11JNa38tz25Lq52qVPpsl
	QpKnXpe5CSsMqUoB1P9wst4wHtsUXfJj63XUGXGRLI0TVPRpCDqo1YpRdy1c5J63BM/SIY7KrfG
	jwEPzGI25ICoJz7+gTae1k/EvfhQRqyhPpjW8Pw2Rgl3+CzU6U0ur+CVs4uPMsUIxr8L/EllTKB
	PsTK4H8UNJj0f59uN+df+30IBlSO7Kv9d+l1nZTkiXj4r8wq1ctqxdncEV55kgT83lDLObNR9Ct
	OyYDvHqT10arVeuQLj0e5nnjHFDRryB82M3i
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr438432725e9.9.1795771051464;
        Fri, 27 Nov 2026 01:17:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm896151645e9.0.2026.11.27.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:30 -0800 (PST)
Message-ID: <5c05644b-fcf2-41e7-a012-338ce7eec8d2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:29 +0200
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
Subject: Re: [PATCH v2 2/7] i3c: renesas: Drop comma after OF match table
 sentinel
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> Reviewed-by: Frank Li<Frank.Li@nxp.com>
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
