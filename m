Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374603;
	b=xptBeQlV4effy1a7PelhGmt1gUkKm5tB7x6Y3kLgoJQHbD+P6X2/NURmW4XugqOqu8Th
	 5jRPkqaZcsV1vbwOYVLvo/swrjG3e9zhzu6kmyr+oaSjnCiJhegWQTyZd9TwI1/eWLx3S
	 lVTJpDGotG3VypF0MhJglKbOPQFEephPo6KgV2vpfgiuJk/itCTQ2khLM36MMCISc9MSL
	 h1N0lUBpEC6s5RGarPDTfuzErtlh+Wb772KzC2301ZMiMNkx0vkWMjDL04LaSW4pekGZ9
	 1gPc1xXxh6soZoxvraGiUkyS+Br8wi56d00SGGy5UOKDTw4OL8nmUsaFHwzM6q5viLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374603;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=zwfu6LXFvZArfUsBPF8A4jSr6K6P7+dcl8Uqet33v1w=;
	b=ctTwjNscpAvN0Cvg9z0PQTNx3JHM9GFd0diTbfPrJ00E7mUkkRhYmKBAUAIGLOWYhaQt
	 oOZF5Dhv1wjBEBgn/E9nWOBLMGmijZQ04xODIxtKXm0neyUVt313lEPtKvgbNoqYLOIQ+
	 d0h5PNN4/fGeBBz36Uy7Pg29ljAfmY/z8lQyffYP//kpW0WV8K5e5EMYg3OChOfqSLxhD
	 cIutZP2pyILHsW3sVMwXY2fDPXKKcF2PTVE24FeJlGbKXaDGL35lE159VobP1DAZa6u24
	 a10Sj7TpvDDjwW/E73aWsR7QYvsH1ayrIImzfVTUbyuxw0RLTkQHcCm+Jn1cVYvnQsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kaDSOqzI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D2E606A31C;
	Fri, 30 Oct 2026 15:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kaDSOqzI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0F71F000C1;
	Fri, 30 Oct 2026 15:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793374603;
	bh=zwfu6LXFvZArfUsBPF8A4jSr6K6P7+dcl8Uqet33v1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kaDSOqzIgzlBlGDd2GQPAGghRFztX3UWl8NyF4NCNmpGhx/efDRzifoL7pMg/q/7Q
	 gO5GBDmgzeWlh63aBaXF74TtQ84yoGCVEcMRYI7Q1C3RFJSc77x0wd5YxTy6LtFGLg
	 3e5zMWkE3ary5QQC9/06US3QKgjB7bH80mrNJYWRmNvUXJFDnOviEVJlwgmxkTX40d
	 kR/Z+hUZJUcqApsrlEimHFN37/lWgedyNqdP25Kq2L4Ql5ecMhyKQgDnOD0hxHkGKA
	 jdeOu6s0SwONN8hjASM0DqhcEe6T2Kyus91fUtmaCADfF1V5FFxQyGSOA4SUE2SiE6
	 F49i7B3nb4Wdw==
Date: Fri, 30 Oct 2026 10:36:39 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 1/8] dt-bindings: pinctrl: Add
 starfive,jhb100-adc0-pinctrl
Message-ID: <179337459881.79464.15994915266716714966.robh@kernel.org>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
 <20261017052534.115203-2-changhuang.liang@starfivetech.com>
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
In-Reply-To: <20261017052534.115203-2-changhuang.liang@starfivetech.com>


On Fri, 16 Oct 2026 22:25:27 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC ADC-0(adc0) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-adc0-pinctrl.yaml | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-adc0-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

