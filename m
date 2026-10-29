Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793284982;
	b=OyJ7onFkQsTLmrxp+fiiQai0RAbyW5XCDOLG2TDBjn1VaCSIEJVPKDklDmIk97HzWNoP
	 uXeJrTOGqmL2Lnv79B2pgLFMI2eceM7MmdPuGH9hzUWdmZl7GAgKwJpALusG2lXQkD02g
	 CAiCaIch26RQJTZp5Rp/OPU6IdsK1B3pOpt/22fUDmHmkYrdaWie1FY9TgdQeDwjE355e
	 Qiq6mQao46bwC73iPHdns1uPc65R8dxHb5DGRQSF1AxjgKwUWYO/7sSUZsWb+FTwWAnG0
	 CjJBLt6OOFjRCxKQft7LW8iqIWQUUxy08LkiGkkCpuIuqgA/qV7QmYMxs3isufYUP7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284982;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
	b=HnI2mE1g3p9u0kMJlXjMpDMs+k/2V8ewMfcoCtLSvIxgCKo5X+NkV3utAUDWribQzSSa
	 wvPVrwVkEcsc9ggWoebCp5R2C70fra0kstZnQ7eeaitSCXR9kpaO772OqhAi2PJ3vDW6R
	 5bOraK9WgFBiBwnfoti7UE/FpbiBEEcmQ7s6+kp/5lOgj/a+qhcHgoBTFFyglj2ViTYop
	 6xGbeIRualaFjMI4ELRuYbexY3LBP7QdHKIog5aXoDGvAOF6ZcHvDzvosKzAy0xJOlhc6
	 i1JPtk5vn9SoYqrCObRToU5886S6xi4SfXYm5dEu0WPzMpF9b6jJQivmZ2CutfjEdtQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0stL60wK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA871606A31D
	for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 14:43:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA871606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0stL60wK
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso371306166b.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Oct 2026 07:43:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793284980; cv=none;
        d=google.com; s=arc-20260327;
        b=pW1hCWgx+1Rmk3NHnLim78wENPI0mI7R5oM4gn3nITBkb59e2rBBJ+jGmUVGarfqlc
         G/+6Gn4pybY4CFz1zBau/LyW9WZX/WkiG1GWp57ZSDMGjsqVVKv7cV5qDW9bB5PU6W8p
         VB50OV7RpDJxq1xudUy1NUKnkC8gLJLN1+TpFF401XpZEDlBn5o6dWWeg0S1A17n/51O
         yk1iFkd7FlUsrP5wEfGh4a2QPkTnRJdlV13N0cZjh/0IuE0anD8DEM66ra82qQCgz1Dk
         hrdqMicO4m1DTrL2QSTRb37+1rvo/dcT5J0XJOWAfeBKMXtZ5Af7DaCOF3ijZTus0L5T
         +CHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        fh=eogDnOgRKKpI6U+qthl14y2XfHN+QlB6sQyvv+cEKMI=;
        b=mjopTcVM6t9ow7WHi1MYtZ3BFngf8O0zuBLVrEWi865OyLqgUScGfnrx+Yy0ErpEsz
         QgYIBs5MeNnRxo1U0nxEehDb+7mu3daSMQoRcCcyHWSMThtdIfFzSJbRyNHaRyfjSl8q
         b7t6ORpWCscq3+RGCmZhfnqwirXkcidO6mb7qsYueNlJCdI3KYsbnSoOKG1Z6jN0rACS
         o50a/Vu2DtMGRueoTxUdbqzNd8kF6P0YqWUg8lAi/w2HBDzxlFQiUUQoV8D6KScA12Mz
         aiFIcPd9igiNacRPQ439lbCXK7vVOqkoAlL7W9t1SMDewzBPINXMBaW6UXK7e7RyCi7L
         6W2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793284980; x=1793889780; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=0stL60wKxdKw/s6tHgGvZR0/rzg5KWUL5YTsT+3DjIAzJ+OcSQOZaaHNrT9ZWZ/zh+
         +Xl8MeNrwF56V5jPtuB+LEMmCPk+nSFiqX8R0KfIboElVJg6LAtPXEveGIDUH1rDFZYf
         Jmjb8UCIUbLQfpI/mRHamUeswF/G5myPdqNeQWkjb3AnBw8XGqeD+C6LDc0eV6chfVgH
         O1Fikbjje6CXtZlmMNNthSiVQwxiIecjd1ZpEPoT+i63vefU1BGoUZQVkj4vteNlPh+A
         Ur/oomBPTRABHVKfjTSPzVsPnwk2Y+j1aWLVGn3iltW52D0RxfB2lNY7MgEyo+J+4ssu
         /N/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793284980; x=1793889780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0GNJbbv02z1poibxXcHAUWs3HQDdbjz3OuoC327GVY=;
        b=jm5QtjTvuhT3SSyxV/SxPVHRwlnitQjsGQuEp8XMYWVEVq4Ylg3ttq9QpHLSfwEJIp
         c9nfqF93WkI/8EUaQtX3P1G7EGU0+YusBo6JIeL3ZqZQKzsR+279RYJcACOM2IAr/8hx
         clsDLwoi0C/WafDL5MAm2OQO3dt0PFgI223S6OwyJR3DtPJco2wh9V7Zpi23TnjKxzv2
         Hy0ohnEJAApUM/CNPPXzviXDpz3sITIOLIPdkT9v9PFIlqqFXNganvh3qK8JmQ6o76ze
         aXzcHcv8gcFrbASEKTJLe2+AWvEBGDVK6gaHTYQmPvNTTHKYiswdQx0FU8VI+yh1HaBS
         YT1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwaDHalCf234bryo89G8knwnWaqN43/IvlF+/dVnBzwiyk+a3iz+carFZ8pCLqHTO4Q2FGSPk+4DVM0@vger.kernel.org
