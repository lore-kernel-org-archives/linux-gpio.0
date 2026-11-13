Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794534507;
	b=yc5TtKQntuQYe3YLgCgUhBgElgxBBOzXZuCEEqgJ6AX//8ViZsx6VwCSlfqQaNY+FNIA
	 A87MgSipBvEpnoqSCT2Wy5lhiekSv7Z9ZqzKyDdfdRxr6UEdRsHPmed65MbyKVBm8IFZe
	 dM562qQCezgXm4hJC4k0OohKHm4MYOnyFuFOPEViHqmFvpztkuIdW7genwFy7RhCWbjhc
	 Y20R0a2yqe7HPShPa0Vk149QKzBseISRM+cMweOIJYCbpOuplWcSUOS4KvEjnqg0k+8Xp
	 vPUvuHRlxxUZAUwHtKQKreyec7xYlRCbHRLSsfKt/3zKGb8BrUXmqaG9ju6y4PaV64A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794534507;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
	b=qJC+MYco+8obYAC+GFbBoM4GEU4Ynjj5XMh14lB8NSTRenfC8b1m8vPrziCLAy+E5dG0
	 EjHFfxBZyE2QpUtUmzoL/b35AywQOQo4LKvbeQBfmtRmWZw1zS3U6xI9qEBBpnaWVq4t4
	 LMWcRRBYbBbPyEBMYs5uaLa6B8oehh4FLUZl5vgujJJyLiG5TwL69kWXWlDXP3lEf34bo
	 gqcOuJE8zlIg3WL63zTHN/2mgjQpNRPbssJmsNFcmT1qTqOHkvPVRjVB/uEYvoJBxr52+
	 X2VLpsXBwxGfYa7G5EZozPPSX+ikJPU2C09SqtR1dPzWOa8htsKoEdN8iLGgYJ7UB9g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3olxP7J;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF4A606A323
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 01:48:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFF4A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=P3olxP7J
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso652176e87.0
        for <linux-gpio@vger.kernel.org>; Thu, 12 Nov 2026 17:48:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794534505; cv=none;
        d=google.com; s=arc-20260327;
        b=ZKx/Ni4z/9KLmDjeEWvDn9O+/us1pWScAeefQtoGZDPgUAgVFujEEtgEm2tOPD6HSR
         KuwsKz5QsABIQ8G5aFybQ2L8LKNNZ8oiJwAaEuM/bjiBEuAltlyZpStOw5bwDnL+H4dd
         rstQdyZVqCY1zoy8Xju8lNwQXLFoH9EEqoQ1YQ8B/d75ThqGkeMitdQPEyOMt3vKq4uG
         tW2DMddp8U+Aa2dVAgyWUxWIwpeR13bEUPrJDopjmqKR4Gohr7ACmCG/F7PfUWnoPcJz
         1gcaIgswwaCJzOOUoKFo09Vdew6Vx2NVZCCIvw3mYhkF7zeQDXqYcParwUVmFDX36k5A
         ES1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        fh=vk1aZEAyvCAPObm26sVk3a1bf+2Zj9Vs2tlevKbWI0I=;
        b=k9qJ9KJjv5AEGeMLZrxJP7b/dzb4/ovMdNsst7NHsIkPl1Zn7Yh2zDbswk5n7i5Jjq
         UfoB3N7+T5jcn5FrqPDfVPabpnYRCHl9QCo62ecPR8l4WdsTBVARDF1riijytNWErgk/
         O8t4D0xfq2ft3XgKfm5XbDxKfqz4CZ9+INd+AT8bQqrSmlopphXprjE9LJhNHYs7wp1s
         kwz4eB2AP4x/or8GqPPyjFJCXMQ0diretrMjbQdUASHDT4W9TuVv+Ru6bfO5wALuiOc8
         q3LcSA/adO3W2PctRHC378DF0gx2bQcB7Lvvm4QY9G1XV/lMVstgqvLrkE2p8D2UW4B2
         dSZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794534505; x=1795139305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        b=P3olxP7JPXksuID0OIufKWZhUQ3IH0dS8ULn3ZgVNrVGtvQvVG5nEMYhtJ9B4v1PnL
         vYAxrUbmeyQfP1nOVAGKxZOYabSqvJecWv/gUmKI3gj9UMqz6g2LgS5mLGhtXXPMZ8pz
         RqbtaCjQeWgHoIClTZHjQDi++UNttJvfo3TSX39z8gvdq1nKwkY4QlF+CfnjmPela2/a
         LkzLSVYsG9wZ7nKbm77B5lOLQh92P3mK1vqJ9KqSxWbOeHnMjS2bWGkT27oKVgi4L0A7
         hsLqWHBoFpJQDSYQzcAJ6ZPdWszzgxeUlvWx3yrTigXvqrTH4kr+do47lVjCaZwhTv5J
         LniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794534505; x=1795139305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHMuM5Z9d1NJ0qzFPFfug0ui3jGT4piml21ckpBOlMg=;
        b=HE+5KLmlMg8c4c2uVUMSoIlvYlOX+I0XDN4MPa1mq3mN7o9LUIgkebJjGUMBuTDkJ2
         /s/M2BOGgR14604c68KnWPGxfdv+s8RTtcHQmg1PWWO7EdkNSr2sgx6Sy/L1Qu0Kgw3y
         tks2zM+T+aHzSqdoG9PnIBlRAMatd4FStVMMIgx8+vadwxyGO36FQsUDykewPqVCyTwr
         UBCUTmI07AfXD9+IrmMUY9N2193fHJrK59Xi1foL/reghrsdfJdc18CtJTOxNzxrI+Cv
         J4suMZ460naL3AmHbAr4LoVRh6gIWz13vmllbBI7Cow2VzIN6G+zZ1ctAweBk64b3YVy
         WyBQ==
