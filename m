Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792566389;
	b=apTbuwG5YAQ6GG2LZqcg2IFdgvoWQXIgMTEI+veDulPjbDVaodQXwdRDDPedyUskGcDT
	 a4sWmsQByq+CoLMQ7uhetpz05FWP+xbPcVT3QRmNY6xL8CNDq3MOnDkXOeZsvMndNkRjo
	 uzmKEIauQZwctFBHm6MUk2h4wPzTeofa8G57AqqqPTssriJ6OlDzle/cs6PpX/Wo9ITBz
	 JwX3YzmP1fZwImGuNzy/YEBJKNKFTwHbeCFZVX3ttNxD5Us6455LdGUqHDfP8pwUUNdLF
	 6YAbkMN6ox6te5/2WNSKjnZjYa75yH0FGfQ6+tIZRjYcVOZImsdBUCFUO7mBOd3mEtQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792566389;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
	b=BtkckOsU2TyjGn5Rcbuqz+o6h762U5jood0i42AzJyNp2Co1WAo3evHK/kI2x5ZjKSds
	 7q/hvVTc3eewY7NIWZpl5NgSn4JliQVS/aV8d2hvTHcbtA4xSRY1xF7iJeIO0wAuhDCYS
	 auFlLmLOCMjfXdgyyTm4MB9OnVBvKco4IIwaZ+Ky+JTYtdUldcv/uSe/xglIMgA/XaIuL
	 ql7VnQoVUnN95lkfU21mFRbOcm0Bx+bFg4GFya2xuRUqdKtahw7IoDyAj0hC+BLscA6Nd
	 P2fB2BFRf/Jzz8xn72YJk7pix3IsJtBOs9JblBG8TYP+cHatGVb9iIyiigBqqmqTXfw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2aW6AfO;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.43
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F8E606A31E
	for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 07:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8F8E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C2aW6AfO
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6afbc363efeso538420a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 21 Oct 2026 00:06:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792566387; cv=none;
        d=google.com; s=arc-20260327;
        b=TUtJMx9vY7DaTYsEWe/WiIS2UoNcOmkJvwA7jKqo9IL5AhH0wZz6by58a8h/1tvOMF
         ETNIaJf0qjd8P37O2FYAlRFrrch5hpW9iTBTbSyob/94bUTCzODxIqM7oECgNKCNZd3+
         1/X5sjzzqNImXnXXnWDzlWxKluvNOc1CA8aGDQFhLtgmf5D4qzEmkXG7BNpB7Tl0tSba
         Xg5+YjvG6FNZ14l2cL5yLYt5NTfl2Pm/eLj7nmVtu1Ou/wO43snONe6xiCDJ6yxgdT4V
         e5SBpWPlKW58nHzJojAUMbVdRz7OyjWcvD2ivg9w2SO3gJCO7IKqujFjwMi7gUfyrWuW
         woGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        fh=wP6TrY2ZKH9X2lDVPdRzl8q127nmdmIF7mrBw7EHw5g=;
        b=NzJELPYUAokAxFqiGZLkvXN5QvexDjSa8abFJujqUcEhCs8P4HpLTsvQD0q7RoFXdU
         H8sCVix2zwivClg7dyqgxZgWSdF/bpZS5WUcfuVzh+B32kmUnaKqMZfcFyEfHnDgWM6D
         u90UUAZq77AqbKgY99La67y/q3nsaqzxd1Qhg7JaEk8rnuylpl5sgoUiVcfKkx1Qjiph
         xGIV46zvc3pKMZPZ/oF1GKdB1crEZ61370oY3EkOXzLSShSD7Y8y0bUi5rjtzsBB3Si3
         gXUzbPXmxmz30JMVEcuUcqsY3iLRSfCUVZmgrSa39sKS4wrk0BhvUFcBLqM+dA8srS9/
         QeZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792566387; x=1793171187; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=C2aW6AfO2tXqS0Oxlx14bTBMVNZFQOYYIP++4Zjy0XAUzXRNiZIyd/we1pVq076aHi
         iVYIhUPzTRpHWbk8TgjZRClfvVa/ZIrYZGMbZO3DJMSCV5UIvg3fS/yC6mcleMkr5AZl
         CDc9kVye1E9N/IkJg93m7mi7sqO0whCAZMX9QcPqw07cX41RvUCWYBX2Ni2g9I4qZnBc
         vQc5Edq7qEPfSyUtvQ+/172O9D4MiKBbq1sWvU7Tk2+K4adLUinXmEHtrQ6sATHMl6NQ
         saHvu7vFC0jl/+EFXD61TpmMKJksXH1W78BY/OXH4ikoNly2no/97ZmvjpXcLfZRBf40
         7B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792566387; x=1793171187;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MrXSvMObVmUzW/wExlXkMf3oMLCJJTWEEpBTKn/sJ+Y=;
        b=L3CSBYqmefGl70ojKFPxTN3+jl7DtYdfFFBBVkIal5b3KQROlIycAMCPbbKUQPMi8V
         8GXbtFYPpV0t77vitMnrYwMjzQKy2hOXEWc294wusgG/CYxAlglwPVaB1SmrAoLgMOVK
         AX3cG/gOlW8IZmEGPESA6Iocz8/5cFIDBihIVPHfvvk/sMieq/ZikdkT8RjMIK+hJb57
         FWmvvGOEr5rKeAfRT/GfRMrPECSGZrvToeDFgrxacyore2GnvVDlVRzjeBebwCJrbQ3h
         xME2SPZZFCUMG/uAkQeobkB0KMgSGppE5wvtZHJ1arJsr8KsJ/DLQOyuOZ9uQOfC7jXK
         Bd4w==
