Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D7B38B7D6;
	Tue, 15 Sep 2026 10:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469666; cv=none; b=huEYxxYtfbWB6OXZMn5OcilW4l3kvQg4kYadGVLlw+zCgmLAuTYRTXbNl/tLQFJDYQfZ652wJAfpEkLLlwKaZOz+7B9GtNEq2Xlo3jW/ODQqU6usDpFGELYjYlLGHetTJgZkRVNwkvCudmKNN9DxPt4VZWfyF7hC23j/7TScPEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469666; c=relaxed/simple;
	bh=vNAVw9R5mmptE5v+Ah5R1Dk3gj5vVSnaf2s7eV1Ww60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ym/tSC8JFxT9SSqx1+NOVjc2td/UahkG6bGCgNH4SEcqmMtu3wTAeiqrQZkzbXr7l3wSg/DlUKXDm+PafGlpExfnKZ12s6+gG3YGFAhThgmfeaot95JlWMal218z+mBe2YJcxaQGdPugtoMa0V0lqDM8BuFnsgZc534XXm6JLfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X5zNmVnR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X5zNmVnR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 281E01F000FF;
	Tue, 15 Sep 2026 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469665;
	bh=peUB3B18l4lyQfhHuicbvVQNXVBg/C0FGCKWZf1/1fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X5zNmVnRQSsJBTqjsAW5rxsQrHPW2u1QYsGy4AyDpJlfAMRBXhngQQ85zedqvmxAN
	 GlQ5NZUmPHa8jLgIVWNTYDrIOraP5vQ9Mr3bQrDmWroQ3sbIqzpF/w0oguGSZGVdCM
	 h6HvSSZ2X/NBq41PW9pluJr2lnSiiYup2tpM8+BPtm9Gdn+GYIVjkinpnhzh/uiM7n
	 eWlARKgtK8fveRNglaKbZg15TtDoVyUJfnT36QtKn0gbRvs6VvR0QSKEi6wEDI9JsK
	 JoAESWILugur//jnbbsocwKrDana2fB2fu5JK6pNNKyBpTXB4aafmLXrVdBOjcIHfr
	 cWHxOSPpPRNSA==
Date: Tue, 15 Sep 2026 12:54:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com, 
	Bartosz Golaszewski <brgl@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/ZYNQ ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: gpio: zynq: Add parsing of hogs
Message-ID: <20260915-tactful-nano-gerbil-b58a82@quoll>
References: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <0b17cd7e24ea9a92a3e5268a1f9e5a840960ac6d.1789375913.git.michal.simek@amd.com>

On Mon, Sep 14, 2026 at 10:51:54AM +0200, Michal Simek wrote:
> Allow parsing GPIO controller children nodes with GPIO hogs the same way
> it is done by commit 545908a9fb9c ("dt-bindings: gpio-mmio: Support
> hogs") and commit e8f2ca6be61f ("dt-bindings: gpio: ast2400-gpio: Add
> hogs parsing").
> 
> Signed-off-by: Michal Simek <michal.simek@amd.com>
> ---
> 
>  Documentation/devicetree/bindings/gpio/gpio-zynq.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

