Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722A047ECDC;
	Wed, 17 Jun 2026 16:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781712923; cv=none; b=IgbRfLw6X1MYBmUECt8S76wQAvxV4QMfn8jIn0Yp2o3WeVcP9tfQJABld7yT2gU087kqmOhiROCA9wb+avX1UCnvnxhRyQM+etM0bQS9eoOJ71EG/lZwmKqxsbA07xvPsxl2XdqPywmmhD2HsqTD/459q++wRp1mks1QkLPin+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781712923; c=relaxed/simple;
	bh=u1b9+EhCd4/VXAves46ZuRPNrC7aD+7SaK466F4FxLQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JWDVoGXYS/+SaE3B0MKYmoDKEOenfjvgO/o8VTYzYbfKoMek0zTP+bYLMhFKMpBtf60EiAuEGdhwphgQGy5iqxh1Xrj/+g8sQ80vLgFdVqwwYu/qLJ+QOo9pebtQsGBCLMnSXgy2RsUkx0izk32yUuh8FbtCU1BFJWjhvPWIlF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SHQVZafo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SHQVZafo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C69891F00A3A;
	Wed, 17 Jun 2026 16:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781712916;
	bh=PD3vI4IT8+ugaHfqqxvY5TqGtr2wF3luT7BisiQbBLo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=SHQVZafoeF+Byln9xKKD2VAbzcgthlA6n6+2bwoDU6UP5qGDHOU+CU7gBRNofM3DT
	 ZA0iJc8cufNprO2a0FXsPuZDLCc9DL5AewP+h3sfUVHaC8Gy33ubVVJqJovZPLggnF
	 kQTFNdT4hBi3RUikYPcgBzKxM2Wn0PgN9qx2IKH4uptwhvukeyJ5M2uNSwODzdrzOf
	 1Uc6M89jfg956y4D2451mSkQNNOEfhXQyw/3dP7lDCr57AvRAB4ghSZ53JMNJCcni9
	 Qr10RXl+xXi4Zgc4bDVeKQIYVdNyFJZ28pVmp+W7oMzKpmfDpWs6t76z3VMT4bvNvN
	 D+0yPEfI2XMVA==
From: Lee Jones <lee@kernel.org>
To: Andrey Smirnov <andrew.smirnov@gmail.com>, Lee Jones <lee@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260608-mfd-si476x-v2-1-da5f779c1888@kernel.org>
References: <20260608-mfd-si476x-v2-1-da5f779c1888@kernel.org>
Subject: Re: (subset) [PATCH v2] mfd: si476x: Modernize GPIO handling
Message-Id: <178171291455.1675957.16885396370152870936.b4-ty@b4>
Date: Wed, 17 Jun 2026 17:15:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Mon, 08 Jun 2026 10:57:34 +0200, Linus Walleij wrote:
> The SI476X driver depends on the legacy GPIO API. As it only
> really use a single GPIO for reset, and this can be easily converted
> to use a GPIO descriptor, modernize the driver.
> 
> The "reset" GPIO is obtained from a device property, such as a
> device tree ("reset-gpios", which is standard, but this hardware has
> no DT bindings as of now) or a software node for static platforms.
> 
> [...]

Applied, thanks!

[1/1] mfd: si476x: Modernize GPIO handling
      commit: f3f0acd3768dfe71aa6b2618dbeaff69f25923c4

--
Lee Jones [李琼斯]

