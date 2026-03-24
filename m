Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4572419CD1B;
	Tue, 24 Mar 2026 00:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311971; cv=none; b=pEEj6N4uR7G7xf50lRADSOpxVtUe3FqBkS5ySuRHVTU4Y5lT0KSJEvOIg71IskmrvTiRgRjaMUBw7v+moZnEiZjcUTkwVG1p2C2iHqUAJlr3AkQjY5qmO/g43NrEW6nqfokoMIwJeRFa2Lgv/OEqB0F9/YaIR9LYn0y24N5bjRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311971; c=relaxed/simple;
	bh=HWeN9l25DXERMH+81DhTP9QxAZ48R9hKphOM2+ALNuI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Zp7mreMnJAzMINgA+UhEmqMlTlwGqwE9drehpAACFP5Lo0wKjnJYE6UDL43l2cCyjR+3w+yC7f5TxWbN+CRi9ECTapz5bUYm5j/QtCdr94L3ViJBLAPAfI74Z0LTGg9HXJNfC8ewkKG6UcN6tY16jl6sgFru03VF/20JiTPwfrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaDUWqD1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaDUWqD1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4F56C4CEF7;
	Tue, 24 Mar 2026 00:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311970;
	bh=HWeN9l25DXERMH+81DhTP9QxAZ48R9hKphOM2+ALNuI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GaDUWqD1WdILB1XD7YEZmPMeNwPu3iix2CHQFreGtGYU6o28LV52B8YOwRvjpgVXl
	 YvGmz+2IW/250Y94EOZ8ToI+nAwT7X9Y51YSaM2qlNM5sFqPKkl0AHBzYiAYQi/YZi
	 1Y2V8BvwhNImx9JrYSB/jP4D65ioeRLzNIkh+mkm4rfKkI+ofh1H0nlkBb1Qviaf7k
	 X4XYBcuW2JXQ+vy297LwCAJ09nwLWc+hhEGWgqEs7iuO8XvByeKYrc0psTbBtRTwP8
	 asNUC2ADNv43n1q3n+XMjdoVTWdtInN/6xz1g3Uu0tfFUyM/rUFifTAv3T8HdzAkmg
	 y936vZKsNUVxQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260226-eyeq6lplus-v3-9-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com> <20260226-eyeq6lplus-v3-9-9cbeb59268b0@bootlin.com>
Subject: Re: [PATCH v3 09/13] clk: eyeq: Add Mobileye EyeQ6Lplus OLB
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
To: =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:26:08 -0700
Message-ID: <177431196878.5403.1939223268519339474@lazor>
User-Agent: alot/0.12

Quoting Beno=C3=AEt Monin (2026-02-26 05:33:53)
> Declare the PLLs and fixed factors found in the EyeQ6Lplus OLB as part
> of the match data for the "mobileye,eyeq6lplus-olb" compatible.
>=20
> The PLL and fixed factor of the CPU are registered in early init as they
> are required during the boot by the GIC timer.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
