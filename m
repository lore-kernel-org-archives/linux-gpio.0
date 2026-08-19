Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3792C21FD
	for <linux-gpio@vger.kernel.org>; Wed, 19 Aug 2026 20:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787170005; cv=none; b=oVyk8uyNvIqw5rCfYyZIEAO0naR6Kv6LPwJu6TzPsNFIC0ZsIKhKR2FZQg1cB4k5cjRIHvj1T7GU0PYurccNz5vMtGuueZjMOYtSDzb0m4l2vTwykqB6rl4yz5kgt90Z65rmemMp20OmiMhyHyEIhF5u5jP4wgkvgkZQi9INyKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787170005; c=relaxed/simple;
	bh=TIATeEOXYNjmrKoU3wlzCsVXfHAmPOlWXR37zssnF7U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z/HgSZapDtmRrEWqP369ICWknq6upIS0hTMGuVgvl0roJOuQzMJEfiPHTzM4xbNG2pgfEuTQA12nARPFhIsnGg5S0+VrDdgkc3esTQrZALrbrowBCn+RBblpyNytTxYzoI4ypbw9jKw6yy13tE0XeMpxeXewQY5kVZaIVuw1sXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=ZZFz9OF6; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="ZZFz9OF6"
Received: from [IPv6:2a02:1812:162d:3d00:649f:659d:f6c1:d42] (2a02-1812-162d-3d00-649f-659d-f6c1-d42.ip6.access.telenet.be [IPv6:2a02:1812:162d:3d00:649f:659d:f6c1:d42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 385B58E2A47;
	Wed, 19 Aug 2026 22:06:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1787170002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TIATeEOXYNjmrKoU3wlzCsVXfHAmPOlWXR37zssnF7U=;
	b=ZZFz9OF6aNOLQtxD2f94iZqUmptxuCyZkqkj6WCl6m2qySWEfiLPJw2mH3uHmOzDs01/NM
	bb6oILtdGx08phk17DGJCixUcD+opuS5uyIy1+g4bRC0gYdM9FLf4UpkemMTVdBTmJFkV4
	pCWaBY6x7EMcjjRWM7ff37Zp4Ocr7649xQIZwr2JsTsraoupUdkt7OUrB6quj8Z1gR11cX
	AEFf3m39oJkmSF8Q+oVrQIhKJZAE/97Y5ExTqarc6hytoKiJh6gpy1Q0Z85e+e2XqsxL6g
	4ZELdn44fG+nX7MboDJEVCp5RWfErL5XoNWL7+d9D8TN3vqQ5lWwiFiLh7HpcA==
Message-ID: <eb087ba826b3c95c233ad878f3cbeb6ded254a5f.camel@svanheule.net>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: otto-gpio: Add gpio-ranges
From: Sander Vanheule <sander@svanheule.net>
To: misha.zavertkin@mail.ru, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
 <brgl@kernel.org>,  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Bert Vermeulen	
 <bert@biot.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 19 Aug 2026 22:06:41 +0200
In-Reply-To: <df4e9924282ac9e719c693abb5e39201f172579f.1787130560.git.misha.zavertkin@mail.ru>
References: <cover.1787130560.git.misha.zavertkin@mail.ru>
	 <df4e9924282ac9e719c693abb5e39201f172579f.1787130560.git.misha.zavertkin@mail.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Wed, 2026-08-19 at 22:51 +0700, misha.zavertkin@mail.ru wrote:
> Pinctrl is required for RTL9607C GPIOs to work, otherwise controller
> won't be routed to SoC pins. Add corresponding requirement to
> Documentation for realtek,rtl9607-gpio.
>=20
> Signed-off-by: Michael Zavertkin <misha.zavertkin@mail.ru>
> ---
> =C2=A0.../bindings/gpio/realtek,otto-gpio.yaml=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 14 ++++++++++++++
> =C2=A01 file changed, 14 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yam=
l
> b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> index b18f8f0ca0ae..96396f968e78 100644
> --- a/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> +++ b/Documentation/devicetree/bindings/gpio/realtek,otto-gpio.yaml
> @@ -40,6 +40,8 @@ properties:
> =C2=A0
> =C2=A0=C2=A0 gpio-controller: true
> =C2=A0
> +=C2=A0 gpio-ranges: false
> +
> =C2=A0=C2=A0 ngpios:
> =C2=A0=C2=A0=C2=A0=C2=A0 minimum: 1
> =C2=A0=C2=A0=C2=A0=C2=A0 maximum: 32
> @@ -75,6 +77,18 @@ required:
> =C2=A0=C2=A0 - "#gpio-cells"
> =C2=A0=C2=A0 - gpio-controller
> =C2=A0
> +allOf:
> +=C2=A0 - if:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 compatible:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const=
: realtek,rtl9607-gpio
> +=C2=A0=C2=A0=C2=A0 then:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 properties:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gpio-ranges: true
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 required:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - gpio-ranges
> +
> =C2=A0additionalProperties: false
> =C2=A0
> =C2=A0dependencies:

Same remark as for the driver: I would just allow gpio-ranges for all
compatibles and keep it optional. Since realtek,rtl9607-gpio was already
published, it needs to remain backwards compatible. Making the property req=
uired
now would theoretically invalidate existing devicetrees.

pinctrl-* properties already serve as an (actively used) alternative way to
select GPIO functions e.g. on RTL8380, so that's another reason for me to l=
eave
this property optional.

In any case, thanks for the update to the driver!

Best,
Sander
