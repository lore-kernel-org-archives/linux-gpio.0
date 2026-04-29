Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0DA3090D9;
	Wed, 29 Apr 2026 03:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434409; cv=none; b=MoAbO+pxG511Qt7PwG6cDiTu7WqbNqaSFGUft2r4sx+pBmLiHSn11BAqro5H/ds/h9fxd4ZWJ0awTCy1uQ6s77l/NUjnO9DoWqlSPq272VxaVY6C5WkMwb//uBgb4WR8hE/OUMuFdEGtCVTZng80Lb8FLOBYoD4j+n19+A71F6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434409; c=relaxed/simple;
	bh=9PlwOMJb59m0dV5l30jKmO5m42xoUBZhDmyraeHzGwo=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=K/bbjqyNl+hS/jkyuY2J+N0dzowRcu0iSmiIMLgzuYvKaqY+VwENhmBMOzIq05Jz4bx4sThGTN+JcfWMaybCD/+yGBq74vWI0K2bejQvuFfryB262j4acjyrIFjOyBcmO5pAAVfev5QXd8qHdhlmb4WmjUJwjCvsY7i6kiz+1Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IAyb8qS/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IAyb8qS/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E5E8C2BCB4;
	Wed, 29 Apr 2026 03:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434409;
	bh=9PlwOMJb59m0dV5l30jKmO5m42xoUBZhDmyraeHzGwo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IAyb8qS/AcltzaJjzms3GU+9Sg2utIMY2EwiOYtHCTEIXAQKwGUo79vTkt006TVn+
	 xibvJKT3Fk2XMDGPbjWqQWKkEw5UZ31XQyEb8ftkFblhIxTjSyLFJSg9SPPOQh/9uB
	 JC/yB7IoH0GlspeA8j+aAMFjp1lU9aVjh9DzkhoDJmNPD+7z+eXanFJqdVKyRT/98m
	 X0sbbneSAtQRidAbMZeMADH4v/dguO62KJkK7y1BPzaBczGdvgLfxJMCQtbYluspgD
	 wp3gbDSyCay/fnx/CZ8RjHsWPHDWC5xDNq7Gw5VCEwUE6bAT1WkQF7DH6C8TR4Qdls
	 QZmzq0mFTCq4g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260428-upstream_pinctrl-v8-0-eb8ef9ab0498@aspeedtech.com>
References: <20260428-upstream_pinctrl-v8-0-eb8ef9ab0498@aspeedtech.com>
Subject: Re: [PATCH v8 0/3] pinctrl: aspeed: Add AST2700 SoC0 support
From: Stephen Boyd <sboyd@kernel.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
To: Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lee Jones <lee@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
Date: Tue, 28 Apr 2026 18:56:20 -0700
Message-ID: <177742778029.5403.7247019083523002317@localhost.localdomain>
User-Agent: alot/0.12

Quoting Billy Tsai (2026-04-28 02:49:44)
> AST2700 is composed of two interconnected SoC instances, each providing
> its own pin control hardware. This series introduces bindings describing
> the AST2700 pinctrl architecture and adds pinctrl driver support for the
> SoC0 instance.
>=20
> The bindings document the AST2700 dual-SoC design and follow common
> pinctrl conventions, while the SoC0 driver implementation builds upon
> the existing ASPEED pinctrl infrastructure.
>=20
> ---

Why is this being Cc'ed to linux-clk? I'm hoping it's a manual typo and
not some sort of misconfiguration in ./scripts/get_maintainer.pl,
please?
