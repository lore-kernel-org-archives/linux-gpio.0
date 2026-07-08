Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F76F43C07F
	for <linux-gpio@vger.kernel.org>; Wed,  8 Jul 2026 12:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783512977; cv=none; b=pr3NBwlpNM34U5Wf4vMIiqHc1LN6bGiq9CdeTYMUThmutsigk4H0wCC2uTVCyPz88cUEZlkoTQkpGWNoGck22Ych2PtvTBrdUTy5CJhcMC0GRaScC2IMQkAh9faqf+5/XE67qpgHAU9j3PMr7GeKKQT3ubyoMBDZ6dcLhxwmGes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783512977; c=relaxed/simple;
	bh=89j/Vg+mxUc+a6GV2Yklth3BpvuokAtPW5SuG5t75Mg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=uvCTZa3mp5rd077ftIUh2v84RRulBMeTdHHW78ZRiGLxWPhIXmXkR+UyfWzAFG3Mb6v95glRCFagSbEPEhjX4HVU1yC1I4qAfGkmpB9l72/avlse8y1+t+yEvQb4J+vXxhGhuOJSfnzaLqABKT+mIMDl9r6ntKWk0zqf9U+jJ4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkH5sWiS; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkH5sWiS"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cad85b7b5aso500715ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Jul 2026 05:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783512975; x=1784117775; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WtPxIe9ZDXTB4bAnWWhC43OWYPlhSUNmRAB3alNpo8Q=;
        b=qkH5sWiSyarNKV5aC4KiWnvMhcn5HtHnlBvGC+DP7kUTQfX8KXfVOkPlccJOxMzA0T
         5mejjhtwQFxCJBAgLgN3lt81TAx03qR5XmhZqiuxaFABuFnlr5vB1gHzWWC3vE0UpjAb
         wIaNgLopiOLFKJLzGwNBxF5kJ0VdrxHuf/7nq2/AR1V8LqFCh5Hl2H4tZ7KmPl3DNvep
         U/49nMzdAQQpMuSDlAawwJPIWbiQxZG4ccW1Ah1fJtQ9W0pi5W72+LBe8VrNVALV/IpR
         ZvnJygbp8EYuJSFSNCWUGyc2RL6reeZf+CEePa79R8XxErM+oDwWmP3lVRqJQqlCOPiq
         CUPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783512975; x=1784117775;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WtPxIe9ZDXTB4bAnWWhC43OWYPlhSUNmRAB3alNpo8Q=;
        b=omfJcwTt8sLQQEvYz3f8cU/UgqRVQ9l24MP2iszXR+TxgPSoVCnjqbDLWiExtScN8X
         dUCvyemuMHxzPB6GRJIsDkh7rPd0luHr0wGeog+h7i4mHMUL7lwVVsKH9fYch6BJZbUY
         d2oYHh/uvQTte+/W90pKZ7BVGLd6W7fYmyqnPAfKRwq490ke2v2xCq0M3zpkfk0uJlRG
         ZVu5dKAFdJqpi19rdopI9yPJAKXKLPMVw1wjfRu1FIhooxxTVx9GSVvBkeTyJmapxJhy
         wiB8DyAWwlf54Qx6Cur/xmrP+8D5w+upb5OY9a29kGMKe286bV7gWnfFAcCAo7aaFzgP
         uRmg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2dYn06zITtbsCMTE0TSDRevNbR9gHGAYmuebk3a6KtZrwJm49cqNs2zIhxUY0i+lUGlfaYIYN2JHY@vger.kernel.org
X-Gm-Message-State: AOJu0Yze7iCbmc8fToi0zVbsjULhxaGJ9obbIvwxGOWrGxapVadOWwPu
	9eAyDVav0nsd9ko7D6b4ocNFmMPB8GgeUmVNtDRg8sDNqonuRJ5wY/J68u5Kd3EJ
X-Gm-Gg: AfdE7cmdZXQpfDRJTY9LGtUFl9/Ul9wYUkBoH1amd2N0O6FLefr3pwAKMlau+yb6bMt
	uVp2sVu89LHgQfqabNbvwNlzwI5lEbQasppwa36XJIRhBIVyyc9YnR5wp0Uq9vrcxFu2tZIswT3
	1Av0lsjpoBt4lsBKSiNRTNzx+rvbGi0177RQbTrOF2qbISNLSrxmTaiKg2TclQ/5WrhIvxwISS5
	s+nICgHdwjXmodSqfGEj6SdZQxuGnRIx+du6rKKUxyS8MIRHXnwpydKxQxM6waTZp359IuUdyfG
	ChcFShkKOvYstOH2Km8G2NJKR5X7qvTtrNDss4QBCz5Q8nIN8kZ347WBHE8y3qc4vjY8wRIFk4n
	JGPuvqxERPYRfcAwsofJEzhsPasAxFoBLasQYx8LyqU/mPSU8/Qfj2BLPky4PT4IZQM5fRQbmGh
	h1dG1ySUhIq/TRLjtdHdZlq1Ha700GR09/X5O/fFAk8JVaLQ==
