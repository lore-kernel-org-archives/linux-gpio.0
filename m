Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A55C477980
	for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 12:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784808892; cv=none; b=R3eHoJFx1JT/X//W5cde2e8/9Cx3H7WAjeOOBqtsxWVJtysAbdBOpvwTe/3E8RTE7ku4Dw/5pN4JRlmRjCU+cyy0OH3K4HmHhh+zzsRBJ5UUrN6vfI24NtaXpgo04uvOrhQ6vhBKLtgyJiFWJASBJ+8U5/vuFx3fcc1GMxCfppA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784808892; c=relaxed/simple;
	bh=nQIK2qNRpQnnO3WE7Zx/GRD1UTj61auqsOK6uG/5LU4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=tYXAI44HgDQTnHpIZ9vbXNHmKMguo6YdKiCUyacvJ/LXgC2fD1KTeywzT7grlReRXNzLSbN9JKbfbGpGpTGVhRFT79qWKw78ZtR7Et8xnN3GObLvgE7N2vAJHA3rGg64L0j0cPMn9VTxm2+jXaVSt3DTHke6neyIIkIJ1owU1s4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjM3hoy2; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjM3hoy2"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-384422b05b5so105742a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784808887; x=1785413687; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rjYZGhFW3MVSYAcsvmcUSA6zBH26wWwBRnEVd1MS60I=;
        b=FjM3hoy2k4p4mZAw9M7NLPff83Vah/T7akDpI8PmPjT7taAtpfq+4oRmTARkjLgfS+
         ormkGOYxiMCaoK3vPG9n+rtPVgbWpW5LyieXpLh9QIzxsL/ovWK9YiHjaGXkG+OrK0jr
         ijyePWisHc5AdxJePbvKbSHSa8bjGT+PkldMSVsutIuJ/cY0IPrVx8DA9on0Iu+ZrCV4
         qhxBHmtJBUpL9kqR1au/Wy14h1s613YR32/eZlYi3BWZY85uxPzjkBOhzMf+rjf+4PwH
         BDSZ68VwOrug1QVSkKEuLoSFkc7xLT5FpO9O/YVLDitHbswhNYaE10dntx1mkcZcKach
         I/8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784808887; x=1785413687;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rjYZGhFW3MVSYAcsvmcUSA6zBH26wWwBRnEVd1MS60I=;
        b=QNtO/9ScLBQf/3hXFp4TrsqIBXQyQb8QOJLFeHSWz8jsDPWLjWrYPJS7sg8u0dY4vL
         ZfSBRUp8DmIRDg5LKoHHCAXRZyYA7fK0xja95Car+yhLa8wDlf7L1t/RjMGSpeqWOr8Z
         9jvFWAxlMRz2vJYnv2XDvkFqfEVlvi6B63xdmZhLov/ZjGgrrninvv+f9k2kf9zS/BAW
         SLS3D87Iejtida8pi8VqFWI0aQCeOp8MWDvqTflJoIBvj0Gq6QeyOq5/gLkXm2FBC9UT
         5oQjyaX407A3wBou9NFDGMD3cw6YMiNuvb+hcRZ8BJs//6DWPkQbzJSbRFrPZUVrfCCB
         B9sQ==
X-Forwarded-Encrypted: i=1; AHgh+RqeZzB633kRY+tyJVlL8PT6S6cvJ1asNTyCZvGUk2GAzkeQBCOS5EyWtS0k6KWYxudxx4oLLJhVMIH8@vger.kernel.org
X-Gm-Message-State: AOJu0YxdNwGZNCIx+7RazBASlv2BjOGLyuwlziNedFj0T9hLzOhxsWrt
	1PHx2K3tdWVn2OAU9lBSWsFoWcHKMZ15JTIOE3SpojyQupGtPt58hggrtlx7B8r48As=
X-Gm-Gg: AR+sD10B9dGLg+/VDHjIlhOZZ2OHJWIxmf3KiHNiiHOR4yT4AK95ybViMXBFq7mTv1N
	ehzeiQfmAStw9JTXS18qkFfP4X5pvkKH62QlHi45A2eYxewUNsYpGgaQuWLQfAjC7NSnYZyLGFq
	3AgmC9l3vi4+AgFPA5a48KzC/xKjciGyzB3eiHUFZX4ggSjpSmr6XBL9VarDFQ6a1URHLfOhk5p
	VMDYEa2K/G6OyyK/OTPnaaCYe8b1xUbt3nNxok9dFxKuWE2w2qYeuruRsXm1EUDWYRt7mD7OwRa
	pTisZHqSL0gfBXuv+zf2ccPh/jLA0aRPIo0lB09Z2RhA2S82/QxEbUVyU8nIz1CyIVAf08U7abF
	pTOych68QauWQ6Xy7lHNowxKB4pHQ+KWck3Oo8397DWYassIMwZUPF+838AJ4/QKhxNqfnZjfhq
	XRWaHoNbdeXuUGdfdQRp7ey9wu
X-Received: by 2002:a17:90b:264c:b0:38e:6d16:1439 with SMTP id 98e67ed59e1d1-38ec6624e75mr1992911a91.5.1784808887285;
        Thu, 23 Jul 2026 05:14:47 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38ecab80f0asm916062a91.7.2026.07.23.05.14.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2026 05:14:45 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v3 1/7] mfd: ls2kbmc: Make a copy when parsing mode
 string
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <034E7CC0-47AA-40A3-BCB8-B9BEA2190DCA@gmail.com>
Date: Thu, 23 Jul 2026 20:14:28 +0800
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>,
 Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
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
 openipmi-developer@lists.sourceforge.net
Content-Transfer-Encoding: quoted-printable
Message-Id: <2FF2A15C-6170-49A3-9E9F-F5CAAEC67AE4@gmail.com>
References: <20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com>
 <20260710-ls2kbmc-mod-v3-1-ef718636e78e@gmail.com>
 <20260723112940.GC3363113@google.com>
 <034E7CC0-47AA-40A3-BCB8-B9BEA2190DCA@gmail.com>
To: Lee Jones <lee@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)



> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 20:02=EF=BC=8CMiao Wang =
<shankerwangmiao@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi,
>=20
>> 2026=E5=B9=B47=E6=9C=8823=E6=97=A5 19:29=EF=BC=8CLee Jones =
<lee@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>=20
>> Why is this v3 set still RFC?  What comment are you requesting?
>=20
> The reason why this is still in RFC is that I am still waiting
> for response and discussion from Loongson personals on the
> proposal that adding a DSDT entry for the ls2kbmc device that
> describes the GPIO pin associated with the device to signal
> the reset event of that BMC device. As pointed by Ruoyao,
> such a proposal will need to be discussed with Loongson. I have
> CC-ed the patch to the relevant maintainers from Loongson but
> failed to receive any response.
>=20
> Moreover, I am also in need of comments on the backup method
> of searching the GPIO device and pin when such a DSDT entry
> is not available.
>=20

To complement, the part that I'm in need of comments is the
7-th patch of this series. The first 6 patches are focusing on
fixing the existing issues in this driver. I thought that they
could be managed to be applied altogether so that the driver
would become a good, ready-to-use state. If the first 6 patches
are good to be applied and we still receive no response from
Loongson personnels, can I split the series into 2 parts?

Cheers,

Miao Wang

