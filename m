Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64A152D0C72
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789578913; cv=none; b=Fuh5MCDQK7X5mtSSOX6L0kMof41mnP2WxgkgnpQx47NBX04yy8nd8d57mvt7R0/N3OGmt6n5XRc86COQqSWzWRze013W4qDJrekFxOOIR7EiBZgWDIevNeQitEXPaVK1V48nIbQ4oIOTBGNES25kJWMd4aSijYSYC+qx7O+3vMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789578913; c=relaxed/simple;
	bh=x+RzZmHnqaIFv/afq4EE1msbYj1HqtHQnuxnErsonnM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JjKK4/HHprt90d2a43evROm37bXEZlk5dzuTqk30GE3U9ahRfy/7NWWozKYoZm8HH4HIDttcAioDRWYsFj9MrZg+niTfsuoiurIDZ+oFpCIMP/1CYEQOr3nch59USL83892jiwKw2SZt+e7Ds3JINfYa4/2hFo232nz6ukjCWyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJWKyUQG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJWKyUQG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 192321F00899
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 17:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789578911;
	bh=x+RzZmHnqaIFv/afq4EE1msbYj1HqtHQnuxnErsonnM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=fJWKyUQGkPoGP6Y6CKkbMqnqk0M61nrKSbxnHjagrEGHJbkxh2gmxnq+2sBMXzN1Z
	 Qz2mT0p9yrfu8kVSu40m5cIhXgOSeqCmYnNDCC+rciMkhrLs0p+dcBdoN1vVayVBVt
	 N+d6tLIHjwuKx2KEFKfarXY6aKGGJQr9I6ZxAlXvUMMZLLUY5kv5hwPIysLW2BsVeg
	 MGNEuRRKp8UVTSz51bvHgHX3WwwSqqMl3q7XHvNdY/hy9VyasfbQH6PYP0ppfJjeZb
	 gqM4N2Sy8rxyPTLehUtbIuvkIJakxSI/S6RjBJZmFFESkhSMFGoXksEure1UOiIk8f
	 Gq8jo4oKDZJDg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d7aso1650591e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 10:15:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBypInXhJyLPNu2dX7A4tqdvNtKKHIe22+wzHtBkEjwV1uGeUbZTjUsryCAzXkSdHYTCq39L0KSjFt4D@vger.kernel.org
X-Gm-Message-State: AFuF++mhpzn7QVC+V7PXJ/RpyCt4977/WjPpXzskjfS4Q9x6dyZ5Mv4V
	cBynZiUq0sUYIBbHJU0ePlgC5fpNwQ3D0atn4IFnu3KKgDk2dkD+npjMaJSIOrbtqqHVcCOevgX
	xYCC4y/PreD0RdhB/yzzM4dvJvlUEpkY=
X-Received: by 2002:a05:6512:4023:b0:5b8:b419:c8ad with SMTP id
 2adb3069b0e04-5b8b6617917mr991899e87.17.1789578909833; Wed, 16 Sep 2026
 10:15:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com> <20260910-fw-devlink-nexus-ready-v2-3-17ac82dbe226@toradex.com>
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-3-17ac82dbe226@toradex.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 19:14:57 +0200
X-Gmail-Original-Message-ID: <CAD++jL=PV_BEw6pa=M7dDEMNMg2xfbBESGanXE2sajTav5hPBg@mail.gmail.com>
X-Gm-Features: AcwNN1VY_W0_it0rWdRRWdWtRhIbKagoTA3QAM941QSR0htK7aD0JhAkkSfT2YY
Message-ID: <CAD++jL=PV_BEw6pa=M7dDEMNMg2xfbBESGanXE2sajTav5hPBg@mail.gmail.com>
Subject: Re: [PATCH v2 3/7] of: unittest: Test fw_devlink with GPIO nexus maps
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
	"Miquel Raynal (Schneider Electric)" <miquel.raynal@bootlin.com>, Frank Li <Frank.li@oss.nxp.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Herve Codina <herve.codina@bootlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Leonardo Costa <leonardo.costa@toradex.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 4:16=E2=80=AFPM Ernest Van Hoecke
<ernestvanhoecke@gmail.com> wrote:

> From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>
> Add OF unit tests that call the fw_devlink add_links operation for GPIOs
> routed through nexus maps. Verify that each mapped consumer has exactly
> one link to the final GPIO provider rather than to the nexus.
>
> Also cover direct references and all GPIO property spellings recognized
> by fw_devlink, including the deprecated singular and unprefixed forms.
>
> Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
