Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EBF242D88
	for <linux-gpio@vger.kernel.org>; Sat,  5 Sep 2026 06:09:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788588568; cv=none; b=fZSj15ONCkbyvLuqjPh46gXdKQA017qZ/FEQkXXL4tuhoL7WiTzN0TWTQ6nfMfgFhalU7UpOEIDVWMTsbbPlmN8JByMj6yKoWZRZZ+dsc/jhsHsycQ3LhjAnqeTz78FIfSfW0OynRuYjaJq/h7ERU9jOWZKMOtVEAz0chv0pCSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788588568; c=relaxed/simple;
	bh=ZEkZQAS7f7y1Xw1yZ7phr3KECVum9x/VK0lR129nVOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tco2HoYsrbzsk6nAn/4xmNsLoiPA+9CO7U1wNEPIjR9w6tU1wWr9tlAw2Qjh6gLQFiZYt7zDpGnWJFftpr5Y2b9u1QVI27+nwDAIVp7KGsCKNXcHyY/dvh/cSSDXlqubTPogFsK6cF23+jKvQp6ZpU+PlWESs9zzpvbwhehoEIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oa8n0aAD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oa8n0aAD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BAFB1F00A3E
	for <linux-gpio@vger.kernel.org>; Sat,  5 Sep 2026 06:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788588567;
	bh=MICPlX8LMsX3aYkaZBnp6d2gX+eIWi36orYNaQ0JbHM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oa8n0aAD1SLQiqBgrQzTqWZODSdbouEsz5MCd2DRL37n32wCFomb31buKZxtXcBDu
	 UfsY6Vt7YV/syZVzMyBNNXfii4Pw+2QMHNMthb26YdOjvvV64GuX7JE2yNEwztRCS8
	 JiipLCZRjheFcGDRBmpgWrDaZNjuGt0gsI/A3PRajX5j0XZTSq2EcM9BL97UTp5Rm0
	 ugwsF6nMPaQbfFTXF4FzmOgcbBTUn3JK+7jXfKgFTSismF3vEECSpIEVOBr1f4o2d8
	 TheV3kSQeC6yzaGUcLXrtxzkSQyHphwKebXkHAdoaBartffBE/7AQ0dl2junEnFnaF
	 QTUNfmz21RecA==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b4ab4b4179so1555146e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 04 Sep 2026 23:09:27 -0700 (PDT)
X-Gm-Message-State: AFuF++kloQZmYxRvWSKsjfxFBfBZxuP67HxxQC2SR8NttloTkc1dNzJA
	r6SfMZOXMObXSqwQYSUALiHbgT7eiiid9OA3dmn4b6SXL58+ypqU54DgmyOMH7TtQjDkXasX0aN
	Xb4j9U8rE4/jRorqGOVevrVwIBtWf+wk=
X-Received: by 2002:a05:6512:3a8d:b0:5b6:7fa:e96b with SMTP id
 2adb3069b0e04-5b616f075bdmr3330109e87.14.1788588566319; Fri, 04 Sep 2026
 23:09:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260905004334.177074-1-rosenp@gmail.com>
In-Reply-To: <20260905004334.177074-1-rosenp@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 5 Sep 2026 08:09:14 +0200
X-Gmail-Original-Message-ID: <CAD++jL=p8LV9XEBK0bC5m9-5aLm78jf4=2OLVxpeO03_6KzzeQ@mail.gmail.com>
X-Gm-Features: AcwNN1XQiwZeqHz6EoFBHGg8DB3jBApt-wzxY6JecJ0GuvMdw3AkXWi1wdHiROw
Message-ID: <CAD++jL=p8LV9XEBK0bC5m9-5aLm78jf4=2OLVxpeO03_6KzzeQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: mvebu: name regmaps to fix debugfs collisions
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 5, 2026 at 2:43=E2=80=AFAM Rosen Penev <rosenp@gmail.com> wrote=
:

> Each marvell,armada-370-gpio node provides both 'gpio' and 'pwm'
> register windows, and the driver creates one regmap per window on the
> same platform device.  The shared regmap_config was unnamed, so both
> maps defaulted their debugfs directory to dev_name(), e.g.
>
>   debugfs: 'f1018100.gpio' already exists in 'regmap'
>
> because the PWM regmap (and on Armada XP the per-CPU regmap) claimed
> the same directory as the GPIO regmap.
>
> Give each regmap a distinct .name so the debugfs directories become
> '<dev>.gpio', '<dev>.percpu' and '<dev>.pwm'.  This only affects
> debugfs naming; register access is unchanged.
>
> Assisted-by: opencode:big-pickle
> Signed-off-by: Rosen Penev <rosenp@gmail.com>

Makes sense.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
