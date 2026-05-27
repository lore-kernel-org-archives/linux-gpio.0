Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029063F786A
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779884729; cv=none; b=DrSuuDFplVR7whrLl2kPiB11qb9HcgtaURjzyl6juW27ZnIFXyDCAHkHmOZrDpYNc4sdCmm2jt0d2iTbnnShImhEx8Z8N8JOiRsxHhYGP3PTbsWMoO8ZrIAZWUD6+DGthFc58dFYP4inyDcMpXKcBBS3GjCnKrbo9UYluIm1DCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779884729; c=relaxed/simple;
	bh=wGld2TPN/8O2HsyZCx/Ljm/OgaN/Z6UFWRvTeNSrdfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YsOybNPUo94twdrcCE5cEbtCTcJLeyncFtaTqoTg4DcTif41Lbsxxj/T9L6n3bv4T+DC9m9Yr1F2/sYKgIMmgvYv/7oWrHi/hwbOHYmtJZ4iaHPqGQKY8BDeQe0Xn1dpnwR5ZU4CpvOvnyQu9/tHtksDwi/msNtWj4UY2S24vyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fy4SIxxr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fy4SIxxr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCAEE1F00A3D
	for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 12:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884727;
	bh=wGld2TPN/8O2HsyZCx/Ljm/OgaN/Z6UFWRvTeNSrdfw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Fy4SIxxraw46mrElWk86sxBiEclZGphShc1CnQchGgn+T2ZwRVUPkuDgh1WaVe+FV
	 eN+ORra2wX/N/xW3YqXm8e1X14TV0HpLWX9J/GcLeGJHrpOyNQlgqK3qwt6o0VOk7y
	 yvgAJ+05jXFCQ6uICORWgVeXzv4ORS75dKR96V9EzU4N+oCzkdjD43A5ZWOK5wUPvN
	 pkpmThWwsLR9AcYIYrO9si4D5p1P0JkKhFcFPUybq55r1nKwC3RGbJGyJLLHPR0pZm
	 fGBQ6mF6NXvBcwnkDoXl35xxIyp5cstbumcGmZN3EJRxljni290igbnwNE0uS/QIq5
	 eDRJx+K6KfB/w==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so11719943e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 May 2026 05:25:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+s3m5JpJoaXXrCKWVbATFrGyiaZ+CyPyy7rZXHQtsAWTosiISaNpttk2zlLY6ymlKIahYEwfqOc+nl@vger.kernel.org
X-Gm-Message-State: AOJu0YyKvzskL0IBq2ikQAXqISw8aekV/LlcrfEc25NKn+CkrQE7Mmic
	Xy8c6wwwGPE3lvSytb9e+6+yBCFJUku3uFWQ2kMOezCz8dSg/vhnsKeyMtoLiUWIU0E15p4FYOO
	xi1N48dBC4zzQ2MXxMr46vTvGnEMmu5s=
X-Received: by 2002:a05:6512:3ca7:b0:5a8:f6fd:f201 with SMTP id
 2adb3069b0e04-5aa3235ec9emr7554368e87.15.1779884726578; Wed, 27 May 2026
 05:25:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260508143453.1886569-1-ckeepax@opensource.cirrus.com> <20260508143453.1886569-2-ckeepax@opensource.cirrus.com>
In-Reply-To: <20260508143453.1886569-2-ckeepax@opensource.cirrus.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:25:14 +0200
X-Gmail-Original-Message-ID: <CAD++jLkBoYV0nZruEp=TR+2Q3mc4+aWNfWX+FHQPUOC_i6tGgw@mail.gmail.com>
X-Gm-Features: AVHnY4J0HkFjtBcVXmlXiVWRGrMNwmHcWBi1R9Rg3-vqB79hR6wp7Jx9IfMWiWs
Message-ID: <CAD++jLkBoYV0nZruEp=TR+2Q3mc4+aWNfWX+FHQPUOC_i6tGgw@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: cs42l43: Fix polarity on debounce
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Cc: brgl@kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 8, 2026 at 4:35=E2=80=AFPM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> The debounce bit sets a bypass on the debounce rather than enabling it,
> as such the current polarity of the debounce is set incorrectly. Invert
> the polarity to correct this.
>
> Fixes: d5282a539297 ("pinctrl: cs42l43: Add support for the cs42l43")
> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied!

Yours,
Linus Walleij
