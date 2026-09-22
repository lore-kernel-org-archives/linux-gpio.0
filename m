Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3ED535FA2
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 10:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790074513; cv=none; b=lYXZpmY7wmFw6zAc5RelMu29xhTdgqqT1p4CDH9ce9gUVEZwidD85yt2HB3WcZbnxj7O18p29uRuNLIwrGEwYf3Cc7+vL712sPplHp2Hrc4JNWPDnnJA3GfGosOobHd9sI4jTnpuklMgNzLcXQCuKZb2wX4EAprXUZ0ed8IEmog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790074513; c=relaxed/simple;
	bh=FJ1s9+IWST7wzuvMM2nR3FjXUniYpzyF+HfM2q13NXY=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PQb6BNyzPLXCLBqFgOURX/L+Nq3jvrtdBHA8QkOlL2ZcIS4r/qZiauNGGhoadTIcDIM69cTib0cHeFrPEBZFot3mOoVLKR+fjh8iHUaC6CdLgmVXOTq+TAGUYAjImOGCcHRv5zfP9b8hPrvjQ8Bk4paX4csx7jCqlzOVE73Aqkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nzGu4fmX; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nzGu4fmX"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2ddb3aea488so5282005ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 03:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790074504; x=1790679304; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Qvfi21S6/W+JGJPKauvye3VyzMgsaM4FPWg0czrYd1M=;
        b=nzGu4fmX/1Zbsl+RiK5F0fabBnFs83C23MXYNYRjbrKN2TIBimQxVrV0hd4DGnUZD8
         oyzXCO1F+f6o8zixMrEMzEudB+WXia8ooVXn1AwZxi7kIo6h/3auQsrojyX9i43qP1hH
         fxMqrgoDCLz6InpPf/YeQp56EHFVqq/OnDY25ldBSdpR80pEfQ2upNXpfCY9RF/OmH/W
         yWlZGKlZ3JFfuz52NfvUcCmtpqNHC4H8rESrEtP37MMFPPwxL3EG0eo8yJgIt4HvPOOM
         CB0pZeXQqE+pUKtRPNo26oK5FgXIMc1yvimSVxyiNabYeDiv4RGPxGm2Vq4vsPmNAF/w
         K6ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790074504; x=1790679304;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qvfi21S6/W+JGJPKauvye3VyzMgsaM4FPWg0czrYd1M=;
        b=Bqi9OEi0M53ZHfRQtByVarRJ4Lf+8oumWBQye6eFAqbVVWPEBNn8SyeMM+XLGJHFvs
         eAzdMM0RxnXVAnPGGOCMdOdkzS1aR8YOjSyucTZrLcV1PH1+EfMOjRRwuL8qerGjUxi/
         qkA8lpNi1UxN7mNrCXVLUxKXyOcU+qTMnM+yljTl+LM3vbNuAMd/NCF/Ia7qE+Zg+gKg
         8u1/1ijeT/XSAQ188w3VUJhara4NQcb1fCvRCzn+ndjAgHAfNsdod6P4ErdGV5XRjkIv
         nS998XDvED7Z69YPSrTNJHkCSvxYb02pHSyjn+t2SccwHaUqFSCbaWUvNO2FcNpJ/DUw
         8j3g==
X-Forwarded-Encrypted: i=1; AKwUvByG/LhVLtlBXxI43PyRZ8CuX1EiTuLt/RQNSS88ionF3j0wI8NR3AxDm2jevay4vmiYFL0DTsST4w6/@vger.kernel.org
X-Gm-Message-State: AFuF++nVeeTrx8QDq565Ljfu5PahXrAKZ6YAzZitr2A3XLBVl0J0pzi6
	BS7CDixywGnFUCR+1mE+W5UTszxwR4d6aely7qCCKcrcMrRZ8Huv8jCy
X-Gm-Gg: AYBFou1hSLnBBbV4QbH3bRkXoxUGnU1YEyAlqYCS7Ne0eDg8Dd/BjOuzkoKUs9JdF6J
	KG4oqz/WI8vovj1BK6HmhWL4PAMtZf/88uyCDYwaiQlKa4bCoz2dvbucwpvpoxcNhfe27T8mYvD
	xrsnc/YCGmLZf9d7au7FOccoy0OMvLAP4vJ/icDu6Q+US9VpaGJppXl3Krm9Xh9OZaGWnWZmaYC
	eHJT934mSFTLrm3efKE48aVVXXC2wsEm0vNWpYzmc9j5MpqtgJC6bp5FWuANeuoL0ti5nu7G8q1
	HXm9Cyc8EY2bQKoL22A10OASWF32xp55UxrWBg3JR9RymegfIzPOmtbxF5ZoPkosASjwIj1InVj
	7tWuRIhnrGDtjh2ncrU+6iXmax7qdLWAJ/oGFaoTKILlWMjsIcL4gImVFH9Fdrg4BHkyVHXKjw4
	3waC4DdQydJjQhXD9eozPwyYqJP2p2VLmdwsyqTVlxKGBr9996QjA72HQBHZbfBnjBxw0tuMoJu
	YHbl8BC/Vfa/bCz/BKg
