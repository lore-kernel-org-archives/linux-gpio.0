Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AA31C84BB
	for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782028537; cv=pass; b=WC8H/sLktLfFfre+kJEcyUYGHj6BDopqg1rVEC/o/4B+0E03HQpbc8Z9BW3dV4VntGc6FifYDcxn9lg9N2+ta2nLaErdoJf/TOZ6qNWZTGjSSDX7qKhcsxLMHoIdsfpvXMEyw7Y8YNxq5hX4pqi3ztXQDpuzwt3NMrHdJxQtsVc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782028537; c=relaxed/simple;
	bh=bT+kSAr+cktWWhCVIYao26NUUMqDDZx8mDGFg9kSW1U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IcUsJqKno3h3E1dbAqCulr4+j3Zf2l7GHKAUZAlKneyDe9xm3QTHq/fluo2yosP4UlCX83S6FyaZOFc9nR7vJgbaUpnuIL934f+rf6J8izH5gUHnZ8jrtNUjI2XsVD2WJV+6MxkCCKb9CC56QR46eg3m/aPVqMvQSypwU5uxm84=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWEeaYI4; arc=pass smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWEeaYI4"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c0c15bd6b8fso154485166b.0
        for <linux-gpio@vger.kernel.org>; Sun, 21 Jun 2026 00:55:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782028535; cv=none;
        d=google.com; s=arc-20240605;
        b=Z/M3uF7zD9VAgE62GO8ug2EPI9WjEeSoP0+bCL6f9BYyUMOX7uQAAmpI9+1v2wd/XV
         ydzgNXZ1NOZkFbkDcf6PsncQuz9czr4FR+sm3ChOBJiJOj9/szaZj8q/iSPaqMBN0Mwm
         WuEMEHQI2axGRtYa9CbxpthKGHDgKkZ9KBxY22bDxttrZg1c6dCzw9Ddu9YAtrLzrzXn
         y8NL8ZX5iaxBApqZluVwFqoIYYkNQC+EDKJjK76D9TbSpBa9D84v/YQt6P5sKJliTq7X
         tjXquqcqYBc9E1phUR3gaolUCdPGUyCuQFNskKQZ/zXwINbudrHpIBUuSue5iugd06Tz
         g+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        fh=RPH0bnuxEzE9TktJ60kMoYUcWev/z6hWhpOoETpa+zc=;
        b=gKgV6757EDGXjyhuqoJOC62Av4zSwVcwqFexQceFkP7ESyT9CYtm/Sz3HEVGFkto2N
         q/eiF3mxDnjRUpiD003SYy8R5Ec13PMWCMmgdDWpwqMpeOCeGKz9t3B5QwL4By5OD3V0
         G/ffa0nJfv36Vw8YeOKl5YFcFg0TWYA7KRCULRsxdLC7Loqp0MBolMtxEMyQvLUY2SzP
         rfkBUXnyIjdUtt1Y7twqLnVFfR1qU/rQy9SONnDDviBhtUwsCDT7FWKX5eirL81m9sXK
         pjfvlJ3CbZirG3SsK0Qug39MB686oz4sHsvdj/cVj541g/L+Ig38Nqibipr+fVNgtz3A
         14fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782028535; x=1782633335; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        b=GWEeaYI4Aj8KgcCRXTTzwq52W1u6Pqo7eXhek1TWd9OFtwcLeoVDQayNGJqN1PTZ5o
         LmbGGOnxQFPOyKSL0A2kQWfrYRbx65JLmx0GZVLkPR3NLR9t4XmNcLXA2OeiU987zTlq
         L6Uwgxp/Q6g+Ob/bTBC6w+efIZok3c8gFKvzCFCbHeRX66C9Sz0CVDuDSi8lHDyHf1rt
         xS9z08vI8/ga+FEruWmiR0byDj3mrKFyTJU+SeHGI8/snB3x+Exsvcbh1HIsraw+a+5W
         OhGpQoCTIwCq/Jcfx0vVQwRerIdMdapgWPId1O2cmI6ffshz/etILyYmZcbUGobNkvfW
         6ZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782028535; x=1782633335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hMvYItPyzRe1gzBuo0wIhzY+wWucW3fQKtqTXdUcD40=;
        b=MIdV/FyeXCWT7X0Jv/YSEOp21OSqWMmVszysaqBtC5nGDbAh9or+G+Prb1Y2maOPo7
         hrkfTj/RpZ+Jc+MtlJcuerpnUhw3b1jKIuk1A8xcP2xfORprwnjcF9wNSo9vqlpQfcEQ
         E/IX6e69Msa+FZdZUiUSHmq0+RXXoXe2Z29H7Hasf79oCmWCU0rQLrnG3HK4nIQbyrB3
         a6NNBAUNg04MaLoX2ThTYpIYmJ1Sq1r3xb/Wa9v/zpGQVlN1sCVeX+RFuNTCZwrdg9W9
         mllO9NP0gTJrI5Yh0+J0NIAiTR2DDQgSLlwYWiVGd6w5WsZrUWCKuNdKe6HrikhnUVgV
         A1Ww==
