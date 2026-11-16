Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.27.42.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855123;
	b=W16RkTK5dRIsNvB+1Q+zjwpG6kSBDyIDTtgBehGLt+0hrJa4+kMjTNRpFAogIS2EsfYV
	 lhcJa2qITS+P2AcSNBdUh8l8e5QaQDmVtj0k8VkNDF5ZpEMfobdGT2NeK203YAOCP4z2b
	 L1B6jyZ3Jd1QKCaAz1+0XJlJnMgMMJGOR+YYfFxSiwpt/JwONLOtLwnIcyolaJKMC4WB7
	 BDYjuYnTpnya872yLUj+pcaI0AzKeG2se15wJIcVahx65nXecd6QkppLmsc2BamneC+z3
	 BejszK4KVTOAxgyHGRQk6CfD+IUf9xMNtHt3YELVTOfoNCGvzY1R+hRYyC51u7pOX5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855123;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Sh2nmNQTVOWP3szEFLOBn84NAH4nPLsfx0J4lAR1HLA=;
	b=oPL1v4pgL+EeNTr937dgh7o5EjtrfEETBNhLHR+yKrSdAg1Q3XN3wFD7q6ZIYSOpkNM2
	 kypY237lJA9jPERPVNMIyExjgsw1eOdNypuM9/XOxC4qA6ODhf7D72OiSWHZojQFhauXZ
	 QLDBIoIyzQy27L42j8X9pb5DFFg5z9QgTNiasDqbXGwkLiQDXCrOLpe/KXwtYIELqPjU6
	 g7EGkpvx7LGjF+pXcY/stXZJuaAZNCnnVIR6DmmkVpR9AIbLDn1uodRD3SyKgeNkZEsMm
	 iZBXk8ZUJERLgb4FM8+nGxh9Wha0nUv29IJXHy4iIt2H9mphTEx547OYp2PAF/cZUNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=free.fr;
	spf=pass smtp.mailfrom=free.fr;
	dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=HEm0RLgX;
	arc=none smtp.remote-ip=212.27.42.2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3170606A322;
	Mon, 16 Nov 2026 18:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3170606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=HEm0RLgX
Received: from l3017729.home (unknown [IPv6:2a01:e0a:ac2:22b0:3d85:8d5d:9362:361])
	(Authenticated sender: vjardin@free.fr)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0D9C9200433;
	Mon, 16 Nov 2026 19:51:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1794855120;
	bh=Cs4uDxAEdjU0yi/6Yx0YrRf3kzhxHuE7ljq+oh0YydI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HEm0RLgXzcQkeMQMm5ajqLQ9UEKOvOUoWOl5Pc5Q0lkeqQge4PXgMTfi5oQs3R821
	 fs3+vi2x7Od996DyW9jGedzsoPGf57zVtZfhANZPXCrhJtPtql+njrXQTm33d7GDpe
	 fwbdKUpT9sbWzvDCSZQmID7MYyXvgK8DmDc2P1NFUDtmOmjBHBYHAxTIsy9Hhtdfbd
	 fHjljJW8FpE0OAInxyP93ShSWSTQ4Ot18Fp8YetBuzfM1+FPYTt5cd53i0GEugDumd
	 5XEGVgr+4Ki/mAd45/57SNNYyMsQVCyrQHjuLTfWNabg5RGEGpYCVNTCpw7VDpc0Uw
	 NymSo4NXmIbNw==
Date: Mon, 16 Nov 2026 19:51:29 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Linus Walleij <linusw@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: Re: [PATCH v6 4/5] pinctrl: freescale: add the Layerscape RCW
 pad-mux driver
Message-ID: <avtQsSmnMtzj4JZS@l3017729.home>
References: <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-0-fbdce4565a5c@free.fr>
 <20261115-for-upstream-lx2160a-rcw-pinmux-v1-v6-4-fbdce4565a5c@free.fr>
 <avs62BhLjlpouTwQ@lxl00025.wbi.nxp.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <avs62BhLjlpouTwQ@lxl00025.wbi.nxp.com>

Hi Linus,

regarding Vladimir's question:

> (which they're not - iic2 is a group consisting of SCL and SDA, whose
> function cannot be selected independently, which is why you've grouped
> them together).
> 
> I suppose this is OK? Not really a pinctrl expert here (and it predates
> your work - pinctrl-simple worked the same way).

either way is ok for me too, I do not properly understand the guidelines
that would fit best the kernel. What would you prefer ?
  - muxes per pad ?
  - 1 pin per field ?

thank you,
  Vincent
