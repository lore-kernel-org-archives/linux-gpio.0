Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8EC5208CF;
	Fri, 18 Sep 2026 18:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756809; cv=none; b=h3s854LQVIPSxfNkpcx50uqPT87ujTRsL1wB8KjcBaHJnhQVuuopL8GerGFzliBv85TeehZi75s8UIErwz1q2K2P/BRjyHzAiHFO9sxBMUVlF+oX7EG2YouNosuSzHOU66OSZi14m68HLanZBgvJiR1luabw2qdsyXcpFzhJy6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756809; c=relaxed/simple;
	bh=6UsgSI8+XtMi6dIkUIbRdK6fM/Z4MnPj966FYfHhQnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pmWicLeuIbSuUmitcQEVvAN5VueQUFrRlR3N/wzmSZOQXqlDZo4U1NfnqWHLdByk4t1bQcNvAngdc99rRwtECY11I+SmbCd3yU3iEyjtQv08ZpbxglpgbA9eTHcuIwTjsxnYg/TSaL5LgQ6ckQgZ6GBYR/9MP01FA1/RebC4M0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pk78XB2e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pk78XB2e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03CB71F000FF;
	Fri, 18 Sep 2026 18:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789756802;
	bh=lNhIuqNEqFGOzX0QSlkVMyRbgM+H53S3L34j5HaHdPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Pk78XB2eGxO5UvaQCsK/UjJS0gU1J32MkfyG9UcyoFeB9JC2M1/PAkOl2RZ3uveaB
	 DRP+8UmvmTZ83uhg4j/OT1iaGbEMnwGaZoF5yoJJYOAn98cePwmFjeqUuHpAhQzd0a
	 jQfn4dkPJNBZH/WnkECtuJ803meKQ/pJ9o5xPBLwmaZH+UEa40l39c1spJOS3mGOAH
	 YqiJzYtbqHx4chZkZbjAdJA0ktI5HedkO8/UvkhZflBt3qp+gDmoIqq4a6K9gUxF6I
	 g3o24e7aCi1WuZxreMnBXXJVrWLqbUiE6Kp/Q3OUt3GtElsF+jwdBcO+KQ8kv9hM93
	 MYgmBlSxuyuHQ==
Date: Fri, 18 Sep 2026 13:40:00 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>,
	linux-kernel@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-gpio@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v8 15/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per2-pinctrl
Message-ID: <178975680030.1349064.2429832407274267046.robh@kernel.org>
References: <20260910100357.130134-1-changhuang.liang@starfivetech.com>
 <20260910100357.130134-16-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910100357.130134-16-changhuang.liang@starfivetech.com>


On Thu, 10 Sep 2026 03:03:50 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2(per2) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per2-pinctrl.yaml | 168 ++++++++++++++++++
>  1 file changed, 168 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

