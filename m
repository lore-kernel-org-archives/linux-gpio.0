Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721930;
	b=iULnVV9D50byGgXiibRmFN41JzLctFF4sBa2cAmuNEO4FNfV7mjsauQQxsbqzrtdha8O
	 k06N3alzqW0XxsyWJfASLXtfOBs7vNWUVb83sGx2RP4zLuoNYsOvUXw7rJjWdSpfuJFBV
	 wG9eWOAw02htBZzXAqY4iWyqmDsB0eOg62Gp1aemz46zmACPLx1jGDQFr4pO1QcY3pwt2
	 v6p/wMJI5rq3CXi1rkOYq3kuaCvB5J5Gh6Gt8otGfllDWW/jvrpdBwfO2Cys0TW2nTnnI
	 JURmkmUiB7S4tuXpu5R6Fo8ynzWHRDTePz4sGbxR9zURPy3LLtNEjmk2RGq9Mpl/Pvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721930;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:Subject:
	 Cc:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=MrwdyrGCigoLs5sakLPRHPJFywstvadxadEtt5B8ORo=;
	b=t0b6ssUJ2M5BSXnvWEDJ+aLLfKTz9BsDcnHE+gfllUPmcQibqtG5CrUackLpACuyOcpr
	 DEHFscHXW1aaUZ1SiGpF4gHjWXBYuTlCPYhq2qSpV5vBaza4y6QCPi0lm3iEaL2bMt9TB
	 8QXm4mPRy+wRDCdgw0ptF9kU6OcDVroMEoPVA5lmxO3lpYa1HKstrx3J6SEL9e3VcUVVI
	 x9jv5wQxc1VvSB0uPoh2ns5+QgYOsR+0bkqpPlKhYp1wKRmSDmfpEL8QgSf8uRMCNZWsS
	 8+HDo2npPttDJanNpMbLnevCvCd05ayxYNYNWKCtZScz4C0p3YJokkWN2UGrItt04XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EQDaEarX;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C27606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 19:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C27606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=EQDaEarX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9FC38C2B9EF;
	Thu, 26 Nov 2026 19:38:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 351CC60558;
	Thu, 26 Nov 2026 19:38:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EDF5511E68361;
	Thu, 26 Nov 2026 20:38:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795721922; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MrwdyrGCigoLs5sakLPRHPJFywstvadxadEtt5B8ORo=;
	b=EQDaEarX5ZZKUUatlj8XX6GwcMfEJAdXz0zX+hexJjwp4uUbs1XfV6d/bUYPRmRwv2Dg+j
	20BIq9QfQG4q7a5JWbrLkoPoAC0dddqbX+2IJM+duoput4oR1N09a5uo0MM0okhhW759uJ
	T4sQ1Vz+e0BfRWFpJhIXfLjVGLXwzuDr9Gu9ozrCw6l2Mda2rvzNl1V9YMNLr40KEn6AHC
	T+KO9TJ4bOO5eE93b1IgxmQWtTTHsrXHg3G2yg6ThJS6ptYtSt6yeuZwuE24z3oWBufppp
	uWXxhc5GzwNpWGgJUkMY4lE998ePX5S2z4YS2adtUFu/3ipxvt3LhSI8IX3Cow==
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Nov 2026 20:38:36 +0100
Message-Id: <DN5EAJWRZSFX.3GP1W2FARX6K7@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 1/2] gpio: tc358762: fix reset gpio handling
Cc: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <kernel@dh-electronics.com>, <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
To: "Andreas Kemnade" <andreas@kemnade.info>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Dmitry Baryshkov" <lumag@kernel.org>, "Robert
 Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Luca Ceresoli" <luca.ceresoli@bootlin.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Christoph Niedermaier"
 <cniedermaier@dh-electronics.com>, "Marek Vasut" <marex@nabladev.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
 <20261125-tc3-reset-v2-1-32eefcaf1460@kemnade.info>
In-Reply-To: <20261125-tc3-reset-v2-1-32eefcaf1460@kemnade.info>
X-Last-TLS-Session-Version: TLSv1.3

On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
> Reset gpio is asserted when the chip should be active, deasserted when
> the chip is enabled. That is the wrong way. Apparently users are working
> around this by using GPIO_ACTIVE_HIGH to compensate for that bug but that
> is not correcly describing the hardware.
> Since this chip is used in a RPi Touchscreen hat, apparently with
> devicetree overlays floating around, add a gpio quirk.
> Also prepare for using the reset-gpio driver.
>
> Fixes: 3355f4ee561d ("drm/bridge: tc358762: Add reset GPIO support")
> Signed-off-by: Andreas Kemnade <andreas@kemnade.info>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
