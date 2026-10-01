Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F01036212C
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790884042; cv=none; b=hMeQeeDnwo2Nv4MCne4FOzHKC8HtqpF2zD0jG1cBxzUhSNiGMief7CXZ0fdzkm3iztu6KfvWGRueU2yiTcrgB/3fitDrAbPONd1duFd529PsxGuieaVs3uPPaj95jomI6OwGqIx+aRl4vDA7LHOUN8MCqCv26plLCvda252iN/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790884042; c=relaxed/simple;
	bh=UyrwE150lXFu+GlejL8pe2d3bOAcXjsAdRLOVIpFdoM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X5Wga7kcIQornC99nh0IKyUqEbAHtGEIyUiSTv2KnD5NDHNDa+nQ/XwRATrTjT5hKtLy19DERAEKlqg2Qtw24j5ozJjNAs8mpbju7DGuv471D3lvMbOX4iEsUtrM7y+NgVMMA8ao/uS1v+KmpoEbPnER4Wj8Zu4v4ZM1Fg3vs14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J6M5XfpV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J6M5XfpV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD4141F008A2
	for <linux-gpio@vger.kernel.org>; Thu,  1 Oct 2026 19:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790884038;
	bh=UyrwE150lXFu+GlejL8pe2d3bOAcXjsAdRLOVIpFdoM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=J6M5XfpVqs/fV8gsv0z4Fy0vqALbbD8wRY6euHpDTpsKYFVlqfph0YbxU6BmhbuGN
	 8H3wWfrSXySfX00vk97Y67XIGg1h/nt+KStOX2jkG6iOsp/CNNmw+u6lkgYQorYxGI
	 GiM/Ec/dr21s82JJb2V8mJ3oWE9OrhmlZw7rt0Ravu8IZu1ZgqMOqePrTEiPl9UoT6
	 4rvUGDZDFLBOXxRZZLbOUWednDNkKH1Qs9jabiQfBjWw93CmEdKGUnCFCy/Jhs1YHP
	 mcL4HutCxcgEF68ruih9+9trIIenaCRlQPywyQY+TqyfNgtoT1tfdnvu0SOHFW6fSI
	 DR0fxRvNqXdvg==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8e986b8b1so7095547e87.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Oct 2026 12:47:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3cp2ZMZPJaDs7WTogH/9/9i4Evbu5XWm28xFB2qe67wy1yKXzUa91DGSuR34mekVElPXfpXuJInDw@vger.kernel.org
X-Gm-Message-State: AFq9FYKhf2MpS8L02FEDg5gVhSDpBLDwnU7tSlA7RR1+jh8rKVNifbvT
	RGmCBYmNuwPTrFm7svhHBwL2XEB8mNwo8lpFXTA9X9+ex5pBnCA5lsJnJqlZTAM4tLGUbPCFEi2
	BbGjbzRmOjOubqvq14HeQFOaYmr1ZG4c=
X-Received: by 2002:a05:6512:3d21:b0:5b8:f45f:4bcc with SMTP id
 2adb3069b0e04-5bb938332c4mr115100e87.4.1790884037525; Thu, 01 Oct 2026
 12:47:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924111856.622898-1-yaojiale02@163.com> <CAD++jLkTzLm00UKdUZuxWidNUppQM=Fge-dUgDJGB-NdRVEn9w@mail.gmail.com>
 <ar5U-FseGCtU3mp2@orome>
In-Reply-To: <ar5U-FseGCtU3mp2@orome>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 1 Oct 2026 21:47:05 +0200
X-Gmail-Original-Message-ID: <CAD++jLkwU9uwkegfBBkDAPFjY6irf4csYR5isSohy7_75J=5EA@mail.gmail.com>
X-Gm-Features: AclHuK9qjcXeegx-mimVsN1jPyyKiPWRkeU24gzuOkOD_Nqh8BGs49FZVb4XgY0
Message-ID: <CAD++jLkwU9uwkegfBBkDAPFjY6irf4csYR5isSohy7_75J=5EA@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: free maps on DT mapping failures
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Jiale Yao <yaojiale02@163.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-renesas-soc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 1, 2026 at 2:42=E2=80=AFPM Thierry Reding <thierry.reding@kerne=
l.org> wrote:
> On Thu, Oct 01, 2026 at 09:49:09AM +0200, Linus Walleij wrote:

> > Patches applied as nonurgent fixes.
>
> Jiale said they were going to update this to drop the useless reset of
> the output parameters. Those changes should probably be integrated into
> the patches you apply. Could of course be a follow-up, too.

OK I pulled them out again. No big deal.

Yours,
Linus Walleij
