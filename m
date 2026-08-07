Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB85925B095;
	Fri,  7 Aug 2026 02:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786069042; cv=none; b=CGKAXPw2SvMtGrFUFpJ0n7BDbtj00f+EeOc4E8YpLH8nAv+sJz/t1zchIp7cZpNdKGprjGJAeJUdbm3CH+mVkzm4OMuear51XJmZt12K7cZO8P9RmqgA0AzekeLWVlG7h0z3HkkDFva1kDMI6y/e7BM1G3cJQiwM3/EOX5Zfryo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786069042; c=relaxed/simple;
	bh=4nprjSkYOT0qGWkIrXSVKFGhK/kqLSouNIsD1wTYSuk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ikXS+/h5AXHLo3WyMC6x8g3Z7CZ05+B2pJdwtEMj8V7aegEX5Kkg5l6kowPSMMerDVzdccjPXXdDOERKr3egshI39qxBLBJh56yJPa2sfa+MaufhnXvGVxPLn7HYW3xaHwSfVPUc53CSJhNyEnHih1Azb+iYw1HX6KnrhTAY/GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=AqDNtX9z; arc=none smtp.client-ip=109.224.244.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="AqDNtX9z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=4h6bznpybngm3p4rgj47lskhui.protonmail; t=1786069036; x=1786328236;
	bh=4nprjSkYOT0qGWkIrXSVKFGhK/kqLSouNIsD1wTYSuk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AqDNtX9zx4Ef5LxdKYfRbU24jLANMpkv/PKTZdddg0t9m7k7a1OyRwl1UHwRq9YH/
	 zasfcQN2SKjrdw7MgxSxqJCW0Jd3zTJgIN3CgUvF7rWn+9aeSRWOPzdVyZpAw8yBAb
	 RU3s4GRBeSRV504IApw9RAGbQtmLcjUi2S3rsJo78gEfVY2yEZV+aoAJugSFO4nWwh
	 B7gDPm4xxjSdqH0ktUqs9tizVC2rd9smz1NADk6YcByl2B7xTvFaArDUjIFuDPFE1H
	 8uymPyoaw4EyBsgk4eIaCCsXAyopoa1jBgpI3Jg1/RRyWTdUbM4Pa5d8pMjtq3s5vB
	 HymScSNJKAngw==
Date: Fri, 07 Aug 2026 02:17:13 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: pinctrl: qcom,sm8450-tlmm: Add compatible for SM8475
Message-ID: <69245b21-ab6d-43bd-9502-d6e31505ff94@proton.me>
In-Reply-To: <20260803-greedy-ruby-whippet-8ed6eb@quoll>
References: <20260802-sm8475-tlmm-v2-0-a93e1d1cb53b@proton.me> <20260802-sm8475-tlmm-v2-3-a93e1d1cb53b@proton.me> <20260803-greedy-ruby-whippet-8ed6eb@quoll>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: ac7c11d5c76be404a804b08784a8852bb9031c04
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 8/3/26 6:00 AM, Krzysztof Kozlowski wrote:
> On Sun, Aug 02, 2026 at 03:30:56AM -0400, Esteban Urrutia wrote:
>> SM8450 and SM8475 have different pinctrl drivers, which are incompatible
>> with each other.
>=20
> Describe the hardware and its incompatibility, not drivers.
>=20
>> Add compatible string for the SM8475 pinctrl driver.
>=20
> Drop references to driver completely. See DTS101 slides.
Will fix these in next revision.

Regards,
Esteban

