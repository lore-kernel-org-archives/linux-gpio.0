Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795710686;
	b=nKNAq+gYIi1E3wQOwG+zdN9EDgZ0jNNV4A9oQk5YuZDmSmRECTPavDsjIGfFLA2d/EcA
	 rMRGTYdlWGglSZY4ANb7cXJQ93U1xFmyI++IAvu/gdW5iMIz4oihEtllxN91+CQRB6ziV
	 8+p9DGPvA2PmbrBmNCrgSeuuepmPyvAlhhTT4dYjspLFOo9cLXuwdy03iAenvChf33Kqw
	 1195Z7mC+9aJerYGD0LJD5r1hJ+oX6iudG1l6VuczvqNja6s6dWBxjm5UUa+7HawKeBgM
	 x7g0Q9Agn7DYw0I2z9Tvv/5eY0Fg6BuB+tjOBkx5jbK2G35VX6yNgXVMv7OA47l7GuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795710686;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:From:Subject:
	 Cc:To:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=oEbc6GvfEpsr54onGmOLNQTpL2P8UYZyii5KitTQG4U=;
	b=aB7IIXYZoWHJSmyVm95ui/Xz8wmriH/hDHNtNPqPDmjB5UVXjIbiCF1ryrU9s7Hb+Rns
	 p7U0RQRW9hFDPF2Qu4zqcQvFOHu428+KmD8O+F+4Nh41QYvjQL53qbdwQ0ir0IbPZUUTG
	 TY9BVUx6zyTZeFh5/Ttsjp0Waqu4tRNxWtZrPrOCeL3xuTjdc00pX+vONXLXEWbb0zl8E
	 q9XR9Vr0OW25iH2qAqco0aI+4PjIklBor1xvyjhMlx0YGd/wSUm3LJYh83wl6IsMQv3g9
	 eCSxSaGRPkIunELQYYh6oUI1J92yztXiOfEcqbAxEbJI4FRBAikVxIBFr2mDNnVKspw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XSq0R6eb;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C5E606A333
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 16:31:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07C5E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=XSq0R6eb
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2CF08C2B9D2;
	Thu, 26 Nov 2026 16:31:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B15E360558;
	Thu, 26 Nov 2026 16:31:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9187311E69139;
	Thu, 26 Nov 2026 17:31:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795710677; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=oEbc6GvfEpsr54onGmOLNQTpL2P8UYZyii5KitTQG4U=;
	b=XSq0R6ebButZYZwwXysdG/xGnajy3rqQ4suyD0LoJQbwU11hLRZ1B0eoOxf1MbLLk4HqS3
	cpet4drLlqhnOh+GwYQvI6OuVAiw/q3rVszc/4nO0pJWDlAh7R8gh2yJY5zcVkHxKyhuza
	DHdjhh6BTJHeYwhKCnni7suBpptl0yz2DC9gPhRNtyO3H/KOmt1/9+tUcvolvNrPhZFkzZ
	MZUZfhcfo1dD5aSekGbXyv4R+D31dMMRuGEsmVEMZpTiVZS9U/7R5/t39J3XkOIawMv2WU
	rFpaTCg3QLM3N+fbFhdlYxdZ2Nprpo0UHzn78390G59CUwax7EF2RxquDvxRjQ==
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
Date: Thu, 26 Nov 2026 17:31:09 +0100
Message-Id: <DN5AB16C26GE.3M5Y1X38QATK8@bootlin.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 0/2] drm/bridge: tc358762: fix reset handling
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
In-Reply-To: <20261125-tc3-reset-v2-0-32eefcaf1460@kemnade.info>
X-Last-TLS-Session-Version: TLSv1.3

Hello Andreas,

On Wed Nov 25, 2026 at 12:37 PM CET, Andreas Kemnade wrote:
> The bridge driver desserts reset after disable and asserts that
> upon enbale. That requires users to workaround that by declaring
> the reset gpio wrongfully active high.
>
> Fix polarity in the one device tree actually declaring
> a reset line. That patch has to go in after the bridge fix.
>
> The issue came to sight during experiments with reset lines on the
> Epson Moverio BT-200. There are two of these chips with a shared reset
> line, so also prepare for future conversion to use a reset controller.
>
> To avoid having GPIO maintainers spammed with a bunch of patches for
> BT200 support, do that fix separately and now, so it can go in more
> fast-track way.
>
> The devicetree change is only compile tested and is more
> a cleanup, not an urgent fix.

Can you test it and report back? I guess it just means applyint patch 2
without patch 1 and checking whether it works.

Other than that the patches look OK.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
