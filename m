Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 757C1421F17
	for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 12:16:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911392; cv=none; b=EVmyntMXwOEVNNH5CTLrOC3RvGNNTRmUijuJbKxA/3tkxhef+wvsqea+aHEVZYuUBjDmlQFjHhYUCr/NpvlfZZpPul/Li8Sm4DAt7llAzLh8L9ji+iOHeODO6dLfkz6WUy+KH32GLWyV3A2vhguJ0nhS7oOrTOCetmvOaKcmxQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911392; c=relaxed/simple;
	bh=9vuH11vqZu29gsum/hoeAJ7Zy2fpKXOeqC/I7bxBlA8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cCuL5KNCC44LPOBz2loWz4cHyOvhGjV/I23MrJwgUN0tBEkPcNY4xVxwhtNwTU5oUo5RGFK1bfOIFBq2ZrXtOpw6TlZVdMj8zuWnSeID6Fb2F1qJ+vBUuewTYXGVyqJ0QQ7LpAHa7YgeOCelLtFqP2qqjGd2ofLRgyu/qZYOi/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fTJ59fvI; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fTJ59fvI"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-81f46b5e2ccso2728814b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Jan 2026 04:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768911390; x=1769516190; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9vuH11vqZu29gsum/hoeAJ7Zy2fpKXOeqC/I7bxBlA8=;
        b=fTJ59fvI+29697Q7JKksBkmBnL6vcEIJhQkhOxh3sCKGnxFknP7k03dUf6LEd0f6tN
         SVYteULHF4zNEplJarwkzdtOhzkthlQv4aVgg2M/KywS7G1ERppCC1M/P4n8x+UmqGvU
         IzeRfC7o5oZXsjn1fPRCrEHO1cFYDvvKxGwhcsdrTViaMe73ajyaaxij1N5AxZg/VYco
         FIvWeVeUXLkKvZre0h8sTrmCXNzU7a5iHN+/LhgFn3XIosFR3Tykq5dbEuoH1HU5ol/B
         Rq8OyGO5IWmesTA+yZueUl0NpoQw4ZigQVpFmeMpjNT6DkdUnGOQOE7/rypOFa+khZ6+
         VagA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768911390; x=1769516190;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9vuH11vqZu29gsum/hoeAJ7Zy2fpKXOeqC/I7bxBlA8=;
        b=ovgdlfwrOq+X4kU5vluWed94s+IBf6MKio+nfR54lhVw5CryglwcaLNxZgETnyZQGl
         kA1dxloYY7XvMvn/DykEl1i8e/aG37VOmBhT6Laj8r6r0j4yFfmaoafeG1h0GYM5W3jF
         g4PQgL3dlZzqlhuZvRKUjN6T0LTBOq8MPyvViZMj7Omks6GNELukBxBXVjSkRubg/GYy
         xZii4Iqum0EoCaUiPlJTtg/k1p5j7br04B8xy7gCasvF7VTh8x2k99dokWMUFSVc+Sz5
         PrQ/MD+3bkbaE26PYUoZNkYfcQOupZtK2bssum2cF+efXTniGI6iPVPuuwbsgJt83fZZ
         b3gA==
X-Forwarded-Encrypted: i=1; AJvYcCWdILT+Ay3MATYWBNWdz09cb8gqztVsIgEEmDiJOUS7MzajGwxc0zMgPxO6woCcswAsvA5wIk5+OgSh@vger.kernel.org
X-Gm-Message-State: AOJu0YxmenvNPFl3kpgk1UjDuKoHyDkI6Oj4L/1txpQCbwld+12vJapt
	sO46/wxCGVqbMbP07FEnNlmELCeq9fnzz3Mirgr8GCdVBuZze83x901EuhmaqJQ/ukU=
X-Gm-Gg: AY/fxX5KWlUqajAr4vuj81fb9Coc+Ta81fbyKWxdM/mL8bI/apPt8OSw8N8PLqHwdW3
	m+H2b1R2xzv8BS2Htf05S9eqMDYLisSjWkOxxavmBS4aVW1r4pZAzkV9wF19S1GOlW68M2JaJjE
	orxjismK/0WLiLpibh04AUQjEkRzW9hQBX8195c+AlTgPnAAJ9+IWrRlE5DU/r4MAeAOGPzW3UQ
	x1kTdPL/rFmG4W4DjYEkyqZyHTCjrJAxnDpHNpd14qxN5Mcd0iN0psqABZ4jsTgWFge4JbynsMO
	AaGsdZfMs6Wq1KKJ6jtQeVQEpK1Fn8h2uwnE70jj4b6Esx/muKHR98D06YrIMhXv7yEdEtt2anH
	5d7OUSiX2xAv+Mp5Z5e+8sgfWPgPMG8i0yVUTw1OfOnx7FGtS77TnxSejCSg64Yg7QGlex8vvkC
	enPWoxDopFg2AKNMCP
X-Received: by 2002:a05:6a21:6f07:b0:33f:4e3d:afff with SMTP id adf61e73a8af0-38e45d0eb85mr1912793637.14.1768911389547;
        Tue, 20 Jan 2026 04:16:29 -0800 (PST)
Received: from draszik.lan ([212.129.80.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352da1eb6a5sm897758a91.0.2026.01.20.04.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 04:16:29 -0800 (PST)
Message-ID: <17cb0fffa7531e75b8cbe11252deaca1bf377a39.camel@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Lee Jones <lee@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,  Bartosz Golaszewski	 <brgl@bgdev.pl>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij	
 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Peter Griffin	
 <peter.griffin@linaro.org>, Will McVicker <willmcvicker@google.com>, Juan
 Yescas <jyescas@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, 	linux-samsung-soc@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-gpio@vger.kernel.org, Bartosz
 Golaszewski	 <bartosz.golaszewski@oss.qualcomm.com>, Mark Brown
 <broonie@kernel.org>
Date: Tue, 20 Jan 2026 12:16:22 +0000
In-Reply-To: <b9df01e9-c4ba-4e2c-b458-bc93663ab78e@sirena.org.uk>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
	 <20260113112244.GE1902656@google.com>
	 <6ace23c4-d858-4bdf-9987-104e706190cd@sirena.org.uk>
	 <20260114155011.GC2842980@google.com>
	 <b9df01e9-c4ba-4e2c-b458-bc93663ab78e@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-2+build3 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Lee,

On Wed, 2026-01-14 at 16:02 +0000, Mark Brown wrote:
> On Wed, Jan 14, 2026 at 03:50:11PM +0000, Lee Jones wrote:
> > On Tue, 13 Jan 2026, Mark Brown wrote:
>=20
> > > Given that the bulk of the series is regulator changes I'd been
> > > expecting to take it?
>=20
> > I have no issues with that, providing you offer a succinct immutable
> > branch containing just this set for me to pull from.
>=20
> > Failing that, I have the machinery in place to offer you the same.
>=20
> Yeah, given what Andr=C3=A9 said about dependencies if you could apply th=
e
> MFD commits and send a PR that'd be great.

Friendly ping. Is there anything else required to get this going please?


Thanks,
Andre'
