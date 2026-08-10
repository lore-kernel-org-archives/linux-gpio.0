Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37CFB3DFC6D
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 13:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786368068; cv=none; b=iXmTIpxQuu5lhiid0/DnARB8Y7Xf++IehepAHWE8y3oElGRbtZ4dXhsHKEEdjbwdFY1yxWSiM2Nj+eErhyYDRwj4FiDeBFTSacmhDhIgEAmc7D9Gf5S/rjbUKIP39CxcgWx6xA1gRhEoqIu13waEDs6IaJ3UCzQtoApwDgLIY90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786368068; c=relaxed/simple;
	bh=iHbJlGeoMHgH2LOiRlm6X+LxFVvol5/ji2uSvnTz1Wk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PyZm0rF00aBdDyuF1v+woJuVQbxfq+Ig6CxoYt+eVzNTuUjjHXcHIYgO6kbuL7K/QdXKDk+iaBhAp18LLoOaLm0U/pGcdX/LCFw7+6HCd2pvAy/M0TyO7968do0yScQKi+KWwaa7C6THrmz5I+JU7uoW6tphatg2KFtZI1j/DeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGrv/952; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGrv/952"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-84a32ff53fcso291632b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 06:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786368066; x=1786972866; darn=vger.kernel.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nhupBQyp7Yply8E4ipmxmMlWj129/OKUHeE3ME+cPLs=;
        b=XGrv/952OPLKNkGKsIq2dcpygRbuaaVTkRJOAsdoLRIec3NzzS1ZdOwFdUahe4w9Q1
         fMyXaoRb34+y44vNQLq1uRtsBqPo/c7tgN9ePC0Z+K4dRuutBiWbSmvl9VA9XN3XHEbp
         e0EQX9WmV4HeZ2ywfsOTla7H2fLm0UE6cXXY7UPTGtd+P2h4+YaHjBfFoUbmPgaZyL/Z
         FbL+YWX5rq5zdmPk9zOGVphjOO702WcyilkPPFc4X7zrpgPdyUmNO7H2qHVMr3pAqqER
         LoM3kLplN2bxy78fqv244Iw9cnP1Slv8j6M+E5b4/5EvK31wUs5zP2PZ57NZSvvZ1TS0
         W4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786368066; x=1786972866;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nhupBQyp7Yply8E4ipmxmMlWj129/OKUHeE3ME+cPLs=;
        b=CuKWv7S41u2QItZUA+Q/S77JIFYeH1/mskTpCuEPoTHg5rZMw3odmtJ54t00YwYxUb
         O6XC0esYy++CdBB4AtUgXL8mlEPuZyI701ASmJ3xhfB7+UCvg0CBNr0iYPtDJ5e8XVgn
         zn3atM4ybYmthugZ25ZYvd62+cxHhjy7Fk6Dn7oVpl8lREwaxt0s2tuYMwZ+xcHu+79A
         SbPpYCHkVc4XmyZ/jfIw+bgkGN9nX2NeJNhY/FasY2s7Oll1bEthI7cW4to7PmS5qtCw
         rhAJyPWPFHdi3ROjDaGdJK+r8cfzLcfjsx7GQiz0DJ0jUPqb0k0+53pg5WTMaBmBk34S
         fPMw==
X-Forwarded-Encrypted: i=1; AHgh+RrTYbSJEVCOcOLqirz+mhg2wqjcJM0wd7ArmHt7tC/RXrfbvP8UrDyDXSnBlKTbM/FGvz9ypczpKpUl@vger.kernel.org
X-Gm-Message-State: AOJu0YydM3hc7pej5ELDw5LKoYvDRqXomKSKFu8BciJB+bduo6OP057y
	xAE6gt3P2ssYh9kgUebpBUgMUdN1H/rk/kB+7qNaXSes7pWDAhsq1KFw