X-Forwarded-Encrypted: i=1; AKwUvBz5J9IuivlkOUDohdhZB6UCQe3EkJCzLBdGU5vNCEIiE7ZMuqmKFkEgYt4XnGlkgG+7e6CQ20BdE0Hp@vger.kernel.org
X-Gm-Message-State: AFq9FYKL04F0w/02y8g1bZRB/xYdk1RkePGzfoPb/s9+Jkfk/MkCyWJY
	4vVNq+q78TAd12mXrzDjLyNO2W8oGnGgiKAR0k5E547v/oQn+895KTqPkBOP6fZ488kYO6TbA2W
	DaKPiWxnw3dr3gO6tWWjEiRDFdlH2IaE=
X-Gm-Gg: AYBFou25mORf2+CsBzOwxceeBVqN8tam5ObPHJYwYHdPZMo2De4M53j953bJNnQ0Pzi
	AYpt09OaF+XSFvVdJaJAbRnQ3QR5wv+gYp8jlWkzQt4Pk4V0+28lCp6sMqFk8HsrufdMI+Bfd1y
	ud6VWzMveu/VIO7W5vobGA/sIN4gVJaMIXW8NF+XqcuU3AkRrej8jlB3UB80v0Vh8cykL2nC+Rb
	5S6+UvNLOs2AAWyatizQa0uM6ssqtiKWRTQS8a5DWdZY+/JUL9NLfKg3URAYo++Wz9nyxxb5FV5
	X8r/F/wAV6NermCq/ItJx9FLiODUw8cyQ4LqYg+mpLY0F3xV0o8OD3eNFeqdGk+WcC+j4vtJc6+
	S9uIfXA5xUZrjNz9y/fTvf7e0S2za+w3qhuU=
X-Received: by 2002:a05:6402:1585:b0:6b1:cea1:a011 with SMTP id
 4fb4d7f45d1cf-6b40893d0e9mr633902a12.0.1792566386899; Wed, 21 Oct 2026
 00:06:26 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020173556.632798-1-l.scorcia@gmail.com> <20261020173556.632798-2-l.scorcia@gmail.com>
 <43b58ad7-5934-4895-b48d-5b5a7b92e253@kernel.org> <CAORyz2JaJ40+F1oyrvY_0WdqH=fritbPuuQaZ98sXagVayZPLA@mail.gmail.com>
 <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
In-Reply-To: <2426ffdd-9438-4166-a67b-96620650a59b@kernel.org>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Wed, 21 Oct 2026 09:06:15 +0200
X-Gm-Features: AclHuK9050nRGHSTN9753pi8bjuF0vHRU3cnUbJida-ygLIdS4pPdAAtcMwmgKA
Message-ID: <CAORyz2KsozjmcDCd+KVfvLokuxs-YAP0E5yJawHECu9pbPQmKA@mail.gmail.com>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392 PMIC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> The dependency of this patch. This one uses compatibles defined in other
> patch.
>
> Just apply it yourself and run full testing - you will see notice about
> undocumented compatibles.

Thank you, now I get it. I had already removed the example from my
testing branch and removing the example also removed the dependency.
I'll run another round of dt tests to be sure and resubmit without the example.
