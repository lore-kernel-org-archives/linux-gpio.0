Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84C353A8E;
	Sat, 10 Oct 2026 14:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791641929; cv=none; b=LbkJyyiM6XrD9XQS321iXgXf1TSulF3UoDHBDy5AbpXDZfrXEVlZf1m+ZzN32/22VswCVtCn3/uvAGMh5pEbSYnb5bWeWpcRJucgKv7MWwJ/40SUeC1XffDzzuJo6yLr/j4iD1WNMQSKdeWKBbOrvJY0IJvGzkm0EPLe3E1RuNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791641929; c=relaxed/simple;
	bh=Ctfy8doPwyTmRah9VMrKFa13iKqAU6HP7+q684v8FQ0=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=Dakx17jnXzZrz8XKsRQiz4CE/LIpEo2XrIQxfPPOuGKb8MP2dVbrVCFZrSNoEmcwMvcWwWwwHfPhUvSju+PO7ie63zRDsRMhi9sJ/D6EvyK842bWp31zoOM9PQhABi/sBii3bieQeO24gvrwNjW3ZMNw4hIKAog7oFeUppZ2DgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=bOlTPzm4; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="bOlTPzm4"
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 269E982B5C;
	Sat, 10 Oct 2026 16:18:39 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1e4Zr0zClsP; Sat, 10 Oct 2026 16:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1791641918; bh=Ctfy8doPwyTmRah9VMrKFa13iKqAU6HP7+q684v8FQ0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=bOlTPzm4tenLVpzb+vjeHa8+j1ALMdeFUeP3ZiBphPg3BUPXEG+MaAETkIEUQCuiJ
	 pROV2CNZsjZ6TieVysYSZ8HrZJMjJjmPBg7BbGCSsKBQY5Jx7S3HOH344pDLKQ8Whz
	 WhpVebz2bhdAr0hmmOdao6uw39hXWqTJHeyBLNTWXV0MBbx6ZK3e58V48ex3tehOr4
	 K+eXJGdUNlnxW9p9GEIa8MT+XjIlgl/l3AwKBaSnEf5KiEo257ricn6+r5oyuRjJ2z
	 KwNQTO+i5fVvSIL3HQG6v5LWWzyJUccHLO64Iu2SZeUCaPPS8wfgVbj7kQtAHJ4Lee
	 FPhjsLoXlmJ/g==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:18:37 +0000
From: Rustam Adilov <adilov@disroot.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Bartosz Golaszewski
 <brgl@kernel.org>, Sander Vanheule <sander@svanheule.net>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpio: realtek-otto: make the driver work with
 SWAP_IO_SPACE
In-Reply-To: <CAD++jLk8gCAy+SbGffttCQ7dM9x6gzVRBwRppCByzwYdm_5kGw@mail.gmail.com>
References: <20260815094451.31792-1-adilov@disroot.org>
 <aro4qbhcd3X6wTvP@black.igk.intel.com>
 <CAD++jLk8gCAy+SbGffttCQ7dM9x6gzVRBwRppCByzwYdm_5kGw@mail.gmail.com>
Message-ID: <e1c0f3ff0c47fc7a2258bbb67f588f57@disroot.org>
X-Sender: adilov@disroot.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2026-10-01 20:14, Linus Walleij wrote:
> On Mon, Sep 28, 2026 at 11:51 AM Andy Shevchenko
> <andriy.shevchenko@intel.com> wrote:
>> On Sat, Aug 15, 2026 at 02:44:49PM +0500, Rustam Adilov wrote:
>> > This patch series changes gpio-realtek-otto to be functional around
>> > SWAP_IO_SPACE config.
> (...)
>> Convert the driver to use regmap MMIO and most of the code in this series won't
>> be needed. Also it will give some benefits (like register caching and debugfs
>> monitoring).
> 
> Andy is right.
> 
> Make an attempt on top of the merged patches to convert this to regmap MMIO
> and see what happens, and if that works consider regmap GPIO as
> well.
> 
> Everyone will be happier, because less code.

As far as i remember, i thought of using regmap earlier but got stuck because
the regmap has to not swap in realtek_gpio_update_line_imr() but potentially
swap in other places by bank_read/write.
Maybe i am missing something but i just couldn't figure it out.

Best,
Rustam
