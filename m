Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A707489FA2
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 10:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791453852; cv=none; b=l1v/b/8MSKwufJc9PolDZvftxwOaoxZC2zHYqUzyRxdPwcqu5FmEbobF965NPlXbjGZE1ujgwUrrqN7R5OJTRya0vQ0lwIub+ec5kU5F4mjQMi+wWn5qHu14E6CL4K2wIlg6W/kO+rBfZibOJGbL/Jrhq7XaPnvNWY10IvLBcrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791453852; c=relaxed/simple;
	bh=k7gRLBPUByLVlt/saKsFJBUEGTiPzVauwntTIHvfju8=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ft9MyxlZAOFdj/QEqwaP7hnxPktcfBDKsvJs/eUCo5jLw2toyDRXMLoX3aZUx+kxFHvVTvWPLR9sdMTk7mm3jAVefIr7tDtGtOHPnTNsROylJfSY0cg96ndtnDAORQ3TDsoL2uzUN0Cnw4PJeazvLiwlp5DLb+ANwTsRPYgk74Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nW8d64AM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nW8d64AM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E238F1F0089C
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 10:04:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791453849;
	bh=k7gRLBPUByLVlt/saKsFJBUEGTiPzVauwntTIHvfju8=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=nW8d64AMhOt+FsuabqNAUTMwrZhrIEMnWsPOLeZGQMp9gnKDHPxPo6uoyW/9r/uMV
	 gXEbxfrSxQY+huWPs+ALmokJ0U+oULLLShCAfdGr26no+qJkyIFtkE/5X2TglEr42S
	 s4Hf98D6ORUP2pl834eWY2xhkhDRgR7GzpmpoWXF1lyScFGE+ZHJq6Cf56pcaZWEOk
	 to4QKjosHPyBaC8tvvGS1ZdIx25wj0ARsD2ZqWbKkjMX3w9cN4YvDrZfi9awO6TSIT
	 jfqRzgsFh8ZZA/MnbZRoz80ea8ACZqEJ3PS4CtO6DTjH5OoOa40S5MWqIuodZwoDP5
	 WdmKE3AOZV94w==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3a65ed9c7cfso21426321fa.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 03:04:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxiBSX5X50D6lrXaXpdg//8knTsxVvv+VEMm0FETsipTLAQstntQeI3mOe5hXKfrvw0LpuZ+AQaEM85@vger.kernel.org
X-Gm-Message-State: AFq9FYKwXCu9YZU1lUVH62ZezdknY8+p6YbwTR3cN38Tp3Dgvcu8Y/pl
	CcIGNF/BnJdBHLOKcZ+UGlfZKd+WGMQo8coMYLDyIZixQxOzivDJuyjsmnB8DtckHhqcdepAnp1
	VFTFPrr4OMSLvDSKpZneUJnH4Lra+Wlpb7TqTfOPSXg==
X-Received: by 2002:a05:651c:19a7:b0:3a5:af50:bc99 with SMTP id
 38308e7fff4ca-3a9a2cf5549mr12349981fa.13.1791453848608; Thu, 08 Oct 2026
 03:04:08 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 10:04:06 +0000
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Oct 2026 10:04:06 +0000
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002-loongsongpio-v2-0-6e3eb150a4ef@gmail.com>
Date: Thu, 8 Oct 2026 10:04:06 +0000
X-Gmail-Original-Message-ID: <CAMRc=McnDBO6OZx6p9HGHn=Yyt8ydD=8Z=zYZvYvuy-_DUq6tQ@mail.gmail.com>
X-Gm-Features: AclHuK9mmokNb-c-m-1w7-MmgfhgFOaUDRj0NVRsP48Bni_RaXXll4zOogvYSAM
Message-ID: <CAMRc=McnDBO6OZx6p9HGHn=Yyt8ydD=8Z=zYZvYvuy-_DUq6tQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 0/4] gpio: loongson-64bit: add interrupt support
 for more models
To: shankerwangmiao@gmail.com
Cc: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 1 Oct 2026 20:13:18 +0200, Miao Wang via B4 Relay
<devnull+shankerwangmiao.gmail.com@kernel.org> said:
> This patch series aims to correctly add interrupt support for GPIO
> controllers found on more Loongson CPUs. The GPIO controllers in such
> models do not have a complete intgrated interrupt controller, but choose
> to delegate interrupt handling to their parent interrupt controller.
> This sounds like a heirarchical interrupt setup, but what makes it
> more complex is that multiple GPIO lines in these controllers may share
> one interrupt line on the parent interrupt controller. The details is
> described in the third patch.
>
> Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
> ---

The series looks pretty good. Who is the RFC addressed at in this case? I can't
really answer the questions from patch 3/4 as I don't know this platform nor am
I well versed in ACPI. Maybe Cc the GPIO ACPI maintainers for review?

Bart
