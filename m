Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839538;
	b=b3UY5jWUmOg4KwZ+OTI6b4JoOq1W9v27iTAXc6K95cY/7u5Ey6HhoV5+gJUIDdF5uWs2
	 8i/FR1puqGNGSb2alIl8WyNW/j14iXuhOFtUBPvOY6RDrJAs+5410DTHl8V3h2O+8yARV
	 hCx2fPavS6cbl+sTmEVZ4STPZKyeWKzatjjMaAl6Y9JWOni99sGBOflkM5vFbim5kA6Kh
	 LVmaBNEFYFuczN29Y8w5gBZnHrguxqrL/OW1MUpMGDWucNGdvsrmSp4wUITilIlCWGp9/
	 5EV2dREoNkaFtINm2rTx4J7dGQU9EX+PVNHOj4HcKF62tVHO659KuXFIB1WZ8qQr53g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839538;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=zXokrLb7sK/T1oSsUCjK0AvMp+oDfMgAYTJvXTl1MyM=;
	b=FYjWihgCiXZu7fH5vl9aArzyVhjzFQUx+akBSKqUgMldktWk7QqrLo24l++G3MvIOmuj
	 qzna9r1zpJKRb4hT/pijOW4kQs++4bHd0kSiVOVpmkxmkTLC3w3KyOexCHEGYIIzkDXtn
	 ej9E8MuySSLSC+5dItnd4eyyjnRj7InK2LJkYJQfTbDjjoDesenequG1kNmA3pxrsWofX
	 3V/7Hpnn1yHjHrtyN5ecGgCNMHClZmYdgvbPaB+gklY/suCrF538k/Q+x1CNurP6SJ7Jh
	 /8+QCy1ZUImU9jUNnEUv+wxlKTBVse+3Hl+ki1fOMp3U9yhMnjtulNfrGwb9QaiFiwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFFE606A31B
	for <linux-gpio@vger.kernel.org>; Thu,  5 Nov 2026 00:45:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEFFE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3acb512a7a0so895958a91.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 16:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839537; x=1794444337;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zXokrLb7sK/T1oSsUCjK0AvMp+oDfMgAYTJvXTl1MyM=;
        b=QUB76ypwXKpMD98H5NTFGnAkFHCckDFmuJsmrA3pChNjXA0hA4IZZcCLRex8/CkrYF
         vYTViwMH52zhLfFdaHKSkWnf4ktX91kG1UrEP6r/dhhPoVhuGGHaCvTidQre2WrMtbUx
         QYDLui9pjDxfvy6s+alvAhZ/V8ovDtVEAcPT1jiZm7wJvYcu/g5TdoCS4UKlBmfKdueA
         Q45Alz+QizkSfetUtoKpnLXB2sRtnTLK5MbsfC638mPqAi7mwbQfoaKSPutm5OC3DG5j
         Uch+UGs6jTned633Of+aSIfn96GvZoUPLs0rzRVkauFstZ8u0nK6Ga//u98CwSBZiBCC
         j2yQ==
X-Forwarded-Encrypted: i=1; AKwUvBytC2J5yEnCOJNd2ik+1KuHAIVs3PF3TYM6tnNpSnZwbqGtp0ibnJGz1rtRoN+QKn13FJbG+Eq/Iew0@vger.kernel.org
X-Gm-Message-State: APuU4Z+V82EWVjh71OIFOqr1XsHrWv04XWhwjo7SR9jTdTV1Tz8jFhND
	ggFMhtuHDO7RTBzp28WCgnqyc3UU/GhJ+aI97q2dK4sTOt2Z4yOaaQstae42NsmA
X-Gm-Gg: AYBFou13qLtuXIBaCBn4bRrMLNTcoeV7JfbSPPSHZQCwzGgTOHmTj9/eMeonEb0WjsN
	SnUOuSaFrGy2N0xx6IZFiISpHcDbGeYZ9HM5+eWacTGx6fSpaLZw10d8yAgTbFkoy/lmnawFUnx
	jMmXUFrM72NScCQuWzYFC3PSTsXs4dlIR3cTcsnDhCJ2bONw6m/yrSb9vyYdLVaVdGjAvWdDG+3
	tTAKaNnSIqC+XQTmMiYX7/A0tOcP78EcAO53Wy3xNnr35cmGyGTdlY52f2JS7GCzb/1CVRxTggK
	JiTfvDot/xaZpRoqboQNHSui33drmdJqCgv/P7oqRmB1EMPGM61byb5C9nk5kKw8Y1pZTFoJ8av
	/eBrgjC7B5JPBSDVeWpjywFRvI39R2RaoaTn5UJ4Xs3QiJxsJ7df3rJvQqZFgU5TZDacmf8BHnm
	OGjK8UZEpTnvmutBZm8zo4y6hV3aan6zvmaCOyYCWGu2gdW7sDhDStj71Bl1Lo8GGot+bE4/VOO
	8mC5sxQMa5PMVPs9U6Mn/5kG+bh2No9o8UUSn+wv7JMWeUWEki/ppV3FftRdPeiyqoaFKyErC2b
	czk81IaXwzBCCqpmVmbS+gKqKjvU0zJNqe8HBpPmQLuvKQz9NkYz5F06da0rn+cuNGVX6boNYan
	f5itetwEFKH796XImFALDsndZq+ZDUg1gWNsCUf4GBus=
X-Received: by 2002:a17:90a:f307:b0:3ae:9944:3bf0 with SMTP id 98e67ed59e1d1-3ae99443c7bmr9894570a91.34.1793839537115;
        Wed, 04 Nov 2026 16:45:37 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3160634sm1083956a91.6.2026.11.04.16.45.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:45:36 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3219028eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 16:45:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwpkHrqk6vLsFoKd93w9VkVRCixzaW/9TMK2Awx0uzaBFqO7DKuCYcpeZgXSHAC5OTvcZx/YVPBE8SF@vger.kernel.org
X-Received: by 2002:a05:7300:a945:b0:35d:d9a9:e455 with SMTP id
 5a478bee46e88-36a423b3556mr44653586eec.21.1793839536384; Wed, 04 Nov 2026
 16:45:36 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-1-4bb83afdbacf@telaak.dev> <20261104-enlighten-handling-a309345b229a@spud>
In-Reply-To: <20261104-enlighten-handling-a309345b229a@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 19:45:25 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6Hkd8sD=tz8_MTQ=OMvD8Evdhc6G6zYPF0tAZzOXL8fQ@mail.gmail.com>
X-Gm-Features: AclHuK9jO8Qr2MXvkxwK5NuEISMbX4skXJyK2Kf-3m6ima855rFUsEPggdBlzRI
Message-ID: <CAPY4CJ6Hkd8sD=tz8_MTQ=OMvD8Evdhc6G6zYPF0tAZzOXL8fQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add Siflower SF19A2890 pin controller
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > +        $ref: /schemas/pinctrl/pincfg-node.yaml#
> > +        allOf:
> > +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
>
> Same format should be used for both of these.

Will do: v2 will put both under allOf.
