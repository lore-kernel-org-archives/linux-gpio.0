Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D21B53537F8;
	Wed, 12 Aug 2026 18:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786559151; cv=none; b=ABGqUvssWpu/Ppzm7eLhI3mjuMR9/DhxdgPNBtr7RQY1vKYvzaOORSr5qU64pgPZBV8Pa+DIkkNzAsKee2reXyV26kCF+Cz/ArMw1ODOOZkDpbH130CL+4TFkudk3AI0EAJH8XlSsQM7dX3bVjzLGwv5X6LjFhb9E9aGt6FRxqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786559151; c=relaxed/simple;
	bh=3qSRwzR3JEdp5YTFpIXaGvrYn94zGrD09f4WwzMWHj8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ipdBOXnBTjFKr3SiABV/f3vfDJvtrc3b5zqkuY6avIQ6b1AkOYJAR5AsAuAo/uyyC0PoEfWpOr1BiKKSRsGUDYm2dnRpHP1KnyQ0LzVbx/iOOKP8SV/lg5sebOWxQn4R325/qNG20ayrNEZcvVKTkBxWRivOdoTNkNY8gndzdvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=mjHZeJyE; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="mjHZeJyE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=q3m3hbagmrgxdgkyzjodnq23ue.protonmail; t=1786559144; x=1786818344;
	bh=3qSRwzR3JEdp5YTFpIXaGvrYn94zGrD09f4WwzMWHj8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=mjHZeJyE9jvglEcRMGg4bkmkpriFlKPNG3W25b7jaHxMX4xS6tRx0Jbdzs7YD8uWp
	 cK6h/9w5kv2ZjKDb2yuUeHSIYGMt59YcNaCCtEpwNvHnrImBU6Fmw6QoH7Q8hzHrHa
	 37O90I5frMnVy72mw/2fHd3+XWsC8IziORlCr35Yb0qWqVIje/WYnONXHvXxJ1MThG
	 HJ0QBOz8kljWmWnokZqt4dCWmXPz02zoJtSoUxjFURdKTlOvS+1ReEBQQEDCASrry/
	 bNat0PFmVa85usdccjSEsUsBjGYQjmGjpLZKZ+wGbEVvQ08T1W1sj052bHjo7bgT8U
	 uqxhWy92hQREA==
Date: Wed, 12 Aug 2026 18:25:40 +0000
To: Bartosz Golaszewski <brgl@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: Re: [PATCH v2 1/4] pinctrl: qcom: sm8450: Remove duplicate reference to gpio81
Message-ID: <534a56f8-c6dd-4196-aed1-c5327ac1c848@proton.me>
In-Reply-To: <CAMRc=McCz40maTP_MqWEdXS8OMJCM1vJrGSpa9mB5htJhcqQqw@mail.gmail.com>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me> <20260802-sm8475-tlmm-v2-1-a93e1d1cb53b@proton.me> <CAMRc=Mf+_3CYbcT79NhBPLz2FBs-xWKA5xZxY_hmHbvYvJxF9g@mail.gmail.com> <c5eb8d0e-39ed-4211-bdfe-7902f6ee7f99@proton.me> <CAMRc=McCz40maTP_MqWEdXS8OMJCM1vJrGSpa9mB5htJhcqQqw@mail.gmail.com>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 67caa6ade212f07ee4c79559ec70da7164b2c875
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/12/26 4:15 AM, Bartosz Golaszewski wrote:
> I - and many other maintainers - find it useful. It seems like there'll b=
e
> a v3 anyway, so what's the problem?
No problem with it, just didn't know Fixes tag can be used in this
scenario as well.
With that said:

Fixes: 4beb02f19c37 ("pinctrl: qcom: Add SM8450 pinctrl driver")

Regards,
Esteban

