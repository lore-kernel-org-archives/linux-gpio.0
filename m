Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793952007;
	b=YewztpGa9DXoCIM3wiUR6dThNi67hLQQiWZM66eztO7THY6qcjtJDv3AXF/wHhI+UnRh
	 Ex7ZcNUPswR0eXDDFcE/vmEIAhiHwFNMWqsbUMAIywwRT36LEN9VfAlxGlIh8S8SSLbSk
	 dLgsiXZDSs6bnolou8TjuP0CHr3aTBr5TG57yNUeAqQzYFbWbUzzOd+ur1HSm0BmQXH8T
	 7+8viZ4p65ENmQJumTKQrd/EcObS2NAwr9fZPvyBJeT/mCEu3PYZJimNPEhDQZ4MP5Ucm
	 kp6qoevmwXb/BuudzTCHCADws9F1bXpDoMxJ8gvYL2TZ9FaCl4VgfTjtwuKMFsYOsDA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
	b=pqskEhPk83nByRFmh8MLsJEUcJ3culQFl8Yp0jV12UG66SqPkBIKupKhoHIlMZgRU7nf
	 KTeJzelfakBvVslw8XtFpGOjlxtjYF0RS7T22WG141yiCDcD3ocz6zfC07MC2cM99PxM0
	 3etPrLndgUHyoqNVmSgqgvKC+AdS2OmVD4YU3i+IHJRShQtaGvmt5lIoaDUbQQFTDRxYo
	 lVtQroc140F3+/ugDvsEptKZL6eapjMJL1Pk07bLIzMFDE9z/SBue/a4d4nJxFLlHe0de
	 BW6579Lwqf7AtudXeKypD2ExuMFH8AoH1aKsPHFsSAMnZUAsKRzunyojMOun6ZrlrsA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZn45ghf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1056083624
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 08:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF1056083624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NZn45ghf
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b6e8b6d424so84661a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 00:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793952000; cv=none;
        d=google.com; s=arc-20260327;
        b=qcGbRwfUWm1f2gKRFWTqBsqxxHduIi/mBNI63cj+pjjd8q4qeQyFTa42IEEEHm+KSw
         7x3eHtaxRtO+5lXO6F+npBIXmgZo1yp76fcZCX+qN6p7XCBJ2q5nKma10Vrp5Slxu+CA
         SxDt2i5VOAzZbD+uREcTNTgtlHWCAc1Rzf0UII65kKoJDQyOd5OpboYnHi4FEw4iUbP8
         AfSi8BkLqfSKmmrLCdtMJtKV9o2WO5xKJlGYme7mFOTWRG2maIXjGMevUQNyLJeVpWK3
         NSLGKn9wwiU/IOIj+/ZdXdmEnmIzQNwdrkj5h1a/sv/pH62316cAflpsJQg+FL/lKhy0
         sEAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        fh=mX3GDlhvUSFsCQKlIxA9vhH2amTh930l4VxlFFvUjxA=;
        b=LWwKBltXwDrdEGz6Dnruq1XpTdtAwUrXK2HRkbkr1daiT6xOi0UQfN97pYFtyyI4AE
         owOiRuSOlgFmajLyNdgXbNQALVGnOu8YhgVXLTSHWNCzQm+2Ps0FJTo4tnxe6wE3XeoR
         pJddULHKtlFx3WTpZYTNOgP2MvS69Vq+Dq4cx91KCfzBpA2wrpPUNp7ivSMWextdVDKC
         Zz62kdPlBXW9hqzIT1kfztKD22NBbjfrDHDbDK06A5e1vySG469zGW7jOMAkTtxOWbUd
         8C+9n1AFtiNEzcokBSOo7i5gA4aOrOCzYTrlwhAH9QsUys8g7lmZRPwgzRf35r8gVvVQ
         ELgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793952000; x=1794556800; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=NZn45ghfBG0ZvdDOyynp1nFEfObT1pcptC1zoQJVefkfah5Cvf4KhBdfAtP45zAtAQ
         UULmHj0hEPtCZn15bvzalYNRj9fhdp3uyVdEClRuRLkVnpOfV9ppeglAAdfxPS28qNaw
         O+q0E4sjEMKTMoFNcQUz67xVF3I/KdEzY8yg+Tpd2afhiQuFsmYUaFLtm5Ti/Cv1nQCD
         bntrz8dBI8l+pN19cS/mEKfoLl4E98jrhkuxDF+X3o30Z7L31Q/ieTJQlTrfBLk9dFV/
         5CptV3jFVboDZT6yTQgUn6wxAwHGSAsVVrnPYMvRpyNWRmRF2c+DpLESNG1RwdqVq9wY
         I3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952000; x=1794556800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JL/ejsWQpZh4uIBI1fUZsT9Ty7diuDK7PLmVq35sQrc=;
        b=EyH6VCqTnc/++Zz+kbtc6oZuPJ8MEfSruJvgD5SJhFMfL0nMifJbOIxmRTiFAaGcA5
         Egbt7tlehbFnF28tcHIxqbypVwMgCCJG7PtOn5v2lVKcEXU04a0cw6Z8INyhfvvtlujb
         pEWaTgHqiCJIQM6okfu7msROmz9tOQxGzUG3c3yDIKoVcgPZIMqRyB5djNDhy2DF9dtD
         gsczoFWabDCtjHP2GoBn2Xy8H9m7BaIfzNAEJ4HihaNiO3reELfHZt1anLt8Zn7cMAQq
         OXG9dICwK7chphFz6bdw/8mQNs7z8wprarhyy5bXuj9jS8TWklylbfvrmIvx8CDDN4hT
         2Npg==
