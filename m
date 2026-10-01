Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F285751CF43
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 17:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790876859; cv=none; b=I9DEV0x//jSkohT+AgAno5NVDb4Ao13nyuFJIjI0+Znk3WGn63WJgVdvh4c1krkVv4D506OcSDwNaQ7cgUuM7e8usySDE045pQMJfkIi/8kg6aEBakArNvTXxAatVsmGexj1Lhvvxv0b/85ZAz+PXMPZuJVdKmu4bC3qpqNZFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790876859; c=relaxed/simple;
	bh=DKGqsyseB4gKTiOiJ1SGkuTS1YW14wsyxnQONVxf/ug=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=qHb1fpWVxPFoWcUaKLrEeoCTWGc7N0T1EoMyIevCAJLkej6pac9XfPlLDuaaSobB5bBcru7TW/Z+2Eq1v4UVq76cWVXqUm4ZuJsI8YosJNAxqatzK2SaPImJjuMtaLTF7rCLEhG/PSTuJwlKYIa5ig48EihV8Fe5Ov5rGZmJfTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DoBFnphf; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DoBFnphf"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8620ffc9ec7so315000b3a.0
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 10:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790876851; x=1791481651; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qt2XCxTufBOnqOeZ29H/d598FvbM5sxD9+psOheUCus=;
        b=DoBFnphfK1gZIaasa5O2nii25zwpoUoyO0wLIOKSrjUCEUCe7l6XTCtfuq3vUCLWXS
         0DLIEsfNe7PYd4e+awDLc2siYAxvnGNsBqWyfxp3yvX5OdiopPoJ1oOeF5L8e+ef65Bu
         rSeY/UyIpcymkAQxG65w1MaYEEIFy4WyYIefkpeeOJ5i+WzHDtuRZZI8LelVu27Qh/xs
         GDS4nyCA+g2vYHfVj3I2UyYIXUgrP6QsBsrQhRwB6wJfEmiZ5pvvl3jS8+yrnWxspaoG
         blBVlLzbJ+i4j99D3hLjoMaA1xr9rpwcNrhWXB9/pCxpW3kKpivcOV7J9Z8uVyw+j/gr
         xW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790876851; x=1791481651;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qt2XCxTufBOnqOeZ29H/d598FvbM5sxD9+psOheUCus=;
        b=nxRv/f3UC/yO5SyG/Qzi8KQEsMo1Dn7XdWl6MGVwrNpzVvZzaQbfHAkr6GEH5EX2br
         XXwxnW3JCTkQbSdhp0LKUQb34YrqTdcxvrf2QQwDISMxZSGtOucttbwVfUKex++Qm6uA
         IDpRFhzLCdjTBwia9hHXWgCwrMyKSD0f9FLotW9W5qfGbJCGU1UWRhcUDyVXmKY8EOWA
         WaJbIh7zAHYEUAHYpBm7Nu5J19EiNbEq2UYJWRDCW29qyaydg8+NGqk1zu113NDhwEc2
         nc45ikckUAAPOEQz5cn1vDIiLm07u3aHcI4x3R30FAZor+Vkl0mbuOqDZCJwaeoyMym/
         Ba+g==
X-Forwarded-Encrypted: i=1; AKwUvBxydTUlrjaOgtn2CiZ3LUC1GLxxhreBg5+Qzy9ncih2MQg8eWnQB4k3h2n825pfhp5jwHKGNfZ/K5w8@vger.kernel.org
X-Gm-Message-State: AFuF++lU81Ll+qfJUNJGN4ge8MJVwveDVJQKZqLi0TKnwc22UJQ8Wxbh
	Jm/3Gg4pvXOaEtzn3hKUEjKHE++ourF/Ym0p7UydGgxJ6TZtyAQkOZYc
X-Gm-Gg: AYBFou3lmI1xl7QVKxn/0RK6jwnDCcxglRuV7gXep0o3wWsqBFDgAZVpB/fOrVaLmQt
	4DrHrJ7KBhXUMiDfjJ+5QdLTKgYQoB/ioxZOwaLI/2w8O6r2C4X5hGuHL0xYwqBRC8GRRP9ujf4
	LkKg2dHdJrae65AGcMTBDjsy1Yz8tcidCQ7JroXvmhNqmoI+DEfCzbgQ29TXNXg69iBBrsL8ujK
	agDUQftIPuLR9onaTJfX3h6WARXoYIVsrtqmxIpNzEDh75p9vgib297oifsX/6/FjRZRcxBPICe
	mNLmqktuahTPu817hlqd1Zgn5KkEwGcwXzKCwchhef0zUVcxHhf4WaGWSHgHhea9d+CL9t6effr
	8TLb1jlO7FCHgl6M2TfCWR8tB/DIJBMe+vMpAYof8SRXnQfzFDL5ptuso9qgElw1j6T364aQqzJ
	YHZgP7rULEl66xz3QPrNdd3udXOSNFG82bLxIQ00hWC3puB/0ScRzJoNWuV5Ru2kjZeb2f82WLx
	RnZJlywronPf7WyifRHmHxsqA==
