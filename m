Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 229D836E489
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 08:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091638; cv=none; b=RIVxGXRFEfwMieBrN9kxm5CdflogsA9cdrpB3/H+lVl3R0CH0WIt/nXSoXeIXB2FkePPsweGUHAn1FoiWfVieRCYT++ny2BCwuZDLGloiSE6KjxvAMsC2R8LBraDotqPVoxE2sWj2vR05Wb/arv4BBZvzn9I6IxO404Sh/tY8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091638; c=relaxed/simple;
	bh=uaodBYNUqFL5M+jyMW9ip64Qnbxfgu4jNSDblJZpYz8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ldDRltpC0hEmxmgI1TGTGPbDHVbqMS7v0FDzcECm0KGXALQ3YuDzNfK+hJZdoYnz3zrhPCVcxdmRwQt5EdpdhKyCuupf+DlIfZAnFxQzUoD2VjDoEENAzdV+gzXx9V+1cgephghmKR0lmRIjGMW2qAuvpXo7t5LJbujhYuNNxwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOsIGSxS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOsIGSxS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30D41F000E9
	for <linux-gpio@vger.kernel.org>; Fri,  7 Aug 2026 08:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786091636;
	bh=uaodBYNUqFL5M+jyMW9ip64Qnbxfgu4jNSDblJZpYz8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=XOsIGSxS2KPwEkWzN1ko08NJwavFrGswmOTJ8769RNRDA+9NNgYawahoMKGC11qkl
	 q3wrKcplqfodaRCS55bT6c4zhW80yXpa6PpWfl+RM+cMrGZVLUKQSINzVPo/UNh94e
	 p9/rMg9tRR20y5EtcSUInU9O6MOu6ki+RPedZ26yFlB8+8smFx+IqPQ/8CgXFEc+US
	 FaTNWmUqXJvixFt9PEy07vAzaoJIjcU85Gpr/Wozshmncf04hy4U/kWAr+NTXafrvo
	 fycNTbvKTc8V3HJzWQIjz+FnsXeLzgr7j9YfMQHHGrwlUCsBOBN0SQfWxKY1EeHTXn
	 byEP7SJJL7fsw==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39faf9e2c62so19659581fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 07 Aug 2026 01:33:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Ro0gVTY7To3UAfniw72qvxBvf00TA3Xd2p/csNdjAdLksUqCclv6g+kDVEt/SnY7u7FAIRBvxaxvdK8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/t+eZc3jnDVRAUgPWI0C/YWNOvG9UTnA7iXGj8SqfP6LmsUf7
	Bs/ihzY1eZkW0/51hn4HY8cQ5+J2mgbSf7TWcwjLLYIlE2kd9Ged4+P/jyNzAu0FGKpxehv5S9l
	DIbO0U5KnV1Tyv499khhqg0HGnbkPk5k=
X-Received: by 2002:a2e:bea3:0:b0:39b:2323:b700 with SMTP id
 38308e7fff4ca-39fbb1b0ba3mr26312101fa.10.1786091635548; Fri, 07 Aug 2026
 01:33:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAD++jLkAjQG7hFsdX+dy8wZUoKKDCaOzMD0EJ0nn3gYmaEOJDw@mail.gmail.com>
 <20260804095935.2132215-1-junjie.cao@intel.com>
In-Reply-To: <20260804095935.2132215-1-junjie.cao@intel.com>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 7 Aug 2026 10:33:42 +0200
X-Gmail-Original-Message-ID: <CAD++jLnrXp0ACwyR7kenvJxLegyn+Owa2WvadXe=0e1ZDG_yYg@mail.gmail.com>
X-Gm-Features: AUfX_mzh7XvLTv9BO6LC7fNXF89uWrencTi6BdtE6RcWVDyr9LbvbWoGa5Cusu0
Message-ID: <CAD++jLnrXp0ACwyR7kenvJxLegyn+Owa2WvadXe=0e1ZDG_yYg@mail.gmail.com>
Subject: Re: [PATCH] gpio: ml-ioh: share the register lock across channels
To: Junjie Cao <junjie.cao@intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Andy Shevchenko <andy@kernel.org>, 
	Tomoya MORINAGA <tomoya-linux@dsn.okisemi.com>, Grant Likely <grant.likely@secretlab.ca>, 
	sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 12:00=E2=80=AFPM Junjie Cao <junjie.cao@intel.com> w=
rote:

> Suspend and resume hold channel 0's lock while saving and restoring
> registers for all eight channels. Code paths using the other seven locks
> can therefore run concurrently with PM.
>
> Use one controller-wide lock shared by all channels.
>
> Fixes: b490fa0bf86e ("gpio-ml-ioh: Fix suspend/resume issue")
> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260731033956.EE6F61F000E9@smtp.kernel.o=
rg
> Signed-off-by: Junjie Cao <junjie.cao@intel.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