X-Forwarded-Encrypted: i=1; AKwUvBztpretnAHVO43GdL0QrDd7yAuDrNyYCGJJssPybogtpEJ5ZCBdH5ox8g7DAZfCO7hdbqegpY5xVw2R@vger.kernel.org
X-Gm-Message-State: APuU4Z+KgfWEbTReFRvOQx85GbrYkLFXP1AQQSmhGaik+S3H1BZFRW5p
	A0/fhCm4Rk8ZDJ+rxQFGxTna+DkASikxHlCU8Z4m62Zxq8NymmP9lkO7qZwMIl00byNOh2zYjCg
	g+ARR5JWMdcCTBX53fVV1LAo36c39TXY=
X-Gm-Gg: AYBFou0/zHn2stTdd6qOMLeaQ7z1WBnN/Xb1ysp4ztmpzKi57l2fK4PXc5ZlD0d+jew
	92Xju5S7gxO8arl8SlMPPuWxL6XVBYf9bYHARc18+o7g6VlR0gaNqzPq6AUcd5T5oEETvpvRqQX
	oMStMXCS3ADKAMbUiK007hHwN/ae/N5FqeOMXS0pn0bAVxROrqLhoz6+Pemx68McIFd7wwqHuwc
	hxreg7up1SNOEdkOznVd4o5KAWjHKEPAbngIzFMVeabmwirR4EejuXeldgdRDw2qX+85qg/Slz8
	J9/ayx7Y+d8Kw1p1gndiZ7f3H0NHtMA0c8iEyW9QfvLfyPfNbXdB93BRmZzVW3spvG261Kwuou7
	T1+mE44H3b98eTcEsdynXSazJZw3PbruNzqjlPLIcWtVLlYJ2t+kjaIXS
X-Received: by 2002:a05:6402:440b:b0:6b5:9849:e335 with SMTP id
 4fb4d7f45d1cf-6b5985927b4mr1117288a12.1.1793952000065; Fri, 06 Nov 2026
 00:00:00 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021105109.199886-1-l.scorcia@gmail.com> <20261103150936.GB792264@google.com>
In-Reply-To: <20261103150936.GB792264@google.com>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Fri, 6 Nov 2026 08:59:48 +0100
X-Gm-Features: AclHuK_yxwIK0Nk7bFmyEO_n6HuxXT4AJJgazikzKXrXwadabrKuwJfTV_QGR20
Message-ID: <CAORyz2J_J0dYtg2BMKq9cuzo7U0j-cMQoFXn+2pOTztHz8dS-g@mail.gmail.com>
Subject: Re: [PATCH v11 0/9] Add support for MT6392 PMIC
To: Lee Jones <lee@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>, 
	Akari Tsuyukusa <akkun11.open@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> How many more Acks do you need now?

Still missing acks for the regulator and pinctrl device. Yesterday I
sent v12 of the series [1], rebased on v7.1-rc4.
Thank you

[1] https://lore.kernel.org/linux-mediatek/20261105194426.1113050-1-l.scorcia@gmail.com/
--
Luca Leonardo Scorcia
l.scorcia@gmail.com
