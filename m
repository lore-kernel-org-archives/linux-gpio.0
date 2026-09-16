Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E106C3ECBC7
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564323; cv=none; b=tUkjNC9IElG4EsU9v7y2iTY7tJ4m6Dvt5HHyUwwgYbqdES4BHIi2g0yO2TK/LWt527a792b+QsQiIAm8SToexV+xyIDLrd1NnkXGMJvtZAP8UsnXXq/hV7tU68F9bXb434EGvV4cWFJB6dVYGxJ0rqYBoCzfkRpvugU0nczNxlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564323; c=relaxed/simple;
	bh=Om485/uIroZxFOSvRDZQjmpHEDREHE9m1HOLoQvEoWc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ht+TphnaX6uBOUids0A2rcKk5NUcx4YqoZxMo0uyoH8L3MIXmuQmPD8ajYn3j21wA93qQbW0xWu151Tt2r/dBnpDV+B4Kw9WGyRB4xW98iXPZa7TWYMRTORsAZ35gukbZezthRwmuqadtl2brT1qUfdmIGppjBD+9NB4v5rj8/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQ8iMu/R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQ8iMu/R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 803FF1F0089C
	for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 13:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789564321;
	bh=Om485/uIroZxFOSvRDZQjmpHEDREHE9m1HOLoQvEoWc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=LQ8iMu/RX0pyx7FgeW6At+ER0FSTEcr1DWL/ZeR2QtsdyOTVVJFstysbjki2HA0uK
	 4QI7WjC7yCfB+7Mg4vMELQATUDvX+UbWM1yNOATCXHIuTDIyBr5qW4e2bdygaJRj/F
	 3V/bJ+C8+5ttmbLeY3zZAPn8SgXUhyP8YFn94JBWqYU5eRYJ9En8mCf8ZdZQZPBVxp
	 fPY+hD7aTwEeyK61WHi5j0tJVoJ8e4TlziCSMIAb2hti+6PuMBXCtZLsKtJqeXr7rP
	 zZ8w9GYpARvTBwPNiTUr50rN/+oelsuXgjlV2qoxUa/AYmOPDkKpqB8hVb+Cv4fLCh
	 6Ou4DDdvyuYSQ==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5b5e4f1744fso1336065e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 16 Sep 2026 06:12:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzCRk6N+rjexCwB6PIj8hbgvh/ePt/5lYQM2QuMeP8/l7ON/AAIOpDlrQmuwRJzd+V+MsJEiz6MrqK+@vger.kernel.org
X-Gm-Message-State: AFuF++nwoNGJn+tWvY+8/UEuV9j+DKevANbcBe7xNOh2xhdk/Ao6RJ7y
	x2mJdwSne2WWYnRfVlyS3eI4rF4G69cRZ2/emQ/iCZF5b6PY8RYvyLf9wTBO55ML/qU5dO1+oH7
	YFqy1V8VjbTldTXxQ+E8qDaQ/A9aMLio=
X-Received: by 2002:a05:6512:3d0f:b0:5b8:112b:c4a2 with SMTP id
 2adb3069b0e04-5b8b66215d1mr875682e87.27.1789564320212; Wed, 16 Sep 2026
 06:12:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
 <20260830065118.51551-3-changhuang.liang@starfivetech.com>
 <417251d0-c2cc-4e10-940d-b75ab20acdec@kernel.org> <ZQ4PR01MB12022D97EFD74D5A80DBBE34F2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <5f99fc90-02e0-40ab-8d1f-c2e7bcce7a5e@kernel.org> <ZQ4PR01MB1202FB18CF51DB252C393D0FF2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260831-dramatic-phrasing-beb1b360cd58@spud> <ZQ4PR01MB12029CCB91CB5673761C6F95F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260903-precise-diamond-loris-ae2da7@quoll>
In-Reply-To: <20260903-precise-diamond-loris-ae2da7@quoll>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 16 Sep 2026 15:11:47 +0200
X-Gmail-Original-Message-ID: <CAD++jL=U6=YcS325TQEJCM6FJNaam=DQwXfv_TZcGusqBte_cg@mail.gmail.com>
X-Gm-Features: AcwNN1X2sinbREAw1ZUZaH6Hmq-5_GA26kEHgweDZZwtWILrrpEVQXydseTiU3o
Message-ID: <CAD++jL=U6=YcS325TQEJCM6FJNaam=DQwXfv_TZcGusqBte_cg@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 11:32=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:

> Anyway, as you pointed out there is already one code like this - Aspeed
> - thus this is a second one and that makes it reasonable to make a
> proper common user-space API.

Brrr my stance as pin control mainainer is that this was merged
behind my back and shouldn't have been done like that, and two
wrongs does not XOR and make one right.

I think what we want here is a way to flag some specific pinctrl
states as userspace accessible and develop an ABI for that.

Yours,
Linus Walleij