X-Gm-Gg: AR+sD10TqV8GQvzpINLTBBvbc2IpSilNsRYRxmJc1iviI/dF0+D2JxwSyEtrXS2x1hw
	4HQdl2HFg4VJ/sEZm4h/ITk+9aYjPpX0gI9z12NYq/kErz/Z6cXJm3N6npi2w7dJJ+2ANNZHyXo
	QQOkHbhjgAR194Ndh89RLCamJGCF/GBgyR/zgAOHbuswUIoVc8uVt9mm6CNWSMaT2YfvabmkDhx
	PJKtu2z7bCZHL9tQ9zFJPPvlmHxbUV6T0cSGGInD6nr4dXzMQbxAffQQyIGD2lr54iSYyu9SLK3
	VFI3SvO2bx/CiZjxxrFt6butVBcqHyTEtxPcN1QgegJBTAefj9lK+bo+etxvjOwknnqYMpDRDxN
	w3EzGxgUg2IQbxJ0E674uNddgGOP9oiHC3Wd7vGnV+uS6MKwtrcXGUumjZIQaedJBHjFKsQWThL
	TbOUulEb7ZYUMOxlhiI7+/WTcCYSwia9EjGtNkO6Nj1LXffxfSy1vHyKGxgnSWiromqVDdOE/NR
	n3z6qrbfmPDf7EhwQf7CLI=
X-Received: by 2002:a05:6a20:6f02:b0:3c3:bbe6:95db with SMTP id adf61e73a8af0-3cb85e2babemr37025734637.1.1786368066101;
        Mon, 10 Aug 2026 06:21:06 -0700 (PDT)
Received: from smtpclient.apple ([23.247.139.92])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f372b5bsm3982901a12.25.2026.08.10.06.21.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Aug 2026 06:21:04 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.8\))
Subject: Re: [PATCH RFC v8 0/8] mfd: ls2kbmc: multiple fixes for this driver
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <CAMRc=Mfo4J8n9MWOzUBRz-VRu7T6SNLTTGrnWfHxGfWxZz71Sg@mail.gmail.com>
Date: Mon, 10 Aug 2026 21:20:47 +0800
Cc: Binbin Zhou <zhoubinbin@loongson.cn>,
 Chong Qiao <qiaochong@loongson.cn>,
 Lee Jones <lee@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Corey Minyard <corey@minyard.net>,
 Linus Walleij <linusw@kernel.org>,
 Xi Ruoyao <xry111@xry111.site>,
 WANG Xuerui <kernel@xen0n.name>,
 Yinbo Zhu <zhuyinbo@loongson.cn>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 mfd@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net,
 Corey Minyard <cminyard@mvista.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <84622E1C-DF59-43C1-A92E-478499AEEBCB@gmail.com>
References: <20260810-ls2kbmc-mod-v8-0-16e44f7322f4@gmail.com>
 <CAMRc=Mfo4J8n9MWOzUBRz-VRu7T6SNLTTGrnWfHxGfWxZz71Sg@mail.gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81.1.8)

Hi,

> 2026=E5=B9=B48=E6=9C=8810=E6=97=A5 21:08=EF=BC=8CBartosz Golaszewski =
<brgl@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Mon, Aug 10, 2026 at 3:04=E2=80=AFPM Miao Wang via B4 Relay
> <devnull+shankerwangmiao.gmail.com@kernel.org> wrote:
>>=20
>> ---
>> Changes in v8:
>> - Address issues found by the Sashiko AI review bot
>>  - Fix the error path of the probe function, preventing =
unintentionally
>>    returning 0 on failure
>>  - Reorder the patches in the series to make the change to the =
Kconfig
>>    entry for ls2kbmc to be the last patch, to satisfy the AI bot's
>>    concern on failure to clean up when the driver is built as a =
module
>>    and is being removed.
>> - Link to v7: =
https://lore.kernel.org/r/20260810-ls2kbmc-mod-v7-0-8aa0fb5a5462@gmail.com=

>>=20
>=20
> Don't send several versions of the same big series within minutes of
> each other. Give reviewers time to respond.

Sorry for bothering the maintainers. A reviewer previously required
a clean or justified Sashiko pass first before reviewing and thus I
have to fix the high issues found by the bot. I would be nice if I
can privately send patches to the bot and let it review before I
send it publicly, to reduce the disturbance to other maintainers.
I tried to run that bot locally but failed because the bot was
consuming too many tokens before generating a final result.

Cheers,

Miao Wang=