X-Received: by 2002:a17:902:d585:b0:2c0:db23:4a6 with SMTP id d9443c01a7336-2ccea33a741mr19490865ad.1.1783512974833;
        Wed, 08 Jul 2026 05:16:14 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d1e284sm27267735ad.40.2026.07.08.05.16.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jul 2026 05:16:14 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v2 7/7] mfd: ls2kbmc: Capture the reset event of BMC
 through GPIO
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=MeDq6=u66hc+ChmJA9iKRhsYFhg7rKkCGh2BA=--VGkcw@mail.gmail.com>
Date: Wed, 8 Jul 2026 20:15:55 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C8B03257-3909-4323-B183-331F7CB1DA3E@gmail.com>
References: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
 <20260708-ls2kbmc-mod-v2-7-2afdd1741766@gmail.com>
 <CAMRc=MeDq6=u66hc+ChmJA9iKRhsYFhg7rKkCGh2BA=--VGkcw@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi

> 2026=E5=B9=B47=E6=9C=888=E6=97=A5 19:36=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, 7 Jul 2026 23:16:31 +0200, Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> said:
>> From: Miao Wang <shankerwangmiao@gmail.com>
>>=20
>> The reset event of BMC is captured through GPIO. However, this driver
>> bypasses the GPIO framework and directly accesses the GPIO controller
>> through the fixed address. When the same GPIO controller is also
>> exposed through ACPI and probed by the corresponding GPIO driver,
>> there would be a conflict between the two drivers.
>>=20
>> This patch will try to find the GPIO through declared GPIO pin in the
>> _CRS resources of the ACPI node. If no such delaration is found, the
>> driver will fall back to search for the correct GPIO controller and =
pin
>> according to the fixed address and pin number. A possible DSDT
>> declaration for the GPIO pin might be as follows:
>>=20
>>    Device (BMC0) {
>>        Name (_ADR, ...) // Match the PCI address of the BMC device
>>        // \_SB.GPO1 is the ACPI path of the GPIO controller
>>        Name (_CRS, ResourceTemplate () {
>>            GpioInt (Edge, ActiveLow, Exclusive, PullNone, 0,
>>                     "\\_SB.GPO1", 0) {
>>                14 // 14 is the GPIO pin number
>>            }
>>    }
>>=20
>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>> ---
>> drivers/mfd/ls2k-bmc-core.c | 162 =
+++++++++++++++++++++++++++++++-------------
>> 1 file changed, 115 insertions(+), 47 deletions(-)
>>=20
>> diff --git a/drivers/mfd/ls2k-bmc-core.c =
b/drivers/mfd/ls2k-bmc-core.c
>> index =
f87224105b3720cca97dcef089dad63fe57bc8c2..7187b2dfddc3acfb9fdf3cb3b4675299=
928dd03a 100644
>> --- a/drivers/mfd/ls2k-bmc-core.c
>> +++ b/drivers/mfd/ls2k-bmc-core.c
>> @@ -26,6 +26,9 @@
>> #include <linux/stop_machine.h>
>> #include <linux/vt_kern.h>
>> #include <linux/console.h>
>> +#include <linux/gpio/consumer.h>
>> +#include <linux/gpio/driver.h>
>> +#include <linux/gpio.h>
>=20
> I've stopped here because this is a legacy header that must not be =
included
> and none of the interfaces in it must be used, as per the - very loud =
- comment
> at the top of that file.

I fully understand using the legacy interface is deprecated. However, =
there
seems no other way to obtain a gpio line description after a gpio device
is found using gpio_device_find(). As the comment shows in the code =
below,
the only place I use the legacy interface is:

gdev =3D gpio_device_find(...);
desc =3D gpio_device_get_desc(gdev, LS2K_BMC_RESET_GPIO);

// XXX: might be better to use gpiod_request()
legacy_gpio =3D desc_to_gpio(desc);
devm_gpio_request_one(..., legacy_gpio, ...);
return gpio_to_desc(legacy_gpio);

I just borrowed the legacy gpio interface to request the irq =
description. I
think that gpiod_request() should be better to be used here, but it is =
not
an interface that is exposed. As a result, I post this patch as a PoC =
here
to discuss and find a better way to achieve this.

Cheers,

Miao Wang=
