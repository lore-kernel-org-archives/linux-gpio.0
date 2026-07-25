Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7EF927732
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 13:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784985054; cv=none; b=TuN8LXJCpM+EBpfbuy09FT01MHI6DeAxrzsQ4HSOiuhsPfOfQoHvI/+av8CdG2b/TjVatVTJrma21yDPaOcYyxbrksN/l5eIoODHmGMCY3Q0hZ8TZW0l8z631u0AccAYmjVimThPuY0yRXaPR/mt53pvXrD8fGrpb4J8gZKQ78Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784985054; c=relaxed/simple;
	bh=2GSUzCngCig5Gksii6QGO0WMCjtneUA3x53tYdJy33w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q578Za9/1ZtZUpZ7Ue2tPP26A+erCJF0OH3jNA/oeCxf8p/w+lt1EUL18JHEthD7/VzYab1VHdbSBjaourGh3DFWcQuw66zp9n4t6kG+AUkFT2PDqqT3wHANi5obxWdvyrItd0DhLQJlqacIG4WxjgimPEi/VLEaVS1F3boYjsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PCQf/d4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PCQf/d4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9189A1F00A3F
	for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 13:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784985053;
	bh=2GSUzCngCig5Gksii6QGO0WMCjtneUA3x53tYdJy33w=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PCQf/d4e2SBtkCRjS9+QR955rdYcLLds7FzgQFrXmMiH4zGRCcFeBhVu/YzJElY88
	 RRQsdRC3uEyRFCbry46WciKBWayGS4xKl4ny29jF0tnSH1FdG6YVVVuTEuzU/Cjoqy
	 lz1uocc0Cn1PK99rFwVIM0IOyQ7CdCx4FMfv/n7sBiOwem4BznxZxo4PHRJ28DtzrI
	 a+x49WTgY6r2/QdLBw+vsEff5n43nKb9imPw+IGE6zb1S3x3ho3feJESFQKK7sHJMr
	 mcBG7kH2qmSjyYQEns+gP/FwYj9RhWO6uL7perCcdkzipvxLmpWTOzcI/yk/t86ljV
	 HpNhVk3SVPOpA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b0148201fbso1036239e87.3
        for <linux-gpio@vger.kernel.org>; Sat, 25 Jul 2026 06:10:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RplvxH3ZZtsc7gPRxaFV/Rf111Tfy/X2q61AtvG7AROl4isZ7CFPfQE0knetxjVrxyJXWdS8mCb9uHc@vger.kernel.org
X-Gm-Message-State: AOJu0YyIL7BcMJzvwI5oG2ivGDLhTM4a764AutVapddNXIKatWnRHfJL
	mv9717xKaWBOT1+NArclCQ6+WrWqWEP6YwphwGbInD7NiCrvvCrjKyAkoDOvtcgYzBkdYsItj9N
	Dmy1FYFRnzDrMtE9lZzqkAZMqm0z4KOc=
X-Received: by 2002:a05:6512:1387:b0:5b0:12e1:486c with SMTP id
 2adb3069b0e04-5b2c1b00ec2mr452374e87.24.1784985052312; Sat, 25 Jul 2026
 06:10:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260723035823.2041832-1-justin.yeh@mediatek.com> <CAD++jL=fy+0ZZhg_eH_BGLUZfpK69zCcOaTp_LQ93yvSxUiS3w@mail.gmail.com>
In-Reply-To: <CAD++jL=fy+0ZZhg_eH_BGLUZfpK69zCcOaTp_LQ93yvSxUiS3w@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 25 Jul 2026 15:10:39 +0200
X-Gmail-Original-Message-ID: <CAD++jLmDKxCwSWZbKcpawjRotMgEFxaoCjcKiq8H87A39tnQqA@mail.gmail.com>
X-Gm-Features: AUfX_myFdmYZ_1tkX_Vbvdyksfd_YwdB8gn7IvzQ4zVRblVSLK3XQPFPscUKun0
Message-ID: <CAD++jLmDKxCwSWZbKcpawjRotMgEFxaoCjcKiq8H87A39tnQqA@mail.gmail.com>
Subject: Re: [PATCH v7 0/5] pinctrl: mediatek: Enable module build support
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 25, 2026 at 3:02=E2=80=AFPM Linus Walleij <linusw@kernel.org> w=
rote:

> All patches applied, I had to rebase patch 5/5, please check the
> result!

Notably I had to add some lines for MT6858.

Yours,
Linus Walleij