X-Received: by 2002:a05:6a00:4991:b0:882:b2a:4840 with SMTP id d2e1a72fcca58-88af49551fcmr393946b3a.2.1790876851247;
        Thu, 01 Oct 2026 10:47:31 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0968dbebsm41525b3a.8.2026.10.01.10.47.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Oct 2026 10:47:30 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC 3/4] gpio: loongson-64bit: Add shared interrupt
 support
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <C6A08AB5-069E-4CC6-8CA0-DEF22F369208@gmail.com>
Date: Fri, 2 Oct 2026 01:47:16 +0800
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 linux-gpio@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <44D04759-C409-4C4C-9FD0-737A8CF9B79A@gmail.com>
References: <20260926-loongsongpio-v1-0-71de7ebebb76@gmail.com>
 <20260926-loongsongpio-v1-3-71de7ebebb76@gmail.com>
 <CAD++jLmRWGXBo8UP6RKt+HHCTam0NxaN6F1DK4XAjoQpoNujjg@mail.gmail.com>
 <C6A08AB5-069E-4CC6-8CA0-DEF22F369208@gmail.com>
To: Linus Walleij <linusw@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,=20

> 2026=E5=B9=B410=E6=9C=881=E6=97=A5 16:59=EF=BC=8CMiao Wang =
<shankerwangmiao@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Linus,
>=20
> Thanks for your suggestions.
>=20
>> 2026=E5=B9=B410=E6=9C=8801=E6=97=A5 16:33=EF=BC=8CLinus Walleij =
<linusw@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>> Hi Miao,
>>=20
>> thanks for your patch!
>>=20
>> On Fri, Sep 25, 2026 at 6:28=E2=80=AFPM Miao Wang via B4 Relay
>> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>=20
>>> +struct loongson_gpio_shared_per_parent_irq_data {
>>> +       unsigned int parent_index;
>>> +       unsigned int parent_irq;
>>> +       /*
>>> +        * The lock of the irq_desc of the parent irq also protects
>>> +        * exclusive/usedby below. It must be taken before
>>> +        * lgpio->shared_irq_data->lock.
>>> +        */
>>> +       struct irq_data *parent_irq_data;
>>> +       struct loongson_gpio_chip *lgpio;
>>> +
>>> +       /*
>>> +        * exclusive: exclusive usage, only one gpio pin can use =
this parent irq.
>>> +        *   It will happen in two cases:
>>> +        *     - The parent irq is used by a gpio pin which is edge =
triggered, and
>>> +        *       thus cannot be used by other gpio pins which are =
mapped to the same
>>> +        *       parent irq.
>>> +        *     - The parent irq is used by a gpio pin which is level =
triggered, and
>>> +        *       the gpio chip lacks the polarity control register, =
and thus the
>>> +        *       interrupt polarity is controlled by the parent irq =
controller, and
>>> +        *       thus cannot be used by other gpio pins which are =
mapped to the
>>> +        *       same parent irq.
>>> +        *   When set, the request for other gpio pins which are =
mapped to this
>>> +        *   parent irq will be rejected.
>>> +        */
>>> +       unsigned int exclusive : 1;
>>=20
>> So use bool exclusive;
>>=20
>>> +       /*
>>> +        * usedby: When exclusive is set, these bits indicate the =
gpio pin which
>>> +        *   is using this parent irq. When exclusive is cleared, =
these bits
>>> +        *   indicate the number of gpio pins which are using this =
parent irq.
>>> +        * When both exclusive and usedby are 0, it means that the =
parent irq is not
>>> +        * used by any gpio pin.
>>> +        */
>>> +       unsigned int usedby : 31;
>>=20
>> Is this a bitmap? Then use a bitmap abstraction.
>=20
> When exclusive is 1, it is a pure number while when exclusive is 0,=20
> it is a bitmap.

To correct my self, usedby is not a bitmap. When exclusive is 1, it =
stores the using pin
id, while when exclusive is zero, it is a counter which stores the =
number of using pins.

Cheers,

Miao Wang

