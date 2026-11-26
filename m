Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718878;
	b=wpKNl4NTwKSbkMAwH+CELU2o99Asl0EvmwHupiwl4xGotQGQy9jTjGRHr4/ugZuBoCPt
	 9b+syo5hZNkuLTw6qHxzl+TSmyEupiCotBD1owaa2sc3h1a2nvz6vwNws9SsM0nlGuRhS
	 5ishPiIw4fGeH91N5HF/WEE6RuRH2+jjYTwKoYmyl6tyOQSreDC5m00UpRvd8hfEcxknc
	 ey13aaY7ysHW8mPjjr9m1BNiM1CbUBho4lgpN5zlD8heQLOk8fJRjWTO9grLXE/2M3IsK
	 iBGOf+K/ojMRoYp+OOD3uITtEjwdQLeyyw+w3NtC5fvAKB/TdEB4HBn+2OmPHIeaylw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718878;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=DkUy01y7xEbf/+LpBM+I9BkjCedA7NkFboIBCgJYdX4=;
	b=ou0EYExxngaAZPbMYMu46pqvQUADkpDqH6iQyEiWDbyQMujtYh4tOaRIKK/9DReENuoD
	 zsy3iaPTmmsXbAAOJbpBs9MvbhUuwEv8IPvYSqSI1kbSx8kajMckHrebvsEFMZ9gzOpTu
	 XBndWHpC4Y+gVvAGEDY2hd+YJw6tGDuVGZKnlliEpqdBEvFoSWQJvnwmKMWN/AbAdVAjK
	 FcccnHqF5AaWPIdBvXghBQtXFFWZbbZl7YkZOlU0S9eLQt7ZC+MoDeh9yp44oMyUsue9J
	 FDyH7LbHTn/ycOqb4x5p8F0612IILjr+O1oyB0ZPFbXPJNuJul0q+ehF8w0ATVAMIjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBF4TsmR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2BE5606A31C;
	Thu, 26 Nov 2026 18:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jBF4TsmR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D96E01F000C4;
	Thu, 26 Nov 2026 18:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795718877;
	bh=DkUy01y7xEbf/+LpBM+I9BkjCedA7NkFboIBCgJYdX4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jBF4TsmR7GFh0k+NboYQnFAM4Y9gkAG1djVNMrQN9KWPX/AVg8obZFA8aMlb1vSBF
	 RFXE+SgvQW6oO617L66UefSjI5+Gik4HBNMhBLbx8qSb4SXhxFatRXaZMfhUI2cK2k
	 YASGpLIcsWeP8Qec2WYUrQc5K1JouNMPZkjtTCCyW3b1GfRV0ptfopc9X9AQFcIuFm
	 pbqFcvQiCeGUyrhZiu4js0k1W+cESSxlFxtoeahqRnvCCpQ6i0WKbyp6YOJm8CVYbZ
	 A/sZjS4dVvEiJy7q3qWWJ3svug03JcZNwXzevVScebjbg5dopXjvb0DctlWO6ogOSH
	 3mTYNeHIVBkqw==
Message-ID: <cdc5f00b-380c-4c8a-800d-967008c16a4f@kernel.org>
Date: Thu, 26 Nov 2026 19:47:47 +0100
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
Subject: Re: [PATCH v8 0/6] lx2160a: change the pad muxes through the RCW
 override
To: Linus Walleij <linusw@kernel.org>, vjardin@free.fr
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Ioana Ciornei <ioana.ciornei@nxp.com>
References: <20261118-for-upstream-lx2160a-rcw-pinmux-v1-v8-0-d01bc837593e@free.fr>
 <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAD++jLnRWZrLfyBGGOikx_eeYXirahuB7E7yuDhB6KoSAQoA5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Linus,

Le 26/11/2026 à 13:53, Linus Walleij a écrit :
> Hi Vincent,
> 
> On Wed, Nov 18, 2026 at 12:00 PM Vincent Jardin via B4 Relay
> <devnull+vjardin.free.fr@kernel.org> wrote:
> 
>> The LX2160A muxes its IIC, XSPI, SDHC, UART, IRQ and EVT pads from
>> fields of the RCW. They are read-only in RCWSR12..14 of DCFG, and are
>> changed at runtime through the override registers in the DCSR view of
>> DCFG, which read 0 until written.
>>
>> Since commit 8a1365c7bbc1 ("arm64: dts: lx2160a: add pinmux and i2c
>> gpio to support bus recovery"), fsl-lx216x.dtsi drives the override
>> registers with pinctrl-single for the I2C bus recovery. Its first pin
>> state clears every other field of the word: a board whose RCW programs
>> a non-zero pad mux loses those pads at the first I2C probe.
>>
>> This series reads the fields in effect from RCWSR and writes RCWCR, as
>> fsl_guts_rcw_rmw() already does for the SerDes protocols:
> 
> Once the review is complete, can I merge all patches except the DTSI
> patch through the pin control tree, i.e. does it have the right ACKs?

I acked patch 3/6 as maintainer of drivers/soc/fsl/ and include/linux/fsl/

Christophe