X-Forwarded-Encrypted: i=1; AL+hErErPNP7RoKUs1L6ozDfE79u3Lo5ObE0dyUurHdX5ZZ/oUBi26UyX3/LMMZhFAYNLc8wl2I5BucMuajP@vger.kernel.org
X-Gm-Message-State: APuU4Z/UWk8p9o9JHtyAXal1mXbqF2A35qfVKWMZJmcr5ughSqFhf+8k
	chwLJB4SKnfxtckIKiRwRZz8aIT16yfZm1dqH2eZ1HzwoqU+TLzGbFUofKLIkYo9ZMfkKiabsOT
	u1DbWpP0BmPKCQDADnxIxF0p1Ia5OwAU=
X-Gm-Gg: AYBFou3qaTvSZNePOJhMP8Ons6Nfufb3N5fMbPO5FAEdtrZc+t7pws/SWPCV+ntSIgZ
	oDNx6IhdXUxPOzpam6zXyKrXaTNs9x64BRnBINW1GP0tRPmFf3T0L53L5xNeVHw1kyp9/cpsxNK
	b4B62ANfXAT1qGBEKYlfzl/8eAr04yIz+ki7rWX94LETcUXhGb3MjjWKJzeqCNuZgyzdrc7DitF
	iwbxlOlykmft+24UUVzM9BNtuZPQqngHwEz64DDE/nWeCTtPUF1oGQod9d0gmx3Uh1GTZlCi0H7
	Nvn+GYZd4j9Yl5Dmvqo3CxGpkV3N57pEp1871k1x5jxC3U1RVEOkOKvVlSufmb8z/Zp5dWY1JYu
	VsSeCLy4YjiawSm46brrrCYw1b4nTqpoURJfc2X8+UlWa/IvQ710Fck9ZZnsl7muUlmXoSvstv0
	hSdsV3/0xPs08bpEcfYDZIAIR+
X-Received: by 2002:a05:6512:1304:b0:5c1:5974:8a54 with SMTP id
 2adb3069b0e04-5c1705faa6emr444217e87.5.1794534504878; Thu, 12 Nov 2026
 17:48:24 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-b4-imx937-frdm-scmi-pinctrl-v1-1-0576fb20964b@oss.nxp.com>
 <CAOMZO5D1XDc7C6H9jYTtpiPah3DnQxJz35t+3k0--a072KsMuA@mail.gmail.com> <avQV+8VrthWpKAWT@shlinux89>
In-Reply-To: <avQV+8VrthWpKAWT@shlinux89>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 12 Nov 2026 22:48:12 -0300
X-Gm-Features: AclHuK_ZlsdyvAp9jZzuN6ezT2JMrw9zinFgseQFdkZHa41yGNMDULrPL8U4muA
Message-ID: <CAOMZO5D3JXGh4FbLs9hRmQMnV-RY65Aq0uosgk+zgv4naQGbBQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Use of_device_id match table for per-SoC data
To: Joy Zou <joy.zou@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Joy,

On Wed, Nov 11, 2026 at 4:10=E2=80=AFAM Joy Zou <joy.zou@oss.nxp.com> wrote=
:

> I kept the check as a defensive guard in case the match data table is
> modified incorrectly in the future. However, if you think this is
> unnecessarily defensive, I can remove it in the next revision.

If driver_override is used, then the check is important, so you can keep it
