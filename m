Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792491529;
	b=Hrw47NfSl1FkR7gU5hj+BAPf5YyoMV9wFo4NmjcHMNUA6oQn2NBWjgTwzNmkAtQIF3rS
	 SnupkHVR3DHs4jHhg1o7eA05xkNxMeZSpGLpgGnQBbgyWQesEe/1cixijI5wjmK3i9AnF
	 AAQ7Qki/qrZZIIEXP2fZIQoCJnddQ5T5J1W21xrJb+Y614DpoLZXoV88YRM0S21+68zMo
	 dllDRi3JlINK7+oEh6tyTLdyXjsSbbAhZO0lhITqmRqgyzNtbM/9XQMNmC5HyG/uccIDw
	 v09zY9PwSFOPWZjHx8JeDkMloOkJPlSDU7jHCnkSGj8fWINwxynje7w8rkMOp8dVCWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792491529;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Subject:From:To:Cc:X-Mailer:References:In-Reply-To;
	bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
	b=LbpuxC8p6dKeG1uLBxq5sBsFPGFdMp4KmeyGqxrJgDIUZ7Anm2tTLBZwuEQnlMWuteNc
	 5bO1ayDzJdSCXWbDMk5cyAAd7fSoZO4xfjTR1H255Qiz1N54Lw475tzPcn7D81AdRtNHz
	 FPoDs8NTC6Ereh38/sNjxknknwOr7s3w/bUBDEgq1RSYteFjPzDes+x4CuNCG0rbZuwjU
	 yxLqxRKdRB/i9ESmpSWcVMWkqSVFsKZcTeR9H/sgOj4HHIJrrkRGt96rqwTWXdZGoCsLI
	 d4U3DNGkoQKJermKPVhELlHEwD1WGcpAVVHgZyFvwMzCYp+70ag4tuBjsLWTb7Jhz4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I55feIN4;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AB2606A31D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 10:18:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AB2606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=I55feIN4
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a180fbeef5so23463365e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 03:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792491527; x=1793096327; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
        b=I55feIN4tyXGD9Ilk8kOCGKJvDvDZYrSBgvyREUAv+WEFGc9pL0orf7sqE3yL9MNfO
         R2VrpP5SEEvXpTFA9eYMpHEPDHdTlFswXPTsVj45R2gEamEu7POVA/leoyoyB/c5XukI
         2FfuL1w8av4tzC07CKSCGbNI+bExwzy+2zRaeGoonanLy/erO6S/KJnMnrZCWi6O08en
         5tHqGgy/FbguN6/0K5uWtCnmv816AnEER7UCpXMw780MT2isfUN+u2qNQZ3/T2ySqpst
         hp5dBxskeYDNMGJggdOS3fe1GzDte/bRvu1cbJeWi5iyAi30b+S4cO64QX1PQFVwobpB
         q+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792491527; x=1793096327;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E3POQm3q9rQRS55TaGFyyCf123uDYsTNmr7KQ/BPaAE=;
        b=AEG7jTf5GB6ADPrpKFm+MhbWevCa0dHwUsFqWoGXpSNmRiO3/NOFSn0Wfa/EyhruuW
         ln4xDcDwjy8c5hcIZTQTUHf40liQ+8H1nj/O5Asicn5QCY6OsVohhQ4hxr3eaS3BQWGH
         zBi6jrKJZ/g964cjCqkGPycKTfkg45hJzxRskqKhja88bfqLjJU+OyrOIVD0jwjpoVX0
         EgFzXJjTeJ1BDWHprZDncxUw+rGhvL9OX4QqKUBp3S/rRqg2x90EcmmuewGcFqWdFbG4
         C0G+7wavBVHl31vJdeH8MvwqXdoLi2qyKx6kpGkkG0WzxOmGTjY83aOGg2MoM+d9QrFs
         27CA==
