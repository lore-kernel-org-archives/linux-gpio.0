Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10E18314D35;
	Thu, 20 Aug 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787210889; cv=none; b=StqrA/d/sMcvurPIaWtrdqYIWWXpvYXhXBVvOP5e+9en7rV7qPKY/JwLvbvzXKdSaCVHD7+LOhsEtd4Mss7s6t6eZ58vFOmDGy9HClm7E1TOFWhLTy0r2Q2rVBkYm/ZzgbyQFuXECBVd7Imh0OvRGuddm1zcHCRCRdtnwQLBLxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787210889; c=relaxed/simple;
	bh=eC7SV2nFqOz7VIuhCPMy2KgDLzwnbiRyzxACH5NOVrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dCeJm6lse3lPq2C1cUR20YFwF/5pVwcZRuo69iOljvSCkXZzCAPv7h7QTfd/bd+9Kfl5cCNsUDvaPF3mSpO0K2m1DiPacCexP1C6FiMwux2vos9BBbRO1nyVUNq8qFqHe/NchiCOVgRZxJtSQ6MgUguFcQ3oyo39dYquxyloSQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9MlsMka; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9MlsMka"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C23941F000E9;
	Thu, 20 Aug 2026 07:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787210887;
	bh=eC7SV2nFqOz7VIuhCPMy2KgDLzwnbiRyzxACH5NOVrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=f9MlsMkaR8DreNx23WomCwU9l/q+ASNXFY2UOE7OKuomVisqGRtOioza8LTbdcTfK
	 sqBSwah3cAHHVYbxSj6YCzK79tnZHDaSPEtQGEsrzhRoRJLP4OOsKiVIp+E6egQvy1
	 mKs0uj+WaAEpvdvUyWcX9nupVUpkzMf1ccnIlEPCYs+ELcyqtcoW6HiEacXsZf8Fmu
	 OhqKOlp20PDtxP1ZsS6BQogCjNsKRxfwyWnF4iImTH1SdwW3OUU0oxTel9ft8iYEzu
	 8V6lt5nihgvU7ZTqKR2hh7FKPvTJxr9YxQfhSSyCaDi0aLN+aIEZJry2l6SdFBlUiG
	 Ca56zIF3HaWXw==
Date: Thu, 20 Aug 2026 09:28:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Muzaffer Kadir <muzafferkadir@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add MSM8952 pinctrl
Message-ID: <20260820-delightful-enlightened-raven-206d1e@quoll>
References: <20260816-msm8952-pinctrl-v1-0-a7272bcd2187@mainlining.org>
 <20260816-msm8952-pinctrl-v1-1-a7272bcd2187@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260816-msm8952-pinctrl-v1-1-a7272bcd2187@mainlining.org>

On Sun, Aug 16, 2026 at 04:48:30PM +0300, Muzaffer Kadir wrote:
> Add device tree bindings documentation for Qualcomm MSM8952
> pinctrl driver.

Do not reference driver, but hardware.

With this fixed:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