X-Forwarded-Encrypted: i=1; AFNElJ/7aqEB0eCXEcNzUg9rIeha7EyiItPh1PjmgL4YFANOm7L9jmZ7kdYZ1i5416i+mDhX7L/IoxqThVnN@vger.kernel.org
X-Gm-Message-State: AOJu0YwKM4hI+th92daTejBKfNKYmYZCjN3xsn6EkK4/xGSCWwOI9Pl7
	w8IdJE1iiY5Sv2GzQSAttOGJy5tjr6MtxlpbF4vK7BSTrkCzqmB8izSMjiMm5MDTWQotxeSQVUI
	e5V+kh39iWHgH8zI25At9UKNVtTsuXTQ=
X-Gm-Gg: AfdE7cn3ARJsZTfOfOzyBn0XEcfj50xj0rbBs8vD1px2ueOWUZMa61N17cMZPrDw9TJ
	ZsylzT51LCDi5C1W0RP9E1hxIW8CFLqnb20UF7FmjEwnlICapt6/gjE5lM/VcMPV4JZSpphmgCD
	Yv9g4cSffdxhzSUtRzHDpXkWdizxVDRSvk8MuK0z77qGsvmzjyqE56La8s6/cQ3GihboLa+8HA/
	xX0scn3JXqzwFnfuVAmwoV539i3dNMgCbeghh1f6kllYSiPLYoWskBbIMWM/KdXvmkG5vSLE1/B
	lPHQJR2SlO8h9gMXqQEIklVlS0Wt
X-Received: by 2002:a17:907:6d27:b0:bdf:8e2a:1092 with SMTP id
 a640c23a62f3a-c097adb13f9mr573581866b.3.1782028534767; Sun, 21 Jun 2026
 00:55:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260620200032.334192-1-l.scorcia@gmail.com>
In-Reply-To: <20260620200032.334192-1-l.scorcia@gmail.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Sun, 21 Jun 2026 09:55:23 +0200
X-Gm-Features: AVVi8CfSZq6Enj-XJKx5vjhFc4xd-jMn2ZAzgLd4cUoBxN01IhUJaqR7lto47H4
Message-ID: <CAORyz2KB3jaRc5EFhDSuPox794UUeDgT5kRFe=jFg_rXuR9eSQ@mail.gmail.com>
Subject: Re: [PATCH v8 0/9] Add support for MT6392 PMIC
To: linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	Val Packett <val@packett.cool>, Julien Massot <julien.massot@collabora.com>, 
	Fabien Parent <parent.f@gmail.com>, Akari Tsuyukusa <akkun11.open@gmail.com>, 
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Sashiko review of v8 pointed out some easy-to-fix but real issues.
Please ignore this series as I have fixed them and I will send out v9.
-- 
Luca Leonardo Scorcia
l.scorcia@gmail.com