X-Forwarded-Encrypted: i=1; AKwUvBwyKhYE+U6H6Jb8CHs8qfP5rHozPJ0D53SyZRcmp3VVFkVkptrSCF0HY0e/6VhryRkE+E2MbqtXV3+l@vger.kernel.org
X-Gm-Message-State: AFq9FYIBslD8u4V6todjF0h12TdMwlSOc8QWYuFYgmr7iOXMr9sQFE7B
	hnHsIG2ujU7CW1C2J1Q0/oyur4upcD9+fJbwo/mkm09zO6O2GOGVHkDaD5KEQG2QmKE=
X-Gm-Gg: AYBFou0EeFlGiCU4pSP8YJc6D9zNZYDyOWQjgX3uIZLQ96B3z+ZIPzTvZ9JyqgkTF0r
	mbznMUaeiaxjbelMioACb03lTb1c2+Qi0jJ9AZoIomFwW4gTvrOpr9MU5Dedan2BRyGhvOCkXSi
	TGRSvCQRM9ls291XxxD6xRgTNHYJ3ypnEsLwg7o6LVCEjZz4Va6XFpkpOtv06P/2lXA1G7hHbx7
	h6j0yZfRawdZhBi2y0LkDDZPK0HN3gvDDSpeHmroL9AxluQoqBGtv/6sNfL3JYzhBkgQb8Iomr/
	AEgQFcyGBvkptStLBQ7ix0gzxLdWC8/qpurgPXeshFOVJKvZ6nbaDx8qjRFQ1i7J2IVok7BkE7I
	sWL8pdoOAiEqz2W6k6nzikevGhX85CszORVgsH3XdROM9MpI4CxIqKfRvxq4fwl5xp3P7Predrg
	mn+KqVpDIqAIyi3/pApe/cBoGs9ZP4m6RiHXOvXIMGPTZby9vsE7YgagNCZq/xZ1dFex1ehM7ZN
	mHcedpQ68Eogt2XiYUEI7tWUegQwWh2ALy/GFlscltdcjTrG0eBufv/1MP7hyNV
X-Received: by 2002:a05:600d:82c5:b0:4a1:e575:33dd with SMTP id 5b1f17b1804b1-4a1e57533efmr141959155e9.18.1792491526824;
        Tue, 20 Oct 2026 03:18:46 -0700 (PDT)
