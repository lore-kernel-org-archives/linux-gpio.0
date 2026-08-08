Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98F13A9018
	for <linux-gpio@vger.kernel.org>; Sat,  8 Aug 2026 18:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786214380; cv=none; b=Cl2zOvTgfE8lAIvOEQjcPgSj7vOnQXR3ibstn3wwDT3N0YIOQ4WI0FjGHrJgKYJX5yh3sg66TqYrn0SR45Rh0te8UDSIN1c5Jj0tJ4r1yf8KUdpU23Kjn0HxlMRXBcPfaaBEUBSLX3wXtmbA3Ops6imiWgwSFz2EDzkn+Ow/tfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786214380; c=relaxed/simple;
	bh=jSQ0A9K+xnOHZyNT2OndwMSs4ft9/c23YE8mq+yqz8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJCD23Y2D4RmIS0bsmlST+BsalZY6g2OZ31nLkrwwr/55wHFjy6RHO2SjEItolz0LyHUlueghiSaLEsJDWYVAx49WlEJAtY7TbULnpNRRsL48mcpHW5h5OhXvvdqXsGCmlShvLGAoCsfs+8n+s+yVXb6/wAGVAuoLEZHZcquvf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PRBHkhq+; arc=none smtp.client-ip=209.85.160.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PRBHkhq+"
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-44aeefa1c00so465534fac.0
        for <linux-gpio@vger.kernel.org>; Sat, 08 Aug 2026 11:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786214377; x=1786819177; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yzZj/lVPkDVMefq5EaYotjMjnYdA6H3Ey0cDfrm8V/M=;
        b=PRBHkhq+fjME1DJ06HOImXmppsFHIXBkesennVnK+GzQMYGaXxs2mjh/UCcXEWdBIL
         Z1BaWXi9Vyjrf+S5tygjkvN8v9A5Y5xku1LWl3cnvwaBmzq/lmVYzWgHlm/Y5Ob/PJnC
         Q9PlZgROQxHhFwCXNsVOFSWt5bVcimhFmjfIOnxUiAw9IwxB3tfKvu6gOFMeAdSbqRNm
         5uYPAhB1NQNISu/GW6vHkiDIon6QqBITmYpgyphGvBcabsvF+CZME1Uc0/Ka1ekFDYpM
         QGkoJ2d6HlYMi4ekaspS+fSpokT47C6+UM+PjaGvNx3q2IseI3bnT3g47ZZP61gSgGxE
         J7Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786214377; x=1786819177;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yzZj/lVPkDVMefq5EaYotjMjnYdA6H3Ey0cDfrm8V/M=;
        b=CgO/+0r01dypI/2H29Shxq+iCnMQkv8YolOqodOb7r7QFy7q/yoUxitTqaxigTc4TT
         nl1WoRbBL4h7Bcp4kIbijxbaMDDwuRcQE7iL+SuBoiZcwVAQ5ggiPUNTYEcscE4OUgZP
         i953pg2qVL5kEgSw2pZnQO54e+8RVQHF4DWLg0GNEZ03dOzKjQq+u4iEVLCmGyOHdNRe
         OyesPz5QFx1o/FZl0nygMc5mhgvOCWafjQDkah0WCVP8zYPJldNhYLmws7j6LWLn+DoS
         ywLOZTsGJVRtKM/ggW104wqlq+WF8gqzec3OqPNkspB8ai/E6kCNKJ6Oq8Ny8rCZVUiY
         4wew==
X-Forwarded-Encrypted: i=1; AHgh+RrcbX8nbBu65Isxre82WhrPGwjkbw21j+SXXkwxu+ffzIbUnnQwH8GK/GdlkICuqzEVL00b0ezcyWo6@vger.kernel.org
X-Gm-Message-State: AOJu0YzqJ/I60RoobY3N4PBtdvquK0KroSc3slB9xUvi7CdQZlPuhylv
	Uo1Mtm41lGb2ZUR0GU6oaJW89RM6q86PoBmaTjk13LKG0JPaZSy70hNGedFLQtQoMSM=
X-Gm-Gg: AR+sD130fJVV+pSvWNhiQnKUdCQXhNg6++TTj6m/PL+AMgb82K8QXDEALbIGwfZk0dF
	21X7Xpn7FO52xaMMzEyd9f3JoDPXIWY9FtVqHqPhWFpYsIrZt/N6q8HiA5LV/LSPLv5YXE2FhM5
	p8l7W23PvAZXPre7/GgjrpefbxPx15VHGR99IA8zMB0l/4l8i6606qv3SwRwlIRK6TgOZ0LxVft
	jUs9J2ywW+t6FCZlYDTG+A0d2vguC/NL6mISgssCwB9NMZKS/U6hC6qTMlEP82yq16LMnAl2lqS
	EKJY7430VS2PWSE1rGWVfMsLmFN0v28kuiuLT+Q0O0YWh9dp1i6jvm/VSH0mET6Nx8mIgMVmMye
	pZota/FTpxQssZ/ywHfnVL7CcMu4dhbVoZTo5X+d5JjpbjVw/FySIgqTsNNS8wbixvxfvweqpEU
	XpUwT7IoV3n2vl7K+NTYb1HoEVC22zptrvrIZWYV9O2cOQ16cpmryC1pNrXdOHTBHBX+dBBzkCY
	8LLUe2oiKphcXp8l0Bko8LpESvSaG/1vS230jo=
X-Received: by 2002:a05:6871:4cc:b0:456:cd41:1492 with SMTP id 586e51a60fabf-45a15d4ae7bmr1682961fac.1.1786214377643;
        Sat, 08 Aug 2026 11:39:37 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:99c2:f16e:201c:3bb5? ([2600:8803:e7e4:500:99c2:f16e:201c:3bb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1d793c9sm4702369fac.9.2026.08.08.11.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Aug 2026 11:39:37 -0700 (PDT)
Message-ID: <924736ec-f503-40e4-bb50-450d425eaea8@baylibre.com>
Date: Sat, 8 Aug 2026 13:39:35 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] iio: adc: ti-ads1262: support input chopping
To: Kurt Borja <kuurtb@gmail.com>, Jonathan Cameron <jic23@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>
Cc: =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-5-f89925d72792@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260807-ads126x-v3-5-f89925d72792@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/7/26 10:58 PM, Kurt Borja wrote:
> Enable per-channel input chopping via the "input-chopping" property.
> As the device withholds the first conversion in chop mode, single reads
> are taken in CONTINUOUS run mode with a brief start/stop pulse, as
> recommended by the datasheet (Section 9.4.1.2).
> 
Reviewed-by: David Lechner <dlechner@baylibre.com>

