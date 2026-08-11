Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com [209.85.217.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C16D403AFA
	for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 20:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786480308; cv=none; b=PSzJKY/X7xUpoxBv9hjdP5yOD80u+BxjOAKfXjr0TobMgnSFVVaEKQN3o/euT5jMuLJAto+Qe3nUr9PRJ61/RfmclKr+Og4LlvGJLr2miBnN7GuTm/nZreXcvkJ4u6aE9o1D1obilbWaygNNZqj/z0Joyt75blNYGJ332Zv0rPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786480308; c=relaxed/simple;
	bh=55glILS0uJhCxGhmHzJrvqNOxv05p9rwglsO0kFx/1Y=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=dYUAcvG0qzRp8XO7F1aKyxBfjKnBaj9g0V+NmM1jh0k4QyYa+vmPJhn+sklNhp2T30Cel9+qK9RqsKoHfeEEu4era7pNOamR45DOKJ1XqWpQ9jaMOM9ogcTnp4Ze4JZFzEIfn8Fp9Rhp4xCr0u25jvQdEChYus86LN3J70KXMzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZN5Dhoya; arc=none smtp.client-ip=209.85.217.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZN5Dhoya"
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-74748e3a4d1so104483137.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Aug 2026 13:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786480304; x=1787085104; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jQXapsYvV1u8RmWHInXHPTUbHPYP2eL1w8VqePS2AeA=;
        b=ZN5Dhoya7R5+j0M2589isoVNKDiVkZXm7oii77nD5Br7EgcgxbpaOgZVkGFaQBeSvO
         FfLixuiiirv5uStRXU/NaWRjAp0OPvtaUpxlJZCLRf4yEpbK2ZmnBOaM4mwdF9ukYKxi
         vdrCIIQX4M7J9nmC+AXzHNh6zZrAnHMOqFzkvq0rOzWZ++6ObE6i90j+00XNbH/GZfeh
         z9N+gIcd4vTnvEBVNEImX12gJeoHNDC9G8lHUIaI4rI2IYyup7pO8KCU5Lf9JN1AYhDZ
         otQnU04y02vBCStn41Cjm9wMv3Aj/Q5a6STFQdCp2aIExoCRfyvyudSB56Y4U6h7JV3j
         Qq3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786480304; x=1787085104;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jQXapsYvV1u8RmWHInXHPTUbHPYP2eL1w8VqePS2AeA=;
        b=BExiLiFSPKUPAR9MEq3oeR7iOhTKQ81Yz/G3uf1LnI8Fcbtq+Win9H6BKOmPww4H0P
         fZLJtWoCb5AzjlSrRxYsAhlbvFloPBm8i/P9Jmb8bUJTnni0ySQS/E9AG4CzEfORe7TP
         SvVJCOhYnjRbMiZHVhyaBJv9FB1U9MeqvWua8guh0EkDuDklKeEcJU9RplgK0UutfC/h
         fSLa6C2mgcn8Tn6VAOEZSnqWpOEkI35v1b8wJ4rZwqUm3m8O26aOy7/k6SZ2/wjPohNE
         OmzvxIP/quMZ0PeHkkA2a/76uyafvbsk4k+HrOGD8KlntbisF/0FDYEDeai6vR+WvlOA
         Z10A==
X-Forwarded-Encrypted: i=1; AHgh+RorDkJW4JxWbZrX4hJJCIqU4IgGp1TGVwHtYGk0DEiGAcUq4xC8W7HnddZjG0Op/JcMNebNFR14nHTN@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+JKgsrUU4mIfWodMt7DqRYk1Tnb9BOdga8a6OTK9c27egrVPd
	cmbRqbkqPiX5EfDHarkVeGFtzHUId6vRMUDrdyYIc0R9q70ZSsb4mmqP
X-Gm-Gg: AR+sD11/PsPeR86n9nEWGHQIKiTxV6Iq6JKx2DLzlq+o4P+mAu02PwF5DC36bb2BZkR
	VrPL0tG0SpVmL2ZB7Mzes8YpXoqdRqcWD+utQt5ZNqD57pVI1EQzLjG75AnsaiyaRO3rD8YFDs+
	aeeTLtOH29CggY5B0e/EU5lziaNJCKDvq9Rxu0XS285qK0/e9szXlQ3Q5LwBlkzsMMsyl1Sx6Z4
	7caLPsKkJTOuUJyovBakTuRxEP0HGCMpKludXs/+AaAQMFTdSpiWgrVbJuNqOmTZjlokXw3l70f
	W8gmk0XIR+e8jzs0VUy8PUdviEoQEsqP6t+/Bp957Iw/VvlttbF3/1LmuEIYeIKbLrSQ1KLd3dX
	cSmw7rDz7Dh7ByjVjuQJ7XPLAkY8MuoOvLcv+KLJ296NkGW6TCG8cB5WRaITi0P6vzItAu8XkAI
	AOrKdZYeq3Xh3s5pQVsslEmWb3qEDR1h7mijJj/W/R1ANBRLDNxBl3
X-Received: by 2002:a05:6102:1496:b0:763:ce80:337e with SMTP id ada2fe7eead31-76b54d84d6dmr1994826137.1.1786480303709;
        Tue, 11 Aug 2026 13:31:43 -0700 (PDT)
Received: from localhost ([2800:bf0:177:563:8f3c:3421:b12:7a09])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-76b632912dasm1128489137.5.2026.08.11.13.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 13:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 11 Aug 2026 15:31:40 -0500
Message-Id: <DKMEEWB5S99C.1AV3WDDKLSB87@gmail.com>
To: "Andy Shevchenko" <andriy.shevchenko@intel.com>, "Kurt Borja"
 <kuurtb@gmail.com>
Cc: "David Lechner" <dlechner@baylibre.com>, "Jonathan Cameron"
 <jic23@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Linus Walleij"
 <linusw@kernel.org>, "Bartosz Golaszewski" <brgl@kernel.org>,
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, "Andy Shevchenko"
 <andy@kernel.org>, <linux-iio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
From: "Kurt Borja" <kuurtb@gmail.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com>
 <ad95afb4-e667-4290-8878-fdd7067f20fe@baylibre.com>
 <DKK9QWYHOBOT.2VD8XMZTE65H4@gmail.com>
 <anoc6axjV0uSXDzB@ashevche-desk.local>
In-Reply-To: <anoc6axjV0uSXDzB@ashevche-desk.local>

On Mon Aug 10, 2026 at 1:48 PM -05, Andy Shevchenko wrote:
> On Sun, Aug 09, 2026 at 03:26:57AM -0500, Kurt Borja wrote:
>> On Sat Aug 8, 2026 at 1:39 PM -05, David Lechner wrote:
>> > On 8/7/26 10:58 PM, Kurt Borja wrote:
>
> [...]
>
>> >> +		ret =3D fwnode_property_read_u32(node, "reg", &reg);
>> >> +		if (ret)
>> >> +			return dev_err_probe(dev, ret, "%s: failed to read channel reg\n"=
,
>> >> +					     fwnode_get_name(node));
>
> Use %pfwP instead of %s (same for all other cases).

Thanks! I'll use it.

I have a vague memory you may have already told me this. Apologies if I
forgot.

--=20
Thanks,
 ~ Kurt
