Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.238.236.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795718078;
	b=5rn+oNdIrkopuaTn9Mm3jKi/4owmZkzuGEnwKFH9rblfZ/SX0BrgSkSRy7cC1rtI01OV
	 5y+coyiaekY0GoiqqgR/phMu/Dy0t7biPyT4cvcycHQnnq4Sk4pvg6fDXZh1e7VIUAW0B
	 dR2z8n+z4Stk6NTuaqIiopAAZBWbOOGmzABGtvo3OAP8xi1XpZWeWTm2dqm7UryPptKKa
	 9W+9FrsiTMFURPUAUqgDhU8MvyiHeS0axnBxBMiAO0wJOxGHQV6psdDOajlciviVDkVTI
	 OEXZ2uFkMUtF2rKIp19qHNPB0QayoBz1HI3Ja7UGkuDZx7GeNJ0xl6WhP+YDSWH7OAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795718078;
	h=DMARC-Filter:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=gZd0J6e4Vwhc7KaA03ZOyx2UROI87QlvB1FAZkxX2CQ=;
	b=Q1cMG05PBr8WgGXN9xSdE6SfYRu/Jn4cHtwyQ/30rZQQ+zWHa87d3F7tjxPwFV8y7NnK
	 bmuZYPchSBV6zhzqZF2+bpxKYnr7VXGdAi1nVV2puHgoOBqHku/pEcj6JlKZsLw/IdJnI
	 sAaNoE0n52Odm2YGKIBf9JxurtE+m6y8OqJWOKuUtBJIS2ydA80+VavOA/oKZUlFbZlIq
	 G+ZiRf0D28clsPtUu7WY/QRRptXHHVpu1jh5dFE9Nl6/xXEP0S08LGjV4qOVrVA1Nwc1r
	 SeVg7kfxa5OsaNsF3MeRUKeusalA0D09WbVeWpJKpd7pNy4GBImN5FlDFBcv5H2tb9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kemnade.info;
	spf=pass smtp.mailfrom=kemnade.info;
	dkim=pass header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=6seRml+o;
	arc=none smtp.remote-ip=178.238.236.174
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5753B606A31E;
	Thu, 26 Nov 2026 18:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5753B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.a=rsa-sha256 header.s=20220719 header.b=6seRml+o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description;
	bh=gZd0J6e4Vwhc7KaA03ZOyx2UROI87QlvB1FAZkxX2CQ=; t=1795718078; x=1796927678; 
	b=6seRml+o3VHzu3k8x7Pw/l7jk1dn2YFz1ydIJzRHN8KVWVld04snhHuqmk8Ikm9COoghBb52WVo
	Mltyv3ZQuTcm8g62gOgzRwjLUPRveXsVx3v7f3DgNQXJJyqo9y8RY7kNoMKO7XTET/fP/sH7laldg
	FRUObgqT5gN2XYD6mZrve6yX4ufw7OkbYoO3vYM4tjRO0PLM5zL4jzh6ZKcgBZKkNUtK/Jdsal3cb
	XOv0VcuCKF8i4YqUsZwesrHkVzRnN9vX71duIovgGun4vmlh5pIcRMXoql69YdzcqAW3U8QuOMOTm
	wsb01WjhzGce7Zvkdo56+DEQ5AddYVzr75Ow==;
Date: Thu, 26 Nov 2026 19:34:23 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Neil Armstrong" <neil.armstrong@linaro.org>, "Dmitry Baryshkov"
 <lumag@kernel.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Christoph Niedermaier"
 <cniedermaier@dh-electronics.com>, "Marek Vasut" <marex@nabladev.com>,
 "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Linus Walleij" <linusw@kernel.org>,
 "Bartosz Golaszewski" <brgl@kernel.org>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <kernel@dh-electronics.com>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358762: fix reset handling
Message-ID: <20261126193423.2344f609@kemnade.info>
In-Reply-To: <DN5AB16C26GE.3M5Y1X38QATK8@bootlin.com>
References: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
	<DN5AB16C26GE.3M5Y1X38QATK8@bootlin.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 26 Nov 2026 17:31:09 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> Hello Andreas,
> 
> On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
> > The bridge driver desserts reset after disable and asserts that
> > upon enbale. That requires users to workaround that by declaring
> > the reset gpio wrongfully active high.
> >
> > Fix polarity in the one device tree actually declaring
> > a reset line. That patch has to go in after the bridge fix.
> >
> > The issue came to sight during experiments with reset lines on the
> > Epson Moverio BT-200. There are two of these chips with a shared reset
> > line, so also prepare for future conversion to use a reset controller.
> >
> > To avoid having GPIO maintainers spammed with a bunch of patches for
> > BT200 support, do that fix separately and now, so it can go in more
> > fast-track way.
> >
> > The devicetree change is only compile tested and is more
> > a cleanup, not an urgent fix.  
> 
> Can you test it and report back? I guess it just means applyint patch 2
> without patch 1 and checking whether it works.
> 
No, I cannot test that. What I can confirm is that BT200 reset with a single
chip works with GPIO_ACTIVE_HIGH without Patch 1, with Patch 1 it works with
both GPIO_ACTIVE_LOW (which is the correct descrption of the hardware) and HIGH.

Patch 2 is based on the assumption that things are working in the state it
is in right now, and only corrects the description of the hardware.
I expect to break things if it goes in without patch 1, so probably the
best strategy. would be if patch 1 goes to v7.n, then patch 2 should
go into v7.n+1.

BTW: BT200 support depends on the stack of patches from Tomi + my RFC +
reset wire up.

Regards,
Andreas
