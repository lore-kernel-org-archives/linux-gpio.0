Received: from smtpcmd03116.aruba.it (smtpcmd03116.aruba.it [62.149.158.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB8747F3C0
	for <linux-gpio@vger.kernel.org>; Thu, 24 Sep 2026 12:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.149.158.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790254749; cv=none; b=DnrRfwecWh3PBRTfCO3+VXgrwsEVYtYosjszsNMxTZQuLz7UgYwCrJCje+0qfAMfP0XHt1Ehek9kTRJ66TG5pW/pzmhvXQUVqz0E7R8HeRWKuZfVoN4RYHJdZmZX5z0XMM4O5HXz8Wh7V1YPdRuEs1ZuBjEg+VwOkqJn9yXZ4nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790254749; c=relaxed/simple;
	bh=VDO9d30LOlHmxDVrylTpyPiHGU6xQXj0z/lqpnE6PvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hk8RfPOS+3Hgor1/ZTOkKLV84rMJ4ia9scPBQMBs43dMDUlVMcosmJcpPxyBJhMtg2F0qzojRONAIvHiCtecqguSWUhvtRmUHwm9bhAtLgUiVAMdxCsbCeQXp/frlGmyN4ZU8rD7FXKTzJvrfPXXYKPZ62vg8Rbz+WjP6SQpTTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com; spf=pass smtp.mailfrom=enneenne.com; dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b=LB7n/lZ/; arc=none smtp.client-ip=62.149.158.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=enneenne.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=enneenne.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it header.b="LB7n/lZ/"
Received: from [192.168.0.186] ([101.57.122.26])
	by Aruba SMTP with ESMTPSA
	id 9j2RxBObRdVTC9j2YxSprX; Thu, 24 Sep 2026 14:59:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
	t=1790254747; bh=VDO9d30LOlHmxDVrylTpyPiHGU6xQXj0z/lqpnE6PvE=;
	h=Date:MIME-Version:Subject:To:From:Content-Type;
	b=LB7n/lZ/1laDl5SdMhY41qC28jc8T7NW6cP3h1PVlSH6AzK/Ly2X2uSb1iUQS69JB
	 cqpBmTaLbv1zVVeeZpMKlFBGlqOp1E+uel0NDCkmKvna+uFx/911APLtD/84U0wKaT
	 1B3i+e7fL/wgfyiSeJSjw6XXjZcJBKCP9pqR2l9NIPg4cjgnwJOJWR5jyRSr/KAy8w
	 VR5WLnUVvui2pSu/mnJ5yrhV0QaitfchHmP28VIE19c18mDkP3E3TdU43cq0GoMYJC
	 tgf1i4/LwG37vABcjcDb2kvNKg35otXWohgu85kxLz+Vr0YgjNdirNjlPZoWOTSo6u
	 O/flMsfC2wZgA==
Message-ID: <7bdb23c7-dfae-496a-854d-03a0ce792d7c@enneenne.com>
Date: Thu, 24 Sep 2026 14:59:06 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] dt-bindings: pps: pps-gpio: document optional
 pinctrl states
Content-Language: en-US
To: Eliav Farber <farbere@amazon.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Fabio Estevam <festevam@gmail.com>, Andrew Morton
 <akpm@linux-foundation.org>, Takashi Sakamoto <o-takashi@sakamocchi.jp>,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260922103051.5257-1-farbere@amazon.com>
 <20260923182243.41060-1-farbere@amazon.com>
 <20260923182243.41060-4-farbere@amazon.com>
From: Rodolfo Giometti <giometti@enneenne.com>
In-Reply-To: <20260923182243.41060-4-farbere@amazon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfNtNlXvnB9jJohenUF7vVCLLMPHN6aVCCWN+CL2LkySWMYwVh/+betMf6cd0fI/rDOqEGiZW4JuBSa4IkCfl3uROT7fz9DEJi2vtSUEOG/nxBWDNFHvA
 0C2rBa9acnFPhD2EMbTqndak0O71DMKUA1VqpNG5GkDCuN0cKUMa19bUiILQD3/O3Z7Nkciny6YESp9KKsTXX6tbjTYXcp3ij7og2B+iwV63HGSlf4d0M5Po
 xmrkxyiznJ1USelBeH1SLE4P+tdjmH0Eaoh7oxMc1QgUzHXYdJvWvMcvu/QYW5eSiE+MoXfO29WN4NYlqNPjYg0/N5hRs+70ApOUply6iTya8+nBtJBvs6D+
 pKJcG4Qy8eDx9hmjs/k+fHR3DsJqfFWTu+c7zL1mnloS/0cue18uSa4bdO0lHSA+5V/fX1ETkVzEgb2yZZSq4gb9e4kYccs9/fI5zRxK1czZW/fFeAfXZKB4
 N6hBqdKRPIbQ7gF/PvMbxyXjCdGFKpJmj54NGtpz5SXTp2Tpd+4pxgWo0/48efaHeeORWRZ4zbXHqHxiOMfs3q7uONNaFKELVxLxFg==

On Wed, Sep 23, 2026 at 06:22:42PM +0000, Eliav Farber wrote:
> Document the optional "default" and "inactive" pinctrl-names and show
> both in the example. The "default" state selects the PPS/GPIO function
> and is applied by the driver core before probe; the optional "inactive"
> state, when present, describes the mux to restore when the driver is
> unbound or the system is shut down. "default" is pinctrl-0, matching the
> implicit ordering the pinctrl core already assigns it, and "inactive" is
> pinctrl-1; the driver looks each state up by name.

Acked-by: Rodolfo Giometti <giometti@enneenne.com>