X-Received: by 2002:a17:903:1a24:b0:2cc:f4d4:29a0 with SMTP id d9443c01a7336-2df60bc66e2mr12441705ad.3.1790074504347;
        Tue, 22 Sep 2026 03:55:04 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df5d019a69sm7754535ad.15.2026.09.22.03.54.58
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Sep 2026 03:55:03 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v9 0/8] mfd: ls2kbmc: multiple fixes for this driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <52183cd9-4b43-456d-896d-ee2fea6d5d72@loongson.cn>
Date: Tue, 22 Sep 2026 18:54:45 +0800
Cc: Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Corey Minyard <cminyard@mvista.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <F6B4A7C7-066E-405B-B6B0-B27D29B4BEFB@gmail.com>
References: <20260811-ls2kbmc-mod-v9-0-4fa9a5584406@gmail.com>
 <52183cd9-4b43-456d-896d-ee2fea6d5d72@loongson.cn>
To: Binbin Zhou <zhoubinbin@loongson.cn>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B49=E6=9C=8822=E6=97=A5 17:55=EF=BC=8CBinbin Zhou =
<zhoubinbin@loongson.cn> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi:
>=20
> On 2026/8/11 16:07, Miao Wang via B4 Relay wrote:
>> Previously, the driver has been introduced to support the Loongson 2K
>> BMC running on the Loongson Servers, which is essential to prevent
>> the system from hanging when the BMC is being reset and the default
>> efi-framebuffer is being used. However, there are some drawbacks in =
the
>> driver.
>> Firstly, the driver tries to read and write to the connected PCI-E =
host
>> controller registers, assuming that the BMC is connected to LS7A =
PCI-E
>> host controller. This assumption should be true for real products, =
but
>> to prevent from accidentally reading and writing to the wrong PCI-E =
host
>> controller, this driver should be modified to check this before
>> accessing the registers.
>> Secondly, the driver uses non-exported functions to tell the vt
>> subsystem to redraw the screen, preventing the driver from being
>> compiling as a module. This can be fixed by using the exported
>> functions instead.
>> Thirdly, the driver directly accesses the GPIO controller registers
>> using hard-coded addresses, which might conflict with the loaded GPIO
>> controller driver for the same GPIO controller. This is fixed in this
>> series by using the GPIO subsystem APIs instead. To associate a GPIO =
pin
>> with a certian PCI device, it should be declared in the firmware =
level,
>> i.e. in the ACPI table or the device tree, and thus the firmware
>> interface should be discussed and coordinated with Loongson =
personnels.
>> Despite of this, the proposed solution in this series should be the
>> minimum necessary change to express such association. Furthermore, =
the
>> conventional GPIO pin number and the controller address are also
>> provided, to be used as a fallback when the GPIO pin is not declared.
>> Finally, there is a minor issue in the driver where it changes the
>> mode string describing the screen resolution during probing, which
>> prevents the device from being probed again if -EPROBE_DEFER is
>> returned by the probe function.
>> I have tested the changes in this series on a single-socket Loongson
>> 3C6000 server with a Loongson 2K BMC, and the driver works as =
expected
>> when the corresponding GPIO driver is additionally loaded.
>> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
>> ---
>> Changes in v9:
>> - Extend the kernel docs for gpio_device_get_fwnode() to describe the
>>   usage of this function, as suggested by Bartosz.
>> - Link to v8: =
https://lore.kernel.org/r/20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com=

>=20
> I=E2=80=99m deeply sorry for the delayed response due to personal =
reasons.
>=20
> Regarding Patch-1, I don=E2=80=99t mind using your current version as =
is=E2=80=94it=E2=80=99s more complete. However, I received another email =
from lkp[1] a few days ago, and I still hope this patch can be merged =
sooner.
>=20
> The current discussion is focused on the GPIO-related patch, but in =
reality, it isn=E2=80=99t closely tied to the other patches; it=E2=80=99s =
more of an optimization. If possible, I personally think we could set it =
aside for now and treat it as a separate set of feature optimization =
patches.
>=20
> [1]: https://lore.kernel.org/all/202608230816.ifMzE0No-lkp@intel.com/

I'm not opposed to separating the first patch from the other patches.
But it seems that Bartosz has not been back ready for reviewing this
series.

Cheers,

Miao Wang