Received: from localhost ([151.41.28.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1f2cc809csm63088925e9.8.2026.10.20.03.18.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 03:18:46 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 20 Oct 2026 12:18:45 +0200
Message-Id: <DM9L7QLLNMOR.1NHOUWGMQK181@linaro.org>
Subject: Re: [PATCH 02/10] dt-bindings: pinctrl: Add devicetree bindings for
 DM816x SoC Pinctrl
From: "Ettore Chimenti" <ettore.chimenti@linaro.org>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Ettore Chimenti"
 <ettore.chimenti@linaro.org>, "Paul Walmsley" <paul@pwsan.com>, "Aaro
 Koskinen" <aaro.koskinen@iki.fi>, "Andreas Kemnade" <andreas@kemnade.info>,
 "Kevin Hilman" <khilman@baylibre.com>, "Roger Quadros" <rogerq@kernel.org>,
 "Tony Lindgren" <tony@atomide.com>, "Russell King" <linux@armlinux.org.uk>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Christopher
 Obbard" <chris.obbard@oss.qualcomm.com>, "Andrew Goodbody"
 <andrew.goodbody@linaro.org>, "Linus Walleij" <linusw@kernel.org>, "Rouven
 Czerwinski" <rouven.czerwinski@linaro.org>
Cc: <linux-omap@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-gpio@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20261016-patch-ektor5-dm8168-dts-v1-0-b4ce30217028@linaro.org>
 <20261016-patch-ektor5-dm8168-dts-v1-2-b4ce30217028@linaro.org>
 <ec27fd26-1862-43cf-803a-428846d66663@kernel.org>
 <DM6CUP7TSOMH.31T789KQ3Q6OB@linaro.org>
 <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>
In-Reply-To: <46414ff2-1273-4690-9001-4d1f825d8cf6@kernel.org>

Hi Krzyszrof,

On Mon Oct 19, 2026 at 8:46 AM CEST, Krzysztof Kozlowski wrote:
> On 16/10/2026 17:07, Ettore Chimenti wrote:
>> Hi Krzyszrof,
>>=20
>> On Fri Oct 16, 2026 at 4:51 PM CEST, Krzysztof Kozlowski wrote:
>>> On 16/10/2026 16:41, Ettore Chimenti wrote:
>>>> Add devicetree bindings for TI DM816x SoC pinctrl configuration.
>>>> Using same definition as OMAP2/3 except pullup/down enable macros, whi=
ch
>>>> are inverted in this SoC.
>>>>
>>>> Signed-off-by: Ettore Chimenti <ettore.chimenti@linaro.org>
>>>> ---
>>>>  include/dt-bindings/pinctrl/dm816x.h | 20 ++++++++++++++++++++
>>>>  1 file changed, 20 insertions(+)
>>>>
>>>> diff --git a/include/dt-bindings/pinctrl/dm816x.h b/include/dt-binding=
s/pinctrl/dm816x.h
>>>> new file mode 100644
>>>> index 000000000000..15aa15bca9bd
>>>> --- /dev/null
>>>> +++ b/include/dt-bindings/pinctrl/dm816x.h
>>>> @@ -0,0 +1,20 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>>> +/*
>>>> + * This header provides constants specific to DM816X pinctrl bindings=
.
>>>> + */
>>>> +
>>>> +#ifndef _DT_BINDINGS_PINCTRL_DM816X_H
>>>> +#define _DT_BINDINGS_PINCTRL_DM816X_H
>>>> +
>>>> +#include <dt-bindings/pinctrl/omap.h>
>>>
>>> I do not see this being used here, IWYU.
>>>
>>>> +
>>>> +#undef PULL_UP
>>>> +#undef PULL_ENA
>>>
>>> Why are you undefining other macros? That's not a easy to follow code.
>>=20
>> Do you prefer to duplicate `omap.h` defines? Only the defines above do n=
ot
>> apply to DM816x.
>
> Not sure what you need to duplicate, but if you add header with bindings
> for this device, then you should not include headers for other devices.

I basically used dm814x.h as a template which does that, is that not
correct?

>
>>=20
>>>
>>>
>>>> +
>>>> +/* DM81xx mux bit defines */
>>>> +#define PULL_ENA		(0 << 3)  /* Pullup enabled  =3D> 0 */
>>>> +#define PULL_DIS		(1 << 3)  /* Pullup disabled =3D> 1 */
>>>> +#define PULL_DN			(0 << 4)
>>>> +#define PULL_UP			(1 << 4)
>>>
>>> I do not see this used by drivers, so why do we need one more header?
>>> What part of SW are you binding here?
>>>
>>=20
>> I added those (DN/UP) because they are not defined in `omap.h`. It may b=
e
>> convenient for future board upstreaming. I can drop those if undesired.
>
> Just add the header to proper place - DTS. These are just not looking as
> bindings.

Sorry, does dm814x.h not look as bindings? I'm a bit confused.
FWIW, dm8148-evm.dts is not including the header, dm814x.dtsi is.
Following=20

Basically PULL_ENA define in omap.h is wrong for DM8168 SoCs.=20

For a better solution, you would prefer:
- Keep omap.h in dm816x.dtsi
- Add a variant like DM816X_PULL_{ENA,DIS} in dm816x.h
- Replace defines in dm8168-evm.dts
- Add the header in dm8168-evm.dts

or:

- Keep omap.h in dm816x.dtsi
- Add a variant like DM816X_PULL_{ENA,DIS} in omap.h
- Replace defines in dm8168-evm.dts

Thanks for your review,=20
Ettore

>
> Best regards,
> Krzysztof


