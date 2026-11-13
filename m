Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581021;
	b=ZUBoqQTilQFuNjTtiN/mAgeY+scZ/B5m885RiwLnV3oeM/GrWly32TEhdJXfV2al+Gb/
	 7zcQm436+zVEE1GIyefZHTfyIamMx28qfV0gg4O/kGaQGllaI4gdUUdYZkDCU/+5DTnLo
	 qP8TWjbnS+fdrWSTe9xhSM//XG+HG2DZvew8fhMwMqHghC/w3XpiW1j1Ert9pbh7GIrXo
	 Z8QftW8DrzNCoXcizrSQF4a9QivJgMSTjmA1EdLLka6orWHpA0XWwjcQhU1J3DSS5TKUd
	 jsvD4bDMwAXZU6l/0DeJPjjbkQgwxV7VDeICSF75Yrx0fz7YNy3C9o1tJmW6xtVHRXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581021;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=+289KWwCUBwSGViqjea0W9Qg4FPkLuVGVzLN0NXnagA=;
	b=BI7i9q1jRVA/NCyzNNy+UPHlipdCSJ9SN8h8V20I2X+mYsIBAaFf7on0sIqxIkqcqtNX
	 u9iO5L8U4glTwaFV/4r8hix59z71pBqQLd2rNYN6oI03Y6LtJE1V/FZOZyQ9ukCXdKUd6
	 TQ3ZESRigznJTrGvSx+R8ZB2/PJ3r1GKIa2/9KlsLyQyaE/c6MRBHQdRgy6r3pMA7LW9q
	 5G/gQNpBZ/9rAat4BZrIkOT3v/Lg2hO7RCU2O617scL8SGn/E8loPZj2eIOJc26OTLGAd
	 2wHPOF+tSUvJGAtZV7Lw/U7MeLrDXEbl81dLAHeNqOuv4UDfxRZ7njmgoIqcjq3yQgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0SQ4rzU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831D7606A323;
	Fri, 13 Nov 2026 14:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V0SQ4rzU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BDF71F000C4;
	Fri, 13 Nov 2026 14:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794581021;
	bh=+289KWwCUBwSGViqjea0W9Qg4FPkLuVGVzLN0NXnagA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V0SQ4rzUxRzFRK4g6VJ+CGzkMySQWEIOsnv+rTId5imAOTMpxQVu2tWEoGRe+VKZa
	 M3I/THA4Z4IDr7qOLGvsMsB1pz3ZhB3XeOBii5bRqjS5g83uE0zJiXc7azAm2HykXu
	 kCD8wPuEYWNFbWX0MQ84R9EONcwGKB3leipchtAFgOwjoFn3ErDYlTsC/hFpwkabNQ
	 R8jiOHzpqqOpSV7vaqypxlRDTTufWdOUWIEn1mYJHL+LNlxRR8dDBU78rpawikdGrC
	 scVfXK5Hj0UKxwxGRb+RhDhFkkNdeHjbGixvCNTMsn8rBjZUoCWQ19aL3UA+XvSMog
	 3D4liuRvDh1QA==
Date: Fri, 13 Nov 2026 08:43:38 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: NXP S32 Linux Team <s32@nxp.com>, Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	linuxppc-dev@lists.ozlabs.org, linux-gpio@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>, linux-arm-kernel@lists.infradead.org,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
Message-ID: <179458101851.831300.17996837915217986690.robh@kernel.org>
References: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-0-5a0063f1da9e@free.fr>
 <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-2-5a0063f1da9e@free.fr>
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
In-Reply-To: <20261108-for-upstream-lx2160a-rcw-pinmux-v1-v3-2-5a0063f1da9e@free.fr>


On Sun, 08 Nov 2026 11:06:50 +0100, Vincent Jardin wrote:
> On the LX2160A the DCFG node holds the pad mux, overridden through its
> DCSR view. Allow fsl,lx2160a-dcfg with simple-mfd, so that the child is
> populated, and the pinctrl child, on the LX2160A only.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