X-Gm-Message-State: AFq9FYJvaDJJO2NX8VVh6Oee+fJA+X+MMM+yxhustIGcldMuSFTeEVNs
	SB7sfz1udsaKjjC5nbIBQ7FopTL1RwkQj2EDVlPIFzMakMXFc7MCyzgo07eHwIvPoJsTfmB+aqU
	f4bmwwAXn0dVCjPCaIq8ePUAknl5jUqU=
X-Gm-Gg: AYBFou3K43Ed/9RYpa8HpZhM4LSIK5GPD0fah5+HzuDLKrK+s5R7SIVZYviWtSxDic1
	cODfE+rqzCSr3nXNtYgvtNFQFYRfvG06PmgfoIH4Asu1J0DCbOl7M0CQ3kCYL5IGkJBM5WFHLd3
	f+aFTjqYWPVgDi82oFHZgHc2qLX3i7ZSXJb17vosZm9GdR9TK0K6v0Kob4L+g6bAdRF0erNfKDR
	Aib9kq6H9hPz7uRyQmT+/GbCKqTw4whysugonFNjc+IJihQIBvk02XoQH1/M0oL2NwsAlr4CBmi
	9qT9w73gLvzOnsFw2Jxq0lRqJQh/T475UoGlx1wLSY8JowQhi/fT8dx8ESarHocueRKe81q0VSc
	e8BoQj5XodnCYAGXOplaAnieH1hlPmP5/QrwCMdy6zdUwsn2LQuhsL92sx3nwpj0ZT6i0og9Hda
	cBkO6FLanwfKgGv8krLJharHuK9LA0jg7o2Bpdg2C05/HsQQpbz6Q=
X-Received: by 2002:a17:907:94c9:b0:c3e:34fa:611d with SMTP id
 a640c23a62f3a-c49be00bf6fmr469836966b.35.1793284980100; Thu, 29 Oct 2026
 07:43:00 -0700 (PDT)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-gpio-vf610-fixes-v1-0-45b484b4c434@nxp.com> <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
In-Reply-To: <20261029-gpio-vf610-fixes-v1-3-45b484b4c434@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 29 Oct 2026 16:46:28 +0200
X-Gm-Features: AclHuK-5fF5L0EppdkS4D8ZIoBbTyK3ZL1smqB5yKpnauEf7H2xoksPh6zRmaVc
Message-ID: <CAEnQRZBsKsDGhABri5MwiPSL1EGC=a5=GfK9H_OX1jXcYnerFw@mail.gmail.com>
Subject: Re: [PATCH 03/11] gpio: vf610: simplify with irq_set_irq_wake
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Stefan Agner <stefan@agner.ch>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 3:51=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.co=
m> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the manual enable/disable irq wake logic with a single call to
> irq_set_irq_wake() to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
