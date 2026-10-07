Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEFE485957
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369247; cv=none; b=W1nu8V9LV/NAcixs2qqrQdcDfo1i15Nin3tMuy3UPYyyB/9pWTErJ/4iBbdkeD54sgPSeTCPWQscv/MqlWpUvmz8Tps3vcij+HL3nUygkxPBE+1SNrHPrCecQb/R9DnQ1nUCZRlHej/pVeeMSNkkxljF9pVRef8KImBY5d2ZPpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369247; c=relaxed/simple;
	bh=hwYZelGc2cJ4YCRonOqXHjwGmnal0btcIymMebtXd9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cvODcidfFxaEit+4Hd0o2YDJOEBFh06sjLrAdzAcyTK0iGRFJl9Jmk9I9A9nxu6n2Zm/n3PEz+6r40CIvqeWKdPDbr0UIMZgeCPVUwLmHgiVTQKPRqElXtbt4KUYr8J4cv4Q3VA4UVrE3hR78W9s9Rm2ZR2KtvaIclyS6awWOmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IbPU636O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IbPU636O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E93B1F0089B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 10:33:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369221;
	bh=2pOrvtc34zjiHi7ArAWp0fsuOWQMob1icjSI0Sd/kJ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=IbPU636Ob5RgsbCstlDZc9of3OIg+ojp1VgPmaW+V6z0LO3SNCwVZfO0FVORGwQao
	 xLBqmYyA7d4saiE2g4zwfpfDmnFi5PLJ9+TPb7iegvd0RtbUlXsiD1cvb5DsSJcEWc
	 c2mzj2wRlqpUEthThuCtmaJ8a8kmKET82KqAXftVrU6VLVV3hRGCzqqSmc7AZlqcjn
	 xm8Q5RZd4jI8IsLGjq8TH0MHKlvMYV8J6dO1RwBvYp8fFvC9VWll8dtvTPepacSUHe
	 01cfV5fY6KLFcBpSwqknu/VmTnbezrrqksVMy+WTuDH3aq+WXlzHyGuzZ/Jw9VZRj5
	 tIH2EJG0cqrUQ==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bcb4f23ddeso2670942e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 Oct 2026 03:33:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwhUtlsVMefrbEDBp/5hcWo6HLhfyXiOcvFgQZEtkgcxg7uhPsyNSUbZ4QAs+BLJiJrf9UhJVubt5iH@vger.kernel.org
X-Gm-Message-State: AFq9FYK+Cbmswd72TKwbUPrs3QniCL5a9QCWoYxTTIKJvv6uaSmx3ezA
	BBj5USuVuIRcfMix+91z5hrXFxYSgC8Ao+fL4ghnuQeZpGul1bIvu2QwwCsP8R+Z0SsNbqeUIho
	2AUdekov1BGyV3POlfjipQRgApkOMl+Y=
X-Received: by 2002:a05:6512:3186:b0:5bc:b659:2e11 with SMTP id
 2adb3069b0e04-5bcd06faacemr713954e87.25.1791369220442; Wed, 07 Oct 2026
 03:33:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-2-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-2-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:33:26 +0200
X-Gmail-Original-Message-ID: <CAD++jLk_eLX=AekTrqSH7yB2vL_zL2jntAYchJehnxxQ_jALzw@mail.gmail.com>
X-Gm-Features: AclHuK_J7REc7EOu2ICAHynEFqSp9Q5Bd9Te4ZdG3E7XUdnipn8Eecp9yHxk1kk
Message-ID: <CAD++jLk_eLX=AekTrqSH7yB2vL_zL2jntAYchJehnxxQ_jALzw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] pinctrl: sprd: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> sprd_dt_node_to_map() reserves map storage before adding mux and
> configuration entries.  If a later operation fails, the error path only
> frees the temporary configurations and leaves the map allocation reachabl=
e
> through the output pointer.
>
> Free the partially built map on failure.  The caller ignores the output
> parameters when the mapping callback returns an error, so they do not nee=
d
> to be reset after freeing the map.
>
> Fixes: 41d32cfce1ae ("pinctrl: sprd: Add Spreadtrum pin control driver")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>

Patch applied.

Yours,
Linus Walleij
