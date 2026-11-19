Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795101919;
	b=V4JFo4X6+F/7SRrIeG556E0mGTYMbP3ye1Y8VU/aueY6qxdxkUCVkh5WqfVZo1Q1SzKF
	 iYygWh4QGkU866/6NUJNaQ3IPdLivBrkCc3eISfb3epWLV0Ikptd/dTky5UsMsgnw2yuZ
	 RvxlQ3HM44Pxd8TBON2N/AYhzaIgDAqPpSPeVW91aHgJV0f3XwuIM97ocoYciSjGjIGl8
	 a4yFfMkN1W77Wqd8vUucsiuPMn1vTB831fwke5iqioQjp5BwCvqjGppAnseBr1OToqruL
	 1vjqON3jjuA7uQQiCq4srCjgzzyhbOZsEh9Zt1b+DlQQv0wEIZ4jZelPb02H9xceiIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795101919;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=uaieUuwNDJlck+sb0f5Cz2Nf9mdI2HebrbCMTwi6cZM=;
	b=TsIlSusasZAzc4JlliNaAY2K2edQqtP4LX5kN4hfn6AhbYq6eEGgyRgoXA/8eygx4UlK
	 +oB657Ke+EitEoqifhYA7bEJeve4Vh5U2QKqUV9VeRV6aAAVDdTTemM6PyDJuZfV3CNWE
	 kwfFKs45YNapDzuWrF1OfsDMipeas7ZoueuKyJud+SaW1X43KIUzBrVFoh2ee4jDLIlV5
	 XU+jOAa1GX6Kc+BzZRYJb7Lw5QMERaIu/7EgvvFTxARjsde5gtBBgy8gWNQOpw4wZqiM5
	 h9jARG2ZA1LMzBfgn+WAJcb53OE3uX7cUmJRskvHf11YHLSbGYm2xr9L6LtPhF7/5Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaacLShH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073DC606A324;
	Thu, 19 Nov 2026 15:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaacLShH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533131F000C4;
	Thu, 19 Nov 2026 15:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795101918;
	bh=uaieUuwNDJlck+sb0f5Cz2Nf9mdI2HebrbCMTwi6cZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QaacLShHFUPMK1Ps8fTV2PHma1j7V/Z6Wid8RqvGV9QswflPuv5Wsq6ntegNDkGUY
	 hQWIpE744uDcSki9mDE+Y0IHraOaCQFMqIdt9KHtIjgVsC//I35UN70waIpXXeMcap
	 bmUtlPOgU0/vqZd1ihDp2QmRzNnc6K74BfGYiZ2QcACskJFYHoCoVJoJMhihS1MUz3
	 VtnMiTN7XvbumvYJ/iKgKM13oTuiBdKHG9j/A6yCHGe/xlQDhRnoBVCpvVAlqvjEzb
	 il8w1JlK9bOzIg6WfRYNmhw3LRBdo2PUW0X73BM8HaVBgBmqqtXr088WGVCkU1cWRm
	 Lk1teOOgCRSeQ==
Date: Thu, 19 Nov 2026 09:25:16 -0600
From: Rob Herring <robh@kernel.org>
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, letux-kernel@openphoenux.org
Subject: Re: [PATCH v4 3/7] dt-bindings: pinctrl: ingenic: Add X2600 support
Message-ID: <20261119152516.GA936383-robh@kernel.org>
References: <cover.1795022736.git.hns@goldelico.com>
 <a8688e1ea979dbbb3ffa198ca041b31c97752bad.1795022736.git.hns@goldelico.com>
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
In-Reply-To: <a8688e1ea979dbbb3ffa198ca041b31c97752bad.1795022736.git.hns@goldelico.com>

On Wed, Nov 18, 2026 at 06:25:33PM +0100, H. Nikolaus Schaller wrote:
> Add the pinctrl and GPIO compatible strings for the Lumissil
> X2600 SoC.
> 
> The X2600 has five GPIO ports with 32 GPIO number slots per port.
> The programming manual lists 113 implemented GPIO pins.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>

Missing Conor's ack from v1. And then he acked v2 again which happened 
after 3 versions in 24 hours. Please add tags and slow down your pace on 
new versions.

Rob
